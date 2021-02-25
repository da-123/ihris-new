Profile:        IhrisBasicProfessional
Parent:         IhrisPractitionerBasic
Id:             ihris-basic-professional
Title:          "Professional Information"
Description:    "iHRIS Profile of the Basic resource for Professional."
* extension[practitioner].valueReference 1..1 MS
* extension[practitioner].valueReference ^label = "Health Worker"
* extension contains
    IhrisProfessional named professional 0..1 MS
* extension[professional].extension[profession].valueCoding ^label = "Professional Category Type"
* extension[professional].extension[profession].valueCoding MS
* extension[professional].extension[education_category].valueCoding ^label = "Education Level Category"
* extension[professional].extension[education_category].valueCoding MS
* extension[professional].extension[education_sub_category].valueCoding ^label = "Education Level Sub Category"
* extension[professional].extension[education_sub_category].valueCoding MS
* extension[professional].extension[profession].valueCoding ^label = "Profession Category Type"
* extension[professional].extension[profession].valueCoding MS
* extension[professional].extension[profession_category].valueCoding ^label = "Profession Category"
* extension[professional].extension[profession_category].valueCoding MS
* extension[professional].extension[profession_sub_category].valueCoding ^label = "Profession Sub Category"
* extension[professional].extension[profession_sub_category].valueCoding MS
* extension[professional].extension[profession_sub_sub_category].valueCoding ^label = "Profession Sub Sub Category"
* extension[professional].extension[profession_sub_sub_category].valueCoding MS
* extension[professional].extension[remark].valueString ^label = "Remarks"
* extension[professional].extension[remark].valueString MS
    
Extension:      IhrisProfessional
Id:             ihris-professional
Title:          "Professional details"
* extension contains
      education_category 1..1 MS and
      education_sub_category 0..1 MS and
      profession 1..1 MS and
      profession_category 0..1 MS and
      profession_sub_category 0..1 MS and
      profession_sub_sub_category 0..1 MS and
      remark 0..1 MS
* extension[education_category].value[x] only Coding
* extension[education_category].valueCoding ^label = "Education Level Category"
* extension[education_category].valueCoding from IhrisEducationCategoryValueSet (required)
* extension[education_sub_category].value[x] only Coding
* extension[education_sub_category].valueCoding ^label = "Education Level Sub Category"
* extension[education_sub_category].valueCoding from IhrisEducationSubCategoryValueSet (required)
* extension[profession].value[x] only Coding
* extension[profession].valueCoding ^label = "Profession Category Type"
* extension[profession].valueCoding from IhrisProfessionValueSet (required)
* extension[profession_category].value[x] only Coding
* extension[profession_category].valueCoding ^label = "Profession Category"
* extension[profession_category].valueCoding from IhrisProfessionCategoryValueSet (required)
* extension[profession_sub_category].value[x] only Coding
* extension[profession_sub_category].valueCoding ^label = "Profession Sub Category"
* extension[profession_sub_category].valueCoding from IhrisProfessionSubCategoryValueSet (required)
* extension[profession_sub_sub_category].value[x] only Coding
* extension[profession_sub_sub_category].valueCoding ^label = "Profession Sub Sub Category"
* extension[profession_sub_sub_category].valueCoding from IhrisProfessionSubSubCategoryValueSet (required)
* extension[remark].value[x] only string
* extension[remark].valueString ^label = "Remarks"

CodeSystem:      IhrisProfessionCodesystem
Id:              ihris-profession-codesystem
Title:           "Professional Category Type"
* ^date = "2020-12-04T08:41:04.362Z"
* ^version = "0.2.0"

ValueSet:         IhrisProfessionValueSet
Id:               ihris-profession-valueset
Title:            "Professional Category Type ValueSet"
* ^date = "2020-12-04T08:41:04.362Z"
* ^version = "0.2.0"
* codes from system IhrisProfessionCodesystem

CodeSystem:      IhrisProfessionCategoryCodesystem
Id:              ihris-profession-category-codesystem
Title:           "Professional Category"
* ^date = "2020-12-04T08:41:04.362Z"
* ^version = "0.2.0"

ValueSet:         IhrisProfessionCategoryValueSet
Id:               ihris-profession-category-valueset
Title:            "iHRIS Profession Category ValueSet"
* ^date = "2020-12-04T08:41:04.362Z"
* ^version = "0.2.0"
* codes from system IhrisProfessionCategoryCodesystem

CodeSystem:      IhrisProfessionSubCategoryCodesystem
Id:              ihris-profession-subcategory-codesystem
Title:           "Professional Sub Category"
* ^date = "2020-12-04T08:41:04.362Z"
* ^version = "0.2.0"

ValueSet:         IhrisProfessionSubCategoryValueSet
Id:               ihris-profession-subcategory-valueset
Title:            "iHRIS Profession Sub Category ValueSet"
* ^date = "2020-12-04T08:41:04.362Z"
* ^version = "0.2.0"
* codes from system IhrisProfessionSubCategoryCodesystem

CodeSystem:      IhrisProfessionSubSubCategoryCodesystem
Id:              ihris-profession-subsubcategory-codesystem
Title:           "Professional Sub Sub Category"
* ^date = "2020-12-04T08:41:04.362Z"
* ^version = "0.2.0"

ValueSet:         IhrisProfessionSubSubCategoryValueSet
Id:               ihris-profession-subsubcategory-valueset
Title:            "iHRIS Profession Sub Sub Category ValueSet"
* ^date = "2020-12-04T08:41:04.362Z"
* ^version = "0.2.0"
* codes from system IhrisProfessionSubSubCategoryCodesystem

CodeSystem:      IhrisEducationCategoryCodesystem
Id:              ihris-education-category-codesystem
Title:           "Education Level Category"
* ^date = "2020-12-04T08:41:04.362Z"
* ^version = "0.2.0"

ValueSet:         IhrisEducationCategoryValueSet
Id:               ihris-education-category-valueset
Title:            "iHRIS Education Category ValueSet"
* ^date = "2020-12-04T08:41:04.362Z"
* ^version = "0.2.0"
* codes from system IhrisEducationCategoryCodesystem

CodeSystem:      IhrisEducationSubCategoryCodesystem
Id:              ihris-education-subcategory-codesystem
Title:           "Education Level Sub-Category"
* ^date = "2020-12-04T08:41:04.362Z"
* ^version = "0.2.0"

ValueSet:         IhrisEducationSubCategoryValueSet
Id:               ihris-education-subcategory-valueset
Title:            "iHRIS Education Sub Category ValueSet"
* ^date = "2020-12-04T08:41:04.362Z"
* ^version = "0.2.0"
* codes from system IhrisEducationSubCategoryCodesystem

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
* item[0].text = "Professional License Category"
* item[0].type = #group

* item[0].item[0].linkId = "Basic.extension[0].extension[0]"
* item[0].item[0].text = "Education Level Category"
* item[0].item[0].type = #choice
* item[0].item[0].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-education-category-valueset"
* item[0].item[0].required = true
* item[0].item[0].repeats = false

* item[0].item[1].linkId = "Basic.extension[0].extension[1]"
* item[0].item[1].text = "Education Level Sub Category"
* item[0].item[1].type = #choice
* item[0].item[1].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-education-subcategory-valueset"
* item[0].item[1].required = false
* item[0].item[1].repeats = false

* item[0].item[2].linkId = "Basic.extension[0].extension[2]"
* item[0].item[2].text = "Professional Category Type"
* item[0].item[2].type = #choice
* item[0].item[2].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-profession-valueset"
* item[0].item[2].required = true
* item[0].item[2].repeats = false

* item[0].item[3].linkId = "Basic.extension[0].extension[3]"
* item[0].item[3].text = "Professional Category"
* item[0].item[3].type = #choice
* item[0].item[3].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-profession-category-valueset"
* item[0].item[3].required = true
* item[0].item[3].repeats = false

* item[0].item[4].linkId = "Basic.extension[0].extension[4]"
* item[0].item[4].text = "Professional Sub Category"
* item[0].item[4].type = #choice
* item[0].item[4].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-profession-subcategory-valueset"
* item[0].item[4].required = false
* item[0].item[4].repeats = false

* item[0].item[5].linkId = "Basic.extension[0].extension[5]"
* item[0].item[5].text = "Professional Sub Sub-Category"
* item[0].item[5].type = #choice
* item[0].item[5].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-profession-subsubcategory-valueset"
* item[0].item[5].required = false
* item[0].item[5].repeats = false

* item[0].item[6].linkId = "Basic.extension[0].extension[6]"
* item[0].item[6].text = "Remarks"
* item[0].item[6].type = #text
* item[0].item[6].required = false
* item[0].item[6].repeats = false

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
* extension[display].extension[link][1].extension[url].valueUrl = "/questionnaire/ihris-professional/professional?practitioner=FIELD"
* extension[display].extension[search][0].valueString = "Professional License Category|extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-professional').extension.where(url='profession').valueCoding.display"
* extension[display].extension[field][0].extension[path].valueString = "Basic.extension:practitioner.value[x]:valueReference"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Professional Evaluation"
* extension[section][0].extension[description].valueString = "Professional Evaluation details"
* extension[section][0].extension[name].valueString = "Basic"
* extension[section][0].extension[field][0].valueString = "Basic.extension:practitioner"
* extension[section][0].extension[field][1].valueString = "Basic.extension:professional"

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

Instance:       ihris-page-education-category
InstanceOf:     IhrisPage
Title:          "iHRIS Education CodeSystem Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/ihris-education-category-codesystem)
* extension[display].extension[search][0].valueString = "Code|code"
* extension[display].extension[search][1].valueString = "Display|display"
* extension[display].extension[field][0].extension[path].valueString = "CodeSystem.code"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Education Level Category"
* extension[section][0].extension[description].valueString = "Education Level Category"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.display"
* extension[section][0].extension[field][1].valueString = "CodeSystem.code"
* extension[section][0].extension[field][2].valueString = "CodeSystem.definition"

Instance:       ihris-page-education-subcategory
InstanceOf:     IhrisPage
Title:          "Education Level Sub Category CodeSystem Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/ihris-education-subcategory-codesystem)
* extension[display].extension[search][0].valueString = "Code|code"
* extension[display].extension[search][1].valueString = "Display|display"
* extension[display].extension[field][0].extension[path].valueString = "CodeSystem.code"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Education Level Sub-Category"
* extension[section][0].extension[description].valueString = "Education Level Sub-Category"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.display"
* extension[section][0].extension[field][1].valueString = "CodeSystem.code"
* extension[section][0].extension[field][2].valueString = "CodeSystem.definition"

Instance:       ihris-page-profession-category
InstanceOf:     IhrisPage
Title:          "Profession Category CodeSystem Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/ihris-profession-category-codesystem)
* extension[display].extension[search][0].valueString = "Code|code"
* extension[display].extension[search][1].valueString = "Display|display"
* extension[display].extension[field][0].extension[path].valueString = "CodeSystem.code"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Profession Category"
* extension[section][0].extension[description].valueString = "Profession Category"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.display"
* extension[section][0].extension[field][1].valueString = "CodeSystem.code"
* extension[section][0].extension[field][2].valueString = "CodeSystem.definition"

Instance:       ihris-page-profession-subcategory
InstanceOf:     IhrisPage
Title:          "Profession Sub Category CodeSystem Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/ihris-profession-subcategory-codesystem)
* extension[display].extension[search][0].valueString = "Code|code"
* extension[display].extension[search][1].valueString = "Display|display"
* extension[display].extension[field][0].extension[path].valueString = "CodeSystem.code"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Profession Sub-Category"
* extension[section][0].extension[description].valueString = "Profession Sub-Category"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.display"
* extension[section][0].extension[field][1].valueString = "CodeSystem.code"
* extension[section][0].extension[field][2].valueString = "CodeSystem.definition"

Instance:       ihris-page-profession-subsubcategory
InstanceOf:     IhrisPage
Title:          "Profession Sub Sub-Category CodeSystem Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/ihris-profession-subsubcategory-codesystem)
* extension[display].extension[search][0].valueString = "Code|code"
* extension[display].extension[search][1].valueString = "Display|display"
* extension[display].extension[field][0].extension[path].valueString = "CodeSystem.code"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Profession Sub Sub-Category"
* extension[section][0].extension[description].valueString = "Profession Sub Sub-Category"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.display"
* extension[section][0].extension[field][1].valueString = "CodeSystem.code"
* extension[section][0].extension[field][2].valueString = "CodeSystem.definition"
