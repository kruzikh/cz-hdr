ValueSet: CZ_MedicationDlpCodesAbsentUnknownVS
Id: cz-medication-dlp-absent-unknown-vs
Title: "Medications - DLP codes + Absent/Unknown (IPS)"
Description: "This value set includes the codes from DLP (Databáze léčivých přípravků), plus IPS codes for absent/unknown medications."
* ^status = #active
* ^experimental = false
* ^publisher = "NCEZ"
* ^contact.name = "Národní centrum elektronického zdravotnictví"
* ^contact.telecom[0].system = #phone
* ^contact.telecom[=].value = "+420"
* ^contact.telecom[+].system = #email
* ^contact.telecom[=].value = "ncez@mzcr.cz"
* ^immutable = false

* include codes from valueset CZ_MedicineDlpVS
* include codes from valueset CZ_AbsentOrUnknownMedicationVS