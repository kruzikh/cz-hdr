Profile: CZ_AllergyIntolerance
Parent: AllergyIntolerance
Id: cz-allergy-intolerance
Title: "Allergy Intolerance (CZ)"
Description: """This profile represents the constraints applied to the AllergyIntolerance resource by the Czech national implementation.

It documents the relevant allergies or intolerances (conditions) for a patient, describing the kind of reaction (e.g. rash, anaphylaxis,..); preferably the agents that cause it; and optionally the criticality and the certainty of the allergy."""
* ^status = #active
* ^purpose = "This profile constrains the representation of a record of an allergy or intolerance of the patient as specified by the Czech national interoperability project."
* extension contains $abatement-dateTime-uv-ips named abatement-datetime 0..1
* extension[abatement-datetime] ^short = "Abatement datetime / Datum ústupu"
* extension[abatement-datetime] ^definition = "Datum nebo období, ve kterém byly projevy alergie nebo jiné nežádoucí reakce potlačeny nebo klinicky vyloučeny. / The date or estimated date that the condition resolved or went into remission."
//* clinicalStatus only CodeableConceptIPS
//* verificationStatus only CodeableConceptIPS
* verificationStatus MS
//* verificationStatus ^comment = "In the scope of the IPS the entered-in-error concept is not allowed."
* type MS   // alergie/intolerance
* code ..1 MS
* code from CZ_AllergyIntoleranceVS (preferred)
/*
* code ^binding.extension[0].extension[0].url = "purpose"
* code ^binding.extension[=].extension[=].valueCode = #candidate
* code ^binding.extension[=].extension[+].url = "valueSet"
* code ^binding.extension[=].extension[=].valueCanonical = "http://hl7.org/fhir/uv/ips/ValueSet/allergy-intolerance-snomed-ct-ips-free-set"
* code ^binding.extension[=].extension[+].url = "documentation"
* code ^binding.extension[=].extension[=].valueMarkdown = "Type of the substance/product, allergy or intolerance condition."
* code ^binding.extension[=].url = "http://hl7.org/fhir/tools/StructureDefinition/additional-binding"
* code ^binding.extension[+].extension[0].url = "purpose"
* code ^binding.extension[=].extension[=].valueCode = #candidate
* code ^binding.extension[=].extension[+].url = "valueSet"
* code ^binding.extension[=].extension[=].valueCanonical = "http://hl7.org/fhir/uv/ips/ValueSet/whoatc-uv-ips"
* code ^binding.extension[=].extension[+].url = "documentation"
* code ^binding.extension[=].extension[=].valueMarkdown = "Type of the substance/product, allergy or intolerance condition."
* code ^binding.extension[=].url = "http://hl7.org/fhir/tools/StructureDefinition/additional-binding"
* code ^binding.extension[+].extension[0].url = "purpose"
* code ^binding.extension[=].extension[=].valueCode = #candidate
* code ^binding.extension[=].extension[+].url = "valueSet"
* code ^binding.extension[=].extension[=].valueCanonical = "http://hl7.org/fhir/uv/ips/ValueSet/absent-or-unknown-allergies-uv-ips"
* code ^binding.extension[=].extension[+].url = "documentation"
* code ^binding.extension[=].extension[=].valueMarkdown = "Absent and unknown codes for allergy or intolerance."
* code ^binding.extension[=].url = "http://hl7.org/fhir/tools/StructureDefinition/additional-binding"
* code ^binding.description = "Type of the substance/product, allergy or intolerance condition or or a code for absent/unknown allergy."
*/

//* code from $allergy-intolerance-substance-condition-uv-ips (preferred)
* code.coding ^slicing.discriminator.type = #pattern
* code.coding ^slicing.discriminator.path = "$this"
* code.coding ^slicing.description = "Discriminated by the bound value set"
* code.coding ^slicing.rules = #open
* code.coding ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* code.coding ^binding.extension.valueString = "AllergyIntoleranceCode"
* code.coding ^binding.description = "Type of the substance/product, allergy or intolerance condition."
* code.coding contains
    allergyIntoleranceGPSCode 0..1 MS and
    absentOrUnknownAllergyIntolerance 0..1 MS and
    eHDSIAtc 0..1 MS and
    DLP_leciva 0..1 MS

//* code[allergyIntoleranceGPSCode] only CodeableConceptIPS
* code.coding[allergyIntoleranceGPSCode] from CZ_AllergyIntoleranceSubstanceConditionsVS (required)
* code.coding[allergyIntoleranceGPSCode] ^short = "Code for allergy or intolerance from the SNOMED CT GPS code set"
* code.coding[allergyIntoleranceGPSCode] ^definition = "Code for an allergy or intolerance statement that is selected from the SNOMED CT GPS code set."
* code.coding[allergyIntoleranceGPSCode] ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* code.coding[allergyIntoleranceGPSCode] ^binding.extension.valueString = "AllergyIntolerance GPS"
//* code.coding[allergyIntoleranceGPSCode] ^binding.extension.fhir_comments = "<extension url=\"http://hl7.org/fhir/StructureDefinition/elementdefinition-maxValueSet\">\r\n\t\t\t\t\t<valueCanonical value=\"http://hl7.org/fhir/uv/ips/ValueSet/allergy-intolerance-substance-condition-uv-ips\"/>\r\n\t\t\t\t</extension>"
* code.coding[allergyIntoleranceGPSCode] ^binding.description = "Codes for allergy or intolerance from the SNOMED CT GPS code set"
//* code[absentOrUnknownAllergyIntolerance] only CodeableConceptIPS
* code.coding[absentOrUnknownAllergyIntolerance] from cz-absent-or-unknown-allergies-vs (required)
* code.coding[absentOrUnknownAllergyIntolerance] ^short = "Code for absent or unknown allergy or intolerance"
* code.coding[absentOrUnknownAllergyIntolerance] ^definition = "Code for an allergy or intolerance statement (either a positive or a negated/excluded statement).  This describes a categorical negated statement (e.g., \"No known allergy\")."
* code.coding[absentOrUnknownAllergyIntolerance] ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* code.coding[absentOrUnknownAllergyIntolerance] ^binding.extension.valueString = "absentOrUnknownAllergy"
* code.coding[absentOrUnknownAllergyIntolerance] ^binding.description = "negation/exclusion codes for reporting no known allergies or not available data."

* code.coding[eHDSIAtc] from $eHDSI-ATC-VS (required)
* code.coding[eHDSIAtc] ^short = "Code for absent or unknown allergy or intolerance"
* code.coding[eHDSIAtc] ^definition = "Code for an allergy or intolerance statement selected from WHO ATC classification."
* code.coding[eHDSIAtc] ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* code.coding[eHDSIAtc] ^binding.extension.valueString = "absentOrUnknownAllergy"
* code.coding[eHDSIAtc] ^binding.description = "negation/exclusion codes for reporting no known allergies or not available data."

/*
* code.coding[DLP_leciva] from CZ_DLP_lecivaVS (required)
* code.coding[DLP_leciva] ^short = "Code for absent or unknown allergy or intolerance"
* code.coding[DLP_leciva] ^definition = "Code for an allergy or intolerance statement (either a positive or a negated/excluded statement).  This describes a categorical negated statement (e.g., \"No known allergy\")."
* code.coding[DLP_leciva] ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* code.coding[DLP_leciva] ^binding.extension.valueString = "absentOrUnknownAllergy"
* code.coding[DLP_leciva] ^binding.description = "negation/exclusion codes for reporting no known allergies or not available data."
*/

* patient only Reference(CZ_Patient)
* patient MS
* patient.reference 1.. MS
* onset[x] only dateTime or Age or Period or Range or string
* onset[x] MS
* onset[x] ^type.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* onset[x] ^type.extension.valueBoolean = true
* reaction MS
//* reaction.manifestation only CodeableConceptIPS
* reaction.manifestation MS

* reaction.manifestation ^slicing.discriminator.type = #pattern
* reaction.manifestation ^slicing.discriminator.path = "$this"
* reaction.manifestation ^slicing.description = "Discriminated by the bound value set"
* reaction.manifestation ^slicing.rules = #open
* reaction.manifestation contains reactionManifestationGPSCode 0..1 MS
//* reaction.manifestation[reactionManifestationGPSCode] only CodeableConceptIPS
* reaction.manifestation[reactionManifestationGPSCode] from CZ_AllergyReactionSnomedVS (required)
* reaction.manifestation[reactionManifestationGPSCode] ^short = "Code for the allergy or intolerance reaction manifestation from the SNOMED CT GPS code set"
* reaction.manifestation[reactionManifestationGPSCode] ^definition = "Code for an allergy or intolerance reaction manifestation statement that is selected from the SNOMED CT GPS code set."
* reaction.manifestation[reactionManifestationGPSCode] ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* reaction.manifestation[reactionManifestationGPSCode] ^binding.extension.valueString = "ReactionManifestationGPS"

* reaction.severity MS