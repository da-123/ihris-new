Profile:        IhrisBasicEducationHistory
Parent:         IhrisPractitionerBasic
Id:             ihris-basic-education-history
Title:          "Education History Information"
Description:    "iHRIS Profile of the Basic resource for Education History."
* extension[practitioner].valueReference 1..1 MS
* extension[practitioner].valueReference ^label = "Health Worker"
* extension contains
    IhrisEducationHistory named educationHistory 1..1 MS
* extension[educationHistory].extension[institution].valueCoding 1..1 MS
* extension[educationHistory].extension[institution].valueCoding ^label = "Institution"
* extension[educationHistory].extension[level].valueCoding ^label = "Education Level"
* extension[educationHistory].extension[level].valueCoding 1..1 MS
/* extension[educationHistory].extension[degree].valueCoding ^label = "Educational Background/Carrier"
* extension[educationHistory].extension[degree].valueCoding 1..1 MS*/
* extension[educationHistory].extension[educationalMajor].valueCoding ^label = "Educational Major"
* extension[educationHistory].extension[educationalMajor].valueCoding 0..1 MS
* extension[educationHistory].extension[year].valueDate ^label = "Year Of Graduation"
* extension[educationHistory].extension[year].valueDate 0..1 MS
* extension[educationHistory].extension[current].valueBoolean ^label = "Is Current?"
* extension[educationHistory].extension[current].valueBoolean MS
* extension[educationHistory].extension[attachment].valueAttachment ^label = "Attachment"
* extension[educationHistory].extension[attachment].valueAttachment MS
    
Extension:      IhrisEducationHistory
Id:             ihris-education-history
Title:          "Education History details"
* extension contains
      institution 1..1 MS and
      level 1..1 MS and
      /*degree 1..1 MS and*/
      educationalMajor 0..1 MS and
      year 0..1 MS and
      current 0..1 MS and
      attachment 0..1 MS
* extension[institution].value[x] only Coding
* extension[institution].valueCoding from IhrisInstitutionValueSet
* extension[institution].valueCoding ^label = "Institution"
* extension[level].value[x] only Coding
* extension[level].valueCoding ^label = "Education Level"
* extension[level].valueCoding from IhrisEducationLevelValueSet (required)
/* extension[degree].value[x] only Coding
* extension[degree].valueCoding ^label = "Educational Background/Carrier"
* extension[degree].valueCoding from IhrisDegreeValueSet (required)*/
* extension[educationalMajor].value[x] only Coding
* extension[educationalMajor].valueCoding ^label = "Educational Major"
* extension[educationalMajor].valueCoding from IhrisEducationalMajorValueSet (required)
* extension[year].value[x] only date
* extension[year].valueDate ^label = "Year Of Graduation"
* extension[current].value[x] only boolean
* extension[current].valueBoolean MS
* extension[current].valueBoolean ^label = "Is Current"
* extension[attachment].value[x] only Attachment
* extension[attachment].valueAttachment 0..1 MS
* extension[attachment].valueAttachment ^label = "Attachment"

CodeSystem:      IhrisDegree
Id:              ihris-degree
Title:           "Degree"
* ^date = "2020-11-10T08:41:04.362Z"
* ^version = "0.3.0"
* #1 "Anesthesia Professionals "
* #2 "Biomedical Engineering / Technology"
* #3 "Biomedical Engineering /Technology - Technician / Level_IV"
* #4 "Clinical Health professionals - Clinical infectious disease officer/MSC"
* #5 "Clinical Health professionals - Health officer"
* #6 "Clinical Health professionals -  IESO/MSC"
* #7 "Clinical Health professionals - Tropical and Infectious Disease officer/MSC"
* #8 "Dental Professionals "
* #9 "Dental Professionals - Dental surgeon / MD in Dental "
* #10 "Dental Professionals -Dental technician[Diploma/Level_IV]"
* #11 "Environmental Health and Occupational Health and safety Professionals"
* #12 "Health Education and promotion Professionals"
* #13 "Health Extension Workers[HEWs]  - Level _III"
* #14 "Health Extension Workers[HEWs] - Level _IV"
* #15 "Health Extension Workers[HEWs]  - Urban HEW(Nursing +3month training on HEP)"
* #16 "Health information Technology professionals - Health informatics"
* #17 "Medical Doctor Professionals - General Practitioner/GP"
* #18 "Medical Laboratory professionals - Assistant Medical Lab. Technician"
* #19 "Medical Laboratory professionals"
* #20 "Mental Health Professionals - Clinical Psychologist"
* #21 "Midwifery professionals"
* #22 "Psychiatric Nursing professionals"
* #23 "Midwifery professionals - Diploma/IV assistant"
* #24 "Emergency and critical care nurse"
* #25 "Midwifery professionals - Psychiatric"
* #26 "Nursing professionals"
* #27 "Nurse professional"
* #28 "Ophthalmic professionals"
* #29 "Optometry professional"
* #30 "Other staffs / Supportive and administrative"
* #31 "Paramedics Professionals: Emergency Medical Technician(EMT) - Level _II"
* #32 "Paramedics Professionals: Emergency Medical Technician(EMT) - Level _III"
* #33 "Paramedics Professionals: Emergency Medical Technician(EMT) - Level _IV"
* #34 "Pharmacy professionals"
* #35 "Physiotherapy  professionals"
* #36 "Prosthetic/orthotic professionals"
* #37 "Public Health Professionals - Biostatician"
* #38 "Public Health Professionals - MPH - Epidemiologist"
* #39 "Public Health Professionals - MPH-Generalist"
* #40 "Public Health Professionals- MPH - Health Economist / Occupational Health"
* #41 "Public Health Professionals - MPH-Health Service mgt."
* #42 "Public Health Professionals - MPH - M & amp;E"
* #43 "Public Health Professionals - MPH-Nutritionist"
* #44 "Public Health Professionals - MPH others"
* #45 "Public Health Professionals - MPH-RH"
* #46 "Public Health Professionals - MSC - Field Epidemiology"
* #47 "Public Health Specialist [MD/GP+] - MPH[Biostatitian]"
* #48 "Public Health Specialist[MD / GP + ] - MPH[Epidemiologist]"
* #49 "Public Health Specialist [MD/GP+] - MPH[Generalist"
* #50 "Public Health Specialist [MD/GP+] - MPH[Health Economics]"
* #51 "Public Health Specialist[MD / GP + ] - MPH[Health Service mgt.]"
* #52 "Public Health Specialist [MD/GP+] - MPH["
* #53 "Public Health Specialist[MD / GP + ] - MPH[Nutritionist]"
* #54 "Public Health Specialist [MD/GP+] - MPH[RH]"
* #55 "Public Health Specialist[MD / GP + ] - MSC - [All other Category]"
* #56 "Public Health Specialist [MD/GP+] - MS[Hospital Administration]"
* #57 "Public Health Specialist[MD / GP + ] - Other MPH unspecified"
* #58 "Radiology professionals"
* #59 "Radiology professionals - X-ray technician[Diploma/IV]"
* #60 "Specialist[clinical] - All Sub Specialty"
* #61 "Specialist[clinical] - Anesthesiologist"
* #62 "Specialist[clinical] - Dental surgeon / MD in Dental"
* #63 "Specialist[clinical] - Dermatologist"
* #64 "Specialist[clinical] - Emergency medicine"
* #65 "Specialist[clinical] - ENT"
* #66 "Specialist[clinical] - Family Medicine"
* #67 "Specialist[clinical] - Forensic"
* #68 "Specialist[clinical] - Internist"
* #69 "Specialist[clinical] - Neurology"
* #70 "Specialist[clinical] - Nuclear Medicine"
* #71 "Specialist[clinical] - Obs/Gyn"
* #72 "Specialist[clinical] - Oncology"
* #73 "Specialist[clinical] - Ophthalmologist"
* #74 "Specialist[clinical] - Orthopedics"
* #75 "Specialist[clinical] - Pathologist"
* #76 "Specialist[clinical] - Pediatrician"
* #77 "Specialist[clinical] - Plastic and reconstructive"
* #78 "Specialist[clinical] - Psychiatrist"
* #79 "Specialist[clinical] - Radiologist"
* #80 "Specialist[clinical] - Surgeon(General)"
* #81 "Specialist[clinical] - urology"
* #82 "Specialist Nurse - Emergency and critical nurse"
* #83 "Specialist Nurse - Neonatal Nurse"
* #84 "Specialist Nurse - Oncology"
* #85 "Specialist Nurse - OR Nurse"
* #86 "Specialist Nurse - other unspecified"
* #87 "Specialist Nurse - Surgical Nurse"
* #88 "Specialist Nurse - Adult Nursing"
* #89 "Specialist Nurse - Emergency and critical nurse"
* #90 "Specialist Nurse - Maternity and Child Health"
* #91 "Specialist Nurse - Maternity and RH"
* #92 "Specialist Nurse - other unspecified"
* #93 "Specialist Nurse - Pediatric and child health nurse specialist"

ValueSet:         IhrisDegreeValueSet
Id:               ihris-degree-valueset
Title:            "iHRIS Degree ValueSet"
* ^date = "2020-11-10T08:41:04.362Z"
* ^version = "0.3.0"
* codes from system IhrisDegree

CodeSystem:      IhrisEducationLevel
Id:              ihris-education-level
Title:           "Education Level"
* ^date = "2020-09-29T08:41:04.362Z"
* #Cerifiticate "Cerifiticate" "Cerifiticate"
* #Diploma "Diploma" "Diploma"
* #Degree "Degree" "Degree"
* #Masters "Masters" "Masters"
* #PHD "PHD" "PHD"
* #Others "Others" "Others"

ValueSet:         IhrisEducationLevelValueSet
Id:               ihris-education-level-valueset
Title:            "iHRIS Education Level ValueSet"
* ^date = "2020-09-29T08:41:04.362Z"
* ^version = "0.2.0"
* codes from system IhrisEducationLevel

CodeSystem:      IhrisInstitution
Id:              ihris-institution
Title:           "Institution"
* ^date = "2020-11-10T08:41:04.362Z"
* ^version = "0.3.0"
* ^property[0].code = #region
* ^property[0].description = "Region"
* ^property[0].type = #string
* #AUAH	"Ambo University and Hospital"
* #WSUAH	"Wolayta Sodo University and Hospital "
* #WUAH	"Wachamo University and Hospital"
* #MWUAH	"Meda Wolabo University and Hospital"
* #MUAAH	"Mekele Univeristy and Ayder Hospital"
* #AHSC	"ARSI Health Science Collage"
* #JHSUCAH	"Jijga Health Science University Collage and Hospital "
* #DHSUCAH	"Dila Health Science University Collage and Hospital"
* #DBHSUCAH	"Debere Brhan Health Science University Collage and Hospital"
* #AHSUCAH	"Axum Health Science University Collage and Hospital"
* #BHSUCAH	"Bulehora Health Science University Collage and Hospital"
* #JIHSUCAH	"JIMA Health Science University Collage and Hospital"
* #WHSUCAH	"WELKITE Health Science University Collage and Hospital "
* #BDHSUCAH	"BHAR-DAR Health Science University Collage and Hospital"
* #WU	"Woldiya University"
* #MTU	"Mizan Tapi University"
* #DMU	"Debre Markos University"
* #WOU	"Wollega University"
* #DTU	"Debre Tabor University"
* #GUCAH	"Gonder Univeristy CM and HS "
* #SHSUCAH	"Selale Health Science University Collage and Hospital "
* #ARHSUCAH	"Arbamnch Health Science University Collage and Hospital "
* #WUCAH	"Wolo Health Science University Collage and Hospital "
* #MHSUCAH	"Metu Health Science University Collage and Hospital "
* #KMUMIMAHSC	"Kotebe Metropolitan University menelik II medical and Health Science collede "
* #SU	"Semera University"
* #AU	"Asossa Univeristy "
* #ADU	"Adigrat University"
* #HU	"Haromaya University "
* #AAUTASH	"Adiss Ababa University Tikur Anbesa Specialised Hospital"
* #DU	"Defence University"
* #A2HSC	"Adama Health Science Collage"
* #SPM	"St. Paul MMHSC "
* #DDU	"Dambi Dollo University"
* #HMC	"Hayat Medical College "
* #BMC	"Bethel Medical College"
* #KMC	"Korea Medical College"
* #AFMC	"Africa Medical College"
* #SMC	"Sante Medical College"
* #AGHMC	"Adama General Hospital, Medical College (Adama)"
* #GCOMSD	"Gambi College of Medical  Science(Bahir dar) "
* #EHLI	"Ecusta Higher Learning institute "
* #AMC	"ABH Medical College"
* #HHHR	"Hareri HSc (Hareri Region)"
* #RVHR	"Rift vally (Hareri Region)"
* #LHR	"Lucy (Hareri Region)"
* #EAHR	"East africa (Hareri Region)"
* #HAHR	"Horn Africa ( Hareri Region)"
* #AHR	"Afenkelo ( Hareri Region)"

ValueSet:         IhrisInstitutionValueSet
Id:               ihris-institution-valueset
Title:            "iHRIS Institution Value Set"
* ^date = "2020-11-10T08:41:04.362Z"
* ^version = "0.3.0"
* codes from system IhrisInstitution


/*Profile:        IhrisInstitution
Parent:         Location
Id:             ihris-institution
Title:          "Education Institution"
Description:    "iHRIS profile of Education Institution."
* identifier 0..0 
* status 1..1 MS
* status ^label = "Status"
* operationalStatus 0..0
* hoursOfOperation 0..0
* physicalType 0..0
* type 0..0
* mode 0..0
* name 1..1 MS
* name ^label = "Institution Name"
* telecom 0..* MS
* telecom ^label = "Institution Contact"
* telecom.system MS
* telecom.system ^label = "Type"
* telecom.value MS
* telecom.value ^label = "Value"
* telecom.use MS
* telecom.use ^label = "Use"
* address 0..1 MS
* address ^label = "Institution Address"
* address.type MS
* address.type ^label = "Address Type"
* address.use MS
* address.use ^label = "Use"
* address.line 0..1 MS
* address.line ^label = "Street name, number & P.O. Box etc."
* address.city MS
* address.city ^label = "Name of city, town etc"
* address.district MS
* address.district ^label = "District"
* address.country MS
* address.country ^label = "Country"
* partOf 0..1 MS
* partOf ^label = "Institution Location"
* extension contains
    IhrisInstitutionType named institutionType 1..1 MS 
* extension[institutionType].valueCoding MS
* extension[institutionType] ^label = "Institution Type"

Extension:      IhrisInstitutionType
Id:             ihris-institution-type
Title:          "Institution Type"
Description:    "iHRIS extension for Institution Type."
* ^context.type = #element
* ^context.expression = "Location"
* value[x] only Coding
* valueCoding 1..1 MS
* valueCoding ^label = "Type"
* valueCoding from IhrisInstitutionTypeValueSet (required)

CodeSystem:      IhrisInstitutionType
Id:              ihris-institution-type
Title:           "Institution Type"
* #university "University" "University"
* #technical "Technical Institute" "Technical Institute"
* #college "College" "College"
* #other "other" "other"

ValueSet:         IhrisInstitutionTypeValueSet
Id:               ihris-institution-type-valueset
Title:            "iHRIS Institution Type Value Set"
* codes from system IhrisInstitutionType*/

Instance:       IhrisPractitionerWorkflowEducationHistory
InstanceOf:      Questionnaire
Usage:          #definition
* title = "iHRIS Education History Workflow"
* description = "iHRIS workflow to record a Education History"
* id = "ihris-education-history"
* url = "http://ihris.org/fhir/Questionnaire/ihris-education-history"
* name = "ihris-education-history"
* status = #active
* date = 2020-08-27
* purpose = "Workflow page for recording a Education History information."

* item[0].linkId = "Basic"
* item[0].text = "Education History"
* item[0].type = #group

* item[0].item[0].linkId = "Basic.extension[0].extension[0]"
* item[0].item[0].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-institution-valueset"
* item[0].item[0].text = "Education Institution"
* item[0].item[0].type = #choice
* item[0].item[0].required = true
* item[0].item[0].repeats = false

* item[0].item[1].linkId = "Basic.extension[0].extension[1]"
* item[0].item[1].text = "Education Level"
* item[0].item[1].type = #choice
* item[0].item[1].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-education-level-valueset"
* item[0].item[1].required = true
* item[0].item[1].repeats = false

/* item[0].item[2].linkId = "Basic.extension[0].extension[2]"
* item[0].item[2].text = "Educational Background/Carrier"
* item[0].item[2].type = #choice
* item[0].item[2].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-degree-valueset"
* item[0].item[2].required = true
* item[0].item[2].repeats = false*/

* item[0].item[2].linkId = "Basic.extension[0].extension[2]"
* item[0].item[2].text = "Education Major"
* item[0].item[2].type = #choice
* item[0].item[2].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-educational-major-valueset"
* item[0].item[2].required = false
* item[0].item[2].repeats = false

* item[0].item[3].linkId = "Basic.extension[0].extension[3]#year"
* item[0].item[3].text = "Year Of Graduation"
* item[0].item[3].type = #date
* item[0].item[3].required = false
* item[0].item[3].repeats = false

* item[0].item[4].linkId = "Basic.extension[0].extension[4]"
* item[0].item[4].text = "Is Current?"
* item[0].item[4].type = #boolean
* item[0].item[4].required = false
* item[0].item[4].repeats = false

* item[0].item[5].linkId = "Basic.extension[0].extension[5]"
* item[0].item[5].text = "Attachement"
* item[0].item[5].type = #attachment
* item[0].item[5].required = false
* item[0].item[5].repeats = false

Instance:       ihris-page-basic-education-history
InstanceOf:     IhrisPage
Title:          "Education History"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(StructureDefinition/ihris-basic-education-history)
* extension[display].extension[link][0].extension[field].valueString = "Basic.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference').valueReference.reference"
* extension[display].extension[link][0].extension[text].valueString = "View Health Worker"
* extension[display].extension[link][0].extension[button].valueBoolean = true
* extension[display].extension[link][0].extension[icon].valueString = "mdi-account-arrow-right"
* extension[display].extension[link][0].extension[url].valueUrl = "/resource/view/practitioner/FIELD"
* extension[display].extension[link][1].extension[field].valueString = "Basic.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference').valueReference.reference"
* extension[display].extension[link][1].extension[text].valueString = "Add Another"
* extension[display].extension[link][1].extension[button].valueBoolean = true
* extension[display].extension[link][1].extension[icon].valueString = "mdi-account-arrow-right"
* extension[display].extension[link][1].extension[url].valueUrl = "/questionnaire/ihris-education-history/basic-education-history?practitioner=FIELD"
* extension[display].extension[search][0].valueString = "Practitioner|extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference').valueReference.reference"
* extension[display].extension[search][1].valueString = "Institution|extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-education-history').extension.where(url='institution').valueReference.reference"
/* extension[display].extension[search][2].valueString = "Degree|extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-education-history').extension.where(url='degree').valueCoding.display"*/
* extension[display].extension[search][2].valueString = "Level|extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-education-history').extension.where(url='level').valueCoding.display"
* extension[display].extension[search][3].valueString = "Educational Major|extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-education-history').extension.where(url='educationalMajor').valueCoding.display"
* extension[display].extension[search][4].valueString = "Year|extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-education-history').extension.where(url='year').valueDate"
* extension[display].extension[field][0].extension[path].valueString = "Basic.extension:practitioner.value[x]:valueReference"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[display].extension[field][1].extension[path].valueString = "Basic.extension:educationHistory.extension:year.value[x]:valueDate"
* extension[display].extension[field][1].extension[type].valueString = "year"
* extension[section][0].extension[title].valueString = "Education History"
* extension[section][0].extension[description].valueString = "Education History details"
* extension[section][0].extension[name].valueString = "Basic"
* extension[section][0].extension[field][0].valueString = "extension:practitioner"
* extension[section][0].extension[field][1].valueString = "extension:educationHistory.extension:institution.value[x]:valueCoding"
* extension[section][0].extension[field][2].valueString = "extension:educationHistory.extension:level.value[x]:valueCoding"
/* extension[section][0].extension[field][3].valueString = "extension:educationHistory.extension:degree.value[x]:valueCoding"*/
* extension[section][0].extension[field][3].valueString = "extension:educationHistory.extension:educationalMajor.value[x]:valueCoding"
* extension[section][0].extension[field][4].valueString = "extension:educationHistory.extension:year.value[x]:valueDate"


Instance:       ihris-page-institution
InstanceOf:     IhrisPage
Title:          "iHRIS Institution CodeSystem Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/ihris-institution)
* extension[display].extension[search][0].valueString = "Code|code"
* extension[display].extension[search][1].valueString = "Display|display"
* extension[display].extension[search][2].valueString = "Region|region"
* extension[display].extension[field][0].extension[path].valueString = "CodeSystem.code"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Education Institution"
* extension[section][0].extension[description].valueString = "Education Institution"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.code"
* extension[section][0].extension[field][1].valueString = "CodeSystem.definition"
* extension[section][0].extension[field][2].valueString = "CodeSystem.display"
* extension[section][0].extension[field][3].valueString = "CodeSystem.region"
