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
      filter 0..* MS
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
* extension[display].extension[filter][1].valueString = "Gender|gender|http://hl7.org/fhir/ValueSet/administrative-gender"
* extension[display].extension[filter][2].valueString = "Employee ID|identifier"
* extension[section][0].extension[title].valueString = "Health Worker"
* extension[section][0].extension[description].valueString = "Primary Person details"
* extension[section][0].extension[name].valueString = "Practitioner"
* extension[section][0].extension[field][0].valueString = "Practitioner.name"
* extension[section][0].extension[field][1].valueString = "Practitioner.name.given"
* extension[section][0].extension[field][2].valueString = "Practitioner.extension:familyNames.extension:fathers"
* extension[section][0].extension[field][3].valueString = "Practitioner.extension:familyNames.extension:fathersalternativelanguage"
* extension[section][0].extension[field][4].valueString = "Practitioner.extension:familyNames.extension:grandfatherslastname"
* extension[section][0].extension[field][5].valueString = "Practitioner.extension:familyNames.extension:grandfathersalternativelanguage"
* extension[section][0].extension[field][6].valueString = "Practitioner.extension:familyNames.extension:mothers"
* extension[section][0].extension[field][7].valueString = "Practitioner.extension:nationality"
* extension[section][0].extension[field][8].valueString = "Practitioner.extension:residence"
* extension[section][1].extension[title].valueString = "Demographic Details"
* extension[section][1].extension[description].valueString = "Demographic Informations"
* extension[section][1].extension[name].valueString = "demographic"
* extension[section][1].extension[field][0].valueString = "Practitioner.birthDate"
* extension[section][1].extension[field][1].valueString = "Practitioner.gender"
* extension[section][1].extension[field][2].valueString = "Practitioner.extension:maritalStatus"
* extension[section][1].extension[field][3].valueString = "Practitioner.extension:ethnicity"
* extension[section][2].extension[title].valueString = "Identifiers"
* extension[section][2].extension[description].valueString = "Personal identifiers"
* extension[section][2].extension[name].valueString = "identifiers"
* extension[section][2].extension[field][0].valueString = "Practitioner.identifier"
* extension[section][2].extension[field][1].valueString = "Practitioner.identifier.use"
* extension[section][2].extension[field][2].valueString = "Practitioner.identifier.type"
* extension[section][2].extension[field][3].valueString = "Practitioner.identifier.value"
* extension[section][2].extension[field][4].valueString = "Practitioner.identifier.system"
* extension[section][3].extension[title].valueString = "Contact Details"
* extension[section][3].extension[description].valueString = "email, phone numbers"
* extension[section][3].extension[name].valueString = "contact"
* extension[section][3].extension[field][0].valueString = "Practitioner.telecom"
* extension[section][4].extension[title].valueString = "Language Details"
* extension[section][4].extension[description].valueString = "Languages spoken"
* extension[section][4].extension[name].valueString = "language"
* extension[section][4].extension[field][0].valueString = "Practitioner.communication"
* extension[section][5].extension[title].valueString = "Dependents Details"
* extension[section][5].extension[description].valueString = "Dependents"
* extension[section][5].extension[name].valueString = "dependents"
* extension[section][5].extension[field][0].valueString = "Practitioner.extension:dependents"
* extension[section][6].extension[title].valueString = "Education and Training Details"
* extension[section][6].extension[description].valueString = "Education,Training and License Information"
* extension[section][6].extension[name].valueString = "education"
* extension[section][6].extension[field][0].valueString = "Practitioner.extension:educationalMajor"
* extension[section][6].extension[field][1].valueString = "Practitioner.extension:professionalLicenseCategory"
* extension[section][6].extension[field][2].valueString = "Practitioner.extension:specialTraining"
* extension[section][6].extension[field][3].valueString = "Practitioner.extension:category"
* extension[section][7].extension[title].valueString = "Remarks"
* extension[section][7].extension[description].valueString = "Remarks or Notes "
* extension[section][7].extension[name].valueString = "remarks"
* extension[section][7].extension[field][0].valueString = "Practitioner.extension:remarkNote"
* extension[section][8].extension[title].valueString = "Position"
* extension[section][8].extension[description].valueString = "Position the person holds"
* extension[section][8].extension[name].valueString = "position"
* extension[section][8].extension[field][0].valueString = "PractitionerRole.code"
* extension[section][8].extension[resource].extension[resource].valueReference = Reference(StructureDefinition/ihris-job-description)
* extension[section][8].extension[resource].extension[linkfield].valueString = "PractitionerRole.practitioner"
* extension[section][8].extension[resource].extension[column][0].extension[header].valueString = "Job"
* extension[section][8].extension[resource].extension[column][0].extension[field].valueString = "PractitionerRole.code.coding[0]"
* extension[section][8].extension[resource].extension[column][1].extension[header].valueString = "Duty Station"
* extension[section][8].extension[resource].extension[column][1].extension[field].valueString = "PractitionerRole.location"
* extension[section][8].extension[resource].extension[column][2].extension[header].valueString = "First Employment Date"
* extension[section][8].extension[resource].extension[column][2].extension[field].valueString = "PractitionerRole.extension:firstEmploymentDate.value[x]:valueDate"
* extension[section][8].extension[resource].extension[column][3].extension[header].valueString = "Start Date"
* extension[section][8].extension[resource].extension[column][3].extension[field].valueString = "PractitionerRole.period.start"
* extension[section][8].extension[resource].extension[column][4].extension[header].valueString = "Shift"
* extension[section][8].extension[resource].extension[column][4].extension[field].valueString = "PractitionerRole.extension:shift.value[x]:valueCoding"
* extension[section][8].extension[resource].extension[column][5].extension[header].valueString = "Job Type"
* extension[section][8].extension[resource].extension[column][5].extension[field].valueString = "PractitionerRole.extension:jobType.value[x]:valueCoding"
* extension[section][8].extension[resource].extension[column][6].extension[header].valueString = "Employment Status"
* extension[section][8].extension[resource].extension[column][6].extension[field].valueString = "PractitionerRole.extension:employmentStatus.value[x]:valueCoding"
* extension[section][8].extension[resource].extension[column][7].extension[header].valueString = "End Date"
* extension[section][8].extension[resource].extension[column][7].extension[field].valueString = "PractitionerRole.period.end"
* extension[section][8].extension[resource].extension[column][8].extension[header].valueString = "Actions"
* extension[section][8].extension[resource].extension[column][8].extension[field].valueString = "_action"
* extension[section][8].extension[resource].extension[action][0].extension[link].valueString = "/resource/add/practitionerrole?PractitionerRole.practitioner.reference=Practitioner/FHIRID"
* extension[section][8].extension[resource].extension[action][0].extension[text].valueString = "Assign Job"
* extension[section][8].extension[resource].extension[action][0].extension[row].valueBoolean = false
* extension[section][8].extension[resource].extension[action][0].extension[condition].valueString = "PractitionerRole.period.end.exists()"
* extension[section][8].extension[resource].extension[action][0].extension[class].valueString = "primary"
* extension[section][8].extension[resource].extension[action][1].extension[link].valueString = "/resource/view/practitionerrole/ITEMID"
* extension[section][8].extension[resource].extension[action][1].extension[text].valueString = "View"
* extension[section][8].extension[resource].extension[action][1].extension[row].valueBoolean = true
* extension[section][8].extension[resource].extension[action][1].extension[class].valueString = "primary"
* extension[section][8].extension[resource].extension[action][2].extension[link].valueString = "/questionnaire/ihris-endrole/practitioner?practitionerrole=ITEMID"
* extension[section][8].extension[resource].extension[action][2].extension[text].valueString = "End Job"
* extension[section][8].extension[resource].extension[action][2].extension[row].valueBoolean = true
* extension[section][8].extension[resource].extension[action][2].extension[condition].valueString = "PractitionerRole.period.end.empty()"
* extension[section][8].extension[resource].extension[action][2].extension[class].valueString = "warning"
* extension[section][8].extension[resource].extension[action][3].extension[link].valueString = "/questionnaire/ihris-promote/practitioner?practitionerrole=ITEMID&practitioner=FHIRID"
* extension[section][8].extension[resource].extension[action][3].extension[text].valueString = "Enter Promotion"
* extension[section][8].extension[resource].extension[action][3].extension[row].valueBoolean = true
* extension[section][8].extension[resource].extension[action][3].extension[condition].valueString = "PractitionerRole.period.end.empty()"
* extension[section][8].extension[resource].extension[action][3].extension[class].valueString = "accent"

Instance:       ihris-page-practitionerrole
InstanceOf:     IhrisPage
Title:          "iHRIS PractitionerRole Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(StructureDefinition/ihris-job-description)
* extension[display].extension[search][0].valueString = "Job|PractitionerRole.code[0].coding[0]"
* extension[display].extension[search][1].valueString = "Start Date|PractitionerRole.period.start"
* extension[display].extension[search][2].valueString = "Practitioner|PractitionerRole.practitioner"
* extension[display].extension[search][3].valueString = "Facility|PractitionerRole.location"
* extension[display].extension[filter][0].valueString = "Job|code|http://ihris.org/fhir/ValueSet/ihris-job-ethiopia"
* extension[section][0].extension[title].valueString = "Position"
* extension[section][0].extension[description].valueString = "Position details"
* extension[section][0].extension[name].valueString = "Position"
* extension[section][0].extension[field][0].valueString = "PractitionerRole.code"
* extension[section][0].extension[field][1].valueString = "PractitionerRole.practitioner"
* extension[section][0].extension[field][2].valueString = "PractitionerRole.location"
* extension[section][0].extension[field][3].valueString = "PractitionerRole.extension:directorate.value[x]:valueCoding"
* extension[section][0].extension[field][4].valueString = "PractitionerRole.extension:caseteam.value[x]:valueCoding"
* extension[section][0].extension[field][5].valueString = "PractitionerRole.extension:firstEmploymentDate.value[x]:valueDate"
* extension[section][0].extension[field][6].valueString = "PractitionerRole.period.start"
* extension[section][0].extension[field][7].valueString = "PractitionerRole.extension:jobType.value[x]:valueCoding"
* extension[section][0].extension[field][8].valueString = "PractitionerRole.extension:shift.value[x]:valueCoding"
* extension[section][0].extension[field][9].valueString = "PractitionerRole.extension:employmentStatus.value[x]:valueCoding"

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
* extension[display].extension[filter][1].valueString = "Location Type|type:text"
* extension[display].extension[filter][2].valueString = "Location Physical Type|physicalType:text"
* extension[section][0].extension[title].valueString = "Location/Duty Station"
* extension[section][0].extension[description].valueString = "Location and Duty Station details"
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
* extension[section][0].extension[title].valueString = "Case Team"
* extension[section][0].extension[description].valueString = "Case Team"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.display"
* extension[section][0].extension[field][1].valueString = "CodeSystem.code"
* extension[section][0].extension[field][2].valueString = "CodeSystem.definition"