ValueSet: CZ_MedicineActiveSubstancesVS
Id: cz-medicine-active-substances-vs
Title: "Medicine Active Substances (CZ)"
Description: """This value set includes all codes from WHO ATC classification
Future implementations should consider ISO 11238 Health informatics -- Identification of medicinal products -- Data elements and structures for the unique identification and exchange of regulated information on substances."""
* ^meta.profile = "http://hl7.org/fhir/StructureDefinition/shareablevalueset"
* ^identifier.use = #official
//* ^identifier.system = "http://art-decor.org/ns/oids/vs"
//* ^identifier.value = "2.16.840.1.113883.11.22.25"
* ^version = "1.0.0"
* ^status = #active
* ^experimental = false
* ^publisher = "National eHealth Center"
* ^contact.name = "National eHealth Center"
* ^contact.telecom[0].system = #phone
* ^contact.telecom[=].value = "+420 "
* ^contact.telecom[+].system = #email
* ^contact.telecom[=].value = "ncez@mzcr.cz"
* ^immutable = false
* ^copyright = "This artifact includes content from WHO ATC classification. ATC classification is copyright WHO Collaborating Centre for Drug Statistics Methodology, Oslo, Norway."
* include codes from system $atc