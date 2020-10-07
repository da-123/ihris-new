Profile:        IhrisBasicProfessional
Parent:         IhrisPractitionerBasic
Id:             ihris-basic-professional
Title:          "Professional Information"
Description:    "iHRIS Profile of the Basic resource for Professional."
* extension[practitioner].valueReference 1..1 MS
* extension[practitioner].valueReference ^label = "Health Worker"
* extension contains
    IhrisProfessional named professional 1..1 MS
* extension[professional].extension[profession].valueCoding ^label = "Professional License Category"
* extension[professional].extension[profession].valueCoding MS
    
Extension:      IhrisProfessional
Id:             ihris-professional
Title:          "Professional details"
* extension contains
      profession 1..1 MS 
* extension[profession].value[x] only Coding
* extension[profession].valueCoding ^label = "Profession Attained"
* extension[profession].valueCoding from IhrisProfessionValueSet (required)

CodeSystem:      IhrisProfessionCodesystem
Id:              ihris-profession-codesystem
Title:           "Professional License Category"
* ^version = "0.2.0"

ValueSet:         IhrisProfessionValueSet
Id:               ihris-profession-valueset
Title:            "iHRISProfession ValueSet"
* ^version = "0.2.0"
* codes from system IhrisProfessionCodesystem

Instance:       IhrisPractitionerWorkflowProfessional
InstanceOf:      Questionnaire
Usage:          #definition
* title = "iHRIS Professional Workflow"
* description = "iHRIS workflow to record a Professional"
* id = "ihris-professional"
* url = "http://ihris.org/fhir/Questionnaire/ihris-professional"
* name = "ihris-professional"
* status = #active
* date = 2020-09-02
* purpose = "Workflow page for recording a Professional information."

* item[0].linkId = "Basic"
* item[0].text = "Professional"
* item[0].type = #group

* item[0].item[0].linkId = "Basic.extension[0].extension[0]"
* item[0].item[0].text = "Professional License Category"
* item[0].item[0].type = #choice
* item[0].item[0].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-profession-valueset"
* item[0].item[0].required = true
* item[0].item[0].repeats = false

Instance:       ihris-page-professional
InstanceOf:     IhrisPage
Title:          "iHRIS Basic Professional Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(StructureDefinition/ihris-basic-professional)
* extension[display].extension[link][0].extension[field].valueString = "Basic.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference').valueReference.reference"
* extension[display].extension[link][0].extension[text].valueString = "View Health Worker"
* extension[display].extension[link][0].extension[button].valueBoolean = true
* extension[display].extension[link][0].extension[icon].valueString = "mdi-account-arrow-right"
* extension[display].extension[link][0].extension[url].valueUrl = "/resource/view/practitioner/FIELD"
* extension[display].extension[link][1].extension[field].valueString = "Basic.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference').valueReference.reference"
* extension[display].extension[link][1].extension[text].valueString = "Add Another"
* extension[display].extension[link][1].extension[button].valueBoolean = true
* extension[display].extension[link][1].extension[icon].valueString = "mdi-account-arrow-right"
* extension[display].extension[link][1].extension[url].valueUrl = "/questionnaire/ihris-professional/practitioner?practitioner=FIELD"
* extension[display].extension[search][0].valueString = "Professional License Category|extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-professional').extension.where(url='profession').valueCoding.display"
* extension[display].extension[field][0].extension[path].valueString = "Basic.extension:practitioner.value[x]:valueReference"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Professional Evaluation"
* extension[section][0].extension[description].valueString = "Professional Evaluation details"
* extension[section][0].extension[name].valueString = "Basic"
* extension[section][0].extension[field][0].valueString = "Basic.extension:practitioner"
* extension[section][0].extension[field][1].valueString = "Basic.extension:professional.extension:profession.value[x]:valueCoding"

Instance:       ihris-page-profession
InstanceOf:     IhrisPage
Title:          "iHRIS Profession CodeSystem Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/ihris-profession-codesystem)
* extension[display].extension[search][0].valueString = "Code|code"
* extension[display].extension[search][1].valueString = "Display|display"
* extension[display].extension[field][0].extension[path].valueString = "CodeSystem.code"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Profession"
* extension[section][0].extension[description].valueString = "Profession"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.display"
* extension[section][0].extension[field][1].valueString = "CodeSystem.code"
* extension[section][0].extension[field][2].valueString = "CodeSystem.definition"
