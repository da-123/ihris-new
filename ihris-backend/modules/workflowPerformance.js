const nconf = require('./config')
const winston = require('winston')
const fhirAxios = nconf.fhirAxios

const workflowPerformance = {
  process: ( req ) => {
    return new Promise( async (resolve, reject) => {
      try {
        let resource
        let bundle = {
          resourceType: "Bundle",
          type: "transaction",
          entry: []
        }
        //winston.info(JSON.stringify( req.body,null,2))
        resource = await fhirAxios.read( "Practitioner", req.query.practitioner )
        if ( (req.body.item[0].item[1].linkId === "Basic.extension[0].extension[1]" 
            && req.body.item[0].item[1].answer 
            && req.body.item[0].item[1].answer[0] 
            && req.body.item[0].item[1].answer[0].valueDateTime)||(
            req.body.item[0].item[2].linkId === "Basic.extension[0].extension[2]" 
            && req.body.item[0].item[2].answer 
            && req.body.item[0].item[2].answer[0] 
            && req.body.item[0].item[2].answer[0].valueDateTime
            && req.body.item[0].item[4].linkId === "Basic.extension[0].extension[4]" 
            && req.body.item[0].item[4].answer 
            && req.body.item[0].item[4].answer[0] 
            && req.body.item[0].item[4].answer[0].valueCoding)){
            let performanceType = req.body.item[0].item[4].answer[0].valueCoding.code
            let startDate = req.body.item[0].item[1].answer[0].valueDateTime
            let endDate = req.body.item[0].item[2].answer[0].valueDateTime
            let performanceBundle = await fhirAxios.search( "Basic", { practitioner: req.query.practitioner, performancetype: performanceType, performanceperiod: "sa"+endDate , performanceperiod: "eb"+startDate } )
            if ( performanceBundle.entry ) {
              resolve(await workflowPerformance.outcome(winston.info("Another "+performanceType+ " evaluation exists for that performance period. Please adjust Type or Date Period ")))
            } else {
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
              complexExt.push({ url: "period",
                  valuePeriod:{ start:req.body.item[0].item[1].answer[0].valueDateTime,
                          end:req.body.item[0].item[2].answer[0].valueDateTime}
                        })
              complexExt.push({ url: "performanceType",
                  valueCoding:req.body.item[0].item[4].answer[0].valueCoding })
              complexExt.push({ url: "score",
                  valueString:req.body.item[0].item[3].answer[0].valueString })
              if ( req.body.item[0].item[0].linkId === "Basic.extension[0].extension[0]" 
                  && req.body.item[0].item[0].answer 
                  && req.body.item[0].item[0].answer[0] 
                  && req.body.item[0].item[0].answer[0].valueString){
                  complexExt.push({ url: "evaluator",
                  valueString:req.body.item[0].item[0].answer[0].valueString })
              }
              if(complexExt){
                extensions.push({ url: "http://ihris.org/fhir/StructureDefinition/ihris-performance",
                extension: complexExt})
              }
              let newPerformance = {
                resourceType: "Basic",
                meta: {
                  profile: [ "http://ihris.org/fhir/StructureDefinition/ihris-basic-performance" ]
                },
                extension: extensions,
              }

              bundle.entry.push( {
                resource: newPerformance,
                request: {
                  method: "POST",
                  url: "Basic"
                }
              } )
              resolve( bundle )
            }
                  
          } else {
            resolve(await workflowPerformance.outcome(winston.info("Either Performance Type, or Period not Specified")))
          }
        
      } catch (err){
        winston.error(err)
        resolve(await workflowPerformance.outcome(winston.info(err)))
      }
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
 
module.exports = workflowPerformance
