// Aktualizovat kontaktní informace NCEZ

ValueSet: CZ_AllergyIntoleranceVS
Id: cz-allergy-intolerance-vs
Title: "Allergy Intolerance (CZ)"
Description: "CZ Allergy intolerance codes value set. This value set includes codes from SNOMED Clinical Terms® and includes: selected descendants of 373873005 \\|Pharmaceutical / biologic product (product)\\|; all descendants of 105590001 \\|Substance (substance)\\|; all descendants of 418038007 \\|Propensity to adverse reactions to substance (finding)\\| plus codes for absent and unknown allergies."
* ^meta.profile = "http://hl7.org/fhir/StructureDefinition/shareablevalueset"
* ^status = #active
* ^experimental = false
* ^publisher = "Národní centrum elektronického zdravotnictví NCEZ"
* ^contact.name = "NCEZ CZ"
* ^contact.telecom[0].system = #phone
//* ^contact.telecom[=].value = "+420 603 111 222"
* ^contact.telecom[+].system = #email
* ^contact.telecom[=].value = "info@ncez.mzcr.cz"
* ^immutable = false
* ^copyright = "The NCEZ implementation guides incorporate SNOMED CT®, used by national license of the International Health Terminology Standards Development Organisation, trading as SNOMED International. SNOMED CT was originally created by the College of American Pathologists. SNOMED CT is a registered trademark of the International Health Terminology Standards Development Organisation, all rights reserved. Implementers of SNOMED CT should review [usage terms](http://www.snomed.org/snomed-ct/get-snomed-ct) or directly contact SNOMED International: info@snomed.org"
* include codes from valueset cz-allergy-intolerance-substance-condition-vs
* include codes from valueset cz-absent-or-unknown-allergies-vs