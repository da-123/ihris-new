Profile:        IhrisBasicEmergency
Parent:         IhrisPractitionerBasic
Id:             ihris-basic-emergency
Title:          "Emergency Information"
Description:    "iHRIS Profile of the Basic resource for Emergency."
* extension[practitioner].valueReference 1..1 MS
* extension[practitioner].valueReference ^label = "Health Worker"
* extension contains
    IhrisEmergency named emergency 1..1 MS
* extension[emergency] ^label = "Emergency"
* extension[emergency].extension[name].valueString 1..1 MS
* extension[emergency].extension[altlangName].valueString MS
* extension[emergency].extension[relation].valueCoding 1..1 MS
* extension[emergency].extension[phone].valueString MS
* extension[emergency].extension[mobile].valueString MS
* extension[emergency].extension[workPhone].valueString MS
* extension[emergency].extension[otherPhone].valueString MS
* extension[emergency].extension[workEmail].valueString MS
* extension[emergency].extension[otherEmail].valueString MS
* extension[emergency].extension[location].valueReference.reference MS
* extension[emergency].extension[city].valueString MS
* extension[emergency].extension[kebele].valueString MS
* extension[emergency].extension[houseNumber].valueString MS
* extension[emergency].extension[address].valueString MS
* extension[emergency].extension[remark].valueString MS
    
Extension:      IhrisEmergency
Id:             ihris-emergency
Title:          "Emergency details"
* extension contains name 1..1 MS and
    altlangName 0..1 MS and
    relation 1..1 MS and
    phone 0..1 MS and
    mobile 0..1 MS and
    workPhone 0..1 MS and
    otherPhone 0..1 MS and
    workEmail 0..1 MS and
    otherEmail 0..1 MS and
    location 0..1 MS and
    city 0..1 MS and
    kebele 0..1 MS and
    houseNumber 0..1 MS and
    address 0..1 MS and
    remark 0..1 MS
* extension[name].value[x] only string
* extension[name].valueString 1..1 MS
* extension[name].valueString ^label = "Full Name"
* extension[name].valueString ^constraint[0].key = "ihris-name-check"
* extension[name].valueString ^constraint[0].severity = #error
* extension[name].valueString ^constraint[0].expression = "matches('^[A-Za-z ]*$')"
* extension[name].valueString ^constraint[0].human = "Name must be only text."
* extension[altlangName].value[x] only string
* extension[altlangName].valueString 0..1 MS
* extension[altlangName].valueString ^label = "Alt Language Full Name"
* extension[relation].value[x] only Coding
* extension[relation].valueCoding 1..1 MS
* extension[relation].valueCoding ^label = "Relationship"
* extension[relation].valueCoding from IhrisEthiopiaRelationValueSet (required)
* extension[phone].value[x] only string
* extension[phone].valueString 0..1 MS
* extension[phone].valueString ^label = "Home Phone"
* extension[mobile].value[x] only string
* extension[mobile].valueString 1..1 MS
* extension[mobile].valueString ^label = "Mobile Phone"
* extension[workPhone].value[x] only string
* extension[workPhone].valueString 0..1 MS
* extension[workPhone].valueString ^label = "Work Phone"
* extension[otherPhone].value[x] only string
* extension[otherPhone].valueString 0..1 MS
* extension[otherPhone].valueString ^label = "Other Phone"
* extension[workEmail].value[x] only string
* extension[workEmail].valueString 0..1 MS
* extension[workEmail].valueString ^label = "Work Email"
* extension[otherEmail].value[x] only string
* extension[otherEmail].valueString 0..1 MS
* extension[otherEmail].valueString ^label = "Other Email"
* extension[location].value[x] only Reference
* extension[location].valueReference 0..1 MS
* extension[location].valueReference ^label = "Location(Region/Zone/Woreda)"
* extension[location].valueReference.reference ^label = "Location(Region/Zone/Woreda)"
* extension[location].valueReference only Reference(Location)
* extension[address].value[x] only string
* extension[address].valueString 0..1 MS
* extension[address].valueString ^label = "P.O.BOX"
* extension[city].value[x] only string
* extension[city].valueString 0..1 MS
* extension[city].valueString ^label = "City/Town"
* extension[kebele].value[x] only string
* extension[kebele].valueString 0..1 MS
* extension[kebele].valueString ^label = "Kebele"
* extension[houseNumber].value[x] only string
* extension[houseNumber].valueString 0..1 MS
* extension[houseNumber].valueString ^label = "House Number"

Instance:       IhrisPractitionerWorkflowEmergency
InstanceOf:     IhrisQuestionnaire
Usage:          #definition
* title = "iHRIS Emergency Workflow"
* description = "iHRIS workflow to record a Emergency"
* id = "ihris-emergency"
* url = "http://ihris.org/fhir/Questionnaire/ihris-emergency"
* name = "ihris-emergency"
* status = #active
* date = 2020-09-02
* purpose = "Workflow page for recording a Emergency information."

* item[0].linkId = "Basic"
* item[0].text = "Emergency"
* item[0].type = #group

* item[0].item[0].linkId = "Basic.extension[0].extension[0]"
* item[0].item[0].text = "Full Name"
* item[0].item[0].type = #string
* item[0].item[0].required = true
* item[0].item[0].repeats = false
* item[0].item[0].extension[constraint].extension[key].valueId = "ihris-given-name-check"
* item[0].item[0].extension[constraint].extension[severity].valueCode = #error
* item[0].item[0].extension[constraint].extension[expression].valueString = "where(linkId='Basic.extension[0].extension[0]').answer.first().valueString.matches('^[A-Za-z ]*$')"
* item[0].item[0].extension[constraint].extension[human].valueString = "Name must be only text."

* item[0].item[1].linkId = "Basic.extension[0].extension[1]"
* item[0].item[1].text = "Alt Language Full Name"
* item[0].item[1].type = #string
* item[0].item[1].required = false
* item[0].item[1].repeats = false

* item[0].item[2].linkId = "Basic.extension[0].extension[2]"
* item[0].item[2].text = "Relation"
* item[0].item[2].type = #choice
* item[0].item[2].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-relation-valueset"
* item[0].item[2].required = true
* item[0].item[2].repeats = false

* item[0].item[3].linkId = "Basic.extension[0].extension[3]"
* item[0].item[3].text = "Home Phone"
* item[0].item[3].type = #string
* item[0].item[3].required = false
* item[0].item[3].repeats = false

* item[0].item[4].linkId = "Basic.extension[0].extension[4]"
* item[0].item[4].text = "Mobile Phone"
* item[0].item[4].type = #string
* item[0].item[4].required = false
* item[0].item[4].repeats = false

* item[0].item[5].linkId = "Basic.extension[0].extension[5]"
* item[0].item[5].text = "Work Phone"
* item[0].item[5].type = #string
* item[0].item[5].required = false
* item[0].item[5].repeats = false

* item[0].item[6].linkId = "Basic.extension[0].extension[6]"
* item[0].item[6].text = "Other Phone"
* item[0].item[6].type = #string
* item[0].item[6].required = false
* item[0].item[6].repeats = false

* item[0].item[7].linkId = "Basic.extension[0].extension[7]"
* item[0].item[7].text = "Work Email"
* item[0].item[7].type = #string
* item[0].item[7].required = false
* item[0].item[7].repeats = false

* item[0].item[8].linkId = "Basic.extension[0].extension[8]"
* item[0].item[8].text = "Other Email"
* item[0].item[8].type = #string
* item[0].item[8].required = false
* item[0].item[8].repeats = false

* item[0].item[9].linkId = "Basic.extension[0].extension[9]"
* item[0].item[9].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-emergency#Basic.extension:emergency.extension:location.value[x]:valueReference"
* item[0].item[9].text = "Location(Region/Zone/Woreda)"
* item[0].item[9].type = #reference
* item[0].item[9].required = false
* item[0].item[9].repeats = false

* item[0].item[10].linkId = "Basic.extension[0].extension[10]"
* item[0].item[10].text = "City/Town"
* item[0].item[10].type = #string
* item[0].item[10].required = false
* item[0].item[10].repeats = false

* item[0].item[11].linkId = "Basic.extension[0].extension[11]"
* item[0].item[11].text = "Kebele"
* item[0].item[11].type = #string
* item[0].item[11].required = false
* item[0].item[11].repeats = false

* item[0].item[12].linkId = "Basic.extension[0].extension[12]"
* item[0].item[12].text = "House Number"
* item[0].item[12].type = #string
* item[0].item[12].required = false
* item[0].item[12].repeats = false

* item[0].item[13].linkId = "Basic.extension[0].extension[13]"
* item[0].item[13].text = "P.O.BOX"
* item[0].item[13].type = #text
* item[0].item[13].required = false
* item[0].item[13].repeats = false

* item[0].item[14].linkId = "Basic.extension[0].extension[14]"
* item[0].item[14].text = "Remark"
* item[0].item[14].type = #text
* item[0].item[14].required = false
* item[0].item[14].repeats = false

Instance:       ihris-page-emergency
InstanceOf:     IhrisPage
Title:          "iHRIS Basic Emergency Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(StructureDefinition/ihris-basic-emergency)
* extension[display].extension[link][0].extension[field].valueString = "Basic.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference').valueReference.reference"
* extension[display].extension[link][0].extension[text].valueString = "View Health Worker"
* extension[display].extension[link][0].extension[button].valueBoolean = true
* extension[display].extension[link][0].extension[icon].valueString = "mdi-account-arrow-right"
* extension[display].extension[link][0].extension[url].valueUrl = "/resource/view/practitioner/FIELD"
* extension[display].extension[search][0].valueString = "Emergency|extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-emergency').extension.where(url='name').valueString"
* extension[display].extension[field][0].extension[path].valueString = "Basic.extension:practitioner.value[x]:valueReference"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Emergency Contact"
* extension[section][0].extension[description].valueString = "Emergency Contact details"
* extension[section][0].extension[name].valueString = "Basic"
* extension[section][0].extension[field][0].valueString = "Basic.extension:practitioner"
* extension[section][0].extension[field][1].valueString = "Basic.extension:emergency.extension:name.value[x]:valueString"
* extension[section][0].extension[field][2].valueString = "Basic.extension:emergency.extension:altlangName.value[x]:valueString"
* extension[section][0].extension[field][3].valueString = "Basic.extension:emergency.extension:relation.value[x]:valueCoding"
* extension[section][0].extension[field][4].valueString = "Basic.extension:emergency.extension:phone.value[x]:valueString"
* extension[section][0].extension[field][5].valueString = "Basic.extension:emergency.extension:mobile.value[x]:valueString"
* extension[section][0].extension[field][6].valueString = "Basic.extension:emergency.extension:workPhone.value[x]:valueString"
* extension[section][0].extension[field][7].valueString = "Basic.extension:emergency.extension:otherPhone.value[x]:valueString"
* extension[section][0].extension[field][8].valueString = "Basic.extension:emergency.extension:workEmail.value[x]:valueString"
* extension[section][0].extension[field][9].valueString = "Basic.extension:emergency.extension:otherEmail.value[x]:valueString"
* extension[section][0].extension[field][10].valueString = "Basic.extension:emergency.extension:location.value[x]:valueReference"
* extension[section][0].extension[field][11].valueString = "Basic.extension:emergency.extension:city.value[x]:valueString"
* extension[section][0].extension[field][12].valueString = "Basic.extension:emergency.extension:kebele.value[x]:valueString"
* extension[section][0].extension[field][13].valueString = "Basic.extension:emergency.extension:houseNumber.value[x]:valueString"
* extension[section][0].extension[field][14].valueString = "Basic.extension:emergency.extension:address.value[x]:valueAddress"
* extension[section][0].extension[field][15].valueString = "Basic.extension:emergency.extension:remark.value[x]:valueString"
