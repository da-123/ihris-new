Profile:        IhrisBasicEmploymentHistory
Parent:         IhrisPractitionerBasic
Id:             ihris-basic-employment-history
Title:          "Employment History Information"
Description:    "iHRIS Profile of the Basic resource for Employment History."
* extension[practitioner].valueReference 1..1 MS
* extension[practitioner].valueReference ^label = "Health Worker"
* extension contains
    IhrisEmploymentHistory named employmentHistory 1..1 MS
* extension[employmentHistory].extension[organization].valueString MS
* extension[employmentHistory].extension[organization] ^label = "Organization Name"
* extension[employmentHistory].extension[address].valueString MS
* extension[employmentHistory].extension[address] ^label = "Organization Address"
* extension[employmentHistory].extension[telephone].valueString MS
* extension[employmentHistory].extension[telephone] ^label = "Organization Telephone"
* extension[employmentHistory].extension[startingPosition].valueString MS
* extension[employmentHistory].extension[startingPosition] ^label = "Starting Position"
* extension[employmentHistory].extension[startingSalary].valueMoney MS
* extension[employmentHistory].extension[startingSalary] ^label = "Starting Salary"
* extension[employmentHistory].extension[dateStarted].valueDate MS
* extension[employmentHistory].extension[dateStarted] ^label = "Date Started"
* extension[employmentHistory].extension[endingPosition].valueString MS
* extension[employmentHistory].extension[endingPosition] ^label = "Ending Position"
* extension[employmentHistory].extension[endingSalary].valueMoney MS
* extension[employmentHistory].extension[endingSalary] ^label = "Ending Salary"
* extension[employmentHistory].extension[dateEnded].valueDate MS
* extension[employmentHistory].extension[dateEnded] ^label = "Date Ended"
* extension[employmentHistory].extension[responsibilities].valueString MS
* extension[employmentHistory].extension[responsibilities] ^label = "Job Responsibilities"
* extension[employmentHistory].extension[reasonLeaving].valueString MS
* extension[employmentHistory].extension[reasonLeaving] ^label = "Reason For Leaving"

Extension:      IhrisEmploymentHistory
Id:             ihris-employment-history
Title:          "Employment History details"
* extension contains
      organization 1..1 MS and
      address 0..1 MS and
      telephone 0..* MS and
      startingPosition 0..1 MS and
      startingSalary 0..1 MS and
      endingPosition 0..1 MS and
      dateStarted 0..1 MS and
      dateEnded 0..1 MS and
      endingSalary  0..1 MS and
      responsibilities 0..1 MS and
      reasonLeaving 0..1 MS
* extension[organization].value[x] only string
* extension[organization].valueString ^label = "Organization Name"
* extension[address].value[x] only string
* extension[address].valueString ^label = "Organization Address"
* extension[telephone].value[x] only string
* extension[telephone].valueString ^label = "Organization Telephone"
* extension[startingPosition].value[x] only string
* extension[startingPosition].valueString ^label = "Starting Position"
* extension[startingSalary].value[x] only Money
* extension[startingSalary].valueMoney ^label = "Starting Salary"
* extension[dateStarted].value[x] only date
* extension[dateStarted].valueDate ^label = "Date Started"
* extension[endingPosition].value[x] only string
* extension[endingPosition].valueString ^label = "Ending Position"
* extension[endingSalary].value[x] only Money
* extension[endingSalary].valueMoney ^label = "Ending Salary"
* extension[dateEnded].value[x] only date
* extension[dateEnded].valueDate ^label = "Date Ended"
* extension[responsibilities].value[x] only string
* extension[responsibilities].valueString ^label = "Job Responsibilities"
* extension[reasonLeaving].value[x] only string
* extension[reasonLeaving].valueString ^label = "Reason For Leaving"

Instance:       IhrisPractitionerWorkflowEmploymentHistory
InstanceOf:      Questionnaire
Usage:          #definition
* title = "iHRIS Employment History Workflow"
* description = "iHRIS workflow to record a Employment History"
* id = "ihris-employment-history"
* url = "http://ihris.org/fhir/Questionnaire/ihris-employment-history"
* name = "ihris-employment-history"
* status = #active
* date = 2020-08-27
* purpose = "Workflow page for recording a Employment History information."

* item[0].linkId = "Basic"
* item[0].text = "Employment History"
* item[0].type = #group

* item[0].item[0].linkId = "Basic.extension[0].extension[0]"
* item[0].item[0].text = "Organization Name"
* item[0].item[0].type = #string
* item[0].item[0].required = true
* item[0].item[0].repeats = false

* item[0].item[1].linkId = "Basic.extension[0].extension[1]"
* item[0].item[1].text = "Organization Address"
* item[0].item[1].type = #text
* item[0].item[1].required = true
* item[0].item[1].repeats = false

* item[0].item[2].linkId = "Basic.extension[0].extension[2]"
* item[0].item[2].text = "Organization Telephone"
* item[0].item[2].type = #string
* item[0].item[2].required = true
* item[0].item[2].repeats = false

* item[0].item[3].linkId = "Basic.extension[0].extension[3]"
* item[0].item[3].text = "Starting Position"
* item[0].item[3].type = #string
* item[0].item[3].required = true
* item[0].item[3].repeats = false

* item[0].item[4].linkId = "Basic.extension[0].extension[4]"
* item[0].item[4].text = "Starting Salary"
* item[0].item[4].type = #string
* item[0].item[4].required = true
* item[0].item[4].repeats = false

* item[0].item[5].linkId = "Basic.extension[0].extension[5]"
* item[0].item[5].text = "Date Started"
* item[0].item[5].type = #date
* item[0].item[5].required = true
* item[0].item[5].repeats = false

* item[0].item[6].linkId = "Basic.extension[0].extension[6]"
* item[0].item[6].text = "Ending Position"
* item[0].item[6].type = #string
* item[0].item[6].required = true
* item[0].item[6].repeats = false

* item[0].item[7].linkId = "Basic.extension[0].extension[7]"
* item[0].item[7].text = "Ending Salary"
* item[0].item[7].type = #string
* item[0].item[7].required = true
* item[0].item[7].repeats = false

* item[0].item[8].linkId = "Basic.extension[0].extension[8]"
* item[0].item[8].text = "Date Ended"
* item[0].item[8].type = #date
* item[0].item[8].required = true
* item[0].item[8].repeats = false

* item[0].item[9].linkId = "Basic.extension[0].extension[9]"
* item[0].item[9].text = "Job Responsibilities"
* item[0].item[9].type = #text
* item[0].item[9].required = true
* item[0].item[9].repeats = false

* item[0].item[10].linkId = "Basic.extension[0].extension[10]"
* item[0].item[10].text = "Reason For Leaving"
* item[0].item[10].type = #text
* item[0].item[10].required = true
* item[0].item[10].repeats = false

Instance:       ihris-page-employment-history
InstanceOf:     IhrisPage
Title:          "iHRIS Basic Employment History Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(StructureDefinition/ihris-basic-employment-history)
* extension[display].extension[link].extension[field].valueString = "Basic.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference').valueReference.reference"
* extension[display].extension[link].extension[text].valueString = "View Health Worker"
* extension[display].extension[link].extension[button].valueBoolean = true
* extension[display].extension[link].extension[icon].valueString = "mdi-account-arrow-right"
* extension[display].extension[link].extension[url].valueUrl = "/resource/view/practitioner/FIELD"
* extension[display].extension[search][0].valueString = "Organization|extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-employment-history').extension.where(url='organization').valueString"
* extension[display].extension[search][1].valueString = "Starting Position|extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-employment-history').extension.where(url='startingPosition').valueString"
* extension[display].extension[field][0].extension[path].valueString = "Basic.extension:practitioner.value[x]:valueReference"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Employment History"
* extension[section][0].extension[description].valueString = "Employment History details"
* extension[section][0].extension[name].valueString = "Basic"
* extension[section][0].extension[field][0].valueString = "Basic.extension:practitioner"
* extension[section][0].extension[field][1].valueString = "Basic.extension:employmentHistory.extension:organization.value[x]:valueString"
* extension[section][0].extension[field][2].valueString = "Basic.extension:employmentHistory.extension:address.value[x]:valueString"
* extension[section][0].extension[field][3].valueString = "Basic.extension:employmentHistory.extension:telephone.value[x]:valueString"
* extension[section][0].extension[field][4].valueString = "Basic.extension:employmentHistory.extension:startingPosition.value[x]:valueString"
* extension[section][0].extension[field][5].valueString = "Basic.extension:employmentHistory.extension:startingSalary.value[x]:valueMoney"
* extension[section][0].extension[field][6].valueString = "Basic.extension:employmentHistory.extension:dateStarted.value[x]:valueDate"
* extension[section][0].extension[field][7].valueString = "Basic.extension:employmentHistory.extension:endingPosition.value[x]:valueString"
* extension[section][0].extension[field][8].valueString = "Basic.extension:employmentHistory.extension:endingSalary.value[x]:valueMoney"
* extension[section][0].extension[field][9].valueString = "Basic.extension:employmentHistory.extension:dateEnded.value[x]:valueDate"
* extension[section][0].extension[field][10].valueString = "Basic.extension:employmentHistory.extension:responsibilities.value[x]:valueString"
* extension[section][0].extension[field][11].valueString = "Basic.extension:employmentHistory.extension:reasonLeaving.value[x]:valueString"