Profile:        IhrisOrganization
Parent:         Organization
Id:             ihris-organization
Title:          "Department/CaseTeam"
Description:    "iHRIS Profile of Organizations such as departments and caseteams."
* active 1..1 MS
* active ^label = "Status"
* type 1..1 MS
* type ^label = "Organization Type"
* type.coding 1..1 MS
* type.coding ^label = "Organization Type"
* type.coding from IhrisOrganizationType (required)
* name 1..1 MS
* name ^label = "Name"
* partOf 0..1 MS
* partOf only Reference(IhrisOrganization)
* partOf ^label = "Part Of(Department/CaseTeam)"

ValueSet:         IhrisOrganizationType
Id:               ihris-organization-type
Title:            "iHRIS organization Type ValueSet"
* ^date = "2021-03-12T08:41:04.362Z"
* ^version = "0.2.0"
* codes from system IhrisOrganizationType

CodeSystem:      IhrisOrganizationType
Id:              ihris-organization-type
Title:           "organization Type(Department/Department)"
* ^date = "2021-03-12T08:41:04.362Z"
* ^version = "0.2.0"
* #department "Department" "Department"
* #caseteam "Caseteam" "Department"

Instance:       ihris-page-organization
InstanceOf:     IhrisPage
Title:          "iHRIS Organization Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(StructureDefinition/ihris-organization)
* extension[display].extension[search][0].valueString = "Name|name"
* extension[display].extension[search][1].valueString = "Type|type.coding"
* extension[display].extension[search][2].valueString = "CaseTeam Department|partOf.reference"
* extension[display].extension[search][3].valueString = "Status|active"
* extension[display].extension[filter][0].valueString = "Name|name:contains"
* extension[display].extension[filter][1].valueString = "Type|type|http://ihris.org/fhir/ValueSet/ihris-organization-type"
* extension[display].extension[filter][2].valueString = "CaseTeam Department|partOf"
* extension[section][0].extension[title].valueString = "Department/Caseteam"
* extension[section][0].extension[description].valueString = "Department/Caseteam details"
* extension[section][0].extension[name].valueString = "Organization"
* extension[section][0].extension[field][0].valueString = "Organization.name"
* extension[section][0].extension[field][1].valueString = "Organization.type"
* extension[section][0].extension[field][2].valueString = "Organization.partOf"
* extension[section][0].extension[field][3].valueString = "Organization.active"