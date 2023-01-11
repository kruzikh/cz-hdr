Profile: CZ_Dosage
Parent: Dosage
Id: cz-dosage
Title: "Dosage (CZ)"
Description: "This profile represents the constraints applied to the Dosage resource by the Czech national interoperability project."
* ^status = #active
* ^publisher = "Národní centrum elektronického zdravotnictví"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://ncez.mzcr.cz"
* ^purpose = "This profile constrains the representation of a dosage as specified by the national interoperability project."

* patientInstruction MS
* text MS
* timing MS

// ToDo: add czech site specific code binding

* route from CZ_RouteOfAdministrationVS (preferred)
* route ^binding.description = "EDQM Standards Terms"
* route ^binding.extension[0].extension[0].url = "purpose"
* route ^binding.extension[=].extension[=].valueCode = #candidate
* route ^binding.extension[=].extension[+].url = "valueSet"
* route ^binding.extension[=].extension[=].valueCanonical = "https://ncez.mzcr.cz/standards/fhir/ig/hdr/ValueSet/cz-cesta-podani-vs"
* route ^binding.extension[=].extension[+].url = "documentation"
* route ^binding.extension[=].extension[=].valueMarkdown = "Cesta podání léčiva dle kódového systému SUKL/DLP-cesty."
* route ^binding.extension[=].url = "http://hl7.org/fhir/tools/StructureDefinition/additional-binding"

