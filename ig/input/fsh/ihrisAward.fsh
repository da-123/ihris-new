Profile:        IhrisBasicAward
Parent:         IhrisPractitionerBasic
Id:             ihris-basic-award
Title:          "iHRIS Award"
Description:    "iHRIS Profile of the Basic resource for an Award to the practioner."
* extension[practitioner].valueReference 1..1 MS
* extension[practitioner].valueReference ^label = "Awarded Staff"
* extension contains
    IhrisAward named ihrisaward 1..1 MS
* extension[ihrisaward].extension[award].valueString 1..1 MS
* extension[ihrisaward].extension[award].valueString ^label = "Title Of AWard" 
* extension[ihrisaward].extension[organization].valueString 0..1 MS
* extension[ihrisaward].extension[organization].valueString ^label = "Awarding Organization"
* extension[ihrisaward].extension[date].valueDate 1..1 MS
* extension[ihrisaward].extension[date].valueDate ^label = "Date of Award"
* extension[ihrisaward].extension[remark].valueString 0..1 MS
* extension[ihrisaward].extension[remark].valueString ^label = "Remarks"  

Extension:      IhrisAward
Id:             ihris-award
Title:          "Award details"
* extension contains
    award 1..1 MS and
    organization 0..1 MS and
    date 1..1 MS and
    remark 0..1 MS
* extension[award].value[x] only string
* extension[award].valueString 1..1 MS
* extension[award].valueString ^label = "Title Of AWard" 
* extension[award].valueString ^constraint[0].key = "ihris-award-check"
* extension[award].valueString ^constraint[0].severity = #error
* extension[award].valueString ^constraint[0].expression = "matches('^[A-Za-z ]*$')"
* extension[award].valueString ^constraint[0].human = "Title Of Award must be only text"
* extension[organization].value[x] only string
* extension[organization].valueString 0..1 MS
* extension[organization].valueString ^label = "Awarding Organization"
* extension[organization].valueString ^constraint[0].key = "ihris-org-check"
* extension[organization].valueString ^constraint[0].severity = #error
* extension[organization].valueString ^constraint[0].expression = "matches('^[A-Za-z ]*$')"
* extension[organization].valueString ^constraint[0].human = "Awarding Organization must be only text"
* extension[date].value[x] only date
* extension[date].valueDate 0..1 MS
* extension[date].valueDate ^label = "Date of Award"
* extension[remark].value[x] only string
* extension[remark].valueString 0..1 MS
* extension[remark].valueString ^label = "Remarks" 

Instance:       IhrisPractitionerWorkflowAward
InstanceOf:     IhrisQuestionnaire
Usage:          #definition
* title = "iHRIS Award Workflow"
* description = "iHRIS workflow to record a Award"
* id = "ihris-award"
* url = "http://ihris.org/fhir/Questionnaire/ihris-award"
* name = "ihris-award"
* status = #active
* date = 2021-02-05
* purpose = "Workflow page for recording a award information."

* item[0].linkId = "Basic"
* item[0].text = "Award"
* item[0].type = #group

* item[0].item[0].linkId = "Basic.extension[0].extension[0]"
* item[0].item[0].text = "Title Of Award"
* item[0].item[0].type = #string
* item[0].item[0].required = true
* item[0].item[0].repeats = false
* item[0].item[0].extension[constraint].extension[key].valueId = "ihris-award-check"
* item[0].item[0].extension[constraint].extension[severity].valueCode = #error
* item[0].item[0].extension[constraint].extension[expression].valueString = "matches('^[A-Za-z ]*$')"
* item[0].item[0].extension[constraint].extension[human].valueString = "Title Of Award must be only text."


* item[0].item[1].linkId = "Basic.extension[0].extension[1]"
* item[0].item[1].text = "Date Of AWard"
* item[0].item[1].type = #date
* item[0].item[1].required = true
* item[0].item[1].repeats = false

* item[0].item[2].linkId = "Basic.extension[0].extension[2]"
* item[0].item[2].text = "Awarding Organization"
* item[0].item[2].type = #string
* item[0].item[2].required = false
* item[0].item[2].repeats = false
* item[0].item[2].extension[constraint].extension[key].valueId = "ihris-award-org-check"
* item[0].item[2].extension[constraint].extension[severity].valueCode = #error
* item[0].item[2].extension[constraint].extension[expression].valueString = "matches('^$|^[A-Za-z ]*$')"
* item[0].item[2].extension[constraint].extension[human].valueString = "Awarding Organization must be only text."

* item[0].item[3].linkId = "Basic.extension[0].extension[3]"
* item[0].item[3].text = "Remarks"
* item[0].item[3].type = #text
* item[0].item[3].required = false
* item[0].item[3].repeats = false

Instance:       ihris-page-award
InstanceOf:     IhrisPage
Title:          "iHRIS Basic award Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(StructureDefinition/ihris-basic-award)
* extension[display].extension[link][0].extension[field].valueString = "Basic.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference').valueReference.reference"
* extension[display].extension[link][0].extension[text].valueString = "View Awarded Staff"
* extension[display].extension[link][0].extension[button].valueBoolean = true
* extension[display].extension[link][0].extension[icon].valueString = "mdi-account-arrow-right"
* extension[display].extension[link][0].extension[url].valueUrl = "/resource/view/practitioner/FIELD"
* extension[display].extension[link][1].extension[field].valueString = "Basic.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference').valueReference.reference"
* extension[display].extension[link][1].extension[text].valueString = "Add Another Award"
* extension[display].extension[link][1].extension[button].valueBoolean = true
* extension[display].extension[link][1].extension[icon].valueString = "mdi-account-arrow-right"
* extension[display].extension[link][1].extension[url].valueUrl = "/questionnaire/ihris-award/award?practitioner=FIELD"
* extension[display].extension[search][0].valueString = "Award|extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-award').extension.where(url='award').valueString"
* extension[display].extension[field][0].extension[path].valueString = "Basic.extension:practitioner.value[x]:valueReference"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Award"
* extension[section][0].extension[description].valueString = "Award details"
* extension[section][0].extension[name].valueString = "Basic"
* extension[section][0].extension[field][0].valueString = "Basic.extension:practitioner"
* extension[section][0].extension[field][1].valueString = "Basic.extension:ihrisaward.extension:award.value[x]:valueString"
* extension[section][0].extension[field][2].valueString = "Basic.extension:ihrisaward.extension:date.value[x]:valueDate"
* extension[section][0].extension[field][3].valueString = "Basic.extension:ihrisaward.extension:organization.value[x]:valueString"
* extension[section][0].extension[field][4].valueString = "Basic.extension:ihrisaward.extension:remarks.value[x]:valueString"