Profile:        IhrisPage
Parent:         Basic
Id:             ihris-page
Title:          "iHRIS Page"
Description:    "iHRIS Profile of the Basic resource to manage pages."
* code = IhrisResourceCodeSystem#page
* extension contains
      IhrisPageDisplay named display 1..1 MS and
      IhrisPageSection named section 0..* MS

Extension:      IhrisPageDisplay
Id:             ihris-page-display
Title:          "iHRIS Page Display"
Description:    "iHRIS Page Display details."
* ^context.type = #element
* ^context.expression = "IhrisPage"
* extension contains
      resource 1..1 MS and
      search 1..* MS and
      filter 0..* MS and
      add 0..1 MS and
      field 0..* MS and
      link 0..* MS
* extension[resource].value[x] only Reference
* extension[resource].valueReference only Reference(StructureDefinition or CodeSystem)
* extension[resource].valueReference 1..1 MS
* extension[resource].valueReference ^label = "Primary Resource"

* extension[search].value[x] only string
* extension[search].valueString 1..1 MS
* extension[search].valueString ^label = "Search Headers"

* extension[filter].value[x] only string
* extension[filter].valueString 1..1 MS
* extension[filter].valueString ^label = "Search Filters"

* extension[add].extension contains
      url 1..1 MS and
      icon 0..1 MS and
      class 0..1 MS
* extension[add].extension[url].value[x] only url
* extension[add].extension[url].valueUrl MS
* extension[add].extension[url].valueUrl ^label = "Add Link URL"
* extension[add].extension[icon].value[x] only string
* extension[add].extension[icon].valueString MS
* extension[add].extension[icon].valueString ^label = "Add Link Icon"
* extension[add].extension[class].value[x] only string
* extension[add].extension[class].valueString MS
* extension[add].extension[class].valueString ^label = "Add Link Class"

* extension[link].extension contains
      field 0..1 MS and
      text 0..1 MS and
      button 0..1 MS and
      icon 0..1 MS and
      url 1..1 MS
* extension[link].extension[field].value[x] only string
* extension[link].extension[field].valueString MS
* extension[link].extension[field].valueString ^label = "FHIRPath for field in resource"
* extension[link].extension[text].value[x] only string
* extension[link].extension[text].valueString MS
* extension[link].extension[text].valueString ^label = "Text for link"
* extension[link].extension[button].value[x] only boolean
* extension[link].extension[button].valueBoolean MS
* extension[link].extension[button].valueBoolean ^label = "Display as button"
* extension[link].extension[icon].value[x] only string
* extension[link].extension[icon].valueString MS
* extension[link].extension[icon].valueString ^label = "Icon to display in button"
* extension[link].extension[url].value[x] only url
* extension[link].extension[url].valueUrl MS
* extension[link].extension[url].valueUrl ^label = "URL to go to"

* extension[field].extension contains
      path 1..1 MS and
      type 1..1 MS and
      readOnlyIfSet 0..1 MS
* extension[field].extension[path].value[x] only string
* extension[field].extension[path].valueString MS
* extension[field].extension[path].valueString ^label = "Field Path from StructureDefintion"
* extension[field].extension[type].value[x] only string
* extension[field].extension[type].valueString MS
* extension[field].extension[type].valueString ^label = "Display type for the field"
* extension[field].extension[readOnlyIfSet].value[x] only boolean
* extension[field].extension[readOnlyIfSet].valueBoolean MS
* extension[field].extension[readOnlyIfSet].valueBoolean ^label = "Read Only if the value is set"

Extension:      IhrisPageSection
Id:             ihris-page-section
Title:          "iHRIS Page Section"
Description:    "iHRIS Page Section information."
* ^context.type = #element
* ^context.expression = "IhrisPage"
* extension contains
      title 1..1 MS and
      description 1..1 MS and
      name 1..1 MS and
      field 0..* MS and
      resource 0..1 MS
* extension[title].value[x] only string
* extension[title].valueString MS
* extension[title].valueString ^label = "Title"
* extension[description].value[x] only string
* extension[description].valueString 1..1 MS
* extension[description].valueString ^label = "Description"
* extension[name].value[x] only string
* extension[name].valueString 1..1 MS
* extension[name].valueString ^label = "Name"
* extension[field].value[x] only string
* extension[field].valueString 1..1 MS
* extension[field].valueString ^label = "Field"
* extension[resource].extension contains
      resource 1..1 MS and
      linkfield 1..1 MS and
      searchfield 0..1 MS and
      column 1..* MS and
      action 0..* MS
* extension[resource].extension[resource].value[x] only Reference
* extension[resource].extension[resource].valueReference only Reference(StructureDefinition)
* extension[resource].extension[resource].valueReference MS
* extension[resource].extension[resource].valueReference ^label = "Secondary Resource"
* extension[resource].extension[linkfield].value[x] only string
* extension[resource].extension[linkfield].valueString MS
* extension[resource].extension[linkfield].valueString ^label = "Secondary Resource Link Field"
* extension[resource].extension[searchfield].value[x] only string
* extension[resource].extension[searchfield].valueString MS
* extension[resource].extension[searchfield].valueString ^label = "Secondary Resource Search Field (if different from the link field)"
* extension[resource].extension[column].extension contains
      header 1..1 MS and
      field 1..1 MS
* extension[resource].extension[column].extension[header].value[x] only string 
* extension[resource].extension[column].extension[header].valueString MS
* extension[resource].extension[column].extension[header].valueString ^label = "Column Header"
* extension[resource].extension[column].extension[field].value[x] only string 
* extension[resource].extension[column].extension[field].valueString MS
* extension[resource].extension[column].extension[field].valueString ^label = "FHIRPath Expression"
* extension[resource].extension[action].extension contains
      link 1..1 MS and
      text 1..1 MS and
      row 0..1 MS and
      condition 0..1 MS and
      emptyDisplay 0..1 MS and
      class 0..1 MS 
* extension[resource].extension[action].extension[link].value[x] only string
* extension[resource].extension[action].extension[link].valueString MS
* extension[resource].extension[action].extension[link].valueString ^label = "Action Link"
* extension[resource].extension[action].extension[text].value[x] only string
* extension[resource].extension[action].extension[text].valueString MS
* extension[resource].extension[action].extension[text].valueString ^label = "Action Text"
* extension[resource].extension[action].extension[row].value[x] only boolean
* extension[resource].extension[action].extension[row].valueBoolean MS
* extension[resource].extension[action].extension[row].valueBoolean ^label = "Is Row Action?"
* extension[resource].extension[action].extension[condition].value[x] only string
* extension[resource].extension[action].extension[condition].valueString MS
* extension[resource].extension[action].extension[condition].valueString ^label = "FHIRPation Condition do Display"
* extension[resource].extension[action].extension[emptyDisplay].value[x] only boolean
* extension[resource].extension[action].extension[emptyDisplay].valueBoolean MS
* extension[resource].extension[action].extension[emptyDisplay].valueBoolean ^label = "Show when no records?"
* extension[resource].extension[action].extension[class].value[x] only string
* extension[resource].extension[action].extension[class].valueString MS
* extension[resource].extension[action].extension[class].valueString ^label = "Element Class for the Action"

Instance:       ihris-page-practitioner
InstanceOf:     IhrisPage
Title:          "iHRIS Practitioner Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(StructureDefinition/ihris-personal-information)
* extension[display].extension[search][0].valueString = "Employee ID|Practitioner.identifier.where(type.coding.code='employeeId').value"
* extension[display].extension[search][1].valueString = "Father's Name|Practitioner.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-familynames').extension.where(url='fathers').valueString"
* extension[display].extension[search][2].valueString = "First Name|Practitioner.name.where(use='official').given"
* extension[display].extension[search][3].valueString = "Birth Date|Practitioner.birthDate"
* extension[display].extension[search][4].valueString = "Gender|Practitioner.gender|http://www.hl7.org/fhir/administrative-gender"
* extension[display].extension[search][5].valueString = "Educational Major|Practitioner.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-educational-major').valueCoding.display"
* extension[display].extension[filter][0].valueString = "Name|name:contains"
* extension[display].extension[filter][1].valueString = "Employee ID|identifier:contains"
* extension[display].extension[add].extension[url].valueUrl = "/questionnaire/ihris-personal-information/practitioner"
* extension[display].extension[add].extension[icon].valueString = "mdi-account-plus"
* extension[display].extension[add].extension[class].valueString = "accent"
* extension[section][0].extension[title].valueString = "Health Worker"
* extension[section][0].extension[description].valueString = "Primary Person details"
* extension[section][0].extension[name].valueString = "Practitioner"
* extension[section][1].extension[title].valueString = "Photo"
* extension[section][1].extension[description].valueString = "Photo"
* extension[section][1].extension[name].valueString = "Photo"
* extension[section][1].extension[field][0].valueString = "Practitioner.photo"
* extension[section][2].extension[title].valueString = "Names"
* extension[section][2].extension[description].valueString = "Health worker names"
* extension[section][2].extension[name].valueString = "Practitioner.name"
* extension[section][2].extension[field][0].valueString = "Practitioner.name"
* extension[section][2].extension[field][1].valueString = "Practitioner.extension:familyNames"
/* extension[section][2].extension[field][2].valueString = "Practitioner.extension:familyNames.extension:fathers"
* extension[section][2].extension[field][3].valueString = "Practitioner.extension:familyNames.extension:fathersalternativelanguage"
* extension[section][2].extension[field][4].valueString = "Practitioner.extension:familyNames.extension:grandfatherslastname"
* extension[section][2].extension[field][5].valueString = "Practitioner.extension:familyNames.extension:grandfathersalternativelanguage"
* extension[section][2].extension[field][6].valueString = "Practitioner.extension:familyNames.extension:mothers"*/
* extension[section][3].extension[title].valueString = "Demographic Details"
* extension[section][3].extension[description].valueString = "Demographic Informations"
* extension[section][3].extension[name].valueString = "demographic"
* extension[section][3].extension[field][0].valueString = "Practitioner.extension:nationality"
* extension[section][3].extension[field][1].valueString = "Practitioner.extension:residence"
* extension[section][3].extension[field][2].valueString = "Practitioner.birthDate"
* extension[section][3].extension[field][3].valueString = "Practitioner.gender"
* extension[section][3].extension[field][4].valueString = "Practitioner.extension:maritalStatus"
* extension[section][3].extension[field][5].valueString = "Practitioner.extension:ethnicity"
* extension[section][4].extension[title].valueString = "Identifiers"
* extension[section][4].extension[description].valueString = "Personal identifiers"
* extension[section][4].extension[name].valueString = "identifiers"
* extension[section][4].extension[field][0].valueString = "Practitioner.identifier"
* extension[section][4].extension[field][1].valueString = "Practitioner.identifier.use"
* extension[section][4].extension[field][2].valueString = "Practitioner.identifier.type"
* extension[section][4].extension[field][3].valueString = "Practitioner.identifier.value"
* extension[section][5].extension[title].valueString = "Contact Details"
* extension[section][5].extension[description].valueString = "email, phone numbers"
* extension[section][5].extension[name].valueString = "contact"
* extension[section][5].extension[field][0].valueString = "Practitioner.telecom"
* extension[section][6].extension[title].valueString = "Language Details"
* extension[section][6].extension[description].valueString = "Languages spoken"
* extension[section][6].extension[name].valueString = "language"
* extension[section][6].extension[field][0].valueString = "Practitioner.communication"
* extension[section][7].extension[title].valueString = "Dependents Details"
* extension[section][7].extension[description].valueString = "Dependents"
* extension[section][7].extension[name].valueString = "dependents"
* extension[section][7].extension[field][0].valueString = "Practitioner.extension:dependents"
* extension[section][8].extension[title].valueString = "Education and Training Details"
* extension[section][8].extension[description].valueString = "Education,Training and License Information"
* extension[section][8].extension[name].valueString = "education"
* extension[section][8].extension[field][0].valueString = "Practitioner.extension:professionalLicenseCategory"
* extension[section][8].extension[field][1].valueString = "Practitioner.extension:specialTraining"
* extension[section][8].extension[field][2].valueString = "Practitioner.extension:category"
* extension[section][9].extension[title].valueString = "Remarks"
* extension[section][9].extension[description].valueString = "Remarks or Notes "
* extension[section][9].extension[name].valueString = "remarks"
* extension[section][9].extension[field][0].valueString = "Practitioner.extension:remarkNote"
* extension[section][10].extension[title].valueString = "Position"
* extension[section][10].extension[description].valueString = "Position the person holds"
* extension[section][10].extension[name].valueString = "position"
* extension[section][10].extension[field][0].valueString = "PractitionerRole.code"
* extension[section][10].extension[resource].extension[resource].valueReference = Reference(StructureDefinition/ihris-job-description)
* extension[section][10].extension[resource].extension[linkfield].valueString = "PractitionerRole.practitioner"
* extension[section][10].extension[resource].extension[column][0].extension[header].valueString = "Job"
* extension[section][10].extension[resource].extension[column][0].extension[field].valueString = "PractitionerRole.code.coding[0]"
* extension[section][10].extension[resource].extension[column][1].extension[header].valueString = "Duty Post"
* extension[section][10].extension[resource].extension[column][1].extension[field].valueString = "PractitionerRole.location.reference"
* extension[section][10].extension[resource].extension[column][2].extension[header].valueString = "First Employment Date"
* extension[section][10].extension[resource].extension[column][2].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitionerrole-first-employment-date').valueDate"
* extension[section][10].extension[resource].extension[column][3].extension[header].valueString = "Start Date"
* extension[section][10].extension[resource].extension[column][3].extension[field].valueString = "PractitionerRole.period.start"
* extension[section][10].extension[resource].extension[column][4].extension[header].valueString = "Shift"
* extension[section][10].extension[resource].extension[column][4].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitionerrole-shift').valueCoding.display"
* extension[section][10].extension[resource].extension[column][5].extension[header].valueString = "Job Type"
* extension[section][10].extension[resource].extension[column][5].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitionerrole-job-type').valueCoding.display"
* extension[section][10].extension[resource].extension[column][6].extension[header].valueString = "Employment Status"
* extension[section][10].extension[resource].extension[column][6].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitionerrole-employment-status').valueCoding.display"
* extension[section][10].extension[resource].extension[column][7].extension[header].valueString = "End Date"
* extension[section][10].extension[resource].extension[column][7].extension[field].valueString = "PractitionerRole.period.end"
* extension[section][10].extension[resource].extension[column][8].extension[header].valueString = "Actions"
* extension[section][10].extension[resource].extension[column][8].extension[field].valueString = "_action"
* extension[section][10].extension[resource].extension[action][0].extension[link].valueString = "/resource/add/practitionerrole?PractitionerRole.practitioner.reference=Practitioner/FHIRID"
* extension[section][10].extension[resource].extension[action][0].extension[text].valueString = "Assign Job"
* extension[section][10].extension[resource].extension[action][0].extension[row].valueBoolean = false
* extension[section][10].extension[resource].extension[action][0].extension[emptyDisplay].valueBoolean = true
* extension[section][10].extension[resource].extension[action][0].extension[condition].valueString = "PractitionerRole.period.end.exists()"
* extension[section][10].extension[resource].extension[action][0].extension[class].valueString = "primary"
* extension[section][10].extension[resource].extension[action][1].extension[link].valueString = "/resource/view/practitionerrole/ITEMID"
* extension[section][10].extension[resource].extension[action][1].extension[text].valueString = "View"
* extension[section][10].extension[resource].extension[action][1].extension[row].valueBoolean = true
* extension[section][10].extension[resource].extension[action][1].extension[class].valueString = "primary"
* extension[section][10].extension[resource].extension[action][2].extension[link].valueString = "/questionnaire/ihris-endrole/practitioner?practitionerrole=ITEMID"
* extension[section][10].extension[resource].extension[action][2].extension[text].valueString = "End Job"
* extension[section][10].extension[resource].extension[action][2].extension[row].valueBoolean = true
* extension[section][10].extension[resource].extension[action][2].extension[condition].valueString = "PractitionerRole.period.end.empty()"
* extension[section][10].extension[resource].extension[action][2].extension[class].valueString = "warning"
* extension[section][10].extension[resource].extension[action][3].extension[link].valueString = "/questionnaire/ihris-promotion-ethiopia/practitioner?practitionerrole=ITEMID"
* extension[section][10].extension[resource].extension[action][3].extension[text].valueString = "Change Position"
* extension[section][10].extension[resource].extension[action][3].extension[row].valueBoolean = true
* extension[section][10].extension[resource].extension[action][3].extension[condition].valueString = "PractitionerRole.period.end.empty()"
* extension[section][10].extension[resource].extension[action][3].extension[class].valueString = "accent"
* extension[section][11].extension[title].valueString = "Leave Information"
* extension[section][11].extension[description].valueString = "Leave Details for the Person"
* extension[section][11].extension[name].valueString = "leave"
* extension[section][11].extension[resource].extension[resource].valueReference = Reference(StructureDefinition/ihris-basic-ethiopia-leave)
* extension[section][11].extension[resource].extension[searchfield].valueString = "practitioner"
* extension[section][11].extension[resource].extension[linkfield].valueString = "Basic.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference').valueReference.reference"
* extension[section][11].extension[resource].extension[column][0].extension[header].valueString = "Leave Type"
* extension[section][11].extension[resource].extension[column][0].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-ethiopia-leave').extension.where(url='leave-type').valueCoding"
* extension[section][11].extension[resource].extension[column][1].extension[header].valueString = "Days Requested"
* extension[section][11].extension[resource].extension[column][1].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-ethiopia-leave').extension.where(url='daysRequested').valueInteger"
* extension[section][11].extension[resource].extension[column][2].extension[header].valueString = "Requested Date"
* extension[section][11].extension[resource].extension[column][2].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-ethiopia-leave').extension.where(url='dateRequested').valueDate"
* extension[section][11].extension[resource].extension[column][3].extension[header].valueString = "Start Date"
* extension[section][11].extension[resource].extension[column][3].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-ethiopia-leave').extension.where(url='period').valuePeriod.start"
* extension[section][11].extension[resource].extension[column][4].extension[header].valueString = "End Date"
* extension[section][11].extension[resource].extension[column][4].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-ethiopia-leave').extension.where(url='period').valuePeriod.end"
* extension[section][11].extension[resource].extension[column][5].extension[header].valueString = "Actions"
* extension[section][11].extension[resource].extension[column][5].extension[field].valueString = "_action"
* extension[section][11].extension[resource].extension[action][0].extension[link].valueString = "/questionnaire/ihris-leave-ethiopia/practitioner?practitioner=FHIRID"
* extension[section][11].extension[resource].extension[action][0].extension[text].valueString = "Add Leave"
* extension[section][11].extension[resource].extension[action][0].extension[row].valueBoolean = false
* extension[section][11].extension[resource].extension[action][0].extension[emptyDisplay].valueBoolean = true
* extension[section][11].extension[resource].extension[action][0].extension[class].valueString = "primary"
* extension[section][11].extension[resource].extension[action][1].extension[link].valueString = "/resource/view/basicleave/ITEMID"
* extension[section][11].extension[resource].extension[action][1].extension[text].valueString = "View"
* extension[section][11].extension[resource].extension[action][1].extension[row].valueBoolean = true
* extension[section][11].extension[resource].extension[action][1].extension[class].valueString = "primary"
* extension[section][12].extension[title].valueString = "Education History Information"
* extension[section][12].extension[description].valueString = "Education History Details for the Person"
* extension[section][12].extension[name].valueString = "education-history"
* extension[section][12].extension[resource].extension[resource].valueReference = Reference(StructureDefinition/ihris-basic-education-history)
* extension[section][12].extension[resource].extension[searchfield].valueString = "practitioner"
* extension[section][12].extension[resource].extension[linkfield].valueString = "Basic.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference').valueReference.reference"
* extension[section][12].extension[resource].extension[column][0].extension[header].valueString = "Education Institution"
* extension[section][12].extension[resource].extension[column][0].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-education-history').extension.where(url='institution').valueReference.reference"
* extension[section][12].extension[resource].extension[column][1].extension[header].valueString = "Degree"
* extension[section][12].extension[resource].extension[column][1].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-education-history').extension.where(url='degree').valueCoding"
* extension[section][12].extension[resource].extension[column][2].extension[header].valueString = "level"
* extension[section][12].extension[resource].extension[column][2].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-education-history').extension.where(url='level').valueCoding"
* extension[section][12].extension[resource].extension[column][3].extension[header].valueString = "Educational Major"
* extension[section][12].extension[resource].extension[column][3].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-education-history').extension.where(url='educationalMajor').valueCoding"
* extension[section][12].extension[resource].extension[column][4].extension[header].valueString = "Year"
* extension[section][12].extension[resource].extension[column][4].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-education-history').extension.where(url='year').valueDate"
* extension[section][12].extension[resource].extension[column][5].extension[header].valueString = "Actions"
* extension[section][12].extension[resource].extension[column][5].extension[field].valueString = "_action"
* extension[section][12].extension[resource].extension[action][0].extension[link].valueString = "/questionnaire/ihris-education-history/practitioner?practitioner=FHIRID"
* extension[section][12].extension[resource].extension[action][0].extension[text].valueString = "Add Education History"
* extension[section][12].extension[resource].extension[action][0].extension[row].valueBoolean = false
* extension[section][12].extension[resource].extension[action][0].extension[emptyDisplay].valueBoolean = true
* extension[section][12].extension[resource].extension[action][0].extension[class].valueString = "primary"
* extension[section][12].extension[resource].extension[action][1].extension[link].valueString = "/resource/view/basic-education-history/ITEMID"
* extension[section][12].extension[resource].extension[action][1].extension[text].valueString = "View"
* extension[section][12].extension[resource].extension[action][1].extension[row].valueBoolean = true
* extension[section][12].extension[resource].extension[action][1].extension[class].valueString = "primary"
* extension[section][13].extension[title].valueString = "Performance Evaluation Information"
* extension[section][13].extension[description].valueString = "Performance Evaluation for the Person"
* extension[section][13].extension[name].valueString = "performance"
* extension[section][13].extension[resource].extension[resource].valueReference = Reference(StructureDefinition/ihris-basic-performance)
* extension[section][13].extension[resource].extension[searchfield].valueString = "practitioner"
* extension[section][13].extension[resource].extension[linkfield].valueString = "Basic.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference').valueReference.reference"
* extension[section][13].extension[resource].extension[column][0].extension[header].valueString = "Evaluator's Name"
* extension[section][13].extension[resource].extension[column][0].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-performance').extension.where(url='evaluator').valueString"
* extension[section][13].extension[resource].extension[column][1].extension[header].valueString = "Score"
* extension[section][13].extension[resource].extension[column][1].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-performance').extension.where(url='score').valueCoding.display"
* extension[section][13].extension[resource].extension[column][2].extension[header].valueString = "Start Date"
* extension[section][13].extension[resource].extension[column][2].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-performance').extension.where(url='period').valuePeriod.start"
* extension[section][13].extension[resource].extension[column][3].extension[header].valueString = "End Date"
* extension[section][13].extension[resource].extension[column][3].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-performance').extension.where(url='period').valuePeriod.end"
* extension[section][13].extension[resource].extension[column][4].extension[header].valueString = "Actions"
* extension[section][13].extension[resource].extension[column][4].extension[field].valueString = "_action"
* extension[section][13].extension[resource].extension[action][0].extension[link].valueString = "/questionnaire/ihris-performance/practitioner?practitioner=FHIRID"
* extension[section][13].extension[resource].extension[action][0].extension[text].valueString = "Add Perfromamce Evaluation"
* extension[section][13].extension[resource].extension[action][0].extension[row].valueBoolean = false
* extension[section][13].extension[resource].extension[action][0].extension[emptyDisplay].valueBoolean = true
* extension[section][13].extension[resource].extension[action][0].extension[class].valueString = "primary"
* extension[section][13].extension[resource].extension[action][1].extension[link].valueString = "/resource/view/performance/ITEMID"
* extension[section][13].extension[resource].extension[action][1].extension[text].valueString = "View"
* extension[section][13].extension[resource].extension[action][1].extension[row].valueBoolean = true
* extension[section][13].extension[resource].extension[action][1].extension[class].valueString = "primary"

Instance:       ihris-page-practitionerrole
InstanceOf:     IhrisPage
Title:          "iHRIS PractitionerRole Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(StructureDefinition/ihris-job-description)
* extension[display].extension[link].extension[field].valueString = "PractitionerRole.practitioner.reference"
* extension[display].extension[link].extension[text].valueString = "View Health Worker"
* extension[display].extension[link].extension[button].valueBoolean = true
* extension[display].extension[link].extension[icon].valueString = "mdi-account-arrow-right"
* extension[display].extension[link].extension[url].valueUrl = "/resource/view/practitioner/FIELD"
* extension[display].extension[search][0].valueString = "Job|PractitionerRole.code[0].coding[0]"
* extension[display].extension[search][1].valueString = "Start Date|PractitionerRole.period.start"
* extension[display].extension[search][2].valueString = "Practitioner|PractitionerRole.practitioner"
* extension[display].extension[search][3].valueString = "Facility|PractitionerRole.location"
* extension[display].extension[filter][0].valueString = "Job|code|http://ihris.org/fhir/ValueSet/ihris-job-ethiopia"
* extension[display].extension[filter][1].valueString = "Facility|PractitionerRole.location:location"
* extension[display].extension[field][0].extension[path].valueString = "PractitionerRole.practitioner"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Position"
* extension[section][0].extension[description].valueString = "Position details"
* extension[section][0].extension[name].valueString = "PractitionerRole"
* extension[section][0].extension[field][0].valueString = "PractitionerRole.code"
* extension[section][0].extension[field][1].valueString = "PractitionerRole.practitioner"
* extension[section][0].extension[field][2].valueString = "PractitionerRole.location"
* extension[section][0].extension[field][3].valueString = "PractitionerRole.extension:directorate.value[x]:valueCoding.display"
* extension[section][0].extension[field][4].valueString = "PractitionerRole.extension:caseteam.value[x]:valueCoding.display"
* extension[section][0].extension[field][5].valueString = "PractitionerRole.extension:firstEmploymentDate.value[x]:valueDate"
* extension[section][0].extension[field][6].valueString = "PractitionerRole.period"
* extension[section][0].extension[field][7].valueString = "PractitionerRole.extension:jobType.value[x]:valueCoding.display"
* extension[section][0].extension[field][8].valueString = "PractitionerRole.extension:shift.value[x]:valueCoding.display"
* extension[section][0].extension[field][9].valueString = "PractitionerRole.extension:salaryScale.value[x]:valueCoding.display"
* extension[section][0].extension[field][10].valueString = "PractitionerRole.extension:salary.value[x]:valueMoney.display"

Instance:       ihris-page-job
InstanceOf:     IhrisPage
Title:          "iHRIS Job CodeSystem Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/ihris-job-ethiopia)
* extension[display].extension[search][0].valueString = "Code|code"
* extension[display].extension[search][1].valueString = "Display|display"
* extension[display].extension[search][2].valueString = "Cadre|cadre"
* extension[display].extension[search][3].valueString = "Classification|classification"
* extension[display].extension[field][0].extension[path].valueString = "CodeSystem.code"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Job"
* extension[section][0].extension[description].valueString = "Job Titles"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.code"
* extension[section][0].extension[field][1].valueString = "CodeSystem.definition"
* extension[section][0].extension[field][2].valueString = "CodeSystem.display"
* extension[section][0].extension[field][3].valueString = "CodeSystem.cadre"
* extension[section][0].extension[field][4].valueString = "CodeSystem.classification"
* extension[section][0].extension[field][5].valueString = "CodeSystem.salary-grade"
* extension[section][0].extension[field][6].valueString = "CodeSystem.designation[0].language"
* extension[section][0].extension[field][7].valueString = "CodeSystem.designation[0].value"

Instance:       ihris-page-location
InstanceOf:     IhrisPage
Title:          "iHRIS Location Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(StructureDefinition/ihris-location)
* extension[display].extension[search][0].valueString = "Location Name|name"
* extension[display].extension[search][1].valueString = "Location Type|type.coding.display"
* extension[display].extension[search][2].valueString = "Location Physical Type|physicalType.coding.display"
/* extension[display].extension[search][3].valueString = "Longitute|position.longitude"
* extension[display].extension[search][4].valueString = "Latitude|position.latitude"*/
* extension[display].extension[filter][0].valueString = "Name|name:contains"
* extension[display].extension[filter][1].valueString = "Location Type|code|http://terminology.hl7.org/ValueSet/v3-ServiceDeliveryLocationRoleType"
* extension[display].extension[filter][2].valueString = "Location Physical Type|code|http://hl7.org/fhir/ValueSet/location-physical-type"
* extension[section][0].extension[title].valueString = "Location/Facility"
* extension[section][0].extension[description].valueString = "Location and Duty Post details"
* extension[section][0].extension[name].valueString = "Location"
* extension[section][0].extension[field][0].valueString = "Location.name"
* extension[section][0].extension[field][1].valueString = "Location.description"
* extension[section][0].extension[field][2].valueString = "Location.type"
* extension[section][0].extension[field][3].valueString = "Location.physicalType"
/* extension[section][1].extension[title].valueString = "Geographic location"
* extension[section][1].extension[description].valueString = "Geo-Coordinates for this Locatio"
* extension[section][1].extension[name].valueString = "coordinates"
* extension[section][1].extension[field][0].valueString = "Location.position.longitude"
* extension[section][1].extension[field][1].valueString = "Location.position.latitude"*/
* extension[section][1].extension[title].valueString = "Contact Details"
* extension[section][1].extension[description].valueString = "email, phone numbers"
* extension[section][1].extension[name].valueString = "contact"
* extension[section][1].extension[field][0].valueString = "Location.telecom"
* extension[section][2].extension[title].valueString = "Location"
* extension[section][2].extension[description].valueString = "Location this Location is partOf"
* extension[section][2].extension[name].valueString = "location"
* extension[section][2].extension[field][0].valueString = "Location.partOf"

Instance:       ihris-page-identifier
InstanceOf:     IhrisPage
Title:          "iHRIS identifier type CodeSystem Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/ihris-ethiopia-identifier)
* extension[display].extension[search][0].valueString = "Code|code"
* extension[display].extension[search][1].valueString = "Display|display"
* extension[display].extension[field][0].extension[path].valueString = "CodeSystem.code"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Identifier Type"
* extension[section][0].extension[description].valueString = "Identifier Type"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.display"
* extension[section][0].extension[field][1].valueString = "CodeSystem.code"
* extension[section][0].extension[field][2].valueString = "CodeSystem.definition"

Instance:       ihris-page-language
InstanceOf:     IhrisPage
Title:          "iHRIS language CodeSystem Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/ihris-ethiopia-language)
* extension[display].extension[search][0].valueString = "Code|code"
* extension[display].extension[search][1].valueString = "Display|display"
* extension[display].extension[field][0].extension[path].valueString = "CodeSystem.code"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Language"
* extension[section][0].extension[description].valueString = "Language"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.display"
* extension[section][0].extension[field][1].valueString = "CodeSystem.code"
* extension[section][0].extension[field][2].valueString = "CodeSystem.definition"

Instance:       ihris-page-ethnicity
InstanceOf:     IhrisPage
Title:          "iHRIS ethnicity CodeSystem Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/ihris-Ethnicity-codesystem)
* extension[display].extension[search][0].valueString = "Code|code"
* extension[display].extension[search][1].valueString = "Display|display"
* extension[display].extension[field][0].extension[path].valueString = "CodeSystem.code"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Ethnicity"
* extension[section][0].extension[description].valueString = "ethnicity"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.display"
* extension[section][0].extension[field][1].valueString = "CodeSystem.code"
* extension[section][0].extension[field][2].valueString = "CodeSystem.definition"

Instance:       ihris-page-department
InstanceOf:     IhrisPage
Title:          "iHRIS department CodeSystem Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/ihris-department-codesystem)
* extension[display].extension[search][0].valueString = "Code|code"
* extension[display].extension[search][1].valueString = "Display|display"
* extension[display].extension[field][0].extension[path].valueString = "CodeSystem.code"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Department"
* extension[section][0].extension[description].valueString = "Department"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.display"
* extension[section][0].extension[field][1].valueString = "CodeSystem.code"
* extension[section][0].extension[field][2].valueString = "CodeSystem.definition"

Instance:       ihris-page-category
InstanceOf:     IhrisPage
Title:          "iHRIS category CodeSystem Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/ihris-category-codesystem)
* extension[display].extension[search][0].valueString = "Code|code"
* extension[display].extension[search][1].valueString = "Display|display"
* extension[display].extension[field][0].extension[path].valueString = "CodeSystem.code"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Category"
* extension[section][0].extension[description].valueString = "Category"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.display"
* extension[section][0].extension[field][1].valueString = "CodeSystem.code"
* extension[section][0].extension[field][2].valueString = "CodeSystem.definition"

Instance:       ihris-page-educational-major
InstanceOf:     IhrisPage
Title:          "iHRIS Educational Major CodeSystem Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/ihris-educational-major-codesystem)
* extension[display].extension[search][0].valueString = "Code|code"
* extension[display].extension[search][1].valueString = "Display|display"
* extension[display].extension[field][0].extension[path].valueString = "CodeSystem.code"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Educational Major"
* extension[section][0].extension[description].valueString = "Educational Major"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.display"
* extension[section][0].extension[field][1].valueString = "CodeSystem.code"
* extension[section][0].extension[field][2].valueString = "CodeSystem.definition"

Instance:       ihris-page-shift
InstanceOf:     IhrisPage
Title:          "iHRIS Shift CodeSystem Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/ihris-shift-codesystem)
* extension[display].extension[search][0].valueString = "Code|code"
* extension[display].extension[search][1].valueString = "Display|display"
* extension[display].extension[field][0].extension[path].valueString = "CodeSystem.code"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Shift"
* extension[section][0].extension[description].valueString = "Shift"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.display"
* extension[section][0].extension[field][1].valueString = "CodeSystem.code"
* extension[section][0].extension[field][2].valueString = "CodeSystem.definition"

Instance:       ihris-page-employment-status
InstanceOf:     IhrisPage
Title:          "iHRIS Employment Status CodeSystem Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/ihris-employment-status-codesystem)
* extension[display].extension[search][0].valueString = "Code|code"
* extension[display].extension[search][1].valueString = "Display|display"
* extension[display].extension[field][0].extension[path].valueString = "CodeSystem.code"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Employment Status"
* extension[section][0].extension[description].valueString = "Employment Status"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.display"
* extension[section][0].extension[field][1].valueString = "CodeSystem.code"
* extension[section][0].extension[field][2].valueString = "CodeSystem.definition"

Instance:       ihris-page-job-type
InstanceOf:     IhrisPage
Title:          "iHRIS Job Type CodeSystem Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/ihris-job-type-codesystem)
* extension[display].extension[search][0].valueString = "Code|code"
* extension[display].extension[search][1].valueString = "Display|display"
* extension[display].extension[field][0].extension[path].valueString = "CodeSystem.code"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Job Type"
* extension[section][0].extension[description].valueString = "Job Type"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.display"
* extension[section][0].extension[field][1].valueString = "CodeSystem.code"
* extension[section][0].extension[field][2].valueString = "CodeSystem.definition"

Instance:       ihris-page-salary-scale
InstanceOf:     IhrisPage
Title:          "iHRIS Salary Scale CodeSystem Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/ihris-salary-scale-codesystem)
* extension[display].extension[search][0].valueString = "Code|code"
* extension[display].extension[search][1].valueString = "Display|display"
* extension[display].extension[field][0].extension[path].valueString = "CodeSystem.code"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Salary Scale"
* extension[section][0].extension[description].valueString = "Salary Scale"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.display"
* extension[section][0].extension[field][1].valueString = "CodeSystem.code"
* extension[section][0].extension[field][2].valueString = "CodeSystem.definition"

Instance:       ihris-page-leave-type
InstanceOf:     IhrisPage
Title:          "iHRIS Leave Type CodeSystem Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/ihris-leave-type-codesystem)
* extension[display].extension[search][0].valueString = "Code|code"
* extension[display].extension[search][1].valueString = "Display|display"
* extension[display].extension[field][0].extension[path].valueString = "CodeSystem.code"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Leave Type"
* extension[section][0].extension[description].valueString = "Leave Type"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.display"
* extension[section][0].extension[field][1].valueString = "CodeSystem.code"
* extension[section][0].extension[field][2].valueString = "CodeSystem.definition"

Instance:       ihris-page-reason-departure
InstanceOf:     IhrisPage
Title:          "iHRIS Reason for Departure CodeSystem Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/ihris-reason-departure-codesystem)
* extension[display].extension[search][0].valueString = "Code|code"
* extension[display].extension[search][1].valueString = "Display|display"
* extension[display].extension[field][0].extension[path].valueString = "CodeSystem.code"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Reason for Departure"
* extension[section][0].extension[description].valueString = "Reason for Departure"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.display"
* extension[section][0].extension[field][1].valueString = "CodeSystem.code"
* extension[section][0].extension[field][2].valueString = "CodeSystem.definition"

Instance:       ihris-page-training-type
InstanceOf:     IhrisPage
Title:          "iHRIS Training Type CodeSystem Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/ihris-training-type-codesystem)
* extension[display].extension[search][0].valueString = "Code|code"
* extension[display].extension[search][1].valueString = "Display|display"
* extension[display].extension[field][0].extension[path].valueString = "CodeSystem.code"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Training Type"
* extension[section][0].extension[description].valueString = "Training Type"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.display"
* extension[section][0].extension[field][1].valueString = "CodeSystem.code"
* extension[section][0].extension[field][2].valueString = "CodeSystem.definition"

Instance:       ihris-page-skill
InstanceOf:     IhrisPage
Title:          "iHRIS Skill CodeSystem Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/ihris-skill-codesystem)
* extension[display].extension[search][0].valueString = "Code|code"
* extension[display].extension[search][1].valueString = "Display|display"
* extension[display].extension[field][0].extension[path].valueString = "CodeSystem.code"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Skill"
* extension[section][0].extension[description].valueString = "Skill"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.display"
* extension[section][0].extension[field][1].valueString = "CodeSystem.code"
* extension[section][0].extension[field][2].valueString = "CodeSystem.definition"

Instance:       ihris-page-caseteam
InstanceOf:     IhrisPage
Title:          "iHRIS CaseTeam CodeSystem Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/ihris-caseteam-codesystem)
* extension[display].extension[search][0].valueString = "Code|code"
* extension[display].extension[search][1].valueString = "Display|display"
* extension[display].extension[field][0].extension[path].valueString = "CodeSystem.code"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Case Team"
* extension[section][0].extension[description].valueString = "Case Team"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.display"
* extension[section][0].extension[field][1].valueString = "CodeSystem.code"
* extension[section][0].extension[field][2].valueString = "CodeSystem.definition"

Instance:       ihris-page-directorate
InstanceOf:     IhrisPage
Title:          "iHRIS Directorate CodeSystem Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/ihris-directorate-codesystem)
* extension[display].extension[search][0].valueString = "Code|code"
* extension[display].extension[search][1].valueString = "Display|display"
* extension[display].extension[field][0].extension[path].valueString = "CodeSystem.code"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Directorate"
* extension[section][0].extension[description].valueString = "Directorate"
* extension[section][0].extension[name].valueString = "Directorate"
* extension[section][0].extension[field][0].valueString = "CodeSystem.display"
* extension[section][0].extension[field][1].valueString = "CodeSystem.code"
* extension[section][0].extension[field][2].valueString = "CodeSystem.definition"

Instance:       ihris-page-basicleave
InstanceOf:     IhrisPage
Title:          "iHRIS Basic Leave Ethiopia Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(StructureDefinition/ihris-basic-ethiopia-leave)
* extension[display].extension[link].extension[field].valueString = "Basic.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference').valueReference.reference"
* extension[display].extension[link].extension[text].valueString = "View Health Worker"
* extension[display].extension[link].extension[button].valueBoolean = true
* extension[display].extension[link].extension[icon].valueString = "mdi-account-arrow-right"
* extension[display].extension[link].extension[url].valueUrl = "/resource/view/practitioner/FIELD"
* extension[display].extension[search][0].valueString = "Leave Type|extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-ethiopia-leave').extension.where(url='leave-type').valueCoding"
* extension[display].extension[search][1].valueString = "Start Date|extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-ethiopia-leave').extension.where(url='period').valuePeriod.start"
* extension[display].extension[search][2].valueString = "End Date|extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-ethiopia-leave').extension.where(url='period').valuePeriod.end"
* extension[display].extension[search][3].valueString = "Practitioner|extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference').valueReference.reference"
* extension[display].extension[search][4].valueString = "Days Requested|extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-ethiopia-leave').extension.where(url='daysRequested').valuePositiveInt"
* extension[display].extension[search][5].valueString = "Date Requested|extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-ethiopia-leave').extension.where(url='dateRequested').valueDate"
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

Instance:       ihris-page-basic-education-history
InstanceOf:     IhrisPage
Title:          "Education History"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(StructureDefinition/ihris-basic-education-history)
* extension[display].extension[link].extension[field].valueString = "Basic.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference').valueReference.reference"
* extension[display].extension[link].extension[text].valueString = "View Health Worker"
* extension[display].extension[link].extension[button].valueBoolean = true
* extension[display].extension[link].extension[icon].valueString = "mdi-account-arrow-right"
* extension[display].extension[link].extension[url].valueUrl = "/resource/view/practitioner/FIELD"
* extension[display].extension[search][0].valueString = "Practitioner|extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference').valueReference.reference"
* extension[display].extension[search][1].valueString = "Institution|extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-education-history').extension.where(url='institution').valueReference.reference"
* extension[display].extension[search][2].valueString = "Degree|extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-education-history').extension.where(url='degree').valueCoding.display"
* extension[display].extension[search][3].valueString = "Level|extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-education-history').extension.where(url='level').valueCoding.display"
* extension[display].extension[search][4].valueString = "Educational Major|extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-education-history').extension.where(url='educationalMajor').valueCoding.display"
* extension[display].extension[search][5].valueString = "Year|extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-education-history').extension.where(url='year').valueDate"
* extension[display].extension[field][0].extension[path].valueString = "Basic.extension:practitioner.value[x]:valueReference"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Education History"
* extension[section][0].extension[description].valueString = "Education History details"
* extension[section][0].extension[name].valueString = "Basic"
* extension[section][0].extension[field][0].valueString = "extension:practitioner"
* extension[section][0].extension[field][1].valueString = "extension:educationHistory.extension:institution.value[x]:valueCoding"
* extension[section][0].extension[field][2].valueString = "extension:educationHistory.extension:degree.value[x]:valueCoding"
* extension[section][0].extension[field][3].valueString = "extension:educationHistory.extension:level.value[x]:valueCoding"
* extension[section][0].extension[field][4].valueString = "extension:educationHistory.extension:educationalMajor.value[x]:valueCoding"
* extension[section][0].extension[field][5].valueString = "extension:educationHistory.extension:year.value[x]:valueDate"

Instance:       ihris-page-institution
InstanceOf:     IhrisPage
Title:          "iHRIS Institution Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(StructureDefinition/ihris-institution)
* extension[display].extension[search][0].valueString = "Institution Name|name"
* extension[display].extension[search][1].valueString = "Institution Type|type.coding.display"
* extension[display].extension[filter][0].valueString = "Institution Name|name:contains"
* extension[display].extension[filter][1].valueString = "Institution Type|type:text"
* extension[section][0].extension[title].valueString = "Education Institution"
* extension[section][0].extension[description].valueString = "Education Institution details"
* extension[section][0].extension[name].valueString = "Location"
* extension[section][0].extension[field][0].valueString = "Location.name"
* extension[section][0].extension[field][1].valueString = "Location.extension:institutionType.value[x]:valueCoding"
* extension[section][0].extension[field][2].valueString = "Location.telecom"
* extension[section][0].extension[field][3].valueString = "Location.address"
* extension[section][0].extension[field][4].valueString = "Location.partOf"

Instance:       ihris-page-degree
InstanceOf:     IhrisPage
Title:          "iHRIS Degree CodeSystem Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/ihris-degree)
* extension[display].extension[search][0].valueString = "Code|code"
* extension[display].extension[search][1].valueString = "Display|display"
* extension[display].extension[field][0].extension[path].valueString = "CodeSystem.code"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Degree"
* extension[section][0].extension[description].valueString = "Degree"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.display"
* extension[section][0].extension[field][1].valueString = "CodeSystem.code"
* extension[section][0].extension[field][2].valueString = "CodeSystem.definition"

Instance:       ihris-page-education-level
InstanceOf:     IhrisPage
Title:          "iHRIS Education Level CodeSystem Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/ihris-education-level)
* extension[display].extension[search][0].valueString = "Code|code"
* extension[display].extension[search][1].valueString = "Display|display"
* extension[display].extension[field][0].extension[path].valueString = "CodeSystem.code"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Degree"
* extension[section][0].extension[description].valueString = "Degree"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.display"
* extension[section][0].extension[field][1].valueString = "CodeSystem.code"
* extension[section][0].extension[field][2].valueString = "CodeSystem.definition"

Instance:       ihris-page-institution-type
InstanceOf:     IhrisPage
Title:          "iHRIS Institution Type CodeSystem Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/ihris-institution-type)
* extension[display].extension[search][0].valueString = "Code|code"
* extension[display].extension[search][1].valueString = "Display|display"
* extension[display].extension[field][0].extension[path].valueString = "CodeSystem.code"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Institution Type"
* extension[section][0].extension[description].valueString = "Institution Type"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.display"
* extension[section][0].extension[field][1].valueString = "CodeSystem.code"
* extension[section][0].extension[field][2].valueString = "CodeSystem.definition"

Instance:       ihris-page-users
InstanceOf:     IhrisPage
Title:          "Users"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(StructureDefinition/ihris-person-user)
* extension[display].extension[search][0].valueString = "User|Person.name.where(use='official').text"
* extension[display].extension[search][1].valueString = "Username/Email|Person.telecom.where(system='email').value"
* extension[display].extension[search][2].valueString = "Role|Person.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-assign-role').valueReference.reference"
* extension[section][0].extension[title].valueString = "System Users"
* extension[section][0].extension[description].valueString = "System Users details"
* extension[section][0].extension[name].valueString = "Person"
* extension[section][0].extension[field][0].valueString = "Person.name"
* extension[section][0].extension[field][1].valueString = "Person.telecom:"
* extension[section][0].extension[field][2].valueString = "Person.extension:role.valueReference"