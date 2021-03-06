const nconf = require('./config')
const winston = require('winston')
const fhirAxios = nconf.fhirAxios

const workflowCollateral = {
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
                complexExt.push({ url: "name",
                valueString:req.body.item[0].item[0].answer[0].valueString
               })
            }
            if ( req.body.item[0].item[1].linkId === "Basic.extension[0].extension[1]" 
                && req.body.item[0].item[1].answer 
                && req.body.item[0].item[1].answer[0] 
                && req.body.item[0].item[1].answer[0].valueString){
                complexExt.push({ url: "altlangName",
                valueString: req.body.item[0].item[1].answer[0].valueString
                            })
            }
            if ( req.body.item[0].item[2].linkId === "Basic.extension[0].extension[2]" 
                && req.body.item[0].item[2].answer 
                && req.body.item[0].item[2].answer[0] 
                && req.body.item[0].item[2].answer[0].valueCoding){
                complexExt.push({ url: "gender",
                valueCoding:req.body.item[0].item[2].answer[0].valueCoding })
            } 
            if ( req.body.item[0].item[3].linkId === "Basic.extension[0].extension[3]" 
                && req.body.item[0].item[3].answer 
                && req.body.item[0].item[3].answer[0] 
                && req.body.item[0].item[3].answer[0].valueDate){
                complexExt.push({ url: "birthdate",
                valueDate:req.body.item[0].item[3].answer[0].valueDate })
            }
            if ( req.body.item[0].item[4].linkId === "Basic.extension[0].extension[4]" 
                && req.body.item[0].item[4].answer 
                && req.body.item[0].item[4].answer[0] 
                && req.body.item[0].item[4].answer[0].valueString){
                complexExt.push({ url: "phone",
                valueString:req.body.item[0].item[4].answer[0].valueString })
            }
            if ( req.body.item[0].item[5].linkId === "Basic.extension[0].extension[5]" 
                && req.body.item[0].item[5].answer 
                && req.body.item[0].item[5].answer[0] 
                && req.body.item[0].item[5].answer[0].valueString){
                complexExt.push({ url: "mobile",
                valueString:req.body.item[0].item[5].answer[0].valueString })
            }
            if ( req.body.item[0].item[6].linkId === "Basic.extension[0].extension[6]" 
                && req.body.item[0].item[6].answer 
                && req.body.item[0].item[6].answer[0] 
                && req.body.item[0].item[6].answer[0].valueString){
                complexExt.push({ url: "workPhone",
                valueString:req.body.item[0].item[6].answer[0].valueString })
            }
            if ( req.body.item[0].item[7].linkId === "Basic.extension[0].extension[7]" 
                && req.body.item[0].item[7].answer 
                && req.body.item[0].item[7].answer[0] 
                && req.body.item[0].item[7].answer[0].valueString){
                complexExt.push({ url: "otherPhone",
                valueString:req.body.item[0].item[7].answer[0].valueString })
            }
            if ( req.body.item[0].item[8].linkId === "Basic.extension[0].extension[8]" 
                && req.body.item[0].item[8].answer 
                && req.body.item[0].item[8].answer[0] 
                && req.body.item[0].item[8].answer[0].valueString){
                complexExt.push({ url: "workEmail",
                valueString: req.body.item[0].item[8].answer[0].valueString })
            }
            if ( req.body.item[0].item[9].linkId === "Basic.extension[0].extension[9]" 
                && req.body.item[0].item[9].answer 
                && req.body.item[0].item[9].answer[0] 
                && req.body.item[0].item[9].answer[0].valueString){
                complexExt.push({ url: "otherEmail",
                valueString: req.body.item[0].item[9].answer[0].valueString
                            })
            }
            if ( req.body.item[0].item[10].linkId === "Basic.extension[0].extension[10]" 
                && req.body.item[0].item[10].answer 
                && req.body.item[0].item[10].answer[0] 
                && req.body.item[0].item[10].answer[0].valueReference){
                complexExt.push({ url: "location",
                valueReference: req.body.item[0].item[10].answer[0].valueReference
                            })
            }
            if ( req.body.item[0].item[11].linkId === "Basic.extension[0].extension[11]" 
                && req.body.item[0].item[11].answer 
                && req.body.item[0].item[11].answer[0] 
                && req.body.item[0].item[11].answer[0].valueString){
                complexExt.push({ url: "city",
                valueString: req.body.item[0].item[11].answer[0].valueString
                            })
            }
            if ( req.body.item[0].item[12].linkId === "Basic.extension[0].extension[12]" 
                && req.body.item[0].item[12].answer 
                && req.body.item[0].item[12].answer[0] 
                && req.body.item[0].item[12].answer[0].valueString){
                complexExt.push({ url: "kebele",
                valueString: req.body.item[0].item[12].answer[0].valueString
                            })
            }
            if ( req.body.item[0].item[13].linkId === "Basic.extension[0].extension[13]" 
                && req.body.item[0].item[13].answer 
                && req.body.item[0].item[13].answer[0] 
                && req.body.item[0].item[13].answer[0].valueString){
                complexExt.push({ url: "houseNumber",
                valueString: req.body.item[0].item[13].answer[0].valueString
                            })
            }
            if ( req.body.item[0].item[14].linkId === "Basic.extension[0].extension[14]" 
                && req.body.item[0].item[14].answer 
                && req.body.item[0].item[14].answer[0] 
                && req.body.item[0].item[14].answer[0].valueText){
                complexExt.push({ url: "address",
                valueString: req.body.item[0].item[14].answer[0].valueText
                            })
            }
            if ( req.body.item[0].item[15].linkId === "Basic.extension[0].extension[15]" 
                && req.body.item[0].item[15].answer 
                && req.body.item[0].item[15].answer[0] 
                && req.body.item[0].item[15].answer[0].valueString){
                complexExt.push({ url: "salary",
                valueString: req.body.item[0].item[15].answer[0].valueString
                            })
            }
            if ( req.body.item[0].item[16].linkId === "Basic.extension[0].extension[16]" 
                && req.body.item[0].item[16].answer 
                && req.body.item[0].item[16].answer[0] 
                && req.body.item[0].item[16].answer[0].valueText){
                complexExt.push({ url: "remark",
                valueString: req.body.item[0].item[16].answer[0].valueText
                            })
            }
            if ( req.body.item[0].item[17].linkId === "Basic.extension[0].extension[17]" 
                && req.body.item[0].item[17].answer 
                && req.body.item[0].item[17].answer[0] 
                && req.body.item[0].item[17].answer[0].valueAttachment){
                complexExt.push({ url: "attachment",
                valueAttachment: req.body.item[0].item[17].answer[0].valueAttachment
                            })
            }
            if(complexExt){
                extensions.push({ url: "http://ihris.org/fhir/StructureDefinition/ihris-collateral",
                extension: complexExt})
            }
          let newCollateral = {
            resourceType: "Basic",
            meta: {
              profile: [ "http://ihris.org/fhir/StructureDefinition/ihris-basic-collateral" ]
            },
            extension: extensions,
          }

          bundle.entry.push( {
            resource: newCollateral,
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
 
module.exports = workflowCollateral
