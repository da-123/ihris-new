Profile:        IhrisBasicSalary
Parent:         IhrisPractitionerBasic
Id:             ihris-basic-salary
Title:          "Salary Information"
Description:    "iHRIS Profile of the Basic resource for Salary."
* extension[practitioner].valueReference 1..1 MS
* extension[practitioner].valueReference ^label = "Health Worker"
* extension contains
    IhrisSalary named salary 1..1 MS
* extension[salary] ^label = "Salary Information"
* extension[salary].extension[salaryladder].valueCoding 1..1 MS
* extension[salary].extension[salaryScale].valueCoding 1..1 MS
* extension[salary].extension[salaryStep].valueCoding 1..1 MS
* extension[salary].extension[bsalary].valueString MS
* extension[salary].extension[allowance].valueString MS
* extension[salary].extension[benefits].valueString MS
* extension[salary].extension[total].valueString MS
* extension[salary].extension[startDate].valueDate 1..1 MS
* extension[salary].extension[endDate].valueDate MS
* extension[salary].extension[reviewed].valueBoolean MS
* extension[salary].extension[remark].valueString MS
* extension[salary].extension[salarySource].valueCoding 1..1 MS
* extension[salary].extension[frequency].valueCoding MS
* extension[salary].extension[current].valueBoolean MS
    
Extension:      IhrisSalary
Id:             ihris-salary
Title:          "Salary details"
* extension contains salaryladder 1..1 MS and
    salaryScale 1..1 MS and
    salaryStep 1..1 MS and
    bsalary 0..1 MS and
    allowance 0..1 MS and
    benefits 0..1 MS and
    total 0..1 MS and
    startDate 1..1 MS and
    endDate 0..1 MS and
    reviewed 0..1 MS and
    remark 0..1 MS and
    salarySource 1..1 MS and
    frequency 1..1 MS and
    current 1..1 MS
* extension[salaryladder].value[x] only Coding
* extension[salaryladder].valueCoding 1..1 MS
* extension[salaryladder].valueCoding ^label = "Pay Grade Ladder"
* extension[salaryladder].valueCoding from IhrisEthiopiaSalaryLadderValueSet (required)
* extension[salaryScale].value[x] only Coding
* extension[salaryScale].valueCoding 1..1 MS
* extension[salaryScale].valueCoding ^label = "Pay Grade"
* extension[salaryScale].valueCoding from IhrisSalaryScaleValueSet (required)
* extension[salaryStep].value[x] only Coding
* extension[salaryStep].valueCoding 1..1 MS
* extension[salaryStep].valueCoding ^label = "Pay Grade Step"
* extension[salaryStep].valueCoding from IhrisEthiopiaSalaryStepValueSet (required)
* extension[bsalary].value[x] only string
* extension[bsalary].valueString 1..1 MS
* extension[bsalary].valueString ^label = "Basic Salary"
* extension[allowance].value[x] only string
* extension[allowance].valueString 1..1 MS
* extension[allowance].valueString ^label = "Allowance"
* extension[benefits].value[x] only string
* extension[benefits].valueString 1..1 MS
* extension[benefits].valueString ^label = "Benefits"
* extension[total].value[x] only string
* extension[total].valueString 1..1 MS
* extension[total].valueString ^label = "Total"
* extension[startDate].value[x] only date
* extension[startDate].valueDate 1..1 MS
* extension[startDate].valueDate ^label = "Effective Start Date"
* extension[endDate].value[x] only date
* extension[endDate].valueDate 1..1 MS
* extension[endDate].valueDate ^label = "End Date"
* extension[reviewed].value[x] only boolean
* extension[reviewed].valueBoolean 1..1 MS
* extension[reviewed].valueBoolean ^label = "Is Reviewed"
* extension[remark].value[x] only string
* extension[remark].valueString 1..1 MS
* extension[remark].valueString ^label = "Remark"
* extension[salarySource].value[x] only Coding
* extension[salarySource].valueCoding 1..1 MS
* extension[salarySource].valueCoding ^label = "Salary Fund Source Type"
* extension[salarySource].valueCoding from IhrisEthiopiaSalarySourceValueSet (required)
* extension[frequency].value[x] only Coding
* extension[frequency].valueCoding 1..1 MS
* extension[frequency].valueCoding ^label = "Pay Frequency"
* extension[frequency].valueCoding from IhrisEthiopiaFrequencyValueSet (required)
* extension[current].value[x] only boolean
* extension[current].valueBoolean 1..1 MS
* extension[current].valueBoolean ^label = "Is Current"

CodeSystem:      IhrisEthiopiaSalaryLadder
Id:              ihris-salary-ladder-codesystem
Title:           "Pay Grade Ladder"
* ^date = "2020-10-20T08:41:04.362Z"

ValueSet:         IhrisEthiopiaSalaryLadderValueSet
Id:               ihris-salary-ladder-valueset
Title:            "iHRIS Pay Grade Ladder ValueSet"
* ^date = "2020-10-20T08:41:04.362Z"
* ^version = "0.2.0"
* codes from system IhrisEthiopiaSalaryLadder

CodeSystem:      IhrisEthiopiaSalaryStep
Id:              ihris-salary-step-codesystem
Title:           "Pay Grade Step"
* ^date = "2020-10-20T08:41:04.362Z"

ValueSet:         IhrisEthiopiaSalaryStepValueSet
Id:               ihris-salary-step-valueset
Title:            "iHRIS Pay Grade Step ValueSet"
* ^date = "2020-10-20T08:41:04.362Z"
* ^version = "0.2.0"
* codes from system IhrisEthiopiaSalaryStep

CodeSystem:      IhrisEthiopiaSalarySource
Id:              ihris-salary-source-codesystem
Title:           "Salary Fund Source Type"
* ^date = "2020-10-20T08:41:04.362Z"

ValueSet:         IhrisEthiopiaSalarySourceValueSet
Id:               ihris-salary-source-valueset
Title:            "iHRIS Salary Fund Source Type ValueSet"
* ^date = "2020-10-20T08:41:04.362Z"
* ^version = "0.2.0"
* codes from system IhrisEthiopiaSalarySource

CodeSystem:      IhrisEthiopiaFrequency
Id:              ihris-frequency-codesystem
Title:           "Frequency"
* ^date = "2020-10-20T08:41:04.362Z"
* #daily "Daily"
* #weekly "Weekly"
* #monthly "Monthly"
* #quaterly "Quaterly"
* #biannually "Bi-Annually"
* #annualy "Annually/Yearly"

ValueSet:         IhrisEthiopiaFrequencyValueSet
Id:               ihris-frequency-valueset
Title:            "iHRIS Frequency ValueSet"
* ^date = "2020-10-20T08:41:04.362Z"
* ^version = "0.2.0"
* codes from system IhrisEthiopiaFrequency

Instance:       IhrisPractitionerWorkflowSalary
InstanceOf:      Questionnaire
Usage:          #definition
* title = "iHRIS Salary Workflow"
* description = "iHRIS workflow to record a Salary"
* id = "ihris-salary"
* url = "http://ihris.org/fhir/Questionnaire/ihris-salary"
* name = "ihris-salary"
* status = #active
* date = 2020-09-02
* purpose = "Workflow page for recording a Salary information."

* item[0].linkId = "Basic"
* item[0].text = "Salary Information"
* item[0].type = #group

* item[0].item[0].linkId = "Basic.extension[0].extension[0]"
* item[0].item[0].text = "Pay Grade Ladder"
* item[0].item[0].type = #choice
* item[0].item[0].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-salary-ladder-valueset"
* item[0].item[0].required = true
* item[0].item[0].repeats = false

* item[0].item[1].linkId = "Basic.extension[0].extension[1]"
* item[0].item[1].text = "Pay Grade"
* item[0].item[1].type = #choice
* item[0].item[1].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-salary-scale-valueset"
* item[0].item[1].required = true
* item[0].item[1].repeats = false

* item[0].item[2].linkId = "Basic.extension[0].extension[2]"
* item[0].item[2].text = "Pay Grade Step"
* item[0].item[2].type = #choice
* item[0].item[2].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-salary-step-valueset"
* item[0].item[2].required = true
* item[0].item[2].repeats = false

* item[0].item[3].linkId = "Basic.extension[0].extension[3]"
* item[0].item[3].text = "Basic Salary"
* item[0].item[3].type = #string
* item[0].item[3].required = false
* item[0].item[3].repeats = false

* item[0].item[4].linkId = "Basic.extension[0].extension[4]"
* item[0].item[4].text = "Allowance"
* item[0].item[4].type = #string
* item[0].item[4].required = false
* item[0].item[4].repeats = false

* item[0].item[5].linkId = "Basic.extension[0].extension[5]"
* item[0].item[5].text = "Benefits"
* item[0].item[5].type = #string
* item[0].item[5].required = false
* item[0].item[5].repeats = false

* item[0].item[6].linkId = "Basic.extension[0].extension[6]"
* item[0].item[6].text = "Effective Start date"
* item[0].item[6].type = #date
* item[0].item[6].required = true
* item[0].item[6].repeats = false

* item[0].item[7].linkId = "Basic.extension[0].extension[7]"
* item[0].item[7].text = "End Date"
* item[0].item[7].type = #date
* item[0].item[7].required = false
* item[0].item[7].repeats = false

* item[0].item[8].linkId = "Basic.extension[0].extension[8]"
* item[0].item[8].text = "Is Reviewed"
* item[0].item[8].type = #boolean
* item[0].item[8].required = false
* item[0].item[8].repeats = false

* item[0].item[9].linkId = "Basic.extension[0].extension[9]"
* item[0].item[9].text = "Remark"
* item[0].item[9].type = #text
* item[0].item[9].required = false
* item[0].item[9].repeats = false

* item[0].item[10].linkId = "Basic.extension[0].extension[10]"
* item[0].item[10].text = "Salary Fund Source Type"
* item[0].item[10].type = #choice
* item[0].item[10].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-salary-source-valueset"
* item[0].item[10].required = true
* item[0].item[10].repeats = false

* item[0].item[11].linkId = "Basic.extension[0].extension[11]"
* item[0].item[11].text = "Pay Frequency"
* item[0].item[11].type = #choice
* item[0].item[11].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-frequency-valueset"
* item[0].item[11].required = false
* item[0].item[11].repeats = false

* item[0].item[12].linkId = "Basic.extension[0].extension[12]"
* item[0].item[12].text = "Is Current"
* item[0].item[12].type = #boolean
* item[0].item[12].required = false
* item[0].item[12].repeats = false

Instance:       ihris-page-salary
InstanceOf:     IhrisPage
Title:          "iHRIS Basic Salary Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(StructureDefinition/ihris-basic-salary)
* extension[display].extension[link][0].extension[field].valueString = "Basic.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference').valueReference.reference"
* extension[display].extension[link][0].extension[text].valueString = "View Health Worker"
* extension[display].extension[link][0].extension[button].valueBoolean = true
* extension[display].extension[link][0].extension[icon].valueString = "mdi-account-arrow-right"
* extension[display].extension[link][0].extension[url].valueUrl = "/resource/view/practitioner/FIELD"
* extension[display].extension[search][0].valueString = "Salary|extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-salary').extension.where(url='bsalary').valueString"
* extension[display].extension[field][0].extension[path].valueString = "Basic.extension:practitioner.value[x]:valueReference"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Employee Salary Information"
* extension[section][0].extension[description].valueString = "Employee Salary details"
* extension[section][0].extension[name].valueString = "Basic"
* extension[section][0].extension[field][0].valueString = "Basic.extension:practitioner"
* extension[section][0].extension[field][1].valueString = "Basic.extension:salary.extension:salaryladder.value[x]:valueCoding"
* extension[section][0].extension[field][2].valueString = "Basic.extension:salary.extension:salaryScale.value[x]:valueCoding"
* extension[section][0].extension[field][3].valueString = "Basic.extension:salary.extension:salaryStep.value[x]:valueCoding"
* extension[section][0].extension[field][4].valueString = "Basic.extension:salary.extension:bsalary.value[x]:valueString"
* extension[section][0].extension[field][5].valueString = "Basic.extension:salary.extension:allowance.value[x]:valueString"
* extension[section][0].extension[field][6].valueString = "Basic.extension:salary.extension:benefits.value[x]:valueString"
* extension[section][0].extension[field][7].valueString = "Basic.extension:salary.extension:total.value[x]:valueString"
* extension[section][0].extension[field][8].valueString = "Basic.extension:salary.extension:startDate.value[x]:valueDate"
* extension[section][0].extension[field][9].valueString = "Basic.extension:salary.extension:endDate.value[x]:valueDate"
* extension[section][0].extension[field][10].valueString = "Basic.extension:salary.extension:reviewed.value[x]:valueBoolean"
* extension[section][0].extension[field][11].valueString = "Basic.extension:salary.extension:remark.value[x]:valueString"
* extension[section][0].extension[field][12].valueString = "Basic.extension:salary.extension:salarySource.value[x]:valueCoding"
* extension[section][0].extension[field][13].valueString = "Basic.extension:salary.extension:frequency.value[x]:valueCoding"
* extension[section][0].extension[field][14].valueString = "Basic.extension:salary.extension:current.value[x]:valueBoolean"

Instance:       ihris-page-salary-ladder
InstanceOf:     IhrisPage
Title:          "iHRIS Salary Ladder CodeSystem Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/ihris-salary-ladder-codesystem)
* extension[display].extension[search][0].valueString = "Code|code"
* extension[display].extension[search][1].valueString = "Display|display"
* extension[display].extension[field][0].extension[path].valueString = "CodeSystem.code"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Pay Grade Ladder"
* extension[section][0].extension[description].valueString = "Pay Grade Ladder"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.display"
* extension[section][0].extension[field][1].valueString = "CodeSystem.code"
* extension[section][0].extension[field][2].valueString = "CodeSystem.definition"

Instance:       ihris-page-salary-step
InstanceOf:     IhrisPage
Title:          "iHRIS Salary Step CodeSystem Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/ihris-salary-step-codesystem)
* extension[display].extension[search][0].valueString = "Code|code"
* extension[display].extension[search][1].valueString = "Display|display"
* extension[display].extension[field][0].extension[path].valueString = "CodeSystem.code"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Pay Grade Step"
* extension[section][0].extension[description].valueString = "Pay Grade Step"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.display"
* extension[section][0].extension[field][1].valueString = "CodeSystem.code"
* extension[section][0].extension[field][2].valueString = "CodeSystem.definition"

Instance:       ihris-page-salary-source
InstanceOf:     IhrisPage
Title:          "iHRIS Salary source CodeSystem Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/ihris-salary-source-codesystem)
* extension[display].extension[search][0].valueString = "Code|code"
* extension[display].extension[search][1].valueString = "Display|display"
* extension[display].extension[field][0].extension[path].valueString = "CodeSystem.code"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Salary Fund Source Type"
* extension[section][0].extension[description].valueString = "Salary Fund Source Type"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.display"
* extension[section][0].extension[field][1].valueString = "CodeSystem.code"
* extension[section][0].extension[field][2].valueString = "CodeSystem.definition"

Instance:       ihris-page-frequency
InstanceOf:     IhrisPage
Title:          "iHRIS Pay Frequency CodeSystem Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/ihris-frequency-codesystem)
* extension[display].extension[search][0].valueString = "Code|code"
* extension[display].extension[search][1].valueString = "Display|display"
* extension[display].extension[field][0].extension[path].valueString = "CodeSystem.code"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Pay Frequency"
* extension[section][0].extension[description].valueString = "Pay Frequency"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.display"
* extension[section][0].extension[field][1].valueString = "CodeSystem.code"
* extension[section][0].extension[field][2].valueString = "CodeSystem.definition"