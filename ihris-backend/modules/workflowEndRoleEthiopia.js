const nconf = require('./config')
const winston = require('winston')
const fhirAxios = nconf.fhirAxios

const workflowEndRoleEthiopia = {
  process: ( req ) => {
    return new Promise( (resolve, reject) => {
      let bundle = {
        resourceType: "Bundle",
        type: "transaction",
        entry: []
      }
      //winston.info(JSON.stringify( req.body,null,2))
      fhirAxios.read( "PractitionerRole", req.query.practitionerrole ).then( (resource) => {
        if ( req.body && req.body.item 
          && req.body.item && req.body.item[0].linkId === "PractitionerRole"
          && req.body.item[0].item && req.body.item[0].item[0].linkId === "period.end" 
          && req.body.item[0].item[0].answer && req.body.item[0].item[0].answer[0] 
          && req.body.item[0].item[0].answer[0].valueDateTime
          && req.body.item[0].item[1].linkId === "PractitionerRole.extension[0]" 
          && req.body.item[0].item[1].answer && req.body.item[0].item[1].answer[0] 
          && req.body.item[0].item[1].answer[0].valueCoding ) {
            let reason = { url: "http://ihris.org/fhir/StructureDefinition/ihris-practitionerrole-reason-departure",
            valueCoding: req.body.item[0].item[1].answer[0].valueCoding }
            resource.extension.push(reason)
            resource.period.end = req.body.item[0].item[0].answer[0].valueDateTime
            bundle.entry.push( { 
              resource: resource,
              request: {
                method: "PUT",
                url: resource.resourceType +"/"+ resource.id
              }
            } )
          if ( resource.practitioner && resource.practitioner.reference ) {
            req.body.subject = { reference: resource.practitioner.reference }
          }
          resolve( bundle )
        } else {
          reject("Invalid input")
        }
      } ).catch( (err) => {
        reject(err)
      } )
    } )
  },
  postProcess: ( req, results ) => {
    return new Promise( (resolve, reject) => {
        if ( results.entry && results.entry.length > 0 && results.entry[0].response.location ) {
          if ( !req.body.meta ) req.body.meta = {}
          if ( !req.body.meta.tag ) req.body.meta.tag = []
          req.body.meta.tag.push( { system: "http://ihris.org/fhir/tags/resource", code: results.entry[0].response.location } )
          resolve( req )
        }
    })
  }
}
 
module.exports = workflowEndRoleEthiopia
