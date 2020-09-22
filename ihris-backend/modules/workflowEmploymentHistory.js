const nconf = require('./config')
const winston = require('winston')
const fhirAxios = nconf.fhirAxios

const workflowEmploymentHistory = {
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
          && req.body.item[0].item[0].answer && req.body.item[0].item[0].answer[0]) {
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
                && req.body.item[0].item[0].answer[0].valueString){
                complexExt.push({ url: "organization",
                valueString:req.body.item[0].item[0].answer[0].valueString
               })
            }
            if ( req.body.item[0].item[1].linkId === "Basic.extension[0].extension[1]" 
                && req.body.item[0].item[1].answer 
                && req.body.item[0].item[1].answer[0] 
                && req.body.item[0].item[1].answer[0].valueText){
                complexExt.push({ url: "address",
                valueString: req.body.item[0].item[1].answer[0].valueText
                            })
            }
            if ( req.body.item[0].item[2].linkId === "Basic.extension[0].extension[2]" 
                && req.body.item[0].item[2].answer 
                && req.body.item[0].item[2].answer[0] 
                && req.body.item[0].item[2].answer[0].valueString){
                complexExt.push({ url: "telephone",
                valueString:req.body.item[0].item[2].answer[0].valueString })
            } 
            if ( req.body.item[0].item[3].linkId === "Basic.extension[0].extension[3]" 
                && req.body.item[0].item[3].answer 
                && req.body.item[0].item[3].answer[0] 
                && req.body.item[0].item[3].answer[0].valueString){
                complexExt.push({ url: "startingPosition",
                valueString:req.body.item[0].item[3].answer[0].valueString })
            }
            if ( req.body.item[0].item[4].linkId === "Basic.extension[0].extension[4]" 
                && req.body.item[0].item[4].answer 
                && req.body.item[0].item[4].answer[0] 
                && req.body.item[0].item[4].answer[0].valueString){
                complexExt.push({ url: "startingSalary",
                valueMoney:{value:req.body.item[0].item[4].answer[0].valueString} })
            }
            if ( req.body.item[0].item[5].linkId === "Basic.extension[0].extension[5]" 
                && req.body.item[0].item[5].answer 
                && req.body.item[0].item[5].answer[0] 
                && req.body.item[0].item[5].answer[0].valueDate){
                complexExt.push({ url: "dateStarted",
                valueDate:req.body.item[0].item[5].answer[0].valueDate })
            }
            if ( req.body.item[0].item[6].linkId === "Basic.extension[0].extension[6]" 
                && req.body.item[0].item[6].answer 
                && req.body.item[0].item[6].answer[0] 
                && req.body.item[0].item[6].answer[0].valueString){
                complexExt.push({ url: "endingPosition",
                valueString:req.body.item[0].item[6].answer[0].valueString })
            }
            if ( req.body.item[0].item[7].linkId === "Basic.extension[0].extension[7]" 
                && req.body.item[0].item[7].answer 
                && req.body.item[0].item[7].answer[0] 
                && req.body.item[0].item[7].answer[0].valueString){
                complexExt.push({ url: "endingSalary",
                valueMoney:{value:req.body.item[0].item[7].answer[0].valueString} })
            }
            if ( req.body.item[0].item[8].linkId === "Basic.extension[0].extension[8]" 
                && req.body.item[0].item[8].answer 
                && req.body.item[0].item[8].answer[0] 
                && req.body.item[0].item[8].answer[0].valueDate){
                complexExt.push({ url: "dateEnded",
                valueDate:req.body.item[0].item[8].answer[0].valueDate })
            }
            if ( req.body.item[0].item[9].linkId === "Basic.extension[0].extension[9]" 
                && req.body.item[0].item[9].answer 
                && req.body.item[0].item[9].answer[0] 
                && req.body.item[0].item[9].answer[0].valueText){
                complexExt.push({ url: "responsibilities",
                valueString: req.body.item[0].item[9].answer[0].valueText })
            }
            if ( req.body.item[0].item[10].linkId === "Basic.extension[0].extension[10]" 
                && req.body.item[0].item[10].answer 
                && req.body.item[0].item[10].answer[0] 
                && req.body.item[0].item[10].answer[0].valueString){
                complexExt.push({ url: "reasonLeaving",
                valueString: req.body.item[0].item[10].answer[0].valueString
                            })
                 winston.info(JSON.stringify( "Done reasonLeaving",null,2))
            }
            if(complexExt){
                extensions.push({ url: "http://ihris.org/fhir/StructureDefinition/ihris-employment-history",
                extension: complexExt})
            }
          let newLeave = {
            resourceType: "Basic",
            meta: {
              profile: [ "http://ihris.org/fhir/StructureDefinition/ihris-basic-employment-history" ]
            },
            extension: extensions,
          }

          bundle.entry.push( {
            resource: newLeave,
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
 
module.exports = workflowEmploymentHistory
