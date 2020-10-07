Profile:        IhrisJobDescription
Parent:         PractitionerRole
Id:             ihris-job-description
Title:          "Position(s)"
Description:    "iHRIS profile of Practitioner."
* identifier 0..0 MS
/* identifier ^label = "Identifier"
* identifier.system MS
* identifier.system ^label = "System"
* identifier.value MS
* identifier.value ^label = "Value"
* identifier.type MS
* identifier.type ^label = "Type"
* identifier.type.coding 1..1 MS*/
* active 1..1 MS
* active ^label = "Status"
* practitioner MS
* practitioner ^label = "Health Worker"
* practitioner.reference ^label = "Health Worker"
* healthcareService 0..0
* telecom 0..0
* location 1..1 MS
* location ^label = "Place Of Work"
* location.reference ^label = "Place Of Work"
* code 1..1 MS
* code ^label = "Job"
* code from IhrisJobEthiopiaValueset (required)
* code.coding 1..1 MS
* code.coding ^label = "Job Title"
* period 0..1 MS
* period.start 1..1 MS
* period.start ^label = "Hired Date"
* period.end 0..1 MS
* period.end ^label = "End Date"
* extension contains
    IhrisPractitionerRoleSalary named salary 0..1 MS and
    IhrisPractitionerRoleDirectorate named directorate 0..1 MS and
    IhrisPractitionerRoleCaseTeam named caseteam 0..1 MS and
    IhrisPractitionerRoleShift named shift 0..1 MS and
    IhrisPractitionerRoleEmploymentStatus named employmentStatus 0..1 MS and
    IhrisPractitionerRoleJobType named jobType 0..1 MS and
    IhrisPractitionerRoleFirstEmploymentDate named firstEmploymentDate 1..1 MS and
    IhrisPractitionerRoleJobInformationRemark named jobInformationRemark 0..1 MS and
    IhrisPractitionerRoleReasonDeparture named reasonForDepature 0..1 MS and
    IhrisPractitionerRoleSalaryScale named salaryScale 0..1 MS
* extension[salary].valueMoney MS
* extension[salary] ^label = "Salary"
* extension[salaryScale].valueCoding MS
* extension[salaryScale] ^label = "Salary Scale"
* extension[directorate].valueCoding MS
* extension[directorate] ^label = "Directorate"
* extension[caseteam].valueCoding MS
* extension[caseteam] ^label = "Case Team"
* extension[shift].valueCoding MS
* extension[shift] ^label = "Shift"
* extension[employmentStatus].valueCoding MS
* extension[employmentStatus] ^label = "Employment Status"
* extension[jobType].valueCoding MS
* extension[jobType] ^label = "Job Type"
* extension[firstEmploymentDate].valueDate MS
* extension[firstEmploymentDate] ^label = "First Employment Date"
* extension[jobInformationRemark].valueString MS
* extension[jobInformationRemark] ^label = "Remark"
* extension[reasonForDepature].valueCoding MS
* extension[reasonForDepature] ^label = "Reason for Departure"

Extension:      IhrisPractitionerRoleShift
Id:             ihris-practitionerrole-shift
Title:          "iHRIS Job Description Shift"
Description:    "iHRIS extension for Job Description Shift."
* ^context.type = #element
* ^context.expression = "PractitionerRole"
* value[x] only Coding
* valueCoding 1..1 MS
* valueCoding ^label = "Shift"
* valueCoding from IhrisShiftValueSet (required)

CodeSystem:      IhrisShiftCodeSystem
Id:              ihris-shift-codesystem
Title:           "Shift"
* #duty "Duty" "Duty"
* #work "Work" "Work"

ValueSet:         IhrisShiftValueSet
Id:               ihris-shift-valueset
Title:            "iHRIS Shift Value Set"
* codes from system IhrisShiftCodeSystem

Extension:      IhrisPractitionerRoleDirectorate
Id:             ihris-practitionerrole-directorate
Title:          "iHRIS Job Description Directorate"
Description:    "iHRIS extension for Job Description Directorate."
* ^context.type = #element
* ^context.expression = "PractitionerRole"
* value[x] only Coding
* valueCoding 1..1 MS
* valueCoding ^label = "Directorate"
* valueCoding from IhrisDirectorateValueSet (required)

CodeSystem:      IhrisDepartmentCodeSystem
Id:              ihris-department-codesystem
Title:           "Department"

ValueSet:         IhrisDepartmentValueSet
Id:               ihris-department-valueset
Title:            "iHRIS department Value Set"
* codes from system IhrisDepartmentCodeSystem

Extension:      IhrisPractitionerRoleEmploymentStatus
Id:             ihris-practitionerrole-employment-status
Title:          "iHRIS Job Description Employment Status"
Description:    "iHRIS extension for Job Description Employment Status."
* ^context.type = #element
* ^context.expression = "PractitionerRole"
* value[x] only Coding
* valueCoding 1..1 MS
* valueCoding ^label = "Employment Status"
* valueCoding from IhrisEmploymentStatusValueSet (required)

CodeSystem:      IhrisEmploymentStatusCodeSystem
Id:              ihris-employment-status-codesystem
Title:           "Employment Status"
* #contract "Contract" "Contract"
* #permanent "Permanent" "Permanent"
* #LTA "Long Term Absence" "Long Term Absence"
* #LTEA  "Long Term Education Absence" "Long Term Education Absence"
* #Separated "Separated" "Separated"

ValueSet:         IhrisEmploymentStatusValueSet
Id:               ihris-employment-status-valueset
Title:            "iHRIS Employment Status ValueSet"
* codes from system IhrisEmploymentStatusCodeSystem

Extension:      IhrisPractitionerRoleJobType
Id:             ihris-practitionerrole-job-type
Title:          "iHRIS Job Description Job Type"
Description:    "iHRIS extension for Job Description Job Type."
* ^context.type = #element
* ^context.expression = "PractitionerRole"
* value[x] only Coding
* valueCoding 1..1 MS
* valueCoding ^label = "Job Type"
* valueCoding from IhrisJobTypeValueSet (required)

CodeSystem:      IhrisJobTypeCodeSystem
Id:              ihris-job-type-codesystem
Title:           "Job Type"
* #NewHire "New Hire" "New Hire"
* #Transfered "Transfered" "Transfered"
* #Promoted "Promoted" "Promoted"
* #Redeployed "Redeploymed" "Redeploymed"
* #Separated "Separated" "Separated"
* #ReHire "Re-Hire" "Re-Hire"

ValueSet:         IhrisJobTypeValueSet
Id:               ihris-job-type-valueset
Title:            "iHRIS Job Type ValueSet"
* codes from system IhrisJobTypeCodeSystem

Extension:      IhrisPractitionerRoleSalaryScale
Id:             ihris-practitionerrole-salary-scale
Title:          "iHRIS Salary Scale"
Description:    "iHRIS extension for Job Description Salary Scale."
* ^context.type = #element
* ^context.expression = "PractitionerRole"
* value[x] only Coding
* valueCoding 1..1 MS
* valueCoding ^label = "Salary Scale"
* valueCoding from IhrisSalaryScaleValueSet (required)

CodeSystem:      IhrisSalaryScaleCodeSystem
Id:              ihris-salary-scale-codesystem
Title:           "Salary Scale"
* ^date = "2020-09-29T08:41:04.362Z"
* ^version = "0.3.0"

ValueSet:         IhrisSalaryScaleValueSet
Id:               ihris-salary-scale-valueset
Title:            "iHRIS Salary Scale ValueSet"
* ^date = "2020-09-29T08:41:04.362Z"
* ^version = "0.3.0"
* codes from system IhrisSalaryScaleCodeSystem

Extension:      IhrisPractitionerRoleReasonDeparture
Id:             ihris-practitionerrole-reason-departure
Title:          "iHRIS Job Description Reason for Departure"
Description:    "iHRIS extension for Job Description Reason for Departure."
* ^context.type = #element
* ^context.expression = "PractitionerRole"
* value[x] only Coding
* valueCoding 1..1 MS
* valueCoding ^label = "Reason for Departure"
* valueCoding from IhrisReasonDepartureValueSet (required)

CodeSystem:      IhrisReasonDepartureCodeSystem
Id:              ihris-reason-departure-codesystem
Title:           "Reason For Departure"
* ^version = "0.2.0"
* #transfer "Transfer" "Transfer"
* #promotion "Promotion" "Promotion"
* #redeployment  "Redeployment" "Redeployment"
* #death "Death" "Death"
* #mandatoryRetirement "Mandatory Retirement" "Mandatory Retirement"
* #earlyRetirement "Early Retirement" "Early Retirement"
* #resignation "Resignation" "Resignation"
* #anotherJobPosition "Another Job Position" "Another Job Position"
* #health "Health Related" "Health Related"
* #quit "Quit" "Quit"

ValueSet:         IhrisReasonDepartureValueSet
Id:               ihris-reason-departure-valueset
Title:            "iHRIS Reason Departure ValueSet"
* ^version = "0.2.0"
* codes from system IhrisReasonDepartureCodeSystem

Extension:      IhrisPractitionerRoleFirstEmploymentDate
Id:             ihris-practitionerrole-first-employment-date
Title:          "iHRIS Job Description First Employment Date"
Description:    "iHRIS extension for First Employment Date."
* ^context.type = #element
* ^context.expression = "PractitionerRole"
* value[x] only date
* valueDate 1..1 MS
* valueDate ^label = "First Employment Date"

Extension:      IhrisPractitionerRoleJobInformationRemark
Id:             ihris-practitionerrole-job-information-remark
Title:          "iHRIS Job Description Job Information Remark"
Description:    "iHRIS extension for Job Information Remark."
* ^context.type = #element
* ^context.expression = "PractitionerRole"
* value[x] only string
* valueString 1..1 MS
* valueString ^label = "Job Information Remark"

Extension:      IhrisPractitionerRoleSalary
Id:             ihris-practitionerrole-salary
Title:          "iHRIS Job Description salary"
Description:    "iHRIS extension for Job Information Salary."
* ^context.type = #element
* ^context.expression = "PractitionerRole"
* value[x] only Money
* valueMoney 1..1 MS
* valueMoney ^label = "Salary"

Extension:      IhrisPractitionerRoleCaseTeam
Id:             ihris-practitionerrole-caseteam
Title:          "iHRIS Job Description CaseTeam"
Description:    "iHRIS extension for Job Description Case Team."
* ^context.type = #element
* ^context.expression = "PractitionerRole"
* value[x] only Coding
* valueCoding 1..1 MS
* valueCoding ^label = "Case Team"
* valueCoding from IhrisCaseTeamValueSet (required)

CodeSystem:      IhrisCaseTeamCodeSystem
Id:              ihris-caseteam-codesystem
Title:           "Case Team"
* ^version = "0.3.0"
* #RMT "Resource Mobilization Team" "Resource Mobilization Team"
* #PT "Purchasing Team" "Purchasing Team"
* #FT "Financial Team" "Financial Team"
* #RPT "Revenue Payment Team" "Revenue Payment Team"
* #WCYAT "Women, Children And Youth Affairs Team" "Women, Children And Youth Affairs Team"
* #YAT "Youth Affairs Team" "Youth Affairs Team"
* #TFMT "Transport And Fuel Management Team" "Transport And Fuel Management Team"
* #VMT "Vehicle Maintenance Team" "Vehicle Maintenance Team"
* #PST "Protocol Service Team" "Protocol Service Team"
* #BMCMT "Building Management And Comprehensive Maintenance Team" "Building Management And Comprehensive Maintenance Team"
* #JSt "Joint Service Team" "Joint Service Team"
* #AMT "Asset Management Team" "Asset Management Team"
* #ADMT "Application Development And Management Team" "Application Development And Management Team"
* #CTIMT "Infrastructure Communication Technology Infrastructure And Management Team" "Infrastructure Communication Technology Infrastructure And Management Team"
* #SATAT "System Administering Team" "System Administering Team"
* #BET "Employee Benefit Enforcement Team" "Employee Benefit Enforcement Team"
* #HRMT "Human Resource Management Team" "Human Resource Management Team"
* #HRIMT "Human Resource Information Management (Hris) Team" "Human Resource Information Management (Hris) Team"
* #TSCT "Technical Support Coordinating Team" "Technical Support Coordinating Team"
* #RAMST "Record And Archive Management Service Team" "Record And Archive Management Service Team"
* #CST "Cafeteria Service Team" "Cafeteria Service Team"
* #HMET "Health Monitoring And Evaluation Team" "Health Monitoring And Evaluation Team"
* #PPT "Policy Planning Team" "Policy Planning Team"
* #MCHT "Maternal And Child Health Team" "Maternal And Child Health Team"
* #EPBHST "Health Extension Program And Basic Health Service Team" "Health Extension Program And Basic Health Service Team"
* #HAIT "Health Advisory And Information Team" "Health Advisory And Information Team"
* #PCT "Prevention And Control Team" "Prevention And Control Team"
* #TMIPT "The Mental Illness Program Team" "The Mental Illness Program Team"
* #HSQIT "Health Service Quality Improvement Team" "Health Service Quality Improvement Team"
* #HSCT "Hospital System Consolidation Team" "Hospital System Consolidation Team"
* #SMSRT "Specialist Medical Services Reinforcement Team" "Specialist Medical Services Reinforcement Team"
* #HSRASMT "Health Site Reform Action Support And Monitoring Team" "Health Site Reform Action Support And Monitoring Team"
* #PIEMST "Pre-Health Institute Emergency Medical Services Team" "Pre-Health Institute Emergency Medical Services Team"
* #PTST "The Patient Therapy Service Team" "The Patient Therapy Service Team"
* #PEST "Patient Exchange Services Team" "Patient Exchange Services Team"
* #HSST "Health System Strengthening Team" "Health System Strengthening Team"
* #LHSST "Leader Of The Health System Strengthening Team" "Leader Of The Health System Strengthening Team"
* #PHST "Pharmacy Services Team" "Pharmacy Services Team"
* #MRMT "Medical Resource Management Team" "Medical Resource Management Team"
* #CTMT "Health Care Technology Management Team" "Health Care Technology Management Team"
* #HEHT "Hygiene And Environmental Health Team" "Hygiene And Environmental Health Team"
* #FWSHT "Food: Water Safety And Hydrogen Team" "Food: Water Safety And Hydrogen Team"
* #CCEST "Climate Change And Environment Suitability Team" "Climate Change And Environment Suitability Team"
* #HRIPT "Human Resources Information And Planning Team" "Human Resources Information And Planning Team"
* #PSCPT "Professional Standards And Curriculum Preparation Team" "Professional Standards And Curriculum Preparation Team"
* #OHTT "Occupational Health Training Team" "Occupational Health Training Team"
* #LPETHP "The Leader Of The Professional Ethics Team Of Health Professionals" "The Leader Of The Professional Ethics Team Of Health Professionals"
* #QART "Qualified Assessment Registry Team" "Qualified Assessment Registry Team"
* #ATPT "Competency Assessment Test Preparation Team" "Competency Assessment Test Preparation Team"
* #HPIRT "Health Professionals And Institutions Registration Team" "Health Professionals And Institutions Registration Team"
* #CATMT "Competency Assessment Test Management Team" "Competency Assessment Test Management Team"

ValueSet:         IhrisCaseTeamValueSet
Id:               ihris-caseteam-valueset
Title:            "iHRIS Case Team ValueSet"
* ^version = "0.2.0"
* codes from system IhrisCaseTeamCodeSystem

CodeSystem:      IhrisDirectorateCodeSystem
Id:              ihris-directorate-codesystem
Title:           "Directorate"
* ^version = "0.2.0"
* ^concept[0].designation[0].language = #urn:ietf:bcp:47#am
* ^concept[0].designation[0].value = "ዳይሬክተር ጄኔራል (የሚኒስተሩ ጽ/ቤት ኃላፊ )"
* ^concept[0].display = "Director General (Head of the Office of the Minister)"
* ^concept[0].code = #DGHOM
* ^concept[1].designation[0].language = #urn:ietf:bcp:47#am
* ^concept[1].designation[0].value = "ሜዲካል ሰርቪስ ዳይሬክተር ጄኔራል"
* ^concept[1].display = "Director General of Medical Services"
* ^concept[1].code = #DGMS
* ^concept[2].designation[0].language = #urn:ietf:bcp:47#am
* ^concept[2].designation[0].value = "ዳይሬክተር ጄኔራል (ኦፕሬሽን ዘርፍ )"
* ^concept[2].display = "Director General (Operations Sector)"
* ^concept[2].code = #DGOS
* ^concept[3].designation[0].language = #urn:ietf:bcp:47#am
* ^concept[3].designation[0].value = "የፖሊሲ፤ ዕቅድ፤ ክትትልና ግምገማ ዳይሬክቶሬት"
* ^concept[3].display = "Policy: Plan: Monitoring and Evaluation Directorate"
* ^concept[3].code = #PPMED
* ^concept[4].designation[0].language = #urn:ietf:bcp:47#am
* ^concept[4].designation[0].value = "የውስጥ ኦዲት ዳይሬክቶሬት"
* ^concept[4].display = "Internal Audit Directorate"
* ^concept[4].code = #IAD
* ^concept[5].designation[0].language = #urn:ietf:bcp:47#am
* ^concept[5].designation[0].value = "የሕዝብ ግንኙነትና ኮሙኒኬሽን ዳይሬክቶሬት"
* ^concept[5].display = "Directorate of Public Relations and Communication"
* ^concept[5].code = #DPRC
* ^concept[6].designation[0].language = #urn:ietf:bcp:47#am
* ^concept[6].designation[0].value = "ሚኒስትር ዴኤታ (ለውጥና አስተዳደር ዘርፍ) ተጠሪ"
* ^concept[6].display = "Minister of State (Change and Administration Sector)"
* ^concept[6].code = #MSCAS
* ^concept[7].designation[0].language = #urn:ietf:bcp:47#am
* ^concept[7].designation[0].value = "የጤና ኤክስቴሽንና መሠረታዊ ጤና አገልግሎት ዳይሬክቶሬት"
* ^concept[7].display = "Directorate of Health Extension and Basic Health Services"
* ^concept[7].code = #DHEBHS
* ^concept[8].designation[0].language = #urn:ietf:bcp:47#am
* ^concept[8].designation[0].value = "የጤና ሥርዓት ማጠናከር ልዩ ድጋፍ ዳይሬክቶሬት"
* ^concept[8].display = "Special Support Directorate of Health System Strengthening"
* ^concept[8].code = #SSDHSS
* ^concept[9].designation[0].language = #urn:ietf:bcp:47#am
* ^concept[9].designation[0].value = "የበሽታዎች መከላከልና መቆጣጠር ዳይሬክቶሬት"
* ^concept[9].display = "Directorate of Disease Prevention and Control"
* ^concept[9].code = #DDPC
* ^concept[10].designation[0].language = #urn:ietf:bcp:47#am
* ^concept[10].designation[0].value = "የእናቶችና ሕጻናት ጤና ዳይሬክቶሬት"
* ^concept[10].display = "Maternal and Child Health Directorate"
* ^concept[10].code = #MCHD
* ^concept[11].designation[0].language = #urn:ietf:bcp:47#am
* ^concept[11].designation[0].value = "የሐይጅንና አከባቢ ጤና አጠባበቅ ዳይሬክቶሬት"
* ^concept[11].display = "Department of Hygiene and Environmental Health"
* ^concept[11].code = #DHEH
* ^concept[12].designation[0].language = #urn:ietf:bcp:47#am
* ^concept[12].designation[0].value = "የሪፎርምና መልካም አስተዳደር ዳይሬክቶሬት"
* ^concept[12].display = "Reform and Good Governance Directorate"
* ^concept[12].code = #RGGD
* ^concept[13].designation[0].language = #urn:ietf:bcp:47#am
* ^concept[13].designation[0].value = "የንብረት አስተዳደርና ጠቅላላ አገልግሎት ዳይሬክቶሬት"
* ^concept[13].display = "Property Management and General Services Directorate"
* ^concept[13].code = #PMGSD
* ^concept[14].designation[0].language = #urn:ietf:bcp:47#am
* ^concept[14].designation[0].value = "የሰው ሀብት አስተዳደር ዳይሬክቶሬት"
* ^concept[14].display = "Human Resource Management Directorate"
* ^concept[14].code = #HRMD
* ^concept[15].designation[0].language = #urn:ietf:bcp:47#am
* ^concept[15].designation[0].value = "የጤናና ጤና ነክ ዳይሬክቶሬት"
* ^concept[15].display = "Directorate of Health and related services"
* ^concept[15].code = #DHRS
* ^concept[16].designation[0].language = #urn:ietf:bcp:47#am
* ^concept[16].designation[0].value = "የሥነ-ምግባርና ፀረ-ሙስና ዳይሬክቶሬት"
* ^concept[16].display = "Directorate of Ethics and Anti-Corruption"
* ^concept[16].code = #DEAC
* ^concept[17].designation[0].language = #urn:ietf:bcp:47#am
* ^concept[17].designation[0].value = "የሴቶችና ወጣቶች ዳይሬክቶሬት"
* ^concept[17].display = "Directorate for Women and Youth"
* ^concept[17].code = #DWY
* ^concept[18].designation[0].language = #urn:ietf:bcp:47#am
* ^concept[18].designation[0].value = "የሕግ ጉዳዮች ዳይሬክቶሬት"
* ^concept[18].display = "Directorate of Legal Affairs"
* ^concept[18].code = #DLA
* ^concept[19].designation[0].language = #urn:ietf:bcp:47#am
* ^concept[19].designation[0].value = "ድንገተኛና ጽኑ ሕክምና አገልግሎት ዳይሬክቶሬት"
* ^concept[19].display = "Emergency and Chronic Care Services Directorate"
* ^concept[19].code = #ECCSD
* ^concept[20].designation[0].language = #urn:ietf:bcp:47#am
* ^concept[20].designation[0].value = "የክሊካል አገልግሎት ዳይሬክቶሬት"
* ^concept[20].display = "Clinical Services Directorate"
* ^concept[20].code = #CSD
* ^concept[21].designation[0].language = #urn:ietf:bcp:47#am
* ^concept[21].designation[0].value = "የመድሃኒትና ሕክምና መሣሪያዎች አገልግሎት ዳይሬክቶሬት"
* ^concept[21].display = "Directorate of Pharmaceutical and Medical Equipment Services"
* ^concept[21].code = #DPMES
* ^concept[22].designation[0].language = #urn:ietf:bcp:47#am
* ^concept[22].designation[0].value = "የጤና ጥራት አገልግሎት ዳይሬክቶሬት"
* ^concept[22].display = "Health Quality Services Directorate"
* ^concept[22].code = #HQSD
* ^concept[23].designation[0].language = #urn:ietf:bcp:47#am
* ^concept[23].designation[0].value = "የሰው ሀብት ልማት ዳይሬክቶሬት"
* ^concept[23].display = "Human Resource Development Directorate"
* ^concept[23].code = #HRDD
* ^concept[24].designation[0].language = #urn:ietf:bcp:47#am
* ^concept[24].designation[0].value = "የጤና መሠረተ-ልማት ዳይሬክቶሬት"
* ^concept[24].display = "Health Infrastructure Directorate"
* ^concept[24].code = #HID
* ^concept[25].designation[0].language = #urn:ietf:bcp:47#am
* ^concept[25].designation[0].value = "የፋይናንስና ግዥ ዳይሬክቶሬት"
* ^concept[25].display = "Finance and Procurement Directorate"
* ^concept[25].code = #FPD
* ^concept[26].designation[0].language = #urn:ietf:bcp:47#am
* ^concept[26].designation[0].value = "የጤና ባለሙያዎች ብቃት ምዘናና ፈተና አገልግሎት ዳይሬክቶሬት"
* ^concept[26].display = "Health Professionals Assessment and Testing Service Directorate"
* ^concept[26].code = #HPATSD
* ^concept[27].designation[0].language = #urn:ietf:bcp:47#am
* ^concept[27].designation[0].value = "የኢንፎርሜሽን ቴክኖሎጂ ዳይሬክቶሬት"
* ^concept[27].display = "Health Information Technology"
* ^concept[27].code = #HIT
* ^concept[28].designation[0].language = #urn:ietf:bcp:47#am
* ^concept[28].designation[0].value = "የአጋርነትና ትብብር ዳይሬክቶሬት"
* ^concept[28].display = "Directorate of Partnership and Cooperation"
* ^concept[28].code = #DPC
* ^concept[29].designation[0].language = #urn:ietf:bcp:47#am
* ^concept[29].designation[0].value = "ኤችአይቪ መከለካያና መቆጣጠሪያ ጽ/ቤት"
* ^concept[29].display = "Office for HIV Prevention and Control"
* ^concept[29].code = #OHPC
* ^concept[30].designation[0].language = #urn:ietf:bcp:47#am
* ^concept[30].designation[0].value = "ብሔራዊ የደም ባንክ አገልግሎት"
* ^concept[30].display = "National Blood Bank Service"
* ^concept[30].code = #NBBS
* ^concept[31].designation[0].language = #urn:ietf:bcp:47#am
* ^concept[31].designation[0].value = "የምግብና መድሃኒት አስተዳደር ባለሥልጣን"
* ^concept[31].display = "Food and Drug Administration Authority"
* ^concept[31].code = #FDAA
* ^concept[32].designation[0].language = #urn:ietf:bcp:47#am
* ^concept[32].designation[0].value = "የኢትዮጵያ ጤና መድን ኤጄንሲ"
* ^concept[32].display = "Ethiopian Health Insurance Agency"
* ^concept[32].code = #EHIA
* ^concept[33].designation[0].language = #urn:ietf:bcp:47#am
* ^concept[33].designation[0].value = "የመደሃኒት አቅራቢ ኤጄንሲ"
* ^concept[33].display = "Ethiopian Pharmaceuticals Supply Agency"
* ^concept[33].code = #EPSA
* ^concept[34].designation[0].language = #urn:ietf:bcp:47#am
* ^concept[34].designation[0].value = "የኢትዮጵያ ኅብረተሰብ ጤና ኢንስቲትዩት"
* ^concept[34].display = "Ethiopian Institute of Public Health"
* ^concept[34].code = #EIPH
* ^concept[35].designation[0].language = #urn:ietf:bcp:47#am
* ^concept[35].designation[0].value = "የአማኑኤል የአእምሮ ስፔሻላይዝድ ሆስፒታል"
* ^concept[35].display = "Amanuel Mental Psychiatric Hospital"
* ^concept[35].code = #AMPH
* ^concept[36].designation[0].language = #urn:ietf:bcp:47#am
* ^concept[36].designation[0].value = "የቅደስ ጴጥሮስ ቲቢ ስፔሻላይዝድ ሆስፒታል"
* ^concept[36].display = "St. Peter's TB Specialized Hospital"
* ^concept[36].code = #SPTBSH
* ^concept[37].designation[0].language = #urn:ietf:bcp:47#am
* ^concept[37].designation[0].value = "የቅደስ ጳውሎስ ሆስፒታልና ሚሊኒየም ሜድካል ኮሌጅ"
* ^concept[37].display = "St. Paul Hospital and Millennium Medical College"
* ^concept[37].code = #SPHMMC
* ^concept[38].designation[0].language = #urn:ietf:bcp:47#am
* ^concept[38].designation[0].value = "የመላው አፍሪካ ስጋ ዳዌ መከላከያና ትምህርት መስጫ (የአለርት ሆስፒታል)"
* ^concept[38].display = "Alert Hospital"
* ^concept[38].code = #AH
* ^concept[40].designation[0].language = #urn:ietf:bcp:47#am
* ^concept[40].designation[0].value = "የአርማወር ሐንሰን የምርምር ኢንስቲትዩት"
* ^concept[40].display = "Armauer Hansen Research Institute"
* ^concept[40].code = #AHRI
* ^concept[41].designation[0].language = #urn:ietf:bcp:47#am
* ^concept[41].designation[0].value = "የገፈርሳ የአእምሮ ሕሙማን ማገገሚያ ማዕከል"
* ^concept[41].display = "Gefersa Mental Rehabilitation Center"
* ^concept[41].code = #GMRC

ValueSet:         IhrisDirectorateValueSet
Id:               ihris-directorate-valueset
Title:            "iHRIS Directorate ValueSet"
* ^version = "0.2.0"
* codes from system IhrisDirectorateCodeSystem

ValueSet:         IhrisJobEthiopiaValueset
Id:               ihris-job-ethiopia
Title:            "iHRIS Job Title Value Set"
Description:      "iHRIS ValueSet for: iHRISJobEthiopia"
* codes from system IhrisJobEthiopiaCodeSystem

CodeSystem:      IhrisJobEthiopiaCodeSystem
Id:              ihris-job-ethiopia
Title:           "Job Title"
* ^property[0].code = #cadre
* ^property[0].uri = "http://ihris.org/fhir/ValueSet/ihris-cadre"
* ^property[0].description = "Cadre"
* ^property[0].type = #Coding
* ^property[1].code = #classification
* ^property[1].uri = "http://ihris.org/fhir/ValueSet/ihris-classification"
* ^property[1].description = "Classification"
* ^property[1].type = #Coding
* ^property[2].code = #salary-grade
* ^property[2].description = "Salary Grade"
* ^property[2].uri = "http://ihris.org/fhir/ValueSet/ihris-salary-grade"
* ^property[2].type = #Coding
* ^concept[0].designation[0].language = #urn:ietf:bcp:47#am
* ^concept[0].designation[0].value = "ደረጃ 3 ፕሮስቴቲክ ኦርቶቲክ ቴክኒሻን I"
* ^concept[0].display = "Level 3: Prosthetic Orthotic Technique I"
* ^concept[0].code = #POTI3
* ^concept[1].designation[0].language = #urn:ietf:bcp:47#am
* ^concept[1].designation[0].value = "ደረጃ 3 ፕሮስቴቲክ ኦርቶቲክ ቴክኒሻን II"
* ^concept[1].display = "Level 3: Prosthetic Orthotic Technique II"
* ^concept[1].code = #POTII3
* ^concept[2].designation[0].language = #urn:ietf:bcp:47#am
* ^concept[2].designation[0].value = "ደረጃ 3 ፕሮስቴቲክ ኦርቶቲክ ቴክኒሻን III"
* ^concept[2].display = "Level 3: Prosthetic Orthotic Technique III"
* ^concept[2].code = #POTIII3
* ^concept[3].designation[0].language = #urn:ietf:bcp:47#am
* ^concept[3].designation[0].value = "ደረጃ 3 ፕሮስቴቲክ ኦርቶቲክ ቴክኒሻን IV"
* ^concept[3].display = "Level 3: Prosthetic Orthotic Technique IV"
* ^concept[3].code = #POTIV3
* ^concept[4].designation[0].language = #urn:ietf:bcp:47#am
* ^concept[4].designation[0].value = "ደረጃ 4ፕሮስቴቲክ ኦርቶቲክ ቴክኒሻን I"
* ^concept[4].display = "Level 4: Prosthetic Orthotic Technique I"
* ^concept[4].code = #POTI4
* ^concept[5].designation[0].language = #urn:ietf:bcp:47#am
* ^concept[5].designation[0].value = "ደረጃ 4ፕሮስቴቲክ ኦርቶቲክ ቴክኒሻን II"
* ^concept[5].display = "Level 4: Prosthetic Orthotic Technique II"
* ^concept[5].code = #POTII4
* ^concept[6].designation[0].language = #urn:ietf:bcp:47#am
* ^concept[6].designation[0].value = "ደረጃ 4ፕሮስቴቲክ ኦርቶቲክ ቴክኒሻን III"
* ^concept[6].display = "Level 4: Prosthetic Orthotic Technique III"
* ^concept[6].code = #POTIII4
* ^concept[7].designation[0].language = #urn:ietf:bcp:47#am
* ^concept[7].designation[0].value = "ደረጃ 4ፕሮስቴቲክ ኦርቶቲክ ቴክኒሻን IV"
* ^concept[7].display = "Level 4: Prosthetic Orthotic Technique IV"
* ^concept[7].code = #POTIV4
* ^concept[8].designation[0].language = #urn:ietf:bcp:47#am
* ^concept[8].designation[0].value = "ደረጃ 5 ፕሮስቴቲክ ኦርቶቲክ ቴክኒሻን I"
* ^concept[8].display = "Level 5: Prosthetic Orthotic Technique I"
* ^concept[8].code = #POTI5
* ^concept[9].designation[0].language = #urn:ietf:bcp:47#am
* ^concept[9].designation[0].value = "ደረጃ 5 ፕሮስቴቲክ ኦርቶቲክ ቴክኒሻን II"
* ^concept[9].display = "Level 5: Prosthetic Orthotic Technique II"
* ^concept[9].code = #POTII5
* ^concept[10].designation[0].language = #urn:ietf:bcp:47#am
* ^concept[10].designation[0].value = "ደረጃ 5 ፕሮስቴቲክ ኦርቶቲክ ቴክኒሻን III"
* ^concept[10].display = "Level 5: Prosthetic Orthotic Technique III"
* ^concept[10].code = #POTIII5
* ^concept[11].designation[0].language = #urn:ietf:bcp:47#am
* ^concept[11].designation[0].value = "ደረጃ 5 ፕሮስቴቲክ ኦርቶቲክ ቴክኒሻን IV"
* ^concept[11].display = "Level 5: Prosthetic Orthotic Technique IV"
* ^concept[11].code = #POTIV5
* ^concept[12].designation[0].language = #urn:ietf:bcp:47#am
* ^concept[12].designation[0].value = "ደረጃ 4 ሚድዋይፈሪ I"
* ^concept[12].display = "Level 4 Midwifery I"
* ^concept[12].code = #LMI
* ^concept[13].designation[0].language = #urn:ietf:bcp:47#am
* ^concept[13].designation[0].value = "ደረጃ 4 ሚድዋይፈሪ II"
* ^concept[13].display = "Level 4 Midwife II"
* ^concept[13].code = #LMII.
* ^concept[14].designation[0].language = #urn:ietf:bcp:47#am
* ^concept[14].designation[0].value = "ደረጃ 4 ሚድዋይፈሪ III"
* ^concept[14].display = "Level 4 Midwife III"
* ^concept[14].code = #LMIII
* ^concept[15].designation[0].language = #urn:ietf:bcp:47#am
* ^concept[15].designation[0].value = "ደረጃ 4 ሚድዋይፈሪ IV"
* ^concept[15].display = "Level 4 Midwife IV"
* ^concept[15].code = #LMIV
* ^concept[16].designation[0].language = #urn:ietf:bcp:47#am
* ^concept[16].designation[0].value = "ደረጃ 4 አካባቢ ጤና አጠባበቅ ቴክኒሽያን I"
* ^concept[16].display = "Level 4 Environmental Health Technician I"
* ^concept[16].code = #EHTI4
* ^concept[17].designation[0].language = #urn:ietf:bcp:47#am
* ^concept[17].designation[0].value = "ደረጃ 4 አካባቢ ጤና አጠባበቅ ቴክኒሽያን II"
* ^concept[17].display = "Level 4 Environmental Health Technician II"
* ^concept[17].code = #EHTII4
* ^concept[18].designation[0].language = #urn:ietf:bcp:47#am
* ^concept[18].designation[0].value = "ደረጃ 4 አካባቢ ጤና አጠባበቅ ቴክኒሽያን III"
* ^concept[18].display = "Level 4 Environmental Health Technician III"
* ^concept[18].code = #EHTIII4
* ^concept[19].designation[0].language = #urn:ietf:bcp:47#am
* ^concept[19].designation[0].value = "ደረጃ 4 አካባቢ ጤና አጠባበቅ ቴክኒሽያን IV"
* ^concept[19].display = "Level 4 Environmental Health Technician IV"
* ^concept[19].code = #EHTIV4
* ^concept[20].designation[0].language = #urn:ietf:bcp:47#am
* ^concept[20].designation[0].value = "ደረጃ 4 ጤና ኤክስቴንሽን I"
* ^concept[20].display = "Level 4 Health Extension I"
* ^concept[20].code = #LHEI4
* ^concept[21].designation[0].language = #urn:ietf:bcp:47#am
* ^concept[21].designation[0].value = "ደረጃ 4 ጤና ኤክስቴንሽን II"
* ^concept[21].display = "Level 4 Health Extension II"
* ^concept[21].code = #LHEII4
* ^concept[22].designation[0].language = #urn:ietf:bcp:47#am
* ^concept[22].designation[0].value = "ደረጃ 4 ጤና ኤክስቴንሽን III"
* ^concept[22].display = "Level 4 Health Extension III"
* ^concept[22].code = #LHEIII4
* ^concept[23].designation[0].language = #urn:ietf:bcp:47#am
* ^concept[23].designation[0].value = "ደረጃ 4 ጤና ኤክስቴንሽን IV"
* ^concept[23].display = "Level 4 Health Extension IV"
* ^concept[23].code = #LHEIV4
* ^concept[24].designation[0].language = #urn:ietf:bcp:47#am
* ^concept[24].designation[0].value = "ደረጃ 3 ጤና ኤክስቴሽን ሰራተኛ I"
* ^concept[24].display = "Level 3 Health Extension Worker I"
* ^concept[24].code = #LHEWI3
* ^concept[25].designation[0].language = #urn:ietf:bcp:47#am
* ^concept[25].designation[0].value = "ደረጃ 3 ጤና ኤክስቴሽን ሰራተኛII"
* ^concept[25].display = "Level 3 Health Extension Worker II"
* ^concept[25].code = #LHEWII3
* ^concept[26].designation[0].language = #urn:ietf:bcp:47#am
* ^concept[26].designation[0].value = "ደረጃ 3 ጤና ኤክስቴሽን ሰራተኛ III"
* ^concept[26].display = "Level 3 Health Extension Worker III"
* ^concept[26].code = #LHEWIII3
* ^concept[27].designation[0].language = #urn:ietf:bcp:47#am
* ^concept[27].designation[0].value = "ደረጃ 3 ጤና ኤክስቴሽን ሰራተኛ IV"
* ^concept[27].display = "Level 3 Health Extension Worker IV"
* ^concept[27].code = #LHEWIV3
* ^concept[28].designation[0].language = #urn:ietf:bcp:47#am
* ^concept[28].designation[0].value = "ህብረተሰብ ጤና አጠባበቅ (HO) I"
* ^concept[28].display = "Community Health Organization (HO) I"
* ^concept[28].code = #CHOI
* ^concept[29].designation[0].language = #urn:ietf:bcp:47#am
* ^concept[29].designation[0].value = "ህብረተሰብ ጤና አጠባበቅ (HO) II"
* ^concept[29].display = "Community Health Organization (HO) II"
* ^concept[29].code = #CHOII
* ^concept[30].designation[0].language = #urn:ietf:bcp:47#am
* ^concept[30].designation[0].value = "ህብረተሰብ ጤና አጠባበቅ (HO) III"
* ^concept[30].display = "Community Health Organization (HO) III"
* ^concept[30].code = #CHOIII
* ^concept[31].designation[0].language = #urn:ietf:bcp:47#am
* ^concept[31].designation[0].value = "ህብረተሰብ ጤና አጠባበቅ (HO) IV"
* ^concept[31].display = "Community Health Organization (HO) IV"
* ^concept[31].code = #CHOIV
* ^concept[32].designation[0].language = #urn:ietf:bcp:47#am
* ^concept[32].designation[0].value = "ፐብሊክ ሄልዝ ፕሮፌሽናል ስፔሻሊሰት I"
* ^concept[32].display = "Public Health Professional Specialist I"
* ^concept[32].code = #PHPSI.
* ^concept[33].designation[0].language = #urn:ietf:bcp:47#am
* ^concept[33].designation[0].value = "ፐብሊክ ሄልዝ ፕሮፌሽናል ስፔሻሊሰት II"
* ^concept[33].display = "Public Health Professional Specialist II"
* ^concept[33].code = #PHPSII
* ^concept[34].designation[0].language = #urn:ietf:bcp:47#am
* ^concept[34].designation[0].value = "ፐብሊክ ሄልዝ ፕሮፌሽናል ስፔሻሊሰት III"
* ^concept[34].display = "Public Health Professional Specialist III"
* ^concept[34].code = #PHPSIII
* ^concept[35].designation[0].language = #urn:ietf:bcp:47#am
* ^concept[35].designation[0].value = "ፐብሊክ ሄልዝ ፕሮፌሽናል ስፔሻሊሰት IV"
* ^concept[35].display = "Public Health Professional Specialist IV"
* ^concept[35].code = #PHPSIV

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
* extension[display].extension[filter][2].valueString = "Directorate|PractitionerRole.extension:directorate.value[x]:valueCoding|http://ihris.org/fhir/ValueSet/ihris-directorate-valueset"
* extension[display].extension[filter][3].valueString = "Case Team|PractitionerRole.extension:caseteam.value[x]:valueCoding|http://ihris.org/fhir/ValueSet/ihris-caseteam-valueset"
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

Instance:       IhrisPractitionerWorkflowEndRole
InstanceOf:      Questionnaire
Usage:          #definition
* title = "iHRIS End Role Workflow"
* description = "iHRIS workflow to end a current role/job"
* id = "ihris-endrole"
* url = "http://ihris.org/fhir/Questionnaire/ihris-endrole"
* name = "ihris-endrole"
* status = #active
* date = 2020-08-09
* purpose = "Workflow page for ending a role/job."

* item[0].linkId = "PractitionerRole"
* item[0].text = "Terminate Job Record"
* item[0].type = #group

* item[0].item[0].linkId = "period.end"
* item[0].item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-job-description#PractitionerRole.period.end"
* item[0].item[0].text = "End Date"
* item[0].item[0].type = #dateTime
* item[0].item[0].required = true
* item[0].item[0].repeats = false

* item[0].item[1].linkId = "PractitionerRole.extension[0]"
* item[0].item[1].definition = "http://ihris.org/fhir/StructureDefinition/ihris-job-description#PractitionerRole.extension:reasonForDepature.value[x]:valueCoding"
* item[0].item[1].text = "Reason For Depature"
* item[0].item[1].type = #choice
* item[0].item[1].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-reason-departure-valueset"
* item[0].item[1].required = true
* item[0].item[1].repeats = false