const nconf = require('./config')
const fhirAxios = nconf.fhirAxios

const workflowPromotionEthiopia = {
  process: ( req ) => {
    return new Promise( (resolve, reject) => {
      let bundle = {
        resourceType: "Bundle",
        type: "transaction",
        entry: []
      }
      fhirAxios.read( "PractitionerRole", req.query.practitionerrole ).then( (resource) => {
        if ( req.body && req.body.item 
          && req.body.item && req.body.item[0].linkId === "PractitionerRole"
          && req.body.item[0].item && req.body.item[0].item[0].linkId === "period.end" 
          && req.body.item[0].item[0].answer && req.body.item[0].item[0].answer[0] 
          && req.body.item[0].item[0].answer[0].valueDate 
          && req.body.item[0].item[1].linkId === "code" 
          && req.body.item[0].item[1].answer && req.body.item[0].item[1].answer[0] 
          && req.body.item[0].item[1].answer[0].valueCoding ) {

          let reason = { url: "http://ihris.org/fhir/StructureDefinition/ihris-practitionerrole-reason-departure",
              valueCoding: req.body.item[0].item[1].answer[0].valueCoding }
          resource.extension.push(reason)
          resource.period.end = req.body.item[0].item[0].answer[0].valueDate

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
          let extensions = []
          if ( req.body.item[0].item[3].linkId === "PractitionerRole.extension[5]" 
            && req.body.item[0].item[3].answer 
            && req.body.item[0].item[3].answer[0] 
            && req.body.item[0].item[3].answer[0].valueCoding){
              extensions.push({ url: "http://ihris.org/fhir/StructureDefinition/ihris-practitionerrole-salary-scale",
              valueCoding:req.body.item[0].item[3].answer[0].valueCoding })
          }
          if ( req.body.item[0].item[4].linkId === "PractitionerRole.extension[4]" 
            && req.body.item[0].item[4].answer 
            && req.body.item[0].item[4].answer[0] 
            && req.body.item[0].item[4].answer[0].valueString){
            extensions.push({ url: "http://ihris.org/fhir/StructureDefinition/ihris-practitionerrole-salary",
            valueString:req.body.item[0].item[4].answer[0].valueString })
          }
          if ( req.body.item[0].item[6].linkId === "PractitionerRole.extension[1]" 
            && req.body.item[0].item[6].answer 
            && req.body.item[0].item[6].answer[0] 
            && req.body.item[0].item[6].answer[0].valueCoding){
              extensions.push({ url: "http://ihris.org/fhir/StructureDefinition/ihris-practitionerrole-shift",
              valueCoding:req.body.item[0].item[6].answer[0].valueCoding })
          }
          if ( req.body.item[0].item[7].linkId === "PractitionerRole.extension[2]" 
            && req.body.item[0].item[7].answer 
            && req.body.item[0].item[7].answer[0] 
            && req.body.item[0].item[7].answer[0].valueCoding){
              extensions.push({ url: "http://ihris.org/fhir/StructureDefinition/ihris-practitionerrole-employment-status",
              valueCoding:req.body.item[0].item[7].answer[0].valueCoding })
          }
          if ( req.body.item[0].item[8].linkId === "PractitionerRole.extension[3]" 
            && req.body.item[0].item[8].answer 
            && req.body.item[0].item[8].answer[0] 
            && req.body.item[0].item[8].answer[0].valueCoding){
              extensions.push({ url: "http://ihris.org/fhir/StructureDefinition/ihris-practitionerrole-job-type",
              valueCoding:req.body.item[0].item[8].answer[0].valueCoding })
          } 

          let newRole = {
            resourceType: "PractitionerRole",
            meta: {
              profile: [ resource.meta.profile[0] ]
            },
            practitioner: { reference: resource.practitioner.reference },
            location: { reference: req.body.item[0].item[5].answer },
            code: [
              { coding: [ req.body.item[0].item[2].answer[0].valueCoding ] }
            ],
            period: { start: req.body.item[0].item[0].answer[0].valueDate },
            extension: extensions,
          }

          bundle.entry.push( {
            resource: newRole,
            request: {
              method: "POST",
              url: "PractitionerRole"
            }
          } )

          resolve( bundle )
        } else {
          reject("Invalid input")
        }
      } ).catch( (err) => {
        reject(err)
      } )
    } )
  }
}
 
module.exports = workflowPromotionEthiopia
