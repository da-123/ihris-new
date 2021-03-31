const nconf = require('./config')
const winston = require('winston')
const fhirAxios = nconf.fhirAxios

const workflowFulltimeEthiopia = {
  process: ( req ) => {
    return new Promise( async (resolve, reject) => {
      try {
        let bundle = {
          resourceType: "Bundle",
          type: "transaction",
          entry: []
        }
        //winston.info(JSON.stringify( req.body,null,2))
        let resource = await fhirAxios.read( "Practitioner", req.query.practitioner )
      
        if (resource.resourceType === "Practitioner"){
          if ( req.body && req.body.item 
            && req.body.item && req.body.item[0].linkId === "PractitionerRole"
            && req.body.item[0].item[0] && req.body.item[0].item[0].linkId === "PractitionerRole.code" 
            && req.body.item[0].item[0].answer
            && req.body.item[0].item[0].answer[0].valueCoding 
            && req.body.item[0].item[1].linkId === "PractitionerRole.location" 
            && req.body.item[0].item[1].answer 
            && req.body.item[0].item[1].answer[0].valueReference ) {  
            if (req.query.practitioner ) {
              req.body.subject = { reference: "Practitioner/" +req.query.practitioner }
            }
            let extensions = []
            let roleorganization = {}
            if ( req.body.item[0].item[2].linkId === "PractitionerRole.organization" 
              && req.body.item[0].item[2].answer 
              && req.body.item[0].item[2].answer[0] 
              && req.body.item[0].item[2].answer[0].valueReference){
              roleorganization = { reference: req.body.item[0].item[2].answer[0].valueReference.reference }
            }
            if ( req.body.item[0].item[3].linkId === "PractitionerRole.employmentStatus" 
              && req.body.item[0].item[3].answer 
              && req.body.item[0].item[3].answer[0] 
              && req.body.item[0].item[3].answer[0].valueCoding){
                extensions.push({ url: "http://ihris.org/fhir/StructureDefinition/ihris-practitionerrole-employment-status",
                valueCoding:req.body.item[0].item[3].answer[0].valueCoding })
            }
            if ( req.body.item[0].item[4].linkId === "PractitionerRole.extension[0]" 
              && req.body.item[0].item[4].answer 
              && req.body.item[0].item[4].answer[0] 
              && req.body.item[0].item[4].answer[0].valueCoding){
                extensions.push({ url: "http://ihris.org/fhir/StructureDefinition/ihris-practitionerrole-job-type",
                valueCoding:req.body.item[0].item[4].answer[0].valueCoding })
            }
            if ( req.body.item[0].item[5].linkId === "PractitionerRole.extension[1]" 
              && req.body.item[0].item[5].answer 
              && req.body.item[0].item[5].answer[0] 
              && req.body.item[0].item[5].answer[0].valueDate){
              extensions.push({ url: "http://ihris.org/fhir/StructureDefinition/ihris-practitionerrole-first-employment-date",
                valueDate:req.body.item[0].item[5].answer[0].valueDate })
            }
            if ( req.body.item[0].item[7].linkId === "PractitionerRole.salaryScale" 
              && req.body.item[0].item[7].answer 
              && req.body.item[0].item[7].answer[0] 
              && req.body.item[0].item[7].answer[0].valueCoding){
                extensions.push({ url: "http://ihris.org/fhir/StructureDefinition/ihris-practitionerrole-salary-scale",
                valueCoding:req.body.item[0].item[7].answer[0].valueCoding })
            }
            if ( req.body.item[0].item[8].linkId === "PractitionerRole.salary" 
              && req.body.item[0].item[8].answer 
              && req.body.item[0].item[8].answer[0] 
              && req.body.item[0].item[8].answer[0].valueString){
              extensions.push({ url: "http://ihris.org/fhir/StructureDefinition/ihris-practitionerrole-salary",
              valueMoney:{ value: req.body.item[0].item[8].answer[0].valueString }})
            }
            if ( req.body.item[0].item[9].linkId === "PractitionerRole.extension[2]" 
              && req.body.item[0].item[9].answer 
              && req.body.item[0].item[9].answer[0] 
              && req.body.item[0].item[9].answer[0].valueText){
                extensions.push({ url: "http://ihris.org/fhir/StructureDefinition/ihris-practitionerrole-job-information-remark",
                valueString:req.body.item[0].item[9].answer[0].valueText })
            }
            if ( req.body.item[0].item[10].linkId === "positionStatus" 
              && req.body.item[0].item[10].answer 
              && req.body.item[0].item[10].answer[0] 
              && req.body.item[0].item[10].answer[0].valueCoding){
                extensions.push({ url: "http://ihris.org/fhir/StructureDefinition/ihris-practitionerrole-position-status",
                valueCoding:req.body.item[0].item[10].answer[0].valueCoding })
            }
            let newRole = {
              resourceType: "PractitionerRole",
              meta: {
                profile: [ "http://ihris.org/fhir/StructureDefinition/ihris-job-description" ]
              },
              practitioner: { reference: "Practitioner/" +req.query.practitioner },
              location:[ req.body.item[0].item[1].answer[0].valueReference],
              organization: roleorganization ,
              code: [
                { coding: [ req.body.item[0].item[0].answer[0].valueCoding ] }
              ],
              period: { start: req.body.item[0].item[6].answer[0].valueDateTime },
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
            winston.error("Either Duty Post or Job title not provided")
            resolve(await workflowFulltimeEthiopia.outcome("Either Duty Post or Job title not provided"))
          }
        } else {
          winston.error("No Person(Practitioner) Record found")
          resolve(await workflowFulltimeEthiopia.outcome("No Person(Practitioner) Record found"))
        }
      } catch(err) {
        reject(err)
      } 
    })
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
  },
  outcome: (message) => {
    return new Promise ((resolve, reject ) => {
      let outcomeBundle = {
        resourceType: "Bundle",
        type: "transaction",
        entry: [{
          resource:{
            resourceType: "OperationOutcome",
            issue: [
            {
              severity: "error",
              code: "exception",
              diagnostics: message
            }]
          },
          request: {
            method: "POST",
            url: "OperationOutcome"
          }
        }]
      }
      winston.info(JSON.stringify(outcomeBundle,null,2))
      resolve(outcomeBundle)
    })
  }
}
 
module.exports = workflowFulltimeEthiopia
