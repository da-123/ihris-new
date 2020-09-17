Profile:        IhrisBasicEducationHistory
Parent:         IhrisPractitionerBasic
Id:             ihris-basic-education-history
Title:          "Education History Information"
Description:    "iHRIS Profile of the Basic resource for Education History."
* extension[practitioner].valueReference 1..1 MS
* extension[practitioner].valueReference ^label = "Health Worker"
* extension contains
    IhrisEducationHistory named educationHistory 1..1 MS
* extension[educationHistory].extension[institution].valueReference MS
* extension[educationHistory].extension[institution].valueReference ^label = "Institution"
* extension[educationHistory].extension[degree].valueCoding ^label = "Degree"
* extension[educationHistory].extension[degree].valueCoding MS
* extension[educationHistory].extension[level].valueCoding ^label = "Education Level"
* extension[educationHistory].extension[level].valueCoding MS
* extension[educationHistory].extension[educationalMajor].valueCoding ^label = "Degree"
* extension[educationHistory].extension[educationalMajor].valueCoding MS
* extension[educationHistory].extension[year].valueDate ^label = "Year Of Graduation"
* extension[educationHistory].extension[year].valueDate MS
    
Extension:      IhrisEducationHistory
Id:             ihris-education-history
Title:          "Education History details"
* extension contains
      institution 1..1 MS and
      degree 1..1 MS and
      level 0..1 MS and
      educationalMajor 0..1 MS and
      year 0..1 MS
* extension[institution].value[x] only Reference
* extension[institution].valueReference only Reference(IhrisInstitution)
* extension[institution].valueReference ^label = "Institution"
* extension[degree].value[x] only Coding
* extension[degree].valueCoding ^label = "Degree"
* extension[degree].valueCoding from IhrisDegreeValueSet (required)
* extension[level].value[x] only Coding
* extension[level].valueCoding ^label = "Education Level"
* extension[level].valueCoding from IhrisEducationLevelValueSet (required)
* extension[educationalMajor].value[x] only Coding
* extension[educationalMajor].valueCoding ^label = "Degree"
* extension[educationalMajor].valueCoding from IhrisEducationalMajorValueSet (required)
* extension[year].value[x] only date
* extension[year].valueDate ^label = "Year Of Graduation"

CodeSystem:      IhrisDegree
Id:              ihris-degree
Title:           "Degree"
* ^version = "0.2.0"

ValueSet:         IhrisDegreeValueSet
Id:               ihris-degree-valueset
Title:            "iHRIS Degree ValueSet"
* ^version = "0.2.0"
* codes from system IhrisDegree

CodeSystem:      IhrisEducationLevel
Id:              ihris-education-level
Title:           "Education Level"
* #Cerifiticate "Cerifiticate" "Cerifiticate"
* #Diploma "Diploma" "Diploma"
* #Degree "Degree" "Degree"
* #Masters "Masters" "Masters"
* #PHD "PHD" "PHD"
* #Others "Others" "Others"

ValueSet:         IhrisEducationLevelValueSet
Id:               ihris-education-level-valueset
Title:            "iHRIS Education Level ValueSet"
* codes from system IhrisEducationLevel

Profile:        IhrisInstitution
Parent:         Location
Id:             ihris-institution
Title:          "Education Institution"
Description:    "iHRIS profile of Education Institution."
* identifier 0..0 
* status 1..1 MS
* status ^label = "Status"
* operationalStatus 0..0
* hoursOfOperation 0..0
* physicalType 0..0
* type 0..0
* mode 0..0
* name 1..1 MS
* name ^label = "Institution Name"
* telecom 0..* MS
* telecom ^label = "Institution Contact"
* telecom.system MS
* telecom.system ^label = "Type"
* telecom.value MS
* telecom.value ^label = "Value"
* telecom.use MS
* telecom.use ^label = "Use"
* address 0..1 MS
* address ^label = "Institution Address"
* address.type MS
* address.type ^label = "Address Type"
* address.use MS
* address.use ^label = "Use"
* address.line 0..1 MS
* address.line ^label = "Street name, number & P.O. Box etc."
* address.city MS
* address.city ^label = "Name of city, town etc"
* address.district MS
* address.district ^label = "District"
* address.country MS
* address.country ^label = "Country"
* partOf 0..1 MS
* partOf ^label = "Institution Location"
* extension contains
    IhrisInstitutionType named institutionType 1..1 MS 
* extension[institutionType].valueCoding MS
* extension[institutionType] ^label = "Institution Type"

Extension:      IhrisInstitutionType
Id:             ihris-institution-type
Title:          "Institution Type"
Description:    "iHRIS extension for Institution Type."
* ^context.type = #element
* ^context.expression = "Location"
* value[x] only Coding
* valueCoding 1..1 MS
* valueCoding ^label = "Type"
* valueCoding from IhrisInstitutionTypeValueSet (required)

CodeSystem:      IhrisInstitutionType
Id:              ihris-institution-type
Title:           "Institution Type"
* #university "University" "University"
* #technical "Technical Institute" "Technical Institute"
* #college "College" "College"
* #other "other" "other"

ValueSet:         IhrisInstitutionTypeValueSet
Id:               ihris-institution-type-valueset
Title:            "iHRIS Institution Type Value Set"
* codes from system IhrisInstitutionType

Instance:       IhrisPractitionerWorkflowEducationHistory
InstanceOf:      Questionnaire
Usage:          #definition
* title = "iHRIS Education History Workflow"
* description = "iHRIS workflow to record a Education History"
* id = "ihris-education-history"
* url = "http://ihris.org/fhir/Questionnaire/ihris-education-history"
* name = "ihris-education-history"
* status = #active
* date = 2020-08-27
* purpose = "Workflow page for recording a Education History information."

* item[0].linkId = "Basic"
* item[0].text = "Education History"
* item[0].type = #group

* item[0].item[0].linkId = "Basic.extension[0].extension[0]"
* item[0].item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-education-history#Basic.extenstion:education.extension:institution.value[x]:valueCoding"
* item[0].item[0].text = "Education Institution"
* item[0].item[0].type = #reference
* item[0].item[0].required = true
* item[0].item[0].repeats = false

* item[0].item[1].linkId = "Basic.extension[0].extension[1]"
* item[0].item[1].text = "Degree"
* item[0].item[1].type = #choice
* item[0].item[1].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-degree-valueset"
* item[0].item[1].required = true
* item[0].item[1].repeats = false

* item[0].item[2].linkId = "Basic.extension[0].extension[2]"
* item[0].item[2].text = "Education Level"
* item[0].item[2].type = #choice
* item[0].item[2].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-education-level-valueset"
* item[0].item[2].required = true
* item[0].item[2].repeats = false

* item[0].item[3].linkId = "Basic.extension[0].extension[3]"
* item[0].item[3].text = "Education Major"
* item[0].item[3].type = #choice
* item[0].item[3].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-educational-major-valueset"
* item[0].item[3].required = true
* item[0].item[3].repeats = false

* item[0].item[4].linkId = "Basic.extension[0].extension[4]#year"
* item[0].item[4].text = "Year Of Graduation"
* item[0].item[4].type = #date
* item[0].item[4].required = true
* item[0].item[4].repeats = false
