Profile: CZ_MedicationStatementHDR
Parent: CZ_MedicationStatement
Id: cz-medication-statement-hdr
Title: "Medication Statement HDR (CZ)"
Description: "This profile represents the constraints applied to the MedicationStatement resource by the Czech national interoperability project for Hospital Discharge Report (HDR). "
* ^status = #active
* ^publisher = "Národní centrum elektronického zdravotnictví"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://ncez.mzcr.cz"
* ^purpose = "This profile constrains the representation of a medication statement related to the patient, in the context of the Czech hospital discharge record as specified by the national interoperability project."
* status ^comment = "In the scope of the HDR the entered-in-error concept is not allowed."
* extension contains cz-coverage-after-discharge named valueCoverageAfterDischarge 0..1
* extension[valueCoverageAfterDischarge] ^short = "Number of days of medication given to patient at discharge / Počet dní vybavení pacienta léčivem."
* extension[valueCoverageAfterDischarge] ^definition = "Number of days after hospital discharge for which the patient was given the mediction. / Počet dní vybavení pacienta léčivem při propuštění z hospitalizační péče."
