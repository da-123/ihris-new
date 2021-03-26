const nconf = require('./config')
const winston = require('winston')
const fhirAxios = nconf.fhirAxios

const workflowPromotionEthiopia = {
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
          && req.body.item[0].item[0].item && req.body.item[0].item[0].item[0].linkId === "period.end" 
          && req.body.item[0].item[0].item[0].answer && req.body.item[0].item[0].item[0].answer[0] 
          && req.body.item[0].item[0].item[0].answer[0].valueDateTime 
          && req.body.item[0].item[1].item[0].linkId === "code" 
          && req.body.item[0].item[1].item[0].answer && req.body.item[0].item[1].item[0].answer[0] 
          && req.body.item[0].item[1].item[0].answer[0].valueCoding ) {
          let reason = { url: "http://ihris.org/fhir/StructureDefinition/ihris-practitionerrole-reason-change",
              valueCoding: req.body.item[0].item[0].item[1].answer[0].valueCoding }
          resource.extension.push(reason)
          resource.period.end = req.body.item[0].item[0].item[0].answer[0].valueDateTime
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
          let roleorganization = {}
          if ( req.body.item[0].item[1].item[1].linkId === "PractitionerRole.extension[4]" 
            && req.body.item[0].item[1].item[1].answer 
            && req.body.item[0].item[1].item[1].answer[0] 
            && req.body.item[0].item[1].item[1].answer[0].valueCoding){
              extensions.push({ url: "http://ihris.org/fhir/StructureDefinition/ihris-practitionerrole-salary-scale",
              valueCoding:req.body.item[0].item[1].item[1].answer[0].valueCoding })
          }
          if ( req.body.item[0].item[1].item[2].linkId === "PractitionerRole.extension[3]" 
            && req.body.item[0].item[1].item[2].answer 
            && req.body.item[0].item[1].item[2].answer[0] 
            && req.body.item[0].item[1].item[2].answer[0].valueString){
            extensions.push({ url: "http://ihris.org/fhir/StructureDefinition/ihris-practitionerrole-salary",
            valueMoney:{value: req.body.item[0].item[1].item[2].answer[0].valueString }})
          }
          /*if ( req.body.item[0].item[1].item[4].linkId === "PractitionerRole.extension[1]" 
            && req.body.item[0].item[1].item[4].answer 
            && req.body.item[0].item[1].item[4].answer[0] 
            && req.body.item[0].item[1].item[4].answer[0].valueCoding){
              extensions.push({ url: "http://ihris.org/fhir/StructureDefinition/ihris-practitionerrole-shift",
              valueCoding:req.body.item[0].item[1].item[4].answer[0].valueCoding })
          }*/
          if ( req.body.item[0].item[1].item[4].linkId === "PractitionerRole.extension[1]" 
            && req.body.item[0].item[1].item[4].answer 
            && req.body.item[0].item[1].item[4].answer[0] 
            && req.body.item[0].item[1].item[4].answer[0].valueCoding){
              extensions.push({ url: "http://ihris.org/fhir/StructureDefinition/ihris-practitionerrole-employment-status",
              valueCoding:req.body.item[0].item[1].item[4].answer[0].valueCoding })
          }
          if ( req.body.item[0].item[1].item[5].linkId === "PractitionerRole.extension[2]" 
            && req.body.item[0].item[1].item[5].answer 
            && req.body.item[0].item[1].item[5].answer[0] 
            && req.body.item[0].item[1].item[5].answer[0].valueCoding){
              extensions.push({ url: "http://ihris.org/fhir/StructureDefinition/ihris-practitionerrole-job-type",
              valueCoding:req.body.item[0].item[1].item[5].answer[0].valueCoding })
          }
          if ( req.body.item[0].item[1].item[6].linkId === "PractitionerRole.organization" 
            && req.body.item[0].item[1].item[6].answer 
            && req.body.item[0].item[1].item[6].answer[0] 
            && req.body.item[0].item[1].item[6].answer[0].valueReference){
             roleorganization.push({ reference: req.body.item[0].item[1].item[6].answer[0].valueReference.reference})
          }
          let data = resource.extension
          function getExtension(url) {
            return data.filter(
                function(data){return data.url == url}
            );
          }
          let exUrl = 'http://ihris.org/fhir/StructureDefinition/ihris-practitionerrole-first-employment-date'
          let firstEmployment = getExtension(exUrl)
          if (firstEmployment){
            extensions.push({ url: "http://ihris.org/fhir/StructureDefinition/ihris-practitionerrole-first-employment-date",
              valueDate:firstEmployment[0].valueDate })
          }
          let newRole = {
            resourceType: "PractitionerRole",
            meta: {
              profile: [ resource.meta.profile[0] ]
            },
            practitioner: { reference: resource.practitioner.reference },
            location:[ req.body.item[0].item[1].item[3].answer[0].valueReference],
            organization: roleorganization ,
            code: [
              { coding: [ req.body.item[0].item[1].item[0].answer[0].valueCoding ] }
            ],
            period: { start: req.body.item[0].item[0].item[0].answer[0].valueDateTime },
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
 
module.exports = workflowPromotionEthiopia
