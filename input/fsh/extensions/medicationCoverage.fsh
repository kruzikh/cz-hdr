Extension: CZ_CoverageAfterDischarge
Id: cz-coverage-after-discharge
Title: "Period of medication coverage"
Description: "Extension defined by the CZ interoperability project to record number of days after hospital discharge for which the patient was given the mediction."
* ^context.type = #element
* ^context.expression = "MedicationStatement"
* url MS
* valueDuration only Duration
* valueDuration MS