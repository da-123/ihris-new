const nconf = require('./config')
const winston = require('winston')
const fhirAxios = nconf.fhirAxios

const workflowProfessional = {
  process: ( req ) => {
    return new Promise( (resolve, reject) => {
      let bundle = {
        resourceType: "Bundle",
        type: "transaction",
        entry: []
      }
      //winston.info(JSON.stringify( req.body,null,2))
      fhirAxios.read( "Practitioner", req.query.practitioner ).then( (resource) => {
        if ( req.body && req.body.item 
          && req.body.item && req.body.item[0].linkId === "Basic"
          && req.body.item[0].item && req.body.item[0].item[0].linkId === "Basic.extension[0].extension[0]" 
          && req.body.item[0].item[0].answer && req.body.item[0].item[0].answer[0] 
          && req.body.item[0].item[0].answer[0].valueCoding) {
            if ( req.query.practitioner ) {
              req.body.subject = { reference: "Practitioner/" +req.query.practitioner }
            }
            let extensions = []
            if ( resource.resourceType === "Practitioner") {
                extensions.push({ url: "http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference",
                valueReference: { reference: "Practitioner/" +req.query.practitioner}
             })
            }

            let complexExt = []
            if ( req.body.item[0].item[0].linkId === "Basic.extension[0].extension[0]" 
                && req.body.item[0].item[0].answer 
                && req.body.item[0].item[0].answer[0] 
                && req.body.item[0].item[0].answer[0].valueCoding){
                complexExt.push({ url: "profession",
                valueCoding:req.body.item[0].item[0].answer[0].valueCoding })
            }
            if(complexExt){
                extensions.push({ url: "http://ihris.org/fhir/StructureDefinition/ihris-professional",
                extension: complexExt})
            }
          let newProfessional = {
            resourceType: "Basic",
            meta: {
              profile: [ "http://ihris.org/fhir/StructureDefinition/ihris-basic-professional" ]
            },
            extension: extensions,
          }

          bundle.entry.push( {
            resource: newProfessional,
            request: {
              method: "POST",
              url: "Basic"
            }
          } )
          resolve( bundle )
        } else {
          reject("Invalid input")
        }
      } ).catch( (err) => {
        winston.error(err)
        reject(err)
      } )
    } )
  }
}
 
module.exports = workflowProfessional
