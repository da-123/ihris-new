Instance:       ihris-es-departure-report-ethiopia-staff
InstanceOf:     IhrisRelationship
Title:          "Departure Relationship - Ethiopia"
Usage:          #example

* code.text = "iHRISRelationship"
* code.coding = #iHRISRelationship
* extension[reportdetails].extension[name].valueString = "departure"
* extension[reportdetails].extension[label].valueString = "Separated Employee Report"
* extension[reportdetails].extension[resource].valueString = "Practitioner"
/* extension[reportdetails].extension[query].valueString = "identifier.system=http://app.rapidpro.io/contact-uuid"*/
* extension[reportdetails].extension[displayCheckbox].valueBoolean = true
* extension[reportdetails].extension[reportelement][0].extension[label].valueString = "employeeId"
* extension[reportdetails].extension[reportelement][0].extension[name].valueString = "identifier.where(type.coding.where(code='employeeId')).value"
* extension[reportdetails].extension[reportelement][0].extension[display].valueString = "Employee Id"
* extension[reportdetails].extension[reportelement][0].extension[filter].valueBoolean = true
* extension[reportdetails].extension[reportelement][0].extension[dropDownFilter].valueBoolean = false
* extension[reportdetails].extension[reportelement][1].extension[label].valueString = "given"
* extension[reportdetails].extension[reportelement][1].extension[name].valueString = "name.where(use='official').first().given"
* extension[reportdetails].extension[reportelement][1].extension[display].valueString = "Firstname"
* extension[reportdetails].extension[reportelement][1].extension[filter].valueBoolean = true
* extension[reportdetails].extension[reportelement][1].extension[dropDownFilter].valueBoolean = false
* extension[reportdetails].extension[reportelement][2].extension[label].valueString = "father"
* extension[reportdetails].extension[reportelement][2].extension[name].valueString = "Practitioner.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-familynames').extension.where(url='fathers').valueString"
* extension[reportdetails].extension[reportelement][2].extension[display].valueString = "Father's Name"
* extension[reportdetails].extension[reportelement][2].extension[filter].valueBoolean = true
* extension[reportdetails].extension[reportelement][2].extension[dropDownFilter].valueBoolean = false
* extension[reportdetails].extension[reportelement][3].extension[label].valueString = "grandfather"
* extension[reportdetails].extension[reportelement][3].extension[name].valueString = "Practitioner.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-familynames').extension.where(url='grandfatherslastname').valueString"
* extension[reportdetails].extension[reportelement][3].extension[display].valueString = "Grand Father's Name"
* extension[reportdetails].extension[reportelement][3].extension[filter].valueBoolean = true
* extension[reportdetails].extension[reportelement][3].extension[dropDownFilter].valueBoolean = false
* extension[reportdetails].extension[reportelement][4].extension[label].valueString = "gender"
* extension[reportdetails].extension[reportelement][4].extension[name].valueString = "gender"
* extension[reportdetails].extension[reportelement][4].extension[display].valueString = "Gender"
* extension[reportdetails].extension[reportelement][4].extension[filter].valueBoolean = true
* extension[reportdetails].extension[reportelement][4].extension[dropDownFilter].valueBoolean = true

* extension[reportlink][0].extension[name].valueString = "role"
* extension[reportlink][0].extension[resource].valueString = "PractitionerRole"
* extension[reportlink][0].extension[linkElement].valueString = "PractitionerRole.practitioner.reference"
* extension[reportlink][0].extension[linkTo].valueString = "departure"
* extension[reportlink][0].extension[linkElementSearchParameter].valueString = "practitioner"
* extension[reportlink][0].extension[multiple].valueBoolean = false
* extension[reportlink][0].extension[reportelement][0].extension[label].valueString = "job"
* extension[reportlink][0].extension[reportelement][0].extension[name].valueString = "code.coding.where(system='http://ihris.org/fhir/CodeSystem/ihris-job-ethiopia').display"
* extension[reportlink][0].extension[reportelement][0].extension[display].valueString = "Job Position"
* extension[reportlink][0].extension[reportelement][0].extension[filter].valueBoolean = true
* extension[reportlink][0].extension[reportelement][0].extension[dropDownFilter].valueBoolean = true
* extension[reportlink][0].extension[reportelement][1].extension[label].valueString = "department"
* extension[reportlink][0].extension[reportelement][1].extension[name].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitionerrole-directorate').valueCoding.display"
* extension[reportlink][0].extension[reportelement][1].extension[display].valueString = "Department/Directorate"
* extension[reportlink][0].extension[reportelement][1].extension[filter].valueBoolean = true
* extension[reportlink][0].extension[reportelement][1].extension[dropDownFilter].valueBoolean = true
* extension[reportlink][0].extension[reportelement][2].extension[label].valueString = "startDate"
* extension[reportlink][0].extension[reportelement][2].extension[name].valueString = "period.start"
* extension[reportlink][0].extension[reportelement][2].extension[display].valueString = "Start Date"
* extension[reportlink][0].extension[reportelement][2].extension[filter].valueBoolean = false
* extension[reportlink][0].extension[reportelement][2].extension[dropDownFilter].valueBoolean = false
* extension[reportlink][0].extension[reportelement][3].extension[label].valueString = "endDate"
* extension[reportlink][0].extension[reportelement][3].extension[name].valueString = "period.end"
* extension[reportlink][0].extension[reportelement][3].extension[display].valueString = "End Date"
* extension[reportlink][0].extension[reportelement][3].extension[filter].valueBoolean = false
* extension[reportlink][0].extension[reportelement][3].extension[dropDownFilter].valueBoolean = false
* extension[reportlink][0].extension[reportelement][4].extension[label].valueString = "employmentStatus"
* extension[reportlink][0].extension[reportelement][4].extension[name].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitionerrole-employment-status').valueCoding.display"
* extension[reportlink][0].extension[reportelement][4].extension[display].valueString = "Employment Status"
* extension[reportlink][0].extension[reportelement][4].extension[filter].valueBoolean = true
* extension[reportlink][0].extension[reportelement][4].extension[dropDownFilter].valueBoolean = true
* extension[reportlink][0].extension[reportelement][5].extension[label].valueString = "reasonForChange"
* extension[reportlink][0].extension[reportelement][5].extension[name].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitionerrole-reason-change').valueCoding.display"
* extension[reportlink][0].extension[reportelement][5].extension[display].valueString = "Reason For Change"
* extension[reportlink][0].extension[reportelement][5].extension[filter].valueBoolean = true
* extension[reportlink][0].extension[reportelement][5].extension[dropDownFilter].valueBoolean = true
* extension[reportlink][0].extension[reportelement][6].extension[label].valueString = "reasonForChange"
* extension[reportlink][0].extension[reportelement][6].extension[name].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitionerrole-reason-departure').valueCoding.display"
* extension[reportlink][0].extension[reportelement][6].extension[display].valueString = "Reason For Change"
* extension[reportlink][0].extension[reportelement][6].extension[filter].valueBoolean = true
* extension[reportlink][0].extension[reportelement][6].extension[dropDownFilter].valueBoolean = true

* extension[reportlink][1].extension[name].valueString = "facility"
* extension[reportlink][1].extension[resource].valueString = "Location"
* extension[reportlink][1].extension[linkElement].valueString = "Location.id"
* extension[reportlink][1].extension[linkTo].valueString = "role.location.reference"
* extension[reportlink][1].extension[multiple].valueBoolean = false
* extension[reportlink][1].extension[reportelement][0].extension[label].valueString = "dutyPost"
* extension[reportlink][1].extension[reportelement][0].extension[name].valueString = "name"
* extension[reportlink][1].extension[reportelement][0].extension[display].valueString = "Facility"
* extension[reportlink][1].extension[reportelement][0].extension[filter].valueBoolean = true
* extension[reportlink][1].extension[reportelement][0].extension[dropDownFilter].valueBoolean = true