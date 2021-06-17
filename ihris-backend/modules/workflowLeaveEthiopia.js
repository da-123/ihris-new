const nconf = require('./config')
const winston = require('winston')
const differenceInBusinessDays = require('date-fns/differenceInBusinessDays')
const differenceInDays = require('date-fns/differenceInDays')
const compareAsc = require('date-fns/compareAsc')
const isWeekend = require('date-fns/isWeekend')
const fhirAxios = nconf.fhirAxios

const workflowLeaveEthiopia = {
  process: ( req ) => {
    return new Promise( async (resolve, reject) => {
      try {
        let resource
        let requestedDays
        let bundle = {
          resourceType: "Bundle",
          type: "transaction",
          entry: []
        }
        let leaveType = req.body.item[0].item[0].answer[0].valueCoding.code
        let startDate = req.body.item[0].item[1].answer[0].valueDateTime
        let endDate = req.body.item[0].item[2].answer[0].valueDateTime
        let leaveBundle = await fhirAxios.search( "Basic", { practitioner: req.query.practitioner, leavetype: leaveType, leaveperiod: "sa"+endDate , leaveperiod: "eb"+startDate } )   
        if ( leaveBundle.entry ) {
          resolve(await workflowLeaveEthiopia.outcome(winston.info("Another Leave request of "+leaveType+ " exists for that period. Please adjust Type or Date Period ")))
        } else {
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
                  let continousLeaveType = ["maternity","paternity","sick"]
                  if (continousLeaveType.includes(leaveType)){
                    requestedDays = differenceInDays(new Date(req.body.item[0].item[2].answer[0].valueDateTime),new Date(req.body.item[0].item[1].answer[0].valueDateTime))
                  } else {
                    //Deduct holidays
                    let periodStart = req.body.item[0].item[1].answer[0].valueDateTime
                    let periodend = req.body.item[0].item[2].answer[0].valueDateTime
                    let numHolidays = 0
                    requestedDays = differenceInBusinessDays(new Date(req.body.item[0].item[2].answer[0].valueDateTime),new Date(req.body.item[0].item[1].answer[0].valueDateTime))
                    let holidaysResource = await fhirAxios.read( "CodeSystem", "ihris-holidays-codesystem" )
                    if(holidaysResource.id === "ihris-holidays-codesystem" ){
                      if(holidaysResource.concept){
                        for (let holidayConcept of holidaysResource.concept){
                          if(isWeekend(holidayConcept.property.valueDateTime)){

                          } else {
                            if(compareAsc(holidayConcept.property.valueDateTime,periodStart) >= 0 && compareAsc(holidayConcept.property.valueDateTime,periodend) <= 0){
                              numHolidays++
                            }
                          }
                        }
                        requestedDays = requestedDays - numHolidays
                      }
                    }
                  }
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
              let cuttOffYear = new Date().getFullYear()
              if (leaveType == "annual" ){
                cuttOffYear = new Date().getFullYear() - 2
              } 
              let leaveStockbundle = await fhirAxios.search( "Basic", { practitioner: req.query.practitioner, leavestock: leaveType, _sort: "leavestockyear" , leavestockyear: "ge"+cuttOffYear } )
              //winston.info("BUNDLE" + JSON.stringify( leaveStockbundle,null,2))
              if ( leaveStockbundle.entry ) {
                let totalleaveStockDays = 0
                for( let entry of leaveStockbundle.entry ) {
                  if ( entry.resource.resourceType === "Basic" ) {
                    //leaveStockYear = entry.resource.extension.find( ext => ext.url === "http://ihris.org/fhir/StructureDefinition/ihris-ethiopia-leave-stock" ).extension.find( ext => ext.url === "year").valueString
                    //if (parseInt(leaveStockYear) >= cuttOffYear){
                      totalleaveStockDays +=  Number(entry.resource.extension.find( ext => ext.url === "http://ihris.org/fhir/StructureDefinition/ihris-ethiopia-leave-stock" ).extension.find( ext => ext.url === "numDays").valueString)
                    //} 
                  }
                } 
                let requestedDaysNum =  Number(requestedDays)
                let newleaveStockDays = totalleaveStockDays - requestedDaysNum
                if ( Number(newleaveStockDays) >= 0){
                  if (leaveType != "annual" ){
                    entry.resource.extension.find( ext => ext.url === "http://ihris.org/fhir/StructureDefinition/ihris-ethiopia-leave-stock" ).extension.find( ext => ext.url === "numDays").valueString = newleaveStockDays + ''
                    bundle.entry.push( {
                      resource: entry.resource,
                      request: {
                        method: "PUT",
                        url: "Basic/"+entry.resource.id
                      }
                    } )
                  } else {

                  }
                  
                  let resourceNumDays = 0
                  for( let entry of leaveStockbundle.entry ) {
                    if (leaveType != "annual" ){ 
                        entry.resource.extension.find( ext => ext.url === "http://ihris.org/fhir/StructureDefinition/ihris-ethiopia-leave-stock" ).extension.find( ext => ext.url === "numDays").valueString = newleaveStockDays + ''
                        bundle.entry.push( {
                          resource: entry.resource,
                          request: {
                            method: "PUT",
                            url: "Basic/"+entry.resource.id
                          }
                        } ) 
                        break
                      } else {
                        resourceNumDays =  Number(entry.resource.extension.find( ext => ext.url === "http://ihris.org/fhir/StructureDefinition/ihris-ethiopia-leave-stock" ).extension.find( ext => ext.url === "numDays").valueString)
                        requestedDaysNum = resourceNumDays - requestedDaysNum
                        if(Number(requestedDaysNum) < 0){
                          entry.resource.extension.find( ext => ext.url === "http://ihris.org/fhir/StructureDefinition/ihris-ethiopia-leave-stock" ).extension.find( ext => ext.url === "numDays").valueString = 0 + ''
                          bundle.entry.push( {
                            resource: entry.resource,
                            request: {
                              method: "PUT",
                              url: "Basic/"+entry.resource.id
                            }
                          } )
                          requestedDaysNum = Math.abs(requestedDaysNum)
                        } else if(Number(requestedDaysNum) >= 0) {
                          entry.resource.extension.find( ext => ext.url === "http://ihris.org/fhir/StructureDefinition/ihris-ethiopia-leave-stock" ).extension.find( ext => ext.url === "numDays").valueString = requestedDaysNum + ''
                          bundle.entry.push( {
                            resource: entry.resource,
                            request: {
                              method: "PUT",
                              url: "Basic/"+entry.resource.id
                            }
                          } )
                          break
                        } else {
                          winston.info("Calculated value is not a number")
                          resolve(await workflowLeaveEthiopia.outcome(winston.info("Calculated value is not a number")))
                        }
                    }
                  }
                } else {
                  winston.info("Leave Stock is less that Zero")
                  resolve(await workflowLeaveEthiopia.outcome("Calculated Leave stock is less than zero (" +newleaveStockDays+"). Please adjust dates"))
                }
              } else {
                resolve(await workflowLeaveEthiopia.outcome("No Leave Stock Data. Please enter leave sock data first"))
              }
              resolve(bundle)
            } catch (err) {
              winston.error(err)
              reject(err)
            }
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