Invariant:      ihris-performance-period
Description:    "Period Must be six months or less"
Expression:     "end <= start + 6 months"
Severity:       #error

Profile:        IhrisBasicPerformance
Parent:         IhrisPractitionerBasic
Id:             ihris-basic-performance
Title:          "Performance Information"
Description:    "iHRIS Profile of the Basic resource for Performance."
* extension[practitioner].valueReference 1..1 MS
* extension[practitioner].valueReference ^label = "Health Worker"
* extension contains
    IhrisPerformance named performance 1..1 MS
* extension[performance].extension[performanceType].valueCoding 1..1 MS
* extension[performance].extension[performanceType].valueCoding ^label = "Performance Type"
* extension[performance].extension[evaluator].valueString 1..1 MS
* extension[performance].extension[evaluator].valueString ^label = "Evaluator's Name"
* extension[performance].extension[period].valuePeriod MS
* extension[performance].extension[period].valuePeriod obeys ihris-performance-period
* extension[performance].extension[period].valuePeriod.start 1..1 MS
* extension[performance].extension[period].valuePeriod.start ^label = "Evaluation Period Start Date"
* extension[performance].extension[period].valuePeriod.end 1..1 MS
* extension[performance].extension[period].valuePeriod.end ^label = "Evaluation Period End Date"
* extension[performance].extension[score].valueString ^label = "Score Attained"
* extension[performance].extension[score].valueString 1..1 MS
    
Extension:      IhrisPerformance
Id:             ihris-performance
Title:          "Performance details"
* extension contains
      performanceType 1..1 MS and
      evaluator 1..1 MS and
      period 1..1 MS and
      score 1..1 MS 
* extension[performanceType].value[x] only Coding
* extension[performanceType].valueCoding 1..1 MS
* extension[performanceType].valueCoding ^label = "Performance Type"
* extension[performanceType].valueCoding from IhrisPerformanceTypeValueSet (required)
* extension[evaluator].value[x] only string
* extension[evaluator].valueString ^label = "Evaluator's Name"
* extension[score].value[x] only string
* extension[score].valueString ^label = "Score Attained"
* extension[period].value[x] only Period
* extension[period].valuePeriod ^constraint[0].key = "ihris-period-start-end"
* extension[period].valuePeriod ^constraint[0].severity = #error
* extension[period].valuePeriod ^constraint[0].human = "The end date must be after the start date"
* extension[period].valuePeriod ^constraint[0].expression = "end >= start"
* extension[period].valuePeriod ^constraint[1].key = "ihris-period-start-end-diff"
* extension[period].valuePeriod ^constraint[1].severity = #error
* extension[period].valuePeriod ^constraint[1].human = "The difference between end date and start date must be max 6 moths"
* extension[period].valuePeriod ^constraint[1].expression = "end <= start + 6 months"
* extension[period].valuePeriod ^label = "Evaluation Period"
* extension[period].valuePeriod.start 1..1 MS
* extension[period].valuePeriod.start ^label = "Evaluation Period Start Date"
* extension[period].valuePeriod.end 1..1 MS
* extension[period].valuePeriod.end ^label = "Evaluation Period End Date"

CodeSystem:      IhrisPerformanceScore
Id:              ihris-performance-score
Title:           "Performance Score"
* ^date = "2020-11-17T10:41:04.362Z"
* ^version = "0.2.0"
* #1 "Improvement Required" "Improvement Required"
* #2 "Development Required" "Development Required"
* #3 "Meets Expectations" "Meets Expectations"
* #4 "Exceeds Expectations" "Exceeds Expectations"
* #5 "Far Exceeds Expectations" "Far Exceeds Expectations"

ValueSet:         IhrisPerformanceScoreValueSet
Id:               ihris-performance-score-valueset
Title:            "iHRIS Performance Score ValueSet"
* ^date = "2020-11-17T10:41:04.362Z"
* ^version = "0.2.0"
* codes from system IhrisPerformanceScore

CodeSystem:      IhrisPerformanceType
Id:              ihris-performance-type
Title:           "Performance Score"
* ^date = "2020-11-17T10:41:04.362Z"
* ^version = "0.2.0"
* #probation "Probation period" "Probation period"
* #annual "Annual Performance Evaluation" "Annual Performance Evaluation"

ValueSet:         IhrisPerformanceTypeValueSet
Id:               ihris-performance-type-valueset
Title:            "iHRIS Performance Score ValueSet"
* ^date = "2020-11-10T10:41:04.362Z"
* ^version = "0.2.0"
* codes from system IhrisPerformanceType

Instance:       IhrisPractitionerWorkflowPerformance
InstanceOf:      IhrisQuestionnaire
Usage:          #definition
* title = "iHRIS Performance Workflow"
* description = "iHRIS workflow to record a Performance"
* id = "ihris-performance"
* url = "http://ihris.org/fhir/Questionnaire/ihris-performance"
* name = "ihris-performance"
* status = #active
* date = 2020-09-02
* purpose = "Workflow page for recording a Performance information."

* item[0].linkId = "Basic"
* item[0].text = "Performance"
* item[0].type = #group
* item[0].extension[constraint][0].extension[key].valueId = "ihris-start-end-date"
* item[0].extension[constraint][0].extension[severity].valueCode = #error
* item[0].extension[constraint][0].extension[expression].valueString = "where(linkId='Basic.extension[0].extension[2]').answer.first().valueDateTime.empty() or where(linkId='Basic.extension[0].extension[2]').answer.first().valueDateTime >= where(linkId='Basic.extension[0].extension[1]').answer.first().valueDateTime"
* item[0].extension[constraint][0].extension[human].valueString = "The end date must be after the start date."
* item[0].extension[constraint][1].extension[key].valueId = "ihris-period-diff"
* item[0].extension[constraint][1].extension[severity].valueCode = #error
* item[0].extension[constraint][1].extension[expression].valueString = "where(linkId='Basic.extension[0].extension[2]').answer.first().valueDateTime <= where(linkId='Basic.extension[0].extension[1]').answer.first().valueDateTime + 6 months"
* item[0].extension[constraint][1].extension[human].valueString = "The Start and End date period must be six months or less."

* item[0].item[0].linkId = "Basic.extension[0].extension[0]"
* item[0].item[0].text = "Evaluator's Name"
* item[0].item[0].type = #string
* item[0].item[0].required = true
* item[0].item[0].repeats = false
* item[0].item[0].extension[constraint].extension[key].valueId = "ihris-given-name-check"
* item[0].item[0].extension[constraint].extension[severity].valueCode = #error
* item[0].item[0].extension[constraint].extension[expression].valueString = "matches('^[A-Za-z ]*$')"
* item[0].item[0].extension[constraint].extension[human].valueString = "Name must be only text."

* item[0].item[1].linkId = "Basic.extension[0].extension[1]"
* item[0].item[1].text = "Evaluation Period Start Date"
* item[0].item[1].type = #dateTime
* item[0].item[1].required = true
* item[0].item[1].repeats = false

* item[0].item[2].linkId = "Basic.extension[0].extension[2]"
* item[0].item[2].text = "Evaluation Period End Date"
* item[0].item[2].type = #dateTime
* item[0].item[2].required = true
* item[0].item[2].repeats = false

* item[0].item[3].linkId = "Basic.extension[0].extension[3]"
* item[0].item[3].text = "Score Attained"
* item[0].item[3].type = #string
* item[0].item[3].required = true
* item[0].item[3].repeats = false

* item[0].item[4].linkId = "Basic.extension[0].extension[4]"
* item[0].item[4].text = "Performance Type"
* item[0].item[4].type = #choice
* item[0].item[4].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-performance-type-valueset"
* item[0].item[4].required = true
* item[0].item[4].repeats = false

Instance:       ihris-page-performance
InstanceOf:     IhrisPage
Title:          "iHRIS Basic Performance Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(StructureDefinition/ihris-basic-performance)
* extension[display].extension[link][0].extension[field].valueString = "Basic.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference').valueReference.reference"
* extension[display].extension[link][0].extension[text].valueString = "View Health Worker"
* extension[display].extension[link][0].extension[button].valueBoolean = true
* extension[display].extension[link][0].extension[icon].valueString = "mdi-account-arrow-right"
* extension[display].extension[link][0].extension[url].valueUrl = "/resource/view/practitioner/FIELD"
* extension[display].extension[link][1].extension[field].valueString = "Basic.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference').valueReference.reference"
* extension[display].extension[link][1].extension[text].valueString = "Add Another"
* extension[display].extension[link][1].extension[button].valueBoolean = true
* extension[display].extension[link][1].extension[icon].valueString = "mdi-account-arrow-right"
* extension[display].extension[link][1].extension[url].valueUrl = "/questionnaire/ihris-performance/performance?practitioner=FIELD"
* extension[display].extension[search][0].valueString = "Start Date|extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-performance').extension.where(url='period').valuePeriod.start"
* extension[display].extension[search][1].valueString = "End Date|extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-performance').extension.where(url='period').valuePeriod.end"
* extension[display].extension[field][0].extension[path].valueString = "Basic.extension:practitioner.value[x]:valueReference"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Performance Evaluation"
* extension[section][0].extension[description].valueString = "Performance Evaluation details"
* extension[section][0].extension[name].valueString = "Basic"
* extension[section][0].extension[field][0].valueString = "Basic.extension:practitioner"
* extension[section][0].extension[field][1].valueString = "Basic.extension:performance.extension:evaluator.value[x]:valueString"
* extension[section][0].extension[field][2].valueString = "Basic.extension:performance.extension:period.value[x]:valuePeriod"
* extension[section][0].extension[field][3].valueString = "Basic.extension:performance.extension:score.value[x]:valueString"
