Profile: CZ_MedicationRequest
Parent: MedicationRequest
Id: cz-medication-request
Title: "Medication Request (CZ)"
Description: "This profile represents the constraints applied to the MedicationRequest resource by the Czech national interoperbility project FHIR Implementation Guide."
* ^version = "1.0.0"
* ^status = #active
* ^publisher = "NCEZ"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://ncez.mzcr.cz"
* ^jurisdiction = $m49.htm#CZ
* ^purpose = "This profile constrains the representation of a medication request related to the patient as specified by the Czech national interoperability project."
//* status ^comment = "In the scope of the Hospital discharge report the entered-in-error concept is not allowed."
* medication[x] only CodeableConcept or Reference(CZ_Medication)
* medication[x] MS
* medication[x] from CZ_MedicationDlpCodesAbsentUnknownVS (preferred)
* medication[x] ^definition = "Identifies the medication being administered. This is either a link to a resource representing the details of the medication or a simple attribute carrying a code. To improve global interoperability is strongly encouraged that the reference to a medication resource is used, limiting the usage of the medicationCodeableConcept only to the cases in which no other information than a simple code is available."
* medication[x] ^binding.description = "Dlp code from national registry of medicinal products or a code for absent/unknown medication"
* subject only Reference(CZ_Patient)
* subject MS
* subject.reference 1.. MS
* dosageInstruction MS
* dosageInstruction only CZ_Dosage
/*
* dosageInstruction.text MS
* dosageInstruction.timing MS
//* dosageInstruction.route only CodeableConceptIPS
* dosageInstruction.route from CZ_RouteOfAdministrationVS (preferred)
* dosageInstruction.route ^binding.description = "EDQM Standards Terms"
* dosageInstruction.route ^binding.extension[0].extension[0].url = "purpose"
* dosageInstruction.route ^binding.extension[=].extension[=].valueCode = #candidate
* dosageInstruction.route ^binding.extension[=].extension[+].url = "valueSet"
* dosageInstruction.route ^binding.extension[=].extension[=].valueCanonical = "https://ncez.mzcr.cz/standards/fhir/ig/hdr/ValueSet/cz-cesta-podani-vs"
* dosageInstruction.route ^binding.extension[=].extension[+].url = "documentation"
* dosageInstruction.route ^binding.extension[=].extension[=].valueMarkdown = "Cesta podání léčiva dle kódového systému SUKL/DLP-cesty."
* dosageInstruction.route ^binding.extension[=].url = "http://hl7.org/fhir/tools/StructureDefinition/additional-binding"
*/

* dispenseRequest.validityPeriod.extension contains $data-absent-reason named data-absent-reason 0..1
* dispenseRequest.validityPeriod.extension[data-absent-reason] ^short = "validityPeriod absence reason"
* dispenseRequest.validityPeriod.extension[data-absent-reason] ^definition = "Provides a reason why the validityPeriod is missing."