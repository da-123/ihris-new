Profile:        IhrisEthiopiaLeave
Parent:         Basic
Id:             ihris-ethiopia-leave
Title:          "iHRIS EthiopiaLeave"
Description:    "iHRIS Profile of the Basic resource for Ethiopia Leave."
* extension contains
      IhrisPractitioner named practitioner 1..1 MS and
      IhrisLeaveType named leave-type 1..1 MS and
      IhrisDaysRequested named daysRequested 1..1 MS and
      IhrisRequestedDate named requestedDate 1..1 MS and
      IhrisLeavePeriod named leavePeriod 1..1 MS 

Extension:      IhrisLeaveType
Id:             ihris-leave-type
Title:          "iHRIS Leave Type"
Description:    "iHRIS extension for Leave Type."
* ^context.type = #element
* ^context.expression = "Basic"
* value[x] only Coding
* valueCoding 1..1 MS
* valueCoding ^label = "Leave Type"
* valueCoding from IhrisLeaveTypeValueSet (required)

CodeSystem:      IhrisLeaveTypeCodeSystem
Id:              ihris-leave-type-codesystem
Title:           "iHRIS leave Type CodeSystem"

ValueSet:         IhrisLeaveTypeValueSet
Id:               ihris-leave-type-valueset
Title:            "iHRIS leave Type ValueSet"
* codes from system IhrisLeaveTypeCodeSystem

Extension:      IhrisRequestedDate
Id:             ihris-requested-date
Title:          "iHRIS Requested Date"
Description:    "iHRIS extension for Requested Date."
* ^context.type = #element
* ^context.expression = "Basic"
* value[x] only date
* valueDate 1..1 MS
* valueDate ^label = "Requested Date"

Extension:      IhrisLeavePeriod
Id:             ihris-leave-period
Title:          "iHRIS Leave Period"
Description:    "iHRIS extension for Leave Period."
* ^context.type = #element
* ^context.expression = "Basic"
* value[x] only period
* valuePeriod 1..1 MS
* valuePeriod ^label = "Leave Period"

Extension:      IhrisDaysRequested
Id:             ihris-days-requested
Title:          "iHRIS days Requested"
Description:    "iHRIS extension for Days requested."
* ^context.type = #element
* ^context.expression = "Basic"
* value[x] only positiveInt
* valuePositiveInt 1..1 MS
* valuePositiveInt ^label = "Days Requested"

Extension:      IhrisPersonalInformation
Id:             ihris-personal-information
Title:          "iHRIS Personal Information"
Description:    "iHRIS extension for Personal Information"
* ^context.type = #element
* ^context.expression = "Basic"
* value[x] only reference
* valueReference 1..1 MS
* valueReference ^label = "Health Worker"
* valueReference only Reference(Practitioner)
* valueReference.reference 1..1 MS
* valueReference.reference ^label = "Practitioner"