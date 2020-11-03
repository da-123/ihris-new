Invariant:      ihris-age-18
Description:    "birthDate must be more than 18 years ago."
Expression:     "birthDate < today() - 18 years"
Severity:       #error

Profile:        IhrisPersonalInformation
Parent:         Practitioner
Id:             ihris-personal-information
Title:          "Health Worker Information"
Description:    "iHRIS profile of Practitioner."

* identifier MS
* identifier ^label = "Identifier"
* identifier.use 0..0
* identifier.system 0..0
* identifier.value MS
* identifier.value ^label = "Value"
* identifier.type MS
* identifier.type ^label = "Type"
* identifier.type.coding 1..1 MS
* identifier.type.coding ^label = "Type"
* identifier.type from IhrisEthiopiaIdentifierValueSet
* name 1..1 MS
* name ^label = "Name"
* name.use MS
* name.use ^label = "Use"
* name.family 0..0
/* name.family ^label = "Family"*/
* name.given 1..1 MS
* name.given ^label = "First Name"
* name.given ^constraint[0].key = "ihris-name-check"
* name.given ^constraint[0].severity = #error
* name.given ^constraint[0].expression = "matches('^[A-Za-z ]*$')"
* name.given ^constraint[0].human = "Given Name must be only text."
* name.prefix 0..0
* name.text 0..0
* name.extension contains IhrisPractitionerPrefix named ethiopiaPrefix 0..1 MS
* name.extension[ethiopiaPrefix].valueCoding MS
* name.extension[ethiopiaPrefix] ^label = "Prefix"
* name.extension contains IhrisPractitionerGivenAltLang named givenAlternativeLang 0..1 MS
* name.extension[givenAlternativeLang].valueString MS
* name.extension[givenAlternativeLang] ^label = "First Name Alternative Language"
* name.suffix 0..0
/* name.suffix ^label = "Suffix" */
* birthDate MS
* birthDate ^label = "Date of Birth"
* birthDate obeys ihris-age-18
* birthDate ^minValueQuantity.system = "http://unitsofmeasure.org/"
* birthDate ^minValueQuantity.code = #a
* birthDate ^minValueQuantity.value = 60
* birthDate ^maxValueQuantity.system = "http://unitsofmeasure.org/"
* birthDate ^maxValueQuantity.code = #a
* birthDate ^maxValueQuantity.value = -18
* gender 1..1 MS
* gender ^label = "Gender"
* gender from IhrisEthiopiaGenderValueSet (required)
* photo 0..1 MS
* photo ^label = "Photo"
* telecom MS
* telecom ^label = "Telecom"
* telecom.system MS
* telecom.system ^label = "Type"
* telecom.value MS
* telecom.value ^label = "Value"
* telecom.use MS
* telecom.use ^label = "Use"
* communication 0..* MS
* communication ^label = "Language"
* communication.coding 1..1 MS
* communication.coding ^label = "Language"
* communication from IhrisEthiopiaLanguageValueSet
* communication.extension contains
     IhrisPractitionerLanguageProficiency named proficiency 0..* MS
 * communication.extension[proficiency] MS
 * communication.extension[proficiency] ^label = "Language Proficiency"
 * communication.extension[proficiency].extension[level].valueCoding MS
 * communication.extension[proficiency].extension[type].valueCoding MS
* extension contains
    IhrisPractitionerMaritalStatus named maritalStatus 0..1 MS and
    IhrisPractitionerDependents named dependents 0..* MS and
    IhrisPractitionerSpecialTraining named specialTraining 0..* MS and
    IhrisPractitionerRemarkNote named remarkNote 0..* MS and
    IhrisPractitionerResidence named residence 0..1 MS and
    IhrisPractitionerNationality named nationality 0..1 MS and
    IhrisPractitionerCategory named category 0..1 MS and
    IhrisPractitionerEthnicity named ethnicity 0..1 MS and
    IhrisPractitionerFamilyNames named familyNames 0..1 MS and
    IhrisPractitionerDrivingLicense named drivingLicense 0..1 MS
* extension[familyNames] ^label = "Family Names"
* extension[familyNames].extension[fathers].valueString MS
* extension[familyNames].extension[mothers].valueString MS
* extension[familyNames].extension[mothersalternativelanguage].valueString MS
* extension[familyNames].extension[fathersalternativelanguage].valueString MS
* extension[familyNames].extension[grandfatherslastname].valueString MS
* extension[familyNames].extension[grandfathersalternativelanguage].valueString MS
* extension[residence].valueReference.reference MS
* extension[nationality].valueCoding MS
* extension[nationality] ^label = "Nationality"
* extension[dependents] ^label = "Dependents"
* extension[dependents].extension[name].valueString MS
* extension[dependents].extension[birthDate].valueDate MS
* extension[dependents].extension[relationship].valueCoding MS
* extension[dependents].extension[gender].valueCode MS
* extension[maritalStatus].valueCoding MS  
* extension[maritalStatus] ^label = "Marital Status"
* extension[specialTraining].valueString  MS
* extension[specialTraining] ^label = "Special Training"
* extension[category].valueCoding MS
* extension[category] ^label = "Category"
* extension[remarkNote].valueString MS
* extension[remarkNote] ^label = "Remark Note"
* extension[ethnicity].valueCoding MS
* extension[ethnicity] ^label = "Ethnicity"
* extension[drivingLicense] ^label = "Driving License"
* extension[drivingLicense].extension[license].valueString MS
* extension[drivingLicense].extension[license] ^label = "Driving Licence ID"
* extension[drivingLicense].extension[licenseType].valueCoding MS
* extension[drivingLicense].extension[licenseType] ^label = "Driving Licence Type"

Extension:      IhrisPractitionerLanguageProficiency
 Id:             ihris-practitioner-language-proficiency
 Title:          "iHRIS Practitioner Language Proficiency"
 Description:    "iHRIS extension for Practitioner Language Proficiency."
 * ^context.type = #element
 * ^context.expression = "Practitioner"
 * extension contains 
     level 0..1 MS and
     type 0..* MS
 * extension[level].value[x] only Coding
 * extension[level].valueCoding 0..1 MS
 * extension[level].valueCoding from http://terminology.hl7.org/ValueSet/v3-LanguageAbilityProficiency
 * extension[level].valueCoding ^label = "Proficiency Level"
 * extension[type] ^label = "Proficiency Type"
 * extension[type].value[x] only Coding
 * extension[type].valueCoding 0..1 MS
 * extension[type].valueCoding ^label = "Proficiency Type"
 * extension[type].valueCoding from http://terminology.hl7.org/ValueSet/v3-LanguageAbilityMode

Extension:      IhrisPractitionerFamilyNames
Id:             ihris-practitioner-familynames
Title:          "iHRIS FamilyNames"
Description:    "iHRIS Family Names extension for Ethiopia."
* ^context.type = #element
* ^context.expression = "Practitioner"
* extension contains
      fathers 0..1 MS and
      fathersalternativelanguage 0..1 MS and
      grandfatherslastname 0..1 MS and
      grandfathersalternativelanguage 0..1 MS and
      mothers 0..1 MS and
      mothersalternativelanguage 0..1 MS
* extension[fathers].value[x] only string
* extension[fathers].valueString 0..1 MS
* extension[fathers].valueString ^label = "Father's Name"
* extension[fathers] ^label = "Father's Name"
* extension[fathers] ^constraint[0].key = "ihris-name-check"
* extension[fathers] ^constraint[0].severity = #error
* extension[fathers] ^constraint[0].expression = "matches('^[A-Za-z ]*$')"
* extension[fathers] ^constraint[0].human = "Name must be only text."
* extension[fathersalternativelanguage].value[x] only string
* extension[fathersalternativelanguage].valueString 0..1 MS
* extension[fathersalternativelanguage].valueString ^label = "Father's Name Alternative Language"
* extension[fathersalternativelanguage] ^label = "Father's Name Alternative Language"
* extension[mothers].value[x] only string
* extension[mothers].valueString 0..1 MS
* extension[mothers].valueString ^label = "Mother's Full Name"
* extension[mothers] ^label = "Mother's Full Name"
* extension[mothers] ^constraint[0].key = "ihris-name-check"
* extension[mothers] ^constraint[0].severity = #error
* extension[mothers] ^constraint[0].expression = "matches('^[A-Za-z ]*$')"
* extension[mothers] ^constraint[0].human = "Name must be only text."
* extension[mothersalternativelanguage].value[x] only string
* extension[mothersalternativelanguage].valueString 0..1 MS
* extension[mothersalternativelanguage].valueString ^label = "Mother's Full Name Alternative Language"
* extension[mothersalternativelanguage] ^label = "Mother's Full Name Alternative Language"
* extension[grandfatherslastname].value[x] only string
* extension[grandfatherslastname].valueString 0..1 MS
* extension[grandfatherslastname].valueString ^label = "Grandfather's Lastname"
* extension[grandfatherslastname] ^label = "Grandfather's Lastname"
* extension[grandfatherslastname] ^constraint[0].key = "ihris-name-check"
* extension[grandfatherslastname] ^constraint[0].severity = #error
* extension[grandfatherslastname] ^constraint[0].expression = "matches('^[A-Za-z ]*$')"
* extension[grandfatherslastname] ^constraint[0].human = "Name must be only text."
* extension[grandfathersalternativelanguage].value[x] only string
* extension[grandfathersalternativelanguage].valueString 0..1 MS
* extension[grandfathersalternativelanguage].valueString ^label = "Grand Father's Name Alternative Language"
* extension[grandfathersalternativelanguage] ^label = "Grand Father's Name Alternative Language"

Extension:      IhrisPractitionerSpecialTraining
Id:             ihris-personal-information-special-training
Title:          "iHRIS Personal Information Special Training"
Description:    "iHRIS extension for Special Training."
* ^context.type = #element
* ^context.expression = "Practitioner"
* valueString ^label = "Special Training"
* value[x] only string
* valueString 1..1 MS

Extension:      IhrisPractitionerRemarkNote
Id:             ihris-personal-information-remark-note
Title:          "iHRIS Personal Information Remark Note"
Description:    "iHRIS extension for Remark Note."
* ^context.type = #element
* ^context.expression = "Practitioner"
* value[x] only string
* valueString ^label = "Remarks/Note"
* valueString 1..1 MS

Extension:      IhrisPractitionerResidence
Id:             ihris-practitioner-residence
Title:          "iHRIS Practitioner Residence "
Description:    "iHRIS extension for Practitioner Residence."
* ^context.type = #element
* ^context.expression = "Practitioner"
* value[x] only Reference
* valueReference 1..1 MS
* valueReference ^label = "Residence"
* valueReference only Reference(Location)
* valueReference.reference 1..1 MS
* valueReference.reference ^label = "Location"
* valueReference.type 0..0
* valueReference.identifier 0..0
* valueReference.display 0..0

CodeSystem:         IhrisEthiopiaLanguageCodeSystem
Id:               ihris-ethiopia-language
Title:            "Language"
* ^version = "0.2.0"
* #LAN013 "Alaba" "Alaba"
* #LAN014 "Amharic" "Amharic"
* #LAN015 "Anfilo" "Anfilo"
* #LAN016 "Anywa" "Anywa"
* #LAN017 "Argoba" "Argoba"
* #LAN018 "Arbore" "Arbore"
* #LAN019 "Arri" "Arri"
* #LAN020 "Awngi" "Awngi"
* #LAN021 "Basketo" "Basketo"
* #LAN022 "Bench" "Bench"
* #LAN023 "Berta" "Berta"
* #LAN024 "Bodi" "Bodi"
* #LAN025 "Burji" "Burji"
* #LAN026 "C'ara" "C'ara"
* #LAN027 "Dassenech" "Dassenech"
* #LAN028 "Dime" "Dime"
* #LAN029 "Dizi" "Dizi"
* #LAN030 "Dorzee" "Dorzee"
* #LAN031 "Fadashi" "Fadashi"
* #LAN032 "Gamili" "Gamili"
* #LAN033 "Gamo" "Gamo"
* #LAN034 "Ganjule" "Ganjule"
* #LAN035 "Gatsame" "Gatsame"
* #LAN036 "Gawada" "Gawada"
* #LAN037 "Gebata" "Gebata"
* #LAN038 "Gedeo" "Gedeo"
* #LAN039 "Gidole" "Gidole"
* #LAN040 "Gofa" "Gofa"
* #LAN041 "Gumuz" "Gumuz"
* #LAN042 "Gurage" "Gurage"
* #LAN043 "Haddiya" "Haddiya"
* #LAN044 "Hamar" "Hamar"
* #LAN045 "Harari" "Harari"
* #LAN046 "K'abena" "K'abena"
* #LAN047 "Kafa" "Kafa"
* #LAN048 "Kemant" "Kemant"
* #LAN049 "Komo" "Komo"
* #LAN050 "Konso" "Konso"
* #LAN051 "Konta" "Konta"
* #LAN052 "Koyra" "Koyra"
* #LAN053 "Kullo" "Kullo"
* #LAN054 "Kunama" "Kunama"
* #LAN055 "Kwama" "Kwama"
* #LAN056 "Kwegu" "Kwegu"
* #LAN057 "Maale" "Maale"
* #LAN058 "Malo" "Malo"
* #LAN059 "Mareko" "Mareko"
* #LAN060 "Meban" "Meban"
* #LAN061 "Meen" "Meen"
* #LAN062 "Mer" "Mer"
* #LAN063 "Mesengo" "Mesengo"
* #LAN064 "Mocha" "Mocha"
* #LAN065 "Mosiye" "Mosiye"
* #LAN066 "Mursi" "Mursi"
* #LAN067 "Nao" "Nao"
* #LAN068 "Nuer" "Nuer"
* #LAN069 "Nyangatom" "Nyangatom"
* #LAN070 "Oromo" "Oromo"
* #LAN071 "Oyda" "Oyda"
* #LAN072 "Saho" "Saho"
* #LAN073 "She" "She"
* #LAN074 "Sheko" "Sheko"
* #LAN075 "Shinasha" "Shinasha"
* #LAN076 "Shita" "Shita"
* #LAN077 "Sidama" "Sidama"
* #LAN078 "Somali" "Somali"
* #LAN079 "Suri" "Suri"
* #LAN080 "Timbaro" "Timbaro"
* #LAN081 "Tigrigna" "Tigrigna"
* #LAN082 "Tsamako" "Tsamako"
* #LAN083 "Welayitta" "Welayitta"
* #LAN084 "Xamir" "Xamir"
* #LAN085 "Yem" "Yem"
* #LAN086 "Zayse" "Zayse"
* #LAN087 "Zargulla" "Zargulla"
* #LAN1 "English" "English"
* #LAN3 "Hindi" "Hindi"
* #LAN88 "Afar" "Afar"
* #LAN89 "French" "French"
* #LAN91 "Kenbatigna" "Kenbatigna"
* #LAN92 "Arabic" "Arabic"
* #LAN93 "Siltigna" "Siltigna"
* #LAN94 "Kembata" "Kembata"
* #LAN95 "Adere" "Adere"

ValueSet:         IhrisEthiopiaLanguageValueSet
Id:               ihris-ethiopia-language-valueset
Title:            "iHRIS Ethiopia Language ValueSet"
* ^version = "0.2.0"
* codes from system IhrisEthiopiaLanguageCodeSystem


Extension:      IhrisPractitionerPrefix
Id:             ihris-practitioner-prefix
Title:          "iHRIS Personal Information Prefix"
Description:    "iHRIS extension for Personal Prefix."
* ^context.type = #element
* ^context.expression = "Practitioner"
* value[x] only Coding
* valueCoding 1..1 MS
* valueCoding ^label = "Prefix"
* valueCoding from IhrisEthiopiaPrefixValueSet (required)

Extension:      IhrisPractitionerGivenAltLang
Id:             ihris-practitioner-givenAltLang
Title:          "iHRIS Personal Information Given Name Alternative Language"
Description:    "iHRIS extension for Personal Given Name Alternative Language."
* ^context.type = #element
* ^context.expression = "Practitioner"
* value[x] only string
* valueString 1..1 MS
* valueString ^label = "First Name Alternative Language"

ValueSet:         IhrisEthiopiaPrefixValueSet
Id:               ihris-ethiopia-prefix-valueset
Title:            "iHRIS Ethiopia Prefix ValueSet"
* codes from system IhrisEthiopiaPrefixCodeSystem

CodeSystem:         IhrisEthiopiaPrefixCodeSystem
Id:               ihris-ethiopia-pefix-codesystem
Title:            "iHRIS Ethiopia Prefix Codesystem"
* #mr "Mr"
* #mrs "Mrs"
* #ms "Ms"
* #dr "Dr"
* #ato "Ato"
* #ss "Sister"
* #prof "Professor"
* #eng "Enginner"
* #ro "W/ro"
* #rt "W/rt"

ValueSet:         IhrisEthiopiaIdentifierValueSet
Id:               ihris-ethiopia-identifier-valueset
Title:            "iHRIS Ethiopia Identifier ValueSet"
* codes from system IhrisEthiopiaIdentifierCodeSystem

CodeSystem:         IhrisEthiopiaIdentifierCodeSystem
Id:               ihris-ethiopia-identifier
Title:            "Identifier Type"
* #employeeId "Employee Id"
* #pensionNumber "Pension Number"
* #tinNumber "Tin Number"
* #civilServiceId "Civil Service Id"
* #licenseId "License Id"
* #fileNo "File No"

Extension:      IhrisPractitionerNationality
Id:             ihris-practitioner-nationality
Title:          "iHRIS Practitioner Nationality"
Description:    "iHRIS extension for Practitioner nationality."
* ^context.type = #element
* ^context.expression = "Practitioner"
* valueCoding ^label = "Nationality"
* value[x] only Coding
* valueCoding 1..1 MS
* valueCoding from http://hl7.org/fhir/ValueSet/iso3166-1-2 (required)

CodeSystem:      IhrisEducationalMajorCodeSystem
Id:              ihris-educational-major-codesystem
Title:           "Educational Major"
* #emergencyMedicalTech "Emergency Medical Tech" "Emergency Medical Tech"
* #medicalSurgicalAssistant "Medical/Surgical Assistant" "Medical/Surgical Assistant"
* #medicalLabTech "Medical Lab/Tech" "Medical Lab/Tech"
* #medicine "Medicine" "Medicine"
* #nursing "Nursing" "Nursing"
* #pharmacy "Pharmacy" "Pharmacy"
* #otherHealthProfessions "Other Health Professions" "Other Health Professions"

ValueSet:         IhrisEducationalMajorValueSet
Id:               ihris-educational-major-valueset
Title:            "iHRIS Educational Major ValueSet"
* codes from system IhrisEducationalMajorCodeSystem

Extension:      IhrisPractitionerCategory
Id:             ihris-personal-Information-Category
Title:          "iHRIS Personal Information Category"
Description:    "iHRIS extension for Personal Information Category."
* ^context.type = #element
* ^context.expression = "Practitioner"
* value[x] only Coding
* valueCoding 1..1 MS
* valueCoding ^label = "Category"
* valueCoding from IhrisCategoryValueSet (required)

CodeSystem:      IhrisCategoryCodeSystem
Id:              ihris-category-codesystem
Title:           "Category"
* #professional "Health Professional" "Health Professional"
* #administrative "Administrative" "Non Health Related Background"
* #academic "Academic(Less than Grade 12 education Level)" "Less than Grade 12 education Level"

ValueSet:         IhrisCategoryValueSet
Id:               ihris-category-valueset
Title:            "iHRIS Category ValueSet"
* codes from system IhrisCategoryCodeSystem

Extension:      IhrisPractitionerMaritalStatus
Id:             ihris-practitioner-marital-status
Title:          "iHRIS Practitioner Marital Status"
Description:    "iHRIS extension for Practitioner marital status."
* ^context.type = #element
* ^context.expression = "Practitioner"
* value[x] only Coding
* valueCoding 1..1 MS
* valueCoding ^label = "Marital Status"
* valueCoding from IhrisEthiopiaMaritalStatusValueSet (required)

CodeSystem:      IhrisEthiopiaMaritalStatusCodeSystem
Id:              ihris-marital-status-codesystem
Title:           "Marital Status"
* #single "Single"
* #married "Married"
* #divorced "Divorced"
* #widowed "Widowed"
* #separated  "Separated"

ValueSet:         IhrisEthiopiaMaritalStatusValueSet
Id:               ihris-marital-status-valueset
Title:            "iHRIS Marital ValueSet"
* codes from system IhrisEthiopiaMaritalStatusCodeSystem

Extension:      IhrisPractitionerDependents
Id:             ihris-practitioner-dependents
Title:          "iHRIS Practitioner Dependents"
Description:    "iHRIS extension for Practitioner dependents."
* ^context.type = #element
* ^context.expression = "Practitioner"
* extension contains name 1..1 MS and
    birthDate 1..1 MS and
    relationship 1..1 MS and
    gender 1..1 MS
* extension[name].value[x] only string
* extension[name].valueString 1..1 MS
* extension[name].valueString ^label = "Dependent's Name"
* extension[name].valueString ^constraint[0].key = "ihris-name-check"
* extension[name].valueString ^constraint[0].severity = #error
* extension[name].valueString ^constraint[0].expression = "matches('^[A-Za-z ]*$')"
* extension[name].valueString ^constraint[0].human = "Name must be only text."
* extension[birthDate].value[x] only date
* extension[birthDate].valueDate 1..1 MS
* extension[birthDate].valueDate ^label = "Dependent's Date of Birth"
* extension[relationship].value[x] only Coding
* extension[relationship].valueCoding 1..1 MS
* extension[relationship].valueCoding ^label = "Relationship"
* extension[relationship].valueCoding from IhrisEthiopiaRelationValueSet (required)
* extension[gender].value[x] only code
* extension[gender].valueCode 1..1 MS
* extension[gender].valueCode from IhrisEthiopiaGenderValueSet (required)
* extension[gender].valueCode ^label = "Dependent's Gender"

CodeSystem:      IhrisEthiopiaRelationCodesystem
Id:              ihris-relation-codesystem
Title:           "Relationship"
* ^date = "2020-10-29T08:41:04.362Z"
* ^version = "0.2.0"
* #spouse "Spouse" "Spouse"
* #mother "Mother" "Mother"
* #father "Father" "Father"
* #adoptedchild "Adopted Child" "Adopted Child"
* #bilogicalChild "Biological Child" "Biological Child"
* #other "other" "other"

ValueSet:         IhrisEthiopiaRelationValueSet
Id:               ihris-relation-valueset
Title:            "iHRIS Relationship ValueSet"
* ^date = "2020-10-29T08:41:04.362Z"
* ^version = "0.2.0"
* codes from system IhrisEthiopiaRelationCodesystem

CodeSystem:      IhrisEthiopiaGenderCodesystem
Id:              ihris-gender-codesystem
Title:           "Gender"
* ^date = "2020-10-29T08:41:04.362Z"
* ^version = "0.2.0"
* #male "Male" "Male"
* #female "Female" "Female"

ValueSet:         IhrisEthiopiaGenderValueSet
Id:               ihris-gender-valueset
Title:            "iHRIS Gender ValueSet"
* ^date = "2020-10-29T08:41:04.362Z"
* ^version = "0.2.0"
* codes from system IhrisEthiopiaGenderCodesystem

Extension:      IhrisPractitionerEthnicity
Id:             ihris-practitioner-ethnicity
Title:          "iHRIS Personal Information Ethnicity"
Description:    "iHRIS extension for Personal Information Ethnicity."
* ^context.type = #element
* ^context.expression = "Practitioner"
* value[x] only Coding
* valueCoding 1..1 MS
* valueCoding ^label = "Ethnicity"
* valueCoding from IhrisEthnicityValueSet (required)

CodeSystem:      IhrisEthnicityCodeSystem
Id:              ihris-Ethnicity-codesystem
Title:           "Ethnicity"
* ^date = "2020-10-29T08:41:04.362Z"
* #bench "Bench" "Bench"
* #berta "Berta" "Berta"
* #betaIsrael "Beta Israel" "Beta Israel"
* #bodi "Bodi" "Bodi"
* #brayle "Brayle" "Brayle"
* #burji "Burji" "Burji"
* #chara "Chara" "Chara"
* #daasanach "Daasanach" "Daasanach"
* #dawro "Dawro" "Dawro"
* #debaseGawwada "Debase/Gawwada" "Debase/Gawwada"
* #dime "Dime" "Dime"
* #dirashe "Dirashe" "Dirashe"
* #dizi "Dizi" "Dizi"
* #donga "Donga" "Donga"
* #fedashe "Fedashe" "Fedashe"
* #gamo "Gamo" "Gamo"
* #gebato "Gebato" "Gebato"
* #gedeo "Gedeo" "Gedeo"
* #gedicho "Gedicho" "Gedicho"
* #gidole "Gidole" "Gidole"
* #goffa "Goffa" "Goffa"
* #gumuz "Gumuz" "Gumuz"
* #gurage "Gurage" "Gurage"
* #hadiya "Hadiya" "Hadiya"
* #hamar "Hamar" "Hamar"
* #harari "Harari" "Harari"
* #irob "Irob" "Irob"
* #kafficho "Kafficho" "Kafficho"
* #kambaata "Kambaata" "Kambaata"
* #karo "Karo" "Karo"
* #komo "Komo" "Komo"
* #konso "Konso" "Konso"
* #konta "Konta" "Konta"
* #kontoma "Kontoma" "Kontoma"
* #koore "Koore" "Koore"
* #kunama "Kunama" "Kunama"
* #kusumie "Kusumie" "Kusumie"
* #kwegu "Kwegu" "Kwegu"
* #majangir "Majangir" "Majangir"
* #male "Male" "Male"
* #mao "Mao" "Mao"
* #mareqo "Mareqo" "Mareqo"
* #mashola "Mashola" "Mashola"
* #meen "Me'en" "Me'en"
* #merePeople "Mere people" "Mere people"
* #messengo "Messengo" "Messengo"
* #mossiye "Mossiye" "Mossiye"
* #murle "Murle" "Murle"
* #mursi "Mursi" "Mursi"
* #nao "Nao" "Nao"
* #nuer "Nuer" "Nuer"
* #nyangatom "Nyangatom" "Nyangatom"
* #oromo "Oromo" "Oromo"
* #oyda "Oyda" "Oyda"
* #qebena "Qebena" "Qebena"
* #qechem "Qechem" "Qechem"
* #qewama "Qewama" "Qewama"
* #she "She" "She"
* #shekecho "Shekecho" "Shekecho"
* #sheko "Sheko" "Sheko"
* #shinasha "Shinasha" "Shinasha"
* #shitaUpo "Shita/Upo" "Shita/Upo"
* #sidama "Sidama" "Sidama"
* #silte "Silt'e" "Silt'e"
* #somali "Somali" "Somali"
* #surma "Surma" "Surma"
* #tembaro "Tembaro" "Tembaro"
* #tigrinya "Tigrinya" "Tigrinya"
* #tsamai "Tsamai" "Tsamai"
* #welayta "Welayta" "Welayta"
* #werji "Werji" "Werji"
* #yem "Yem" "Yem"
* #zelmam "Zelmam" "Zelmam"
* #zeyese "Zeyese" "Zeyese"
* #otherUnknown "Other/unknown" "Other/unknown"
* #somalian "Somalian" "Somalian"
* #sudanese "Sudanese" "Sudanese"
* #eritrean "Eritrean" "Eritrean"
* #kenyan "Kenyan" "Kenyan"
* #djiboutian "Djiboutian" "Djiboutian"
* #otherForeigners "Other foreigners" "Other foreigners"

ValueSet:         IhrisEthnicityValueSet
Id:               ihris-Ethnicity-valueset
Title:            "iHRIS Ethnicity ValueSet"
* ^date = "2020-10-29T08:41:04.362Z"
* codes from system IhrisEthnicityCodeSystem

CodeSystem:      IhrisTrainingTypeCodeSystem
Id:              ihris-training-type-codesystem
Title:           "Training Type"
* ^date = "2020-10-29T08:41:04.362Z"
* #inService "In-Service Training" "In-Service Training"
* #preService "Pre-Service Training" "Pre-Service Training"

ValueSet:         IhrisTrainingTypeValueSet
Id:               ihris-training-type-valueset
Title:            "iHRIS Training Type ValueSet"
* ^date = "2020-10-29T08:41:04.362Z"
* codes from system IhrisTrainingTypeCodeSystem

CodeSystem:      IhrisSkillCodeSystem
Id:              ihris-skill-codesystem
Title:           "Skill"
* ^date = "2020-10-29T08:41:04.362Z"
* #ActiveListening "Active Listening" "Active Listening"
* #Adaptability "Adaptability" "Adaptability"
* #Communication "Communication" "Communication"
* #Creativity "Creativity" "Creativity"
* #CriticalThinking "Critical Thinking" "Critical Thinking"
* #CustomerService "Customer Service" "Customer Service"
* #DecisionMaking "Decision Making" "Decision Making"
* #InterpersonalCommunication "Interpersonal Communication" "Interpersonal Communication"
* #Management "Management" "Management"
* #Leadership "Leadership" "Leadership"
* #Organization "Organization" "Organization"
* #PublicSpeaking "Public Speaking" "Public Speaking"
* #Problemsolving "Problem-solving" "Problem-solving"
* #Teamwork "Teamwork" "Teamwork"

ValueSet:         IhrisSkillValueSet
Id:               ihris-skill-valueset
Title:            "iHRIS Skill ValueSet"
* ^date = "2020-10-29T08:41:04.362Z"
* codes from system IhrisSkillCodeSystem

Extension:      IhrisPractitionerDrivingLicense
Id:             ihris-practitioner-driving-license
Title:          "iHRIS Practitioner Driving License"
Description:    "iHRIS extension for Practitioner Driving License."
* ^context.type = #element
* ^context.expression = "Practitioner"
* extension contains license 1..1 MS and
    licenseType 1..1 MS
* extension[license].value[x] only string
* extension[license].valueString 1..1 MS
* extension[license].valueString ^label = "Driving License ID"
* extension[licenseType].value[x] only Coding
* extension[licenseType].valueCoding 1..1 MS
* extension[licenseType].valueCoding ^label = "Driving License Type"
* extension[licenseType].valueCoding from IhrisEthiopiaDrivingLicenseTypeValueSet (required)

CodeSystem:      IhrisEthiopiaDrivingLicenseTypeCodesystem
Id:              ihris-driving-license-type-codesystem
Title:           "Relationship"
* ^date = "2020-10-29T08:41:04.362Z"
* ^version = "0.2.0"
* #automobile "Automobile" 
* #PI "Public I"
* #PII "Public II"
* #special "Special"
* #D1 "Dry 1"
* #D2 "Dry 2"

ValueSet:         IhrisEthiopiaDrivingLicenseTypeValueSet
Id:               ihris-driving-license-type-valueset
Title:            "iHRIS Driving License Type ValueSet"
* ^date = "2020-10-29T08:41:04.362Z"
* ^version = "0.2.0"
* codes from system IhrisEthiopiaDrivingLicenseTypeCodesystem

ValueSet:         IhrisJurisdiction
Id:               ihris-jurisdiction
Title:            "iHRIS Degree ValueSet"
* ^date = "2020-09-29T08:41:04.362Z"
* ^version = "0.2.0"
* codes from system IhrisDegree

CodeSystem:      IhrisJurisdiction
Id:              ihris-jurisdiction
Title:           "Jurisdiction(Country/Region/Zone/Woreda)"
* ^date = "2020-09-29T08:41:04.362Z"
* #country "Country" "Country"
* #region "Region" "Region"
* #zone "Zone" "Zone"
* #woreda "Woreda" "Woreda"

Instance:       IhrisPractitionerEthiopiaQuestionnaire
InstanceOf:     IhrisQuestionnaire
Usage:          #definition
* title = "iHRIS Practitioner Ethiopia Questionnaire"
* description = "iHRIS Practitioner Ethiopia initial data entry questionnaire."
* id = "ihris-personal-information"
* url = "http://ihris.org/fhir/Questionnaire/ihris-personal-information"
* name = "ihris-personal-information"
* status = #active
* date = 2020-06-29
* purpose = "Data entry page for practitioners."

* item[0].linkId = "Practitioner"
* item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-personal-information"
* item[0].text = "Basic Information|Basic health worker details"
* item[0].type = #group

* item[0].item[0].linkId = "Practitioner.name[0]"
* item[0].item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-personal-information#Practitioner.name"
* item[0].item[0].text = "Name"
* item[0].item[0].type = #group

* item[0].item[0].item[0].linkId = "Practitioner.name[0].extension[0]"
* item[0].item[0].item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-personal-information#Practitioner.name.extension:ethiopiaPrefix.value[x]:valueCoding"
* item[0].item[0].item[0].text = "Prefix"
* item[0].item[0].item[0].type = #choice
* item[0].item[0].item[0].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-ethiopia-prefix-valueset"
* item[0].item[0].item[0].required = false
* item[0].item[0].item[0].repeats = false

* item[0].item[0].item[1].linkId = "Practitioner.name[0].given[0]"
* item[0].item[0].item[1].definition = "http://ihris.org/fhir/StructureDefinition/ihris-personal-information#Practitioner.name.given"
* item[0].item[0].item[1].text = "First Name"
* item[0].item[0].item[1].type = #string
* item[0].item[0].item[1].required = true
* item[0].item[0].item[1].repeats = false
* item[0].item[0].item[1].extension[constraint].extension[key].valueId = "ihris-given-name-check"
* item[0].item[0].item[1].extension[constraint].extension[severity].valueCode = #error
* item[0].item[0].item[1].extension[constraint].extension[expression].valueString = "matches('^[A-Za-z ]*$')"
* item[0].item[0].item[1].extension[constraint].extension[human].valueString = "First Name must be only text."

* item[0].item[0].item[2].linkId = "Practitioner.name[0].use"
* item[0].item[0].item[2].definition = "http://ihris.org/fhir/StructureDefinition/ihris-personal-information#Practitioner.name.use"
* item[0].item[0].item[2].text = "Use"
* item[0].item[0].item[2].type = #choice
* item[0].item[0].item[2].required = true
* item[0].item[0].item[2].repeats = false
* item[0].item[0].item[2].readOnly = true
* item[0].item[0].item[2].answerOption.valueCoding = http://hl7.org/fhir/name-use#official
* item[0].item[0].item[2].answerOption.initialSelected = true

* item[0].item[0].item[3].linkId = "Practitioner.name[0].extension[1]"
* item[0].item[0].item[3].definition = "http://ihris.org/fhir/StructureDefinition/ihris-personal-information#Practitioner.name.extension:givenAlternativeLang.value[x]:valueString"
* item[0].item[0].item[3].text = "First Name Alternative Language"
* item[0].item[0].item[3].type = #string
* item[0].item[0].item[3].required = false
* item[0].item[0].item[3].repeats = false

* item[0].item[1].linkId = "Practitioner.extension[0].extension[0]"
* item[0].item[1].definition = "http://ihris.org/fhir/StructureDefinition/ihris-personal-information#Practitioner.extension:familyNames.extension:fathers.value[x]:valueString"
* item[0].item[1].text = "Father's Name"
* item[0].item[1].type = #string
* item[0].item[1].required = true
* item[0].item[1].repeats = false
* item[0].item[1].extension[constraint].extension[key].valueId = "ihris-fathers-name-check"
* item[0].item[1].extension[constraint].extension[severity].valueCode = #error
* item[0].item[1].extension[constraint].extension[expression].valueString = "matches('^[A-Za-z ]*$')"
* item[0].item[1].extension[constraint].extension[human].valueString = "Father's Name must be only text."

* item[0].item[2].linkId = "Practitioner.extension[0].extension[1]"
* item[0].item[2].definition = "http://ihris.org/fhir/StructureDefinition/ihris-personal-information#Practitioner.extension:familyNames.extension:fathersalternativelanguage.value[x]:valueString"
* item[0].item[2].text = "Father's Name Alternative Language"
* item[0].item[2].type = #string
* item[0].item[2].required = false
* item[0].item[2].repeats = false

* item[0].item[3].linkId = "Practitioner.extension[0].extension[2]"
* item[0].item[3].definition = "http://ihris.org/fhir/StructureDefinition/ihris-personal-information#Practitioner.extension:familyNames.extension:grandfatherslastname.value[x]:valueString"
* item[0].item[3].text = "Grandfather's Lastname"
* item[0].item[3].type = #string
* item[0].item[3].required = true
* item[0].item[3].repeats = false
* item[0].item[3].extension[constraint].extension[key].valueId = "ihris-grandfather-name-check"
* item[0].item[3].extension[constraint].extension[severity].valueCode = #error
* item[0].item[3].extension[constraint].extension[expression].valueString = "matches('^[A-Za-z ]*$')"
* item[0].item[3].extension[constraint].extension[human].valueString = "Grandfather's Name must be only text."

* item[0].item[4].linkId = "Practitioner.extension[0].extension[3]"
* item[0].item[4].definition = "http://ihris.org/fhir/StructureDefinition/ihris-personal-information#Practitioner.extension:familyNames.extension:grandfathersalternativelanguage.value[x]:valueString"
* item[0].item[4].text = "Grand Father's Name Alternative Language"
* item[0].item[4].type = #string
* item[0].item[4].required = false
* item[0].item[4].repeats = false

* item[0].item[5].linkId = "Practitioner.extension[0].extension[4]"
* item[0].item[5].definition = "http://ihris.org/fhir/StructureDefinition/ihris-personal-information#Practitioner.extension:familyNames.extension:mothers.value[x]:valueString"
* item[0].item[5].text = "Mother's Full Name"
* item[0].item[5].type = #string
* item[0].item[5].required = true
* item[0].item[5].repeats = false
* item[0].item[5].extension[constraint].extension[key].valueId = "ihris-mothers-name-check"
* item[0].item[5].extension[constraint].extension[severity].valueCode = #error
* item[0].item[5].extension[constraint].extension[expression].valueString = "matches('^[A-Za-z ]*$')"
* item[0].item[5].extension[constraint].extension[human].valueString = "Mother's Name must be only text."

* item[0].item[6].linkId = "Practitioner.extension[0].extension[5]"
* item[0].item[6].definition = "http://ihris.org/fhir/StructureDefinition/ihris-personal-information#Practitioner.extension:familyNames.extension:mothersalternativelanguage.value[x]:valueString"
* item[0].item[6].text = "Mother's Name Alternative Language"
* item[0].item[6].type = #string
* item[0].item[6].required = false
* item[0].item[6].repeats = false

* item[1].linkId = "Practitioner:demographic"
* item[1].definition = "http://ihris.org/fhir/StructureDefinition/ihris-personal-information"
* item[1].text = "Demographic Information"
* item[1].type = #group

* item[1].item[0].linkId = "Practitioner.birthDate"
* item[1].item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-personal-information#Practitioner.birthDate"
* item[1].item[0].text = "Date of Birth"
* item[1].item[0].type = #date
* item[1].item[0].required = true
* item[1].item[0].repeats = false
* item[1].item[0].extension[constraint].extension[key].valueId = "ihris-age-18-check"
* item[1].item[0].extension[constraint].extension[severity].valueCode = #error
* item[1].item[0].extension[constraint].extension[expression].valueString = "$this < today() - 18 years"
* item[1].item[0].extension[constraint].extension[human].valueString = "BirthDate must be more than 18 years ago."

* item[1].item[1].linkId = "Practitioner.gender"
* item[1].item[1].definition = "http://ihris.org/fhir/StructureDefinition/ihris-personal-information#Practitioner.gender"
* item[1].item[1].text = "Gender"
* item[1].item[1].type = #choice
* item[1].item[1].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-gender-valueset"
* item[1].item[1].required = true
* item[1].item[1].repeats = false

* item[1].item[2].linkId = "Practitioner.extension[3]"
* item[1].item[2].definition = "http://ihris.org/fhir/StructureDefinition/ihris-personal-information#Practitioner.extension:maritalStatus.value[x]:valueCoding"
* item[1].item[2].text = "Marital Status"
* item[1].item[2].type = #choice
* item[1].item[2].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-marital-status-valueset"
* item[1].item[2].required = false
* item[1].item[2].repeats = false

* item[1].item[3].linkId = "Practitioner.extension[1]"
* item[1].item[3].definition = "http://ihris.org/fhir/StructureDefinition/ihris-personal-information#Practitioner.extension:nationality.value[x]:valueCoding"
* item[1].item[3].text = "Nationality"
* item[1].item[3].type = #choice
* item[1].item[3].answerValueSet = "http://hl7.org/fhir/ValueSet/iso3166-1-2"
* item[1].item[3].required = false
* item[1].item[3].repeats = false

* item[1].item[4].linkId = "Practitioner.extension[8]"
* item[1].item[4].definition = "http://ihris.org/fhir/StructureDefinition/ihris-personal-information#Practitioner.extension:ethnicity.value[x]:valueCoding"
* item[1].item[4].text = "Ethnicity"
* item[1].item[4].type = #choice
* item[1].item[4].answerValueSet = "http://hl7.org/fhir/ValueSet/ihris-Ethnicity-valueset"
* item[1].item[4].required = false
* item[1].item[4].repeats = false

* item[2].linkId = "Practitioner:identifier"
* item[2].definition = "http://ihris.org/fhir/StructureDefinition/ihris-personal-information"
* item[2].text = "Identifiers|Personal Identifiers"
* item[2].type = #group

* item[2].item[0].linkId = "Practitioner.identifier[0]"
* item[2].item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-personal-information#Practitioner.identifier"
* item[2].item[0].text = "Employee Id"
* item[2].item[0].type = #group

* item[2].item[0].item[0].linkId = "Practitioner.identifier[0].type"
* item[2].item[0].item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-personal-information#Practitioner.identifier.type"
* item[2].item[0].item[0].text = "Type"
* item[2].item[0].item[0].type = #choice
* item[2].item[0].item[0].required = false
* item[2].item[0].item[0].repeats = false
* item[2].item[0].item[0].readOnly = true
* item[2].item[0].item[0].answerOption.valueCoding = http://ihris.org/fhir/CodeSystem/ihris-ethiopia-identifier#employeeId
* item[2].item[0].item[0].answerOption.initialSelected = true

* item[2].item[0].item[1].linkId = "Practitioner.identifier[0].value"
* item[2].item[0].item[1].definition = "http://ihris.org/fhir/StructureDefinition/ihris-personal-information#Practitioner.identifier.value"
* item[2].item[0].item[1].text = "Value"
* item[2].item[0].item[1].type = #string
* item[2].item[0].item[1].required = false
* item[2].item[0].item[1].repeats = false

* item[2].item[1].linkId = "Practitioner.identifier[1]"
* item[2].item[1].definition = "http://ihris.org/fhir/StructureDefinition/ihris-personal-information#Practitioner.identifier"
* item[2].item[1].text = "Pension Number"
* item[2].item[1].type = #group

* item[2].item[1].item[0].linkId = "Practitioner.identifier[1].type"
* item[2].item[1].item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-personal-information#Practitioner.identifier.type"
* item[2].item[1].item[0].text = "Type"
* item[2].item[1].item[0].type = #choice
* item[2].item[1].item[0].required = false
* item[2].item[1].item[0].repeats = false
* item[2].item[1].item[0].readOnly = true
* item[2].item[1].item[0].answerOption.valueCoding = http://ihris.org/fhir/CodeSystem/ihris-ethiopia-identifier#pensionNumber
* item[2].item[1].item[0].answerOption.initialSelected = true

* item[2].item[1].item[1].linkId = "Practitioner.identifier[1].value"
* item[2].item[1].item[1].definition = "http://ihris.org/fhir/StructureDefinition/ihris-personal-information#Practitioner.identifier.value"
* item[2].item[1].item[1].text = "Value"
* item[2].item[1].item[1].type = #string
* item[2].item[1].item[1].required = false
* item[2].item[1].item[1].repeats = false

* item[2].item[2].linkId = "Practitioner.identifier[2]"
* item[2].item[2].definition = "http://ihris.org/fhir/StructureDefinition/ihris-personal-information#Practitioner.identifier"
* item[2].item[2].text = "Tin Number"
* item[2].item[2].type = #group

* item[2].item[2].item[0].linkId = "Practitioner.identifier[2].type"
* item[2].item[2].item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-personal-information#Practitioner.identifier.type"
* item[2].item[2].item[0].text = "Type"
* item[2].item[2].item[0].type = #choice
* item[2].item[2].item[0].required = false
* item[2].item[2].item[0].repeats = false
* item[2].item[2].item[0].readOnly = true
* item[2].item[2].item[0].answerOption.valueCoding = http://ihris.org/fhir/CodeSystem/ihris-ethiopia-identifier#tinNumber
* item[2].item[2].item[0].answerOption.initialSelected = true

* item[2].item[2].item[1].linkId = "Practitioner.identifier[2].value"
* item[2].item[2].item[1].definition = "http://ihris.org/fhir/StructureDefinition/ihris-personal-information#Practitioner.identifier.value"
* item[2].item[2].item[1].text = "Value"
* item[2].item[2].item[1].type = #string
* item[2].item[2].item[1].required = false
* item[2].item[2].item[1].repeats = false

* item[2].item[3].linkId = "Practitioner.extension[9]"
* item[2].item[3].definition = "http://ihris.org/fhir/StructureDefinition/ihris-personal-information#Practitioner.identifier.extension:drivingLicense"
* item[2].item[3].text = "Driving License"
* item[2].item[3].type = #group

* item[2].item[3].item[0].linkId = "Practitioner.extension[9].extension[0]"
* item[2].item[3].item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-personal-information#Practitioner.extension:drivingLicense.extension:licenseType.value[x]:valueCoding"
* item[2].item[3].item[0].text = "Driving Licence Type"
* item[2].item[3].item[0].type = #choice
* item[2].item[3].item[0].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-driving-license-type-valueset"
* item[2].item[3].item[0].required = false
* item[2].item[3].item[0].repeats = false

* item[2].item[3].item[1].linkId = "Practitioner.extension[0].extension[1]"
* item[2].item[3].item[1].definition = "http://ihris.org/fhir/StructureDefinition/ihris-personal-information#Practitioner.extension:drivingLicense.extension:license.value[x]:valueString"
* item[2].item[3].item[1].text = "Driving Licence ID"
* item[2].item[3].item[1].type = #string
* item[2].item[3].item[1].required = false
* item[2].item[3].item[1].repeats = false

* item[2].item[4].linkId = "Practitioner.identifier[4]"
* item[2].item[4].definition = "http://ihris.org/fhir/StructureDefinition/ihris-personal-information#Practitioner.identifier"
* item[2].item[4].text = "Civil Service Id"
* item[2].item[4].type = #group

* item[2].item[4].item[0].linkId = "Practitioner.identifier[4].type"
* item[2].item[4].item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-personal-information#Practitioner.identifier.type"
* item[2].item[4].item[0].text = "Type"
* item[2].item[4].item[0].type = #choice
* item[2].item[4].item[0].required = false
* item[2].item[4].item[0].repeats = false
* item[2].item[4].item[0].readOnly = true
* item[2].item[4].item[0].answerOption.valueCoding = http://ihris.org/fhir/CodeSystem/ihris-ethiopia-identifier#civilServiceId
* item[2].item[4].item[0].answerOption.initialSelected = true

* item[2].item[4].item[1].linkId = "Practitioner.identifier[4].value"
* item[2].item[4].item[1].definition = "http://ihris.org/fhir/StructureDefinition/ihris-personal-information#Practitioner.identifier.value"
* item[2].item[4].item[1].text = "Value"
* item[2].item[4].item[1].type = #string
* item[2].item[4].item[1].required = false
* item[2].item[4].item[1].repeats = false

* item[2].item[5].linkId = "Practitioner.identifier[5]"
* item[2].item[5].definition = "http://ihris.org/fhir/StructureDefinition/ihris-personal-information#Practitioner.identifier"
* item[2].item[5].text = "License Id"
* item[2].item[5].type = #group

* item[2].item[5].item[0].linkId = "Practitioner.identifier[5].type"
* item[2].item[5].item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-personal-information#Practitioner.identifier.type"
* item[2].item[5].item[0].text = "Type"
* item[2].item[5].item[0].type = #choice
* item[2].item[5].item[0].required = false
* item[2].item[5].item[0].repeats = false
* item[2].item[5].item[0].readOnly = true
* item[2].item[5].item[0].answerOption.valueCoding = http://ihris.org/fhir/CodeSystem/ihris-ethiopia-identifier#licenseId
* item[2].item[5].item[0].answerOption.initialSelected = true

* item[2].item[5].item[1].linkId = "Practitioner.identifier[5].value"
* item[2].item[5].item[1].definition = "http://ihris.org/fhir/StructureDefinition/ihris-personal-information#Practitioner.identifier.value"
* item[2].item[5].item[1].text = "Value"
* item[2].item[5].item[1].type = #string
* item[2].item[5].item[1].required = false
* item[2].item[5].item[1].repeats = false

* item[2].item[6].linkId = "Practitioner.identifier[6]"
* item[2].item[6].definition = "http://ihris.org/fhir/StructureDefinition/ihris-personal-information#Practitioner.identifier"
* item[2].item[6].text = "File Number"
* item[2].item[6].type = #group

* item[2].item[6].item[0].linkId = "Practitioner.identifier[6].type"
* item[2].item[6].item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-personal-information#Practitioner.identifier.type"
* item[2].item[6].item[0].text = "Type"
* item[2].item[6].item[0].type = #choice
* item[2].item[6].item[0].required = false
* item[2].item[6].item[0].repeats = false
* item[2].item[6].item[0].readOnly = true
* item[2].item[6].item[0].answerOption.valueCoding = http://ihris.org/fhir/CodeSystem/ihris-ethiopia-identifier#fileNo
* item[2].item[6].item[0].answerOption.initialSelected = true

* item[2].item[6].item[1].linkId = "Practitioner.identifier[6].value"
* item[2].item[6].item[1].definition = "http://ihris.org/fhir/StructureDefinition/ihris-personal-information#Practitioner.identifier.value"
* item[2].item[6].item[1].text = "Value"
* item[2].item[6].item[1].type = #string
* item[2].item[6].item[1].required = false
* item[2].item[6].item[1].repeats = false

* item[3].linkId = "Practitioner:telecom"
* item[3].definition = "http://ihris.org/fhir/StructureDefinition/ihris-personal-information#Practitioner.telecom"
* item[3].text = "Contacts|Person's Contact Information"
* item[3].type = #group

* item[3].item[0].linkId = "Practitioner.telecom[0]"
* item[3].item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-personal-information#Practitioner.telecom"
* item[3].item[0].text = "Mobile Phone"
* item[3].item[0].type = #group

* item[3].item[0].item[0].linkId = "Practitioner.telecom[0].use"
* item[3].item[0].item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-personal-information#Practitioner.telecom.use"
* item[3].item[0].item[0].text = "Telecom Use"
* item[3].item[0].item[0].type = #choice
* item[3].item[0].item[0].required = true
* item[3].item[0].item[0].repeats = false
* item[3].item[0].item[0].readOnly = true
* item[3].item[0].item[0].answerOption.valueCoding = http://hl7.org/fhir/contact-point-use#mobile
* item[3].item[0].item[0].answerOption.initialSelected = true

* item[3].item[0].item[1].linkId = "Practitioner.telecom[0].system"
* item[3].item[0].item[1].definition = "http://ihris.org/fhir/StructureDefinition/ihris-personal-information#Practitioner.telecom.system"
* item[3].item[0].item[1].text = "Telecom System"
* item[3].item[0].item[1].type = #choice
* item[3].item[0].item[1].required = true
* item[3].item[0].item[1].repeats = false
* item[3].item[0].item[1].readOnly = true
* item[3].item[0].item[1].answerOption.valueCoding = http://hl7.org/fhir/contact-point-system#phone
* item[3].item[0].item[1].answerOption.initialSelected = true

* item[3].item[0].item[2].linkId = "Practitioner.telecom[0].value"
* item[3].item[0].item[2].definition = "http://ihris.org/fhir/StructureDefinition/ihris-personal-information#Practitioner.telecom.value"
* item[3].item[0].item[2].text = "Mobile Phone"
* item[3].item[0].item[2].type = #string
* item[3].item[0].item[2].required = true
* item[3].item[0].item[2].repeats = false
* item[3].item[0].item[2].extension[constraint].extension[key].valueId = "ihris-phone-check"
* item[3].item[0].item[2].extension[constraint].extension[severity].valueCode = #error
* item[3].item[0].item[2].extension[constraint].extension[expression].valueString = "matches('(\\+\\s*2\\s*5\\s*1\\s*9\\s*(([0-9]\\s*){8}\\s*))|(0\\s*9\\s*(([0-9]\\s*){8}))')"
* item[3].item[0].item[2].extension[constraint].extension[human].valueString = "Phone Number is not properly formatted."

* item[3].item[1].linkId = "Practitioner.telecom[1]"
* item[3].item[1].definition = "http://ihris.org/fhir/StructureDefinition/ihris-personal-information#Practitioner.telecom"
* item[3].item[1].text = "Work Email"
* item[3].item[1].type = #group

* item[3].item[1].item[0].linkId = "Practitioner.telecom[1].use"
* item[3].item[1].item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-personal-information#Practitioner.telecom.use"
* item[3].item[1].item[0].text = "Telecom Use"
* item[3].item[1].item[0].type = #choice
* item[3].item[1].item[0].required = true
* item[3].item[1].item[0].repeats = false
* item[3].item[1].item[0].readOnly = true
* item[3].item[1].item[0].answerOption.valueCoding = http://hl7.org/fhir/contact-point-use#work
* item[3].item[1].item[0].answerOption.initialSelected = true

* item[3].item[1].item[1].linkId = "Practitioner.telecom[1].system"
* item[3].item[1].item[1].definition = "http://ihris.org/fhir/StructureDefinition/ihris-personal-information#Practitioner.telecom.system"
* item[3].item[1].item[1].text = "Telecom System"
* item[3].item[1].item[1].type = #choice
* item[3].item[1].item[1].required = true
* item[3].item[1].item[1].repeats = false
* item[3].item[1].item[1].readOnly = true
* item[3].item[1].item[1].answerOption.valueCoding = http://hl7.org/fhir/contact-point-system#email
* item[3].item[1].item[1].answerOption.initialSelected = true

* item[3].item[1].item[2].linkId = "Practitioner.telecom[1].value"
* item[3].item[1].item[2].definition = "http://ihris.org/fhir/StructureDefinition/ihris-personal-information#Practitioner.telecom.value"
* item[3].item[1].item[2].text = "Work Email"
* item[3].item[1].item[2].type = #string
* item[3].item[1].item[2].required = true
* item[3].item[1].item[2].repeats = false
* item[3].item[1].item[2].extension[constraint].extension[key].valueId = "ihris-email-check"
* item[3].item[1].item[2].extension[constraint].extension[severity].valueCode = #error
* item[3].item[1].item[2].extension[constraint].extension[expression].valueString = "matches('^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$')"
* item[3].item[1].item[2].extension[constraint].extension[human].valueString = "Email Address is not properly formatted."

* item[3].item[2].linkId = "Practitioner.extension[2]"
* item[3].item[2].definition = "http://ihris.org/fhir/StructureDefinition/ihris-personal-information#Practitioner.extension:residence.value[x]:valueReference"
* item[3].item[2].text = "Residence"
* item[3].item[2].type = #reference
* item[3].item[2].required = false
* item[3].item[2].repeats = false

* item[4].linkId = "Practitioner:communication"
* item[4].definition = "http://ihris.org/fhir/StructureDefinition/ihris-personal-information#Practitioner.communication"
* item[4].text = "Language Details|Languages spoken"
* item[4].type = #group

* item[4].item[0].linkId = "Practitioner:communication[0]"
* item[4].item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-personal-information#Practitioner.communication"
* item[4].item[0].text = "Language"
* item[4].item[0].type = #group
* item[4].item[0].required = false
* item[4].item[0].repeats = true

* item[4].item[0].item[0].linkId = "Practitioner.communication[0]"
* item[4].item[0].item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-personal-information#Practitioner.communication"
* item[4].item[0].item[0].text = "Language"
* item[4].item[0].item[0].type = #choice
* item[4].item[0].item[0].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-ethiopia-language-valueset"
* item[4].item[0].item[0].required = false
* item[4].item[0].item[0].repeats = false

* item[4].item[0].item[0].item[0].linkId = "Practitioner.communication[0].extension[0]"
* item[4].item[0].item[0].item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-personal-information#Practitioner.communication.extension:proficiency"
* item[4].item[0].item[0].item[0].text = "Language Proficiency"
* item[4].item[0].item[0].item[0].type = #group
* item[4].item[0].item[0].item[0].required = false
* item[4].item[0].item[0].item[0].repeats = true

* item[4].item[0].item[0].item[0].item[0].linkId = "Practitioner.communication[0].extension[0].extension[0]"
* item[4].item[0].item[0].item[0].item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-personal-information#Practitioner.communication.extension:proficiency.extension:level"
* item[4].item[0].item[0].item[0].item[0].text = "Language Proficiency Level"
* item[4].item[0].item[0].item[0].item[0].type = #choice
* item[4].item[0].item[0].item[0].item[0].answerValueSet = "http://terminology.hl7.org/ValueSet/v3-LanguageAbilityProficiency"
* item[4].item[0].item[0].item[0].item[0].required = false
* item[4].item[0].item[0].item[0].item[0].repeats = false

* item[4].item[0].item[0].item[0].item[1].linkId = "Practitioner.communication[0].extension[0].extension[1]"
* item[4].item[0].item[0].item[0].item[1].definition = "http://ihris.org/fhir/StructureDefinition/ihris-personal-information#Practitioner.communication.extension:proficiency.extension:type"
* item[4].item[0].item[0].item[0].item[1].text = "Language Proficiency Type"
* item[4].item[0].item[0].item[0].item[1].type = #choice
* item[4].item[0].item[0].item[0].item[1].answerValueSet = "http://terminology.hl7.org/ValueSet/v3-LanguageAbilityMode"
* item[4].item[0].item[0].item[0].item[1].required = false
* item[4].item[0].item[0].item[0].item[1].repeats = true

* item[5].linkId = "__Practitioner:trainining"
* item[5].definition = "http://ihris.org/fhir/StructureDefinition/ihris-personal-information#Practitioner.extension:educationalMajor"
* item[5].text = "Training Details|Training information"
* item[5].type = #group

* item[5].item[0].linkId = "Practitioner:specialTraining"
* item[5].item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-personal-information#Practitioner.extension:specialTraining"
* item[5].item[0].text = "Training Details|Special training information"
* item[5].item[0].type = #group

* item[5].item[0].item[0].linkId = "Practitioner.extension[4]"
* item[5].item[0].item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-personal-information#Practitioner.extension:specialTraining.value[x]:valueString"
* item[5].item[0].item[0].text = "Special Training"
* item[5].item[0].item[0].type = #string
* item[5].item[0].item[0].required = false
* item[5].item[0].item[0].repeats = true

* item[5].item[1].linkId = "Practitioner:category"
* item[5].item[1].definition = "http://ihris.org/fhir/StructureDefinition/ihris-personal-information#Practitioner.extension:category"
* item[5].item[1].text = "Category Details|Category information"
* item[5].item[1].type = #group

* item[5].item[1].item[0].linkId = "Practitioner.extension[5]"
* item[5].item[1].item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-personal-information#Practitioner.extension:category.value[x]:valueCoding"
* item[5].item[1].item[0].text = "Category"
* item[5].item[1].item[0].type = #choice
* item[5].item[1].item[0].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-category-valueset"
* item[5].item[1].item[0].required = false
* item[5].item[1].item[0].repeats = false

* item[6].linkId = "__Practitioner:remarkNote"
* item[6].definition = "http://ihris.org/fhir/StructureDefinition/ihris-personal-information#Practitioner.extension:remarkNote"
* item[6].text = "Remarks|Remarks or notes"
* item[6].type = #group

* item[6].item[0].linkId = "Practitioner.extension[6]"
* item[6].item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-personal-information#Practitioner.extension:remarkNote.value[x]:valueString"
* item[6].item[0].text = "Remark Note"
* item[6].item[0].type = #text
* item[6].item[0].required = false
* item[6].item[0].repeats = true

* item[7].linkId = "__Practitioner:photo"
* item[7].definition = "http://ihris.org/fhir/StructureDefinition/ihris-personal-information#Practitioner.photo"
* item[7].text = "Photo|Person's Passport Photo"
* item[7].type = #group

* item[7].item[0].linkId = "Practitioner.extension[7]"
* item[7].item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-personal-information#Practitioner.photo"
* item[7].item[0].text = "Photo"
* item[7].item[0].type = #attachment
* item[7].item[0].required = false
* item[7].item[0].repeats = false

* item[8].linkId = "PractitionerRole"
* item[8].definition = "http://ihris.org/fhir/StructureDefinition/ihris-job-description"
* item[8].text = "Position Informatiom|Health worker position informatiom"
* item[8].type = #group
* item[8].extension[constraint][0].extension[key].valueId = "ihris-start-end-date"
* item[8].extension[constraint][0].extension[severity].valueCode = #error
* item[8].extension[constraint][0].extension[expression].valueString = "where(linkId='PractitionerRole.period.end').answer.first().valueDateTime.empty() or where(linkId='PractitionerRole.period.end').answer.first().valueDateTime >= where(linkId='PractitionerRole.period.start').answer.first().valueDateTime"
* item[8].extension[constraint][0].extension[human].valueString = "The end date must be after the start date."
* item[8].extension[constraint][1].extension[key].valueId = "ihris-first-emp-date"
* item[8].extension[constraint][1].extension[severity].valueCode = #error
* item[8].extension[constraint][1].extension[expression].valueString = "where(linkId='PractitionerRole.extension[3]').answer.first().valueDate.empty() <= where(linkId='PractitionerRole.period.start').answer.first().valueDateTime"
* item[8].extension[constraint][1].extension[human].valueString = "The end date must be after the start date."


* item[8].item[0].linkId = "PractitionerRole.code"
* item[8].item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-job-description#PractitionerRole.code"
* item[8].item[0].text = "Job Title"
* item[8].item[0].type = #choice
* item[8].item[0].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-job-ethiopia"
* item[8].item[0].required = true
* item[8].item[0].repeats = false

* item[8].item[1].linkId = "PractitionerRole.location"
* item[8].item[1].definition = "http://ihris.org/fhir/StructureDefinition/ihris-job-description#PractitionerRole.location"
* item[8].item[1].text = "Duty Post"
* item[8].item[1].type = #reference
* item[8].item[1].required = false
* item[8].item[1].repeats = false

* item[8].item[2].linkId = "PractitionerRole.extension[0]"
* item[8].item[2].definition = "http://ihris.org/fhir/StructureDefinition/ihris-job-description#PractitionerRole.extension:shift.value[x]:valueCoding"
* item[8].item[2].text = "Shift"
* item[8].item[2].type = #choice
* item[8].item[2].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-shift-valueset"
* item[8].item[2].required = true
* item[8].item[2].repeats = false

* item[8].item[3].linkId = "PractitionerRole.extension[1]"
* item[8].item[3].definition = "http://ihris.org/fhir/StructureDefinition/ihris-job-description#PractitionerRole.extension:employmentStatus.value[x]:valueCoding"
* item[8].item[3].text = "Employment Status"
* item[8].item[3].type = #choice
* item[8].item[3].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-employment-status-valueset"
* item[8].item[3].required = true
* item[8].item[3].repeats = false

* item[8].item[4].linkId = "PractitionerRole.extension[2]"
* item[8].item[4].definition = "http://ihris.org/fhir/StructureDefinition/ihris-job-description#PractitionerRole.extension:jobType.value[x]:valueCoding"
* item[8].item[4].text = "Job Type"
* item[8].item[4].type = #choice
* item[8].item[4].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-job-type-valueset"
* item[8].item[4].required = true
* item[8].item[4].repeats = false

* item[8].item[5].linkId = "PractitionerRole.extension[3]"
* item[8].item[5].definition = "http://ihris.org/fhir/StructureDefinition/ihris-job-description#PractitionerRole.extension:firstEmploymentDate.value[x]:valueDate"
* item[8].item[5].text = "First Employment Date"
* item[8].item[5].type = #date
* item[8].item[5].required = true
* item[8].item[5].repeats = false

* item[8].item[6].linkId = "PractitionerRole.period.start"
* item[8].item[6].definition = "http://ihris.org/fhir/StructureDefinition/ihris-job-description#PractitionerRole.period.start"
* item[8].item[6].text = "Hire Date"
* item[8].item[6].type = #dateTime
* item[8].item[6].required = true
* item[8].item[6].repeats = false

* item[8].item[7].linkId = "PractitionerRole.period.end"
* item[8].item[7].definition = "http://ihris.org/fhir/StructureDefinition/ihris-job-description#PractitionerRole.period.end"
* item[8].item[7].text = "End Date"
* item[8].item[7].type = #dateTime
* item[8].item[7].required = false
* item[8].item[7].repeats = false

* item[8].item[8].linkId = "PractitionerRole.extension[4]"
* item[8].item[8].definition = "http://ihris.org/fhir/StructureDefinition/ihris-job-description#PractitionerRole.extension:jobInformationRemark.value[x]:valueString"
* item[8].item[8].text = "Remark"
* item[8].item[8].type = #text
* item[8].item[8].required = false
* item[8].item[8].repeats = false

* item[8].item[9].linkId = "PractitionerRole.practitioner"
* item[8].item[9].definition = "http://ihris.org/fhir/StructureDefinition/ihris-job-description#PractitionerRole.practitioner"
* item[8].item[9].text = "Practitioner"
* item[8].item[9].type = #string
* item[8].item[9].required = true
* item[8].item[9].repeats = false
* item[8].item[9].readOnly = true
* item[8].item[9].answerOption.valueString = "__REPLACE__Practitioner"
* item[8].item[9].answerOption.initialSelected = true

Instance:       IhrisPractitionerWorkflowPromotionEthiopia
InstanceOf:      Questionnaire
Usage:          #definition
* title = "iHRIS Change Position Workflow"
* description = "iHRIS workflow to record a Change Position"
* id = "ihris-promotion-ethiopia"
* url = "http://ihris.org/fhir/Questionnaire/ihris-promotion-ethiopia"
* name = "ihris-promotion-ethiopia"
* status = #active
* date = 2020-08-09
* purpose = "Workflow page for recording a promotion."

* item[0].linkId = "PractitionerRole"
* item[0].text = "Change Position Information"
* item[0].type = #group

* item[0].item[0].linkId = "OldPractitionerRole"
* item[0].item[0].text = "Old Position Details"
* item[0].item[0].type = #group

* item[0].item[0].item[0].linkId = "period.end"
* item[0].item[0].item[0].text = "Position Change Date"
* item[0].item[0].item[0].type = #dateTime
* item[0].item[0].item[0].required = true
* item[0].item[0].item[0].repeats = false

* item[0].item[0].item[1].linkId = "PractitionerRole.extension[0]"
* item[0].item[0].item[1].definition = "http://ihris.org/fhir/StructureDefinition/ihris-job-description#PractitionerRole.extension:reasonForDepature.value[x]:valueCoding"
* item[0].item[0].item[1].text = "Reason For Change"
* item[0].item[0].item[1].type = #choice
* item[0].item[0].item[1].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-reason-departure-valueset"
* item[0].item[0].item[1].required = true
* item[0].item[0].item[1].repeats = false

* item[0].item[1].linkId = "NewPractitionerRole"
* item[0].item[1].text = "New Position Details"
* item[0].item[1].type = #group

* item[0].item[1].item[0].linkId = "code"
* item[0].item[1].item[0].text = "New Job Title"
* item[0].item[1].item[0].type = #choice
* item[0].item[1].item[0].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-job-ethiopia"
* item[0].item[1].item[0].required = true
* item[0].item[1].item[0].repeats = false

* item[0].item[1].item[1].linkId = "PractitionerRole.extension[5]"
* item[0].item[1].item[1].text = "New Salary Scale"
* item[0].item[1].item[1].type = #choice
* item[0].item[1].item[1].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-salary-scale-valueset"
* item[0].item[1].item[1].required = true
* item[0].item[1].item[1].repeats = false

* item[0].item[1].item[2].linkId = "PractitionerRole.extension[4]"
* item[0].item[1].item[2].text = "New Salary"
* item[0].item[1].item[2].type = #string
* item[0].item[1].item[2].required = true
* item[0].item[1].item[2].repeats = false

* item[0].item[1].item[3].linkId = "PractitionerRole.location"
* item[0].item[1].item[3].definition = "http://ihris.org/fhir/StructureDefinition/ihris-job-description#PractitionerRole.location"
* item[0].item[1].item[3].text = "Duty Post/Location"
* item[0].item[1].item[3].type = #reference
* item[0].item[1].item[3].required = true
* item[0].item[1].item[3].repeats = false

* item[0].item[1].item[4].linkId = "PractitionerRole.extension[1]"
* item[0].item[1].item[4].definition = "http://ihris.org/fhir/StructureDefinition/ihris-job-description#PractitionerRole.extension:shift.value[x]:valueCoding"
* item[0].item[1].item[4].text = "Shift"
* item[0].item[1].item[4].type = #choice
* item[0].item[1].item[4].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-shift-valueset"
* item[0].item[1].item[4].required = true
* item[0].item[1].item[4].repeats = false

* item[0].item[1].item[5].linkId = "PractitionerRole.extension[2]"
* item[0].item[1].item[5].definition = "http://ihris.org/fhir/StructureDefinition/ihris-job-description#PractitionerRole.extension:employmentStatus.value[x]:valueCoding"
* item[0].item[1].item[5].text = "Employment Status"
* item[0].item[1].item[5].type = #choice
* item[0].item[1].item[5].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-employment-status-valueset"
* item[0].item[1].item[5].required = true
* item[0].item[1].item[5].repeats = false

* item[0].item[1].item[6].linkId = "PractitionerRole.extension[3]"
* item[0].item[1].item[6].definition = "http://ihris.org/fhir/StructureDefinition/ihris-job-description#PractitionerRole.extension:jobType.value[x]:valueCoding"
* item[0].item[1].item[6].text = "Job Type"
* item[0].item[1].item[6].type = #choice
* item[0].item[1].item[6].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-job-type-valueset"
* item[0].item[1].item[6].required = true
* item[0].item[1].item[6].repeats = false

* item[0].item[1].item[7].linkId = "PractitionerRole.extension[6]"
* item[0].item[1].item[7].definition = "http://ihris.org/fhir/StructureDefinition/ihris-job-description#PractitionerRole.extension:directorate.value[x]:valueCoding"
* item[0].item[1].item[7].text = "Directorate"
* item[0].item[1].item[7].type = #choice
* item[0].item[1].item[7].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-directorate-valueset"
* item[0].item[1].item[7].required = true
* item[0].item[1].item[7].repeats = false

* item[0].item[1].item[8].linkId = "PractitionerRole.extension[7]"
* item[0].item[1].item[8].definition = "http://ihris.org/fhir/StructureDefinition/ihris-job-description#PractitionerRole.extension:caseteam.value[x]:valueCoding"
* item[0].item[1].item[8].text = "Case Team"
* item[0].item[1].item[8].type = #choice
* item[0].item[1].item[8].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-caseteam-valueset"
* item[0].item[1].item[8].required = true
* item[0].item[1].item[8].repeats = false
