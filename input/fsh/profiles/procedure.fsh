Profile: CZ_Procedure
Parent: Procedure
Id: cz-procedure
Title: "Procedure (CZ)"
Description: "This profile represents the constraints applied to the Procedure resource by the Czech national interoperability project."
* ^status = #active
* code 1..1 MS
* code from ProceduresSnomedAbsentUnknownUvIps (preferred)
* code ^definition = "Identification of the procedure or recording of \"absence of relevant procedures\" or of \"procedures unknown\"."
* code ^binding.extension[0].extension[0].url = "purpose"
* code ^binding.extension[=].extension[=].valueCode = #candidate
* code ^binding.extension[=].extension[+].url = "valueSet"
* code ^binding.extension[=].extension[=].valueCanonical = "http://hl7.org/fhir/uv/ips/ValueSet/procedures-snomed-ct-ips-free-set"
* code ^binding.extension[=].extension[+].url = "documentation"
* code ^binding.extension[=].extension[=].valueMarkdown = "Codes for procedures in SNOMED IPS Free Set"
* code ^binding.extension[=].url = "http://hl7.org/fhir/tools/StructureDefinition/additional-binding"
* code ^binding.extension[+].extension[0].url = "purpose"
* code ^binding.extension[=].extension[=].valueCode = #candidate
* code ^binding.extension[=].extension[+].url = "valueSet"
* code ^binding.extension[=].extension[=].valueCanonical = "http://hl7.org/fhir/uv/ips/ValueSet/absent-or-unknown-procedures-uv-ips"
* code ^binding.extension[=].extension[+].url = "documentation"
* code ^binding.extension[=].extension[=].valueMarkdown = "Codes for absent or unknown procedures"
* code ^binding.extension[=].url = "http://hl7.org/fhir/tools/StructureDefinition/additional-binding"
* code ^binding.description = "SNOMED CT procedure code set or a code for absent/unknown procedure"
* subject only Reference(CZ_Patient)
* subject MS
* subject ^definition = "The person on which the procedure was performed."
* subject.reference 1.. MS
* performed[x] 1..1 MS
* performed[x].extension contains $data-absent-reason named data-absent-reason 0..1 MS
* performed[x].extension[data-absent-reason] ^short = "performed[x] absence reason"
* performed[x].extension[data-absent-reason] ^definition = "Provides a reason why the performed is missing."
* asserter ^mustSupport = false
* performer ^mustSupport = false
* performer.actor only Reference(CZ_Patient or RelatedPerson or CZ_DeviceObserver or CZ_Practitioner or CZ_PractitionerRole or CZ_Organization)
* performer.actor ^mustSupport = false
* performer.onBehalfOf only Reference(CZ_Organization)
* performer.onBehalfOf ^mustSupport = false
//* bodySite only CodeableConceptIPS
* bodySite from SNOMEDCTBodyStructures (example)
* bodySite ^binding.extension[0].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* bodySite ^binding.extension[=].valueString = "BodySite"