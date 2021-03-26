const nconf = require('./config')
const winston = require('winston')
const differenceInBusinessDays = require('date-fns/differenceInBusinessDays')
const fhirAxios = nconf.fhirAxios

const workflowLeaveEthiopia = {
  process: ( req ) => {
    return new Promise( async (resolve, reject) => {
      try {
        let resource
        let leaveType
        let requestedDays
        let bundle = {
          resourceType: "Bundle",
          type: "transaction",
          entry: []
        }
        resource = await fhirAxios.read( "Practitioner", req.query.practitioner )
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
                complexExt.push({ url: "leave-type",
                valueCoding:req.body.item[0].item[0].answer[0].valueCoding })
                leaveType = req.body.item[0].item[0].answer[0].valueCoding.code
            }
            if ( (req.body.item[0].item[1].linkId === "Basic.extension[0].extension[1]" 
                && req.body.item[0].item[1].answer 
                && req.body.item[0].item[1].answer[0] 
                && req.body.item[0].item[1].answer[0].valueDateTime)||(
                req.body.item[0].item[2].linkId === "Basic.extension[0].extension[2]" 
                && req.body.item[0].item[2].answer 
                && req.body.item[0].item[2].answer[0] 
                && req.body.item[0].item[2].answer[0].valueDateTime
                )){
                complexExt.push({ url: "period",
                valuePeriod:{ start:req.body.item[0].item[1].answer[0].valueDateTime,
                              end:req.body.item[0].item[2].answer[0].valueDateTime}
                             })
                requestedDays = differenceInBusinessDays(new Date(req.body.item[0].item[2].answer[0].valueDateTime),new Date(req.body.item[0].item[1].answer[0].valueDateTime)) + 1
                complexExt.push({ url: "daysRequested",
                valueInteger:requestedDays})
            }
            if ( req.body.item[0].item[3].linkId === "Basic.extension[0].extension[4]" 
                && req.body.item[0].item[3].answer 
                && req.body.item[0].item[3].answer[0] 
                && req.body.item[0].item[3].answer[0].valueDate){
                complexExt.push({ url: "dateRequested",
                valueDate:req.body.item[0].item[3].answer[0].valueDate })
            }
            if ( req.body.item[0].item[4].linkId === "Basic.extension[0].extension[5]" 
                && req.body.item[0].item[4].answer 
                && req.body.item[0].item[4].answer[0] 
                && req.body.item[0].item[4].answer[0].valueCoding){
                complexExt.push({ url: "leaveSubType",
                valueCoding:req.body.item[0].item[4].answer[0].valueCoding })
            }
            if(complexExt){
              extensions.push({ url: "http://ihris.org/fhir/StructureDefinition/ihris-ethiopia-leave",
              extension: complexExt})
            }
            let newLeave = {
              resourceType: "Basic",
              meta: {
                profile: [ "http://ihris.org/fhir/StructureDefinition/ihris-basic-ethiopia-leave" ]
              },
              extension: extensions,
            }
            bundle.entry.push( {
              resource: newLeave,
              request: {
                method: "POST",
                url: "Basic"
              }
            })
          }
          try {
            let leaveStockbundle = await fhirAxios.search( "Basic", { practitioner: req.query.practitioner, leavestock: leaveType} )
            //winston.info("BUNDLE" + JSON.stringify( leaveStockbundle,null,2))
          if ( leaveStockbundle.entry ) {
            let leaveStockDays
            for( let entry of leaveStockbundle.entry ) {
              if ( entry.resource.resourceType === "Basic" ) {
                try {
                  try{
                    leaveStockDays = entry.resource.extension.find( ext => ext.url === "http://ihris.org/fhir/StructureDefinition/ihris-ethiopia-leave-stock" ).extension.find( ext => ext.url === "numDays").valueString
                  } catch(err){
                    winston.error("Error Getting Leave Stock days ")
                    resolve(await workflowLeaveEthiopia.outcome("Error Getting Leave Stock days"))
                  } 
                  let leaveStockDaysNum  = Number(leaveStockDays)
                  let requestedDaysNum =  Number(requestedDays)
                  let newleaveStockDays = leaveStockDaysNum - requestedDaysNum
                  try{
                    if (isNaN(newleaveStockDays) && newleaveStockDays > 0){
                      entry.resource.extension.find( ext => ext.url === "http://ihris.org/fhir/StructureDefinition/ihris-ethiopia-leave-stock" ).extension.find( ext => ext.url === "numDays").valueString = newleaveStockDays + ''
                    } else {
                      winston.info("Leave Stock is less that Zero")
                      resolve(await workflowLeaveEthiopia.outcome("Calculated Leave stock is less than zero (" +newleaveStockDays+"). Please adjust dates"))
                    }
                  } catch(err){
                    //winston.info(JSON.stringify( entry,null,2))
                    winston.error("Error Saving Leave Stock days "+ newleaveStockDays)
                    reject(err)
                  }
                  bundle.entry.push( {
                    resource: entry.resource,
                    request: {
                      method: "PUT",
                      url: "Basic/"+entry.resource.id
                    }
                  } )
                } catch( err ) {
                  winston.error("Error updating Leave Stock Basic/"+ entry.resource.id)
                  reject(err)
                }
              }
            } 
          } else {
            resolve(await workflowLeaveEthiopia.outcome("No Leave Stock Data What should system do for this leave type. Please enter leave sock data first"))
            //No Leave Stock Data What should system do.
            // Send feedback error saying not leaveStock Data? or just save negative Values.
            /*let extensions = []
            let complexExt = []
            if (req.query.practitioner) {
                extensions.push({ url: "http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference",
                valueReference: { reference: "Practitioner/" +req.query.practitioner}
              })
              if ( req.body.item[0].item[0].linkId === "Basic.extension[0].extension[0]" 
              && req.body.item[0].item[0].answer 
              && req.body.item[0].item[0].answer[0] 
              && req.body.item[0].item[0].answer[0].valueCoding){
                complexExt.push({ url: "leave-type",
                valueCoding:req.body.item[0].item[0].answer[0].valueCoding })
              }
              if ( req.body.item[0].item[3].linkId === "Basic.extension[0].extension[4]" 
              && req.body.item[0].item[3].answer 
              && req.body.item[0].item[3].answer[0] 
              && req.body.item[0].item[3].answer[0].valueDate){
                complexExt.push({ url: "year",
                valueDate:req.body.item[0].item[3].answer[0].valueDate })
              }
              if ( (req.body.item[0].item[1].linkId === "Basic.extension[0].extension[1]" 
              && req.body.item[0].item[1].answer 
              && req.body.item[0].item[1].answer[0] 
              && req.body.item[0].item[1].answer[0].valueDateTime)||(
              req.body.item[0].item[2].linkId === "Basic.extension[0].extension[2]" 
              && req.body.item[0].item[2].answer 
              && req.body.item[0].item[2].answer[0] 
              && req.body.item[0].item[2].answer[0].valueDateTime
              )){
                let requestedDays = differenceInBusinessDays(new Date(req.body.item[0].item[2].answer[0].valueDateTime),new Date(req.body.item[0].item[1].answer[0].valueDateTime)) + 1
                complexExt.push({ url: "numDays",
                valueString:requestedDays + ''})
              }
              if(complexExt){
                extensions.push({ url: "http://ihris.org/fhir/StructureDefinition/ihris-ethiopia-leave-stock",
                extension: complexExt})
              }
              let newLeaveStock = {
                resourceType: "Basic",
                meta: {
                  profile: [ "http://ihris.org/fhir/StructureDefinition/ihris-basic-ethiopia-leave-stock" ]
                },
                extension: extensions,
              }
              bundle.entry.push( {
                resource: newLeaveStock,
                request: {
                    method: "POST",
                    url: "Basic"
                  }
                })
              }*/
            }
            resolve(bundle)
            /*results = await fhirAxios.create( bundle )
            if ( results.entry && results.entry.length > 0) {
              winston.info("Saved "+ results.entry.length + " results") 
              resolve(bundle)
            } */
          } catch (err) {
            winston.error(err)
            reject(err)
          }
      } catch (err){
        winston.error(err)
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
module.exports = workflowLeaveEthiopia