Profile:        IhrisBasicCollateral
Parent:         IhrisPractitionerBasic
Id:             ihris-basic-collateral
Title:          "Collateral Information"
Description:    "iHRIS Profile of the Basic resource for Collateral."
* extension[practitioner].valueReference 1..1 MS
* extension[practitioner].valueReference ^label = "Health Worker"
* extension contains
    IhrisCollateral named collateral 1..1 MS
* extension[collateral] ^label = "Collateral"
* extension[collateral].extension[name].valueString 1..1 MS
* extension[collateral].extension[altlangName].valueString MS
* extension[collateral].extension[gender].valueCoding 1..1 MS
* extension[collateral].extension[birthdate].valueDate MS
* extension[collateral].extension[phone].valueString MS
* extension[collateral].extension[mobile].valueString MS
* extension[collateral].extension[workPhone].valueString MS
* extension[collateral].extension[otherPhone].valueString MS
* extension[collateral].extension[workEmail].valueString MS
* extension[collateral].extension[otherEmail].valueString MS
* extension[collateral].extension[salary].valueString MS
* extension[collateral].extension[location].valueReference.reference MS
* extension[collateral].extension[city].valueString MS
* extension[collateral].extension[kebele].valueString MS
* extension[collateral].extension[houseNumber].valueString MS
* extension[collateral].extension[address].valueString MS
* extension[collateral].extension[remark].valueString MS
* extension[collateral].extension[attachment].valueAttachment MS
    
Extension:      IhrisCollateral
Id:             ihris-collateral
Title:          "Collateral details"
* extension contains name 1..1 MS and
    altlangName 0..1 MS and
    gender 1..1 MS and
    birthdate 0..1 MS and
    phone 0..1 MS and
    mobile 0..1 MS and
    workPhone 0..1 MS and
    otherPhone 0..1 MS and
    workEmail 0..1 MS and
    otherEmail 0..1 MS and
    salary 0..1 MS and
    location 0..1 MS and
    city 0..1 MS and
    kebele 0..1 MS and
    houseNumber 0..1 MS and
    address 0..1 MS and
    remark 0..1 MS and
    attachment 0..1 MS
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
* extension[gender].value[x] only Coding
* extension[gender].valueCoding 1..1 MS
* extension[gender].valueCoding ^label = "Gender"
* extension[gender].valueCoding from IhrisEthiopiaGenderValueSet (required)
* extension[birthdate].value[x] only date
* extension[birthdate].valueDate 0..1 MS
* extension[birthdate].valueDate ^label = "Date of Birth"
* extension[phone].value[x] only string
* extension[phone].valueString 0..1 MS
* extension[phone].valueString ^label = "Home Phone"
* extension[mobile].value[x] only string
* extension[mobile].valueString 0..1 MS
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
* extension[salary].value[x] only string
* extension[salary].valueString 0..1 MS
* extension[salary].valueString ^label = "Salary"
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
* extension[remark].value[x] only string
* extension[remark].valueString 0..1 MS
* extension[remark].valueString ^label = "remark"
* extension[attachment].value[x] only Attachment
* extension[attachment].valueAttachment 0..1 MS
* extension[attachment].valueAttachment ^label = "Attachment"

Instance:       IhrisPractitionerWorkflowCollateral
InstanceOf:     IhrisQuestionnaire
Usage:          #definition
* title = "iHRIS Collateral Workflow"
* description = "iHRIS workflow to record a Collateral"
* id = "ihris-collateral"
* url = "http://ihris.org/fhir/Questionnaire/ihris-collateral"
* name = "ihris-collateral"
* status = #active
* date = 2020-09-02
* purpose = "Workflow page for recording a Collateral information."

* item[0].linkId = "Basic"
* item[0].text = "Collateral"
* item[0].type = #group

* item[0].item[0].linkId = "Basic.extension[0].extension[0]"
* item[0].item[0].text = "Full Name"
* item[0].item[0].type = #string
* item[0].item[0].required = true
* item[0].item[0].repeats = false
* item[0].item[0].extension[constraint].extension[key].valueId = "ihris-given-name-check"
* item[0].item[0].extension[constraint].extension[severity].valueCode = #error
* item[0].item[0].extension[constraint].extension[expression].valueString = "matches('^[A-Za-z ]*$')"
* item[0].item[0].extension[constraint].extension[human].valueString = "Name must be only text."

* item[0].item[1].linkId = "Basic.extension[0].extension[1]"
* item[0].item[1].text = "Alt Language Full Name"
* item[0].item[1].type = #string
* item[0].item[1].required = false
* item[0].item[1].repeats = false

* item[0].item[2].linkId = "Basic.extension[0].extension[2]"
* item[0].item[2].text = "Gender"
* item[0].item[2].type = #choice
* item[0].item[2].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-gender-valueset"
* item[0].item[2].required = true
* item[0].item[2].repeats = false

* item[0].item[3].linkId = "Basic.extension[0].extension[3]"
* item[0].item[3].text = "Date of Birth"
* item[0].item[3].type = #date
* item[0].item[3].required = false
* item[0].item[3].repeats = false

* item[0].item[4].linkId = "Basic.extension[0].extension[4]"
* item[0].item[4].text = "Home Phone"
* item[0].item[4].type = #string
* item[0].item[4].required = false
* item[0].item[4].repeats = false
* item[0].item[4].extension[constraint].extension[key].valueId = "ihris-home-phone-check"
* item[0].item[4].extension[constraint].extension[severity].valueCode = #error
* item[0].item[4].extension[constraint].extension[expression].valueString = "matches('^(([+][2][5][1][1-9][0-9]{8})|([0][1-9][0-9]{8}))')"
* item[0].item[4].extension[constraint].extension[human].valueString = "Phone Number is not properly formatted."

* item[0].item[5].linkId = "Basic.extension[0].extension[5]"
* item[0].item[5].text = "Mobile Phone"
* item[0].item[5].type = #string
* item[0].item[5].required = false
* item[0].item[5].repeats = false
* item[0].item[5].extension[constraint].extension[key].valueId = "ihris-mobile-phone-check"
* item[0].item[5].extension[constraint].extension[severity].valueCode = #error
* item[0].item[5].extension[constraint].extension[expression].valueString = "matches('^(([+][2][5][1][1-9][0-9]{8})|([0][1-9][0-9]{8}))')"
* item[0].item[5].extension[constraint].extension[human].valueString = "Phone Number is not properly formatted."

* item[0].item[6].linkId = "Basic.extension[0].extension[6]"
* item[0].item[6].text = "Work Phone"
* item[0].item[6].type = #string
* item[0].item[6].required = false
* item[0].item[6].repeats = false
* item[0].item[6].extension[constraint].extension[key].valueId = "ihris-work-phone-check"
* item[0].item[6].extension[constraint].extension[severity].valueCode = #error
* item[0].item[6].extension[constraint].extension[expression].valueString = "matches('^(([+][2][5][1][1-9][0-9]{8})|([0][1-9][0-9]{8}))')"
* item[0].item[6].extension[constraint].extension[human].valueString = "Phone Number is not properly formatted."

* item[0].item[7].linkId = "Basic.extension[0].extension[7]"
* item[0].item[7].text = "Other Phone"
* item[0].item[7].type = #string
* item[0].item[7].required = false
* item[0].item[7].repeats = false
* item[0].item[7].extension[constraint].extension[key].valueId = "ihris-other-phone-check"
* item[0].item[7].extension[constraint].extension[severity].valueCode = #error
* item[0].item[7].extension[constraint].extension[expression].valueString = "matches('^(([+][2][5][1][1-9][0-9]{8})|([0][1-9][0-9]{8}))')"
* item[0].item[7].extension[constraint].extension[human].valueString = "Phone Number is not properly formatted."

* item[0].item[8].linkId = "Basic.extension[0].extension[8]"
* item[0].item[8].text = "Work Email"
* item[0].item[8].type = #string
* item[0].item[8].required = false
* item[0].item[8].repeats = false
* item[0].item[8].extension[constraint].extension[key].valueId = "ihris-work-email-check"
* item[0].item[8].extension[constraint].extension[severity].valueCode = #error
* item[0].item[8].extension[constraint].extension[expression].valueString = "matches('^[0-9a-zA-Z_.]+@([0-9a-zA-Z]+[.])+[a-zA-Z]{2,4}$')"
* item[0].item[8].extension[constraint].extension[human].valueString = "Email Address is not properly formatted."

* item[0].item[9].linkId = "Basic.extension[0].extension[9]"
* item[0].item[9].text = "Other Email"
* item[0].item[9].type = #string
* item[0].item[9].required = false
* item[0].item[9].repeats = false
* item[0].item[9].extension[constraint].extension[key].valueId = "ihris-other-email-check"
* item[0].item[9].extension[constraint].extension[severity].valueCode = #error
* item[0].item[9].extension[constraint].extension[expression].valueString = "matches('^[0-9a-zA-Z_.]+@([0-9a-zA-Z]+[.])+[a-zA-Z]{2,4}$')"
* item[0].item[9].extension[constraint].extension[human].valueString = "Email Address is not properly formatted."

* item[0].item[10].linkId = "Basic.extension[0].extension[10]"
* item[0].item[10].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-collateral#Basic.extension:collateral.extension:location.value[x]:valueReference"
* item[0].item[10].text = "Location(Region/Zone/Woreda)"
* item[0].item[10].type = #reference
* item[0].item[10].required = false
* item[0].item[10].repeats = false

* item[0].item[11].linkId = "Basic.extension[0].extension[11]"
* item[0].item[11].text = "City/Town"
* item[0].item[11].type = #string
* item[0].item[11].required = false
* item[0].item[11].repeats = false

* item[0].item[12].linkId = "Basic.extension[0].extension[12]"
* item[0].item[12].text = "Kebele"
* item[0].item[12].type = #string
* item[0].item[12].required = false
* item[0].item[12].repeats = false

* item[0].item[13].linkId = "Basic.extension[0].extension[13]"
* item[0].item[13].text = "House Number"
* item[0].item[13].type = #string
* item[0].item[13].required = false
* item[0].item[13].repeats = false

* item[0].item[14].linkId = "Basic.extension[0].extension[14]"
* item[0].item[14].text = "P.O.BOX"
* item[0].item[14].type = #text
* item[0].item[14].required = false
* item[0].item[14].repeats = false

* item[0].item[15].linkId = "Basic.extension[0].extension[15]"
* item[0].item[15].text = "Salary"
* item[0].item[15].type = #string
* item[0].item[15].required = false
* item[0].item[15].repeats = false

* item[0].item[16].linkId = "Basic.extension[0].extension[16]"
* item[0].item[16].text = "Remark"
* item[0].item[16].type = #text
* item[0].item[16].required = false
* item[0].item[16].repeats = false

* item[0].item[17].linkId = "Basic.extension[0].extension[17]"
* item[0].item[17].text = "Attachement"
* item[0].item[17].type = #attachment
* item[0].item[17].required = false
* item[0].item[17].repeats = false

Instance:       ihris-page-collateral
InstanceOf:     IhrisPage
Title:          "iHRIS Basic Collateral Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(StructureDefinition/ihris-basic-collateral)
* extension[display].extension[link][0].extension[field].valueString = "Basic.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference').valueReference.reference"
* extension[display].extension[link][0].extension[text].valueString = "View Health Worker"
* extension[display].extension[link][0].extension[button].valueBoolean = true
* extension[display].extension[link][0].extension[icon].valueString = "mdi-account-arrow-right"
* extension[display].extension[link][0].extension[url].valueUrl = "/resource/view/practitioner/FIELD"
* extension[display].extension[search][0].valueString = "Collateral|extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-collateral').extension.where(url='name').valueString"
* extension[display].extension[field][0].extension[path].valueString = "Basic.extension:practitioner.value[x]:valueReference"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Collateral"
* extension[section][0].extension[description].valueString = "Collateral details"
* extension[section][0].extension[name].valueString = "Basic"
* extension[section][0].extension[field][0].valueString = "Basic.extension:practitioner"
* extension[section][0].extension[field][1].valueString = "Basic.extension:collateral.extension:name.value[x]:valueString"
* extension[section][0].extension[field][1].valueString = "Basic.extension:collateral.extension:altlangName.value[x]:valueString"
* extension[section][0].extension[field][1].valueString = "Basic.extension:collateral.extension:gender.value[x]:valueCoding"
* extension[section][0].extension[field][1].valueString = "Basic.extension:collateral.extension:birthdate.value[x]:valueDate"
* extension[section][0].extension[field][1].valueString = "Basic.extension:collateral.extension:phone.value[x]:valueString"
* extension[section][0].extension[field][1].valueString = "Basic.extension:collateral.extension:mobile.value[x]:valueString"
* extension[section][0].extension[field][1].valueString = "Basic.extension:collateral.extension:workPhone.value[x]:valueString"
* extension[section][0].extension[field][1].valueString = "Basic.extension:collateral.extension:otherPhone.value[x]:valueString"
* extension[section][0].extension[field][1].valueString = "Basic.extension:collateral.extension:workEmail.value[x]:valueString"
* extension[section][0].extension[field][1].valueString = "Basic.extension:collateral.extension:otherEmail.value[x]:valueString"
* extension[section][0].extension[field][1].valueString = "Basic.extension:collateral.extension:salary.value[x]:valueString"
* extension[section][0].extension[field][1].valueString = "Basic.extension:collateral.extension:location.value[x]:valueReference"
* extension[section][0].extension[field][1].valueString = "Basic.extension:collateral.extension:city.value[x]:valueString"
* extension[section][0].extension[field][1].valueString = "Basic.extension:collateral.extension:kebele.value[x]:valueString"
* extension[section][0].extension[field][1].valueString = "Basic.extension:collateral.extension:houseNumber.value[x]:valueString"
* extension[section][0].extension[field][1].valueString = "Basic.extension:collateral.extension:address.value[x]:valueAddress"
* extension[section][0].extension[field][1].valueString = "Basic.extension:collateral.extension:remark.value[x]:valueString"
