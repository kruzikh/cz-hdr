ValueSet: CZ_MedicineDlpVS
Id: cz-medicine-dlp-vs
Title: "Léčiva (CZ)"
Description: """Databáze léčivých přípravků obsahuje všechny léčivé přípravky registrované v ČR."""
* ^meta.profile = "http://hl7.org/fhir/StructureDefinition/shareablevalueset"
* ^identifier.use = #official
//* ^identifier.system = "http://art-decor.org/ns/oids/vs"
//* ^identifier.value = "2.16.840.1.113883.11.22.25"
* ^version = "2012.12.02"
* ^status = #active
* ^experimental = false
* ^publisher = "Národní centrum elektronického zdravotnictví"
* ^contact.name = "Národní centrum elektronického zdravotnictví"
* ^contact.telecom[0].system = #phone
* ^contact.telecom[=].value = "+420 "
* ^contact.telecom[+].system = #email
* ^contact.telecom[=].value = "ncez@mzcr.cz"
* ^immutable = false
//* ^copyright = ""
* include codes from system CZ_Dlp