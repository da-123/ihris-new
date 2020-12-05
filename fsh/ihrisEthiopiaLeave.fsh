Profile:        IhrisBasicEthiopiaLeave
Parent:         IhrisPractitionerBasic
Id:             ihris-basic-ethiopia-leave
Title:          "Leave Information"
Description:    "iHRIS Profile of the Basic resource for Ethiopia Leave."
* extension[practitioner].valueReference 1..1 MS
* extension[practitioner].valueReference ^label = "Health Worker"
* extension contains
    IhrisEthiopiaLeave named ethiopiaLeave 1..1 MS
* extension[ethiopiaLeave].extension[leave-type].valueCoding MS
* extension[ethiopiaLeave].extension[period].valuePeriod MS
* extension[ethiopiaLeave].extension[period].valuePeriod.start MS
* extension[ethiopiaLeave].extension[period].valuePeriod.start ^label = "Leave Start Date"
* extension[ethiopiaLeave].extension[period].valuePeriod.start ^minValueDateTime = "1950-01-01"
* extension[ethiopiaLeave].extension[period].valuePeriod.start ^maxValueDateTime = "2030-01-01"
* extension[ethiopiaLeave].extension[period].valuePeriod.end MS
* extension[ethiopiaLeave].extension[period].valuePeriod.end ^label = "Leave End Date"
* extension[ethiopiaLeave].extension[period].valuePeriod.end ^minValueDateTime = "1950-01-01"
* extension[ethiopiaLeave].extension[period].valuePeriod.end ^maxValueDateTime = "2030-01-01"
* extension[ethiopiaLeave].extension[dateRequested].valueDate MS
* extension[ethiopiaLeave].extension[daysRequested].valueInteger MS
* extension[ethiopiaLeave].extension[leaveSubType].valueCoding MS
    
Extension:      IhrisEthiopiaLeave
Id:             ihris-ethiopia-leave
Title:          "Leave details"
* extension contains
      leave-type 1..1 MS and
      period 1..1 MS and
      daysRequested 0..1 MS and
      dateRequested 0..1 MS and
      leaveSubType 0..1 MS
* extension[leave-type].value[x] only Coding
* extension[leave-type].valueCoding from IhrisLeaveTypeValueSet (required)
* extension[leave-type].valueCoding ^label = "Leave Type"
* extension[period].value[x] only Period
* extension[period].valuePeriod ^label = "Leave Period"
* extension[period].valuePeriod.start 1..1 MS
* extension[period].valuePeriod.start ^label = "Leave Start Date"
* extension[period].valuePeriod.start ^minValueDateTime = "1950-01-01"
* extension[period].valuePeriod.start ^maxValueDateTime = "2030-01-01"
* extension[period].valuePeriod.end ^minValueDateTime = "1950-01-01"
* extension[period].valuePeriod.end ^maxValueDateTime = "2030-01-01"
* extension[period].valuePeriod.end ^label = "Leave End Date"
* extension[period].valuePeriod.end 1..1 MS
* extension[period].valuePeriod ^constraint[0].key = "ihris-period-start-end"
* extension[period].valuePeriod ^constraint[0].severity = #error
* extension[period].valuePeriod ^constraint[0].human = "The end date must be after the start date"
* extension[period].valuePeriod ^constraint[0].expression = "end.empty() or end = '' or end >= start"
* extension[daysRequested].value[x] only integer
* extension[daysRequested].valueInteger ^label = "Days Requested"
* extension[dateRequested].value[x] only date
* extension[dateRequested].valueDate ^label = "Requested Date"
* extension[leaveSubType].value[x] only Coding
* extension[leaveSubType].valueCoding from IhrisLeaveSubTypeValueSet (required)
* extension[leaveSubType].valueCoding ^label = "Leave Sub Type"

CodeSystem:      IhrisLeaveTypeCodeSystem
Id:              ihris-leave-type-codesystem
Title:           "Leave Type"
* ^date = "2020-10-20T08:41:04.362Z"
* ^version = "0.2.0"
* #annual "Annual Leave" "Annual Leave"
* #maternity "Maternity Leave" "Maternity Leave"
* #paternity "Paternity Leave" "Paternity Leave"
* #sick  "Sick Leave" "Sick Leave"
* #special  "Special Leave" "Special Leave"
* #forced  "Leave Without Pay" "Leave Without Pay"
* #casual "Casual Leave" "Casual Leave"
* #mourning "Mourning Leave" "Mourning Leave"
* #wedding "Wedding Days" "Wedding Days"
* #exam "Exam Leave" "Exam Leave"
* #medical "Medical Leave" "Medical Leave"

ValueSet:         IhrisLeaveTypeValueSet
Id:               ihris-leave-type-valueset
Title:            "iHRIS leave Type ValueSet"
* ^date = "2020-10-20T08:41:04.362Z"
* ^version = "0.2.0"
* codes from system IhrisLeaveTypeCodeSystem

CodeSystem:      IhrisLeaveSubTypeCodeSystem
Id:              ihris-leave-sub-type-codesystem
Title:           "Leave Sub Type"
* ^date = "2020-10-20T08:41:04.362Z"
* ^version = "0.2.0"
* #FHDM "First half day: Morning"
* #FHDA "First half day: Afternoon"
* #EOD "Every other day"
* #EODHDM "Every other day half day: Morning"
* #EODHDA "Every other day half day: Afternoon" 

ValueSet:         IhrisLeaveSubTypeValueSet
Id:               ihris-leave-sub-type-valueset
Title:            "iHRIS leave Sub Type ValueSet"
* ^date = "2020-10-20T08:41:04.362Z"
* ^version = "0.2.0"
* codes from system IhrisLeaveSubTypeCodeSystem

Profile:        IhrisBasicEthiopiaLeaveStock
Parent:         IhrisPractitionerBasic
Id:             ihris-basic-ethiopia-leave-stock
Title:          "Leave Stock Information"
Description:    "iHRIS Profile of the Basic resource for Ethiopia Leave."
* extension[practitioner].valueReference 1..1 MS
* extension[practitioner].valueReference ^label = "Health Worker"
* extension contains
    IhrisEthiopiaLeaveStock named ethiopiaLeaveStock 1..1 MS
* extension[ethiopiaLeaveStock].extension[leave-type].valueCoding MS
* extension[ethiopiaLeaveStock].extension[year].valueDate MS
* extension[ethiopiaLeaveStock].extension[year].valueDate ^minValueDate = "1950-01-01"
* extension[ethiopiaLeaveStock].extension[numDays].valueString MS

Extension:      IhrisEthiopiaLeaveStock
Id:             ihris-ethiopia-leave-stock
Title:          "Leave Stock details"
* extension contains
      leave-type 1..1 MS and
      numDays 1..1 MS and
      year 0..1 MS
* extension[leave-type].value[x] only Coding
* extension[leave-type].valueCoding from IhrisLeaveTypeValueSet (required)
* extension[leave-type].valueCoding ^label = "Leave Type"
* extension[numDays].value[x] only string
* extension[numDays].valueString ^label = "Number Of Days"
* extension[numDays].valueString ^constraint[0].key = "ihris-number-check"
* extension[numDays].valueString ^constraint[0].severity = #error
* extension[numDays].valueString ^constraint[0].expression = "matches('^[0-9][0-9][0-9]?$')"
* extension[numDays].valueString ^constraint[0].human = "Given Name must be only text."
* extension[year].value[x] only date
* extension[year].valueDate ^label = "Year"

Instance:       IhrisPractitionerWorkflowLeaveEthiopia
InstanceOf:     IhrisQuestionnaire
Usage:          #definition
* title = "iHRIS Leave Workflow"
* description = "iHRIS workflow to record a leave"
* id = "ihris-leave-ethiopia"
* url = "http://ihris.org/fhir/Questionnaire/ihris-leave-ethiopia"
* name = "ihris-leave-ethiopia"
* status = #active
* date = 2020-08-20
* purpose = "Workflow page for recording a leave information."

* item[0].linkId = "Basic"
* item[0].text = "Leave Details"
* item[0].type = #group
* item[0].extension[constraint].extension[key].valueId = "ihris-start-end-date"
* item[0].extension[constraint].extension[severity].valueCode = #error
* item[0].extension[constraint].extension[expression].valueString = "where(linkId='Basic.extension[0].extension[2]').answer.first().valueDateTime.empty() or where(linkId='Basic.extension[0].extension[2]').answer.first().valueDateTime >= where(linkId='Basic.extension[0].extension[1]').answer.first().valueDateTime"
* item[0].extension[constraint].extension[human].valueString = "The end date must be after the start date."

* item[0].item[0].linkId = "Basic.extension[0].extension[0]"
* item[0].item[0].text = "Leave Type"
* item[0].item[0].type = #choice
* item[0].item[0].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-leave-type-valueset"
* item[0].item[0].required = true
* item[0].item[0].repeats = false

* item[0].item[1].linkId = "Basic.extension[0].extension[1]"
* item[0].item[1].text = "Start Date"
* item[0].item[1].type = #dateTime
* item[0].item[1].required = true
* item[0].item[1].repeats = false

* item[0].item[2].linkId = "Basic.extension[0].extension[2]"
* item[0].item[2].text = "End Date"
* item[0].item[2].type = #dateTime
* item[0].item[2].required = true
* item[0].item[2].repeats = false

/** item[0].item[3].linkId = "Basic.extension[0].extension[3]"
* item[0].item[3].text = "Days Requested"
* item[0].item[3].type = #integer
* item[0].item[3].required = true
* item[0].item[3].repeats = false*/

* item[0].item[3].linkId = "Basic.extension[0].extension[4]"
* item[0].item[3].text = "Date Requested"
* item[0].item[3].type = #date
* item[0].item[3].required = true
* item[0].item[3].repeats = false

* item[0].item[4].linkId = "Basic.extension[0].extension[5]"
* item[0].item[4].text = "Leave Sub Type"
* item[0].item[4].type = #choice
* item[0].item[4].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-leave-sub-type-valueset"
* item[0].item[4].required = false
* item[0].item[4].repeats = false

Instance:       ihris-page-basicleave
InstanceOf:     IhrisPage
Title:          "iHRIS Basic Leave Ethiopia Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(StructureDefinition/ihris-basic-ethiopia-leave)
* extension[display].extension[link][0].extension[field].valueString = "Basic.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference').valueReference.reference"
* extension[display].extension[link][0].extension[text].valueString = "View Health Worker"
* extension[display].extension[link][0].extension[button].valueBoolean = true
* extension[display].extension[link][0].extension[icon].valueString = "mdi-account-arrow-right"
* extension[display].extension[link][0].extension[url].valueUrl = "/resource/view/practitioner/FIELD"
* extension[display].extension[link][1].extension[field].valueString = "Basic.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference').valueReference.reference"
* extension[display].extension[link][1].extension[text].valueString = "Add Another"
* extension[display].extension[link][1].extension[button].valueBoolean = true
* extension[display].extension[link][1].extension[icon].valueString = "mdi-account-arrow-right"
* extension[display].extension[link][1].extension[url].valueUrl = "/questionnaire/ihris-leave-ethiopia/basicleave?practitioner=FIELD"
* extension[display].extension[search][0].valueString = "Leave Type|extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-ethiopia-leave').extension.where(url='leave-type').valueCoding"
* extension[display].extension[search][1].valueString = "Practitioner|extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference').valueReference.reference"
* extension[display].extension[filter][0].valueString = "Leave Type|code|http://ihris.org/fhir/ValueSet/ihris-leave-type-valueset"
* extension[display].extension[field][0].extension[path].valueString = "Basic.extension:practitioner.value[x]:valueReference"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Leave"
* extension[section][0].extension[description].valueString = "Leave details"
* extension[section][0].extension[name].valueString = "Basic"
* extension[section][0].extension[field][0].valueString = "Basic.extension:practitioner"
* extension[section][0].extension[field][1].valueString = "Basic.extension:ethiopiaLeave.extension:leave-type.value[x]:valueCoding"
* extension[section][0].extension[field][2].valueString = "Basic.extension:ethiopiaLeave.extension:daysRequested.value[x]:valueInteger"
* extension[section][0].extension[field][3].valueString = "Basic.extension:ethiopiaLeave.extension:period.value[x]:valuePeriod"
/* extension[section][0].extension[field][4].valueString = "Basic.extension:ethiopiaLeave.extension:period.value[x]:valuePeriod.end"*/
* extension[section][0].extension[field][4].valueString = "Basic.extension:ethiopiaLeave.extension:dateRequested.value[x]:valueDate"
* extension[section][0].extension[field][5].valueString = "Basic.extension:ethiopiaLeave.extension:leaveSubType.value[x]:valueCoding"

Instance:       IhrisPractitionerWorkflowLeaveStock
InstanceOf:     IhrisQuestionnaire
Usage:          #definition
* title = "iHRIS Leave Workflow"
* description = "iHRIS workflow to record a leave"
* id = "ihris-leave-stock-ethiopia"
* url = "http://ihris.org/fhir/Questionnaire/ihris-leave-stock-ethiopia"
* name = "ihris-leave-stock-ethiopia"
* status = #active
* date = 2020-12-02
* purpose = "Workflow page for recording a leave stock information."

* item[0].linkId = "Basic"
* item[0].text = "Leave Stock Details"
* item[0].type = #group

* item[0].item[0].linkId = "Basic.extension[0].extension[0]"
* item[0].item[0].text = "Leave Type"
* item[0].item[0].type = #choice
* item[0].item[0].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-leave-type-valueset"
* item[0].item[0].required = true
* item[0].item[0].repeats = false

* item[0].item[1].linkId = "Basic.extension[0].extension[1]"
* item[0].item[1].text = "Year"
* item[0].item[1].type = #date
* item[0].item[1].required = true
* item[0].item[1].repeats = false

* item[0].item[2].linkId = "Basic.extension[0].extension[2]"
* item[0].item[2].text = "Number Of Days"
* item[0].item[2].type = #string
* item[0].item[2].required = true
* item[0].item[2].repeats = false
* item[0].item[2].extension[constraint].extension[key].valueId = "ihris-num-check"
* item[0].item[2].extension[constraint].extension[severity].valueCode = #error
* item[0].item[2].extension[constraint].extension[expression].valueString = "matches('^[0-9][0-9][0-9]?$')"
* item[0].item[2].extension[constraint].extension[human].valueString = "Should be a Number."

Instance:       ihris-page-leavestock
InstanceOf:     IhrisPage
Title:          "iHRIS Basic Leave Stock Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(StructureDefinition/ihris-basic-ethiopia-leave-stock)
* extension[display].extension[link][0].extension[field].valueString = "Basic.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference').valueReference.reference"
* extension[display].extension[link][0].extension[text].valueString = "View Health Worker"
* extension[display].extension[link][0].extension[button].valueBoolean = true
* extension[display].extension[link][0].extension[icon].valueString = "mdi-account-arrow-right"
* extension[display].extension[link][0].extension[url].valueUrl = "/resource/view/practitioner/FIELD"
* extension[display].extension[link][1].extension[field].valueString = "Basic.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference').valueReference.reference"
* extension[display].extension[link][1].extension[text].valueString = "Add Another"
* extension[display].extension[link][1].extension[button].valueBoolean = true
* extension[display].extension[link][1].extension[icon].valueString = "mdi-account-arrow-right"
* extension[display].extension[link][1].extension[url].valueUrl = "/questionnaire/ihris-leave-stock-ethiopia/leavestock?practitioner=FIELD"
* extension[display].extension[search][0].valueString = "Leave Type|extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-ethiopia-leave-stock').extension.where(url='leave-type').valueCoding"
* extension[display].extension[search][1].valueString = "Practitioner|extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference').valueReference.reference"
* extension[display].extension[filter][0].valueString = "Leave Type|code|http://ihris.org/fhir/ValueSet/ihris-leave-type-valueset"
* extension[display].extension[field][0].extension[path].valueString = "Basic.extension:practitioner.value[x]:valueReference"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Leave Stock"
* extension[section][0].extension[description].valueString = "Leave Stock details"
* extension[section][0].extension[name].valueString = "Basic"
* extension[section][0].extension[field][0].valueString = "Basic.extension:practitioner"
* extension[section][0].extension[field][1].valueString = "Basic.extension:ethiopiaLeaveStock.extension:leave-type.value[x]:valueCoding"
* extension[section][0].extension[field][2].valueString = "Basic.extension:ethiopiaLeaveStock.extension:numDays.value[x]:valueString"
* extension[section][0].extension[field][3].valueString = "Basic.extension:ethiopiaLeaveStock.extension:year.value[x]:valueDate"
