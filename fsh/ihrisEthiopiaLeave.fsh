Profile:        IhrisBasicEthiopiaLeave
Parent:         IhrisPractitionerBasic
Id:             ihris-basic-ethiopia-leave
Title:          "Leave Information"
Description:    "iHRIS Profile of the Basic resource for Ethiopia Leave."
* extension contains
    IhrisEthiopiaLeave named ethiopiaLeave 1..1 MS
    
Extension:      IhrisEthiopiaLeave
Id:             ihris-ethiopia-leave
Title:          "Leave details"
* extension contains
      leave-type 1..1 MS and
      period 1..1 MS and
      daysRequested 0..1 MS and
      dateRequested 0..1 MS
* extension[leave-type].value[x] only Coding
* extension[leave-type].valueCoding from IhrisLeaveTypeValueSet (required)
* extension[leave-type].valueCoding ^label = "Leave Type"
* extension[period].value[x] only Period
* extension[period].valuePeriod ^label = "Leave Period"
* extension[daysRequested].value[x] only integer
* extension[daysRequested].valueInteger ^label = "Days Requested"
* extension[dateRequested].value[x] only date
* extension[dateRequested].valueDate ^label = "Requested Date"

CodeSystem:      IhrisLeaveTypeCodeSystem
Id:              ihris-leave-type-codesystem
Title:           "Leave Type"
* ^version = "0.2.0"
* #annual "Annual Leave" "Annual Leave"
* #maternity "Maternity Leave" "Maternity Leave"
* #paternity "Paternity Leave" "Paternity Leave"
* #sick  "Sick Leave" "Sick Leave"
* #special  "Special Leave" "Special Leave"
* #forced  "Forced Leave" "Forced Leave"
* #casual "Casual Leave" "Casual Leave"
* #educational "Educational Leave" "Educational Leave"
* #prenatal "Prenatal Leave" "Prenatal Leave"
* #postnatal "Postnatal Leave" "Postnatal Leave"
* #medical  "Medical Leave" "Medical Leave"
* #mourning "Mourning Leave" "Mourning Leave"
* #weeding "Weeding Leave" "Weeding Leave"
* #exam "Exam" "Exam"

ValueSet:         IhrisLeaveTypeValueSet
Id:               ihris-leave-type-valueset
Title:            "iHRIS leave Type ValueSet"
* ^version = "0.2.0"
* codes from system IhrisLeaveTypeCodeSystem
