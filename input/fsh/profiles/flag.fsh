//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Profile:  CZ_Flag
Parent:   Flag
Id:       cz-flag
Title:    "Flag (CZ)"
Description: "This profile constrains the Flag resource to represent alerts or warnings in FHIR for the purpose of the Czech interoperbility project."
//-------------------------------------------------------------------------------------------

* extension contains $flag-detail named flagDetailExt 0..*
* extension contains $flag-priority named flagPriorityExt 0..1  // ToDo check cardinality - tady to hází chybu
* extension[flagDetailExt]
* extension[flagPriorityExt]
* status MS
* code MS
* subject MS
* subject only Reference(CZ_Patient)
