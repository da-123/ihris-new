Profile:        IhrisBasicDiscipline
Parent:         IhrisPractitionerBasic
Id:             ihris-basic-discipline
Title:          "Discipline Information"
Description:    "iHRIS Profile of the Basic resource for Discipline."
* extension[practitioner].valueReference 1..1 MS
* extension[practitioner].valueReference ^label = "Health Worker"
* extension contains
    IhrisDiscipline named discipline 1..1 MS
* extension[discipline] ^label = "Discipline Information"
* extension[discipline].extension[actionType].valueCoding 1..1 MS
* extension[discipline].extension[givenDate].valueDate 1..1 MS
* extension[discipline].extension[givenBy].valueString MS
* extension[discipline].extension[refNo].valueString MS
* extension[discipline].extension[actionTaken].valueString MS
* extension[discipline].extension[startDate].valueDate 1..1 MS
* extension[discipline].extension[endDate].valueDate 1..1 MS
* extension[discipline].extension[reason].valueString 1..1 MS
* extension[discipline].extension[remark].valueString MS
    
Extension:      IhrisDiscipline
Id:             ihris-discipline
Title:          "Discipline details"
* extension contains actionType 1..1 MS and
    actionTaken 0..1 MS and
    givenDate 1..1 MS and
    givenBy 0..1 MS and
    refNo 0..1 MS and
    startDate 1..1 MS and
    endDate 1..1 MS and
    reason 1..1 MS and
    remark 0..1 MS
* extension[actionType].value[x] only Coding
* extension[actionType].valueCoding 1..1 MS
* extension[actionType].valueCoding ^label = "Discipline Action Type"
* extension[actionType].valueCoding from IhrisEthiopiaDisciplinaryActionTypeValueSet (required)
* extension[givenDate].value[x] only date
* extension[givenDate].valueDate 1..1 MS
* extension[givenDate].valueDate ^label = "Given Date"
* extension[givenBy].value[x] only string
* extension[givenBy].valueString 1..1 MS
* extension[givenBy].valueString ^label = "Given By"
* extension[refNo].value[x] only string
* extension[refNo].valueString 1..1 MS
* extension[refNo].valueString ^label = "Reference No"
* extension[actionTaken].value[x] only string
* extension[actionTaken].valueString 1..1 MS
* extension[actionTaken].valueString ^label = "Action Taken"
* extension[startDate].value[x] only date
* extension[startDate].valueDate 1..1 MS
* extension[startDate].valueDate ^label = "Effective Start Date"
* extension[endDate].value[x] only date
* extension[endDate].valueDate 1..1 MS
* extension[endDate].valueDate ^label = "Effective End Date"
* extension[reason].value[x] only string
* extension[reason].valueString 1..1 MS
* extension[reason].valueString ^label = "Reason"
* extension[remark].value[x] only string
* extension[remark].valueString 1..1 MS
* extension[remark].valueString ^label = "Remark"

CodeSystem:      IhrisDisciplinaryActionType
Id:              ihris-discipline-action-type-codesystem
Title:           "Disciplinary Action Type"
* ^date = "2020-10-20T08:41:04.362Z"

ValueSet:         IhrisEthiopiaDisciplinaryActionTypeValueSet
Id:               ihris-discipline-action-type-valueset
Title:            "iHRIS Disciplinary Action Type ValueSet"
* ^date = "2020-10-20T08:41:04.362Z"
* ^version = "0.2.0"
* codes from system IhrisDisciplinaryActionType

Instance:       IhrisPractitionerWorkflowDiscipline
InstanceOf:      Questionnaire
Usage:          #definition
* title = "iHRIS Discipline Workflow"
* description = "iHRIS workflow to record a Discipline"
* id = "ihris-discipline"
* url = "http://ihris.org/fhir/Questionnaire/ihris-discipline"
* name = "ihris-discipline"
* status = #active
* date = 2020-09-02
* purpose = "Workflow page for recording a Discipline information."

* item[0].linkId = "Basic"
* item[0].text = "Discipline"
* item[0].type = #group

* item[0].item[0].linkId = "Basic.extension[0].extension[0]"
* item[0].item[0].text = "Discipline Action Type"
* item[0].item[0].type = #choice
* item[0].item[0].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-discipline-action-type-valueset"
* item[0].item[0].required = true
* item[0].item[0].repeats = false

* item[0].item[1].linkId = "Basic.extension[0].extension[1]"
* item[0].item[1].text = "Given Date"
* item[0].item[1].type = #date
* item[0].item[1].required = true
* item[0].item[1].repeats = false

* item[0].item[2].linkId = "Basic.extension[0].extension[2]"
* item[0].item[2].text = "Given By"
* item[0].item[2].type = #string
* item[0].item[2].required = false
* item[0].item[2].repeats = false

* item[0].item[3].linkId = "Basic.extension[0].extension[3]"
* item[0].item[3].text = "Rerefence Number"
* item[0].item[3].type = #string
* item[0].item[3].required = false
* item[0].item[3].repeats = false

* item[0].item[4].linkId = "Basic.extension[0].extension[4]"
* item[0].item[4].text = "Action Taken"
* item[0].item[4].type = #string
* item[0].item[4].required = false
* item[0].item[4].repeats = false

* item[0].item[5].linkId = "Basic.extension[0].extension[5]"
* item[0].item[5].text = "Effective Start date"
* item[0].item[5].type = #date
* item[0].item[5].required = true
* item[0].item[5].repeats = false

* item[0].item[6].linkId = "Basic.extension[0].extension[6]"
* item[0].item[6].text = "Effective End Date"
* item[0].item[6].type = #date
* item[0].item[6].required = true
* item[0].item[6].repeats = false

* item[0].item[7].linkId = "Basic.extension[0].extension[7]"
* item[0].item[7].text = "Reason"
* item[0].item[7].type = #text
* item[0].item[7].required = true
* item[0].item[7].repeats = false

* item[0].item[8].linkId = "Basic.extension[0].extension[8]"
* item[0].item[8].text = "Remark"
* item[0].item[8].type = #text
* item[0].item[8].required = false
* item[0].item[8].repeats = false

Instance:       ihris-page-discipline
InstanceOf:     IhrisPage
Title:          "iHRIS Basic Discipline Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(StructureDefinition/ihris-basic-discipline)
* extension[display].extension[link][0].extension[field].valueString = "Basic.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference').valueReference.reference"
* extension[display].extension[link][0].extension[text].valueString = "View Health Worker"
* extension[display].extension[link][0].extension[button].valueBoolean = true
* extension[display].extension[link][0].extension[icon].valueString = "mdi-account-arrow-right"
* extension[display].extension[link][0].extension[url].valueUrl = "/resource/view/practitioner/FIELD"
* extension[display].extension[link][1].extension[field].valueString = "Basic.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference').valueReference.reference"
* extension[display].extension[link][1].extension[text].valueString = "Add Another"
* extension[display].extension[link][1].extension[button].valueBoolean = true
* extension[display].extension[link][1].extension[icon].valueString = "mdi-account-arrow-right"
* extension[display].extension[link][1].extension[url].valueUrl = "/questionnaire/ihris-discipline/practitioner?practitioner=FIELD"
* extension[display].extension[search][0].valueString = "Discipline|extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-discipline').extension.where(url='actionType').valueString"
* extension[display].extension[field][0].extension[path].valueString = "Basic.extension:practitioner.value[x]:valueReference"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Employee Discipline"
* extension[section][0].extension[description].valueString = "Employee Discipline details"
* extension[section][0].extension[name].valueString = "Basic"
* extension[section][0].extension[field][0].valueString = "Basic.extension:practitioner"
* extension[section][0].extension[field][1].valueString = "Basic.extension:discipline.extension:actionType.value[x]:valueCoding"
* extension[section][0].extension[field][2].valueString = "Basic.extension:discipline.extension:givenDate.value[x]:valueDate"
* extension[section][0].extension[field][3].valueString = "Basic.extension:discipline.extension:givenBy.value[x]:valueString"
* extension[section][0].extension[field][4].valueString = "Basic.extension:discipline.extension:refNo.value[x]:valueString"
* extension[section][0].extension[field][5].valueString = "Basic.extension:discipline.extension:actionTaken.value[x]:valueString"
* extension[section][0].extension[field][6].valueString = "Basic.extension:discipline.extension:startDate.value[x]:valueDate"
* extension[section][0].extension[field][7].valueString = "Basic.extension:discipline.extension:endDate.value[x]:valueDate"
* extension[section][0].extension[field][8].valueString = "Basic.extension:discipline.extension:reason.value[x]:valueString"
* extension[section][0].extension[field][9].valueString = "Basic.extension:discipline.extension:remark.value[x]:valueString"

Instance:       ihris-page-discipline-action-type
InstanceOf:     IhrisPage
Title:          "iHRIS Discipline Action Type CodeSystem Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/ihris-discipline-action-type-codesystem)
* extension[display].extension[search][0].valueString = "Code|code"
* extension[display].extension[search][1].valueString = "Display|display"
* extension[display].extension[field][0].extension[path].valueString = "CodeSystem.code"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Discipline Action Type"
* extension[section][0].extension[description].valueString = "Discipline Action Type"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.display"
* extension[section][0].extension[field][1].valueString = "CodeSystem.code"
* extension[section][0].extension[field][2].valueString = "CodeSystem.definition"