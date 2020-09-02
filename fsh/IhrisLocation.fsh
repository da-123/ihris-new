Profile:        IhrisLocation
Parent:         Location
Id:             ihris-location
Title:          "Location/Facility"
Description:    "iHRIS profile of Location."

/* identifier 0..0 MS
* identifier ^label = "Identifier"
* identifier.system 0..0
* identifier.system ^label = "System"
* identifier.value MS
* identifier.value ^label = "Value"
* identifier.type MS
* identifier.type ^label = "Type"
* identifier.type.coding 1..1 MS
* identifier.type from IhrisEthiopiaIdentifierValueSet*/
* name 1..1 MS
* name ^label = "Name"
* status 0..1 MS
* status ^label = "Status"
* description MS
* description ^label = "Description"
* type 0..1 MS
* type ^label = "Facility Type"
* type.coding 1..1 MS
* physicalType MS
* physicalType ^label = "Location Type"
* physicalType.coding 1..1 MS
* position 0..1 MS
* position ^label = "Geo-Coordinates"
* position.longitude 1..1 MS
* position.longitude ^label = "Longitude"
* position.latitude 1..1 MS
* position.latitude ^label = "Latitude"
* position.altitude 0..0 MS
* telecom MS
* telecom ^label = "Telecom"
* telecom.system MS
* telecom.system ^label = "Type"
* telecom.value MS
* telecom.value ^label = "Value"
* telecom.use MS
* telecom.use ^label = "Use"
* partOf 0..1 MS
* partOf ^label = "Location/PartOf"