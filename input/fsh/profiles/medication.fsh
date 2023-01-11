Profile: CZ_Medication
Parent: Medication
Id: cz-medication
Title: "Medication (CZ)"
Description: "This profile represents the constraints applied to the Medication resource by the Czech national interoperability project FHIR Implementation Guide, based on FHIR R4. A medication is described as an instance of a Medication resource constrained by this profile."
* ^status = #active
* ^experimental = false
* ^publisher = "Národní centrum elektronického zdravotnictví"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://ncez.mzcr.cz"
* ^purpose = "This profile constrains the representation of a medication, in the context of the Czech national interoperability project."
* . ^comment = "CZ Medication"
* code 1..1 MS


/*
* code only CodeableConceptIPS
* code from $medication-example-uv-ips (example)
*/
* code ^short = "Kód identifikující léčivý přípravek"
* code ^definition = "Kód léčiva (léčivého přípravku). Léčivý přípravek může být identifikován pomocí kódu přiděleného SÚKL, pomocí ATC skupiny nebo generického názvu léčiva"
* code.coding ^slicing.discriminator.type = #pattern
* code.coding ^slicing.discriminator.path = "$this"
* code.coding ^slicing.description = "Discriminated by the bound value set"
* code.coding ^slicing.rules = #open
* code.coding ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* code.coding ^binding.extension.valueString = "MedicationCode"
* code.coding ^binding.description = "The type of medication"
* code.coding contains
    atcClass 0..1 MS and
    dlp 0..1 MS

//* code[atcClass] only CodeableConceptIPS
* code.coding[atcClass] from CZ_MedicineActiveSubstancesVS (required)
* code.coding[atcClass] ^short = "WHO ATC"
* code.coding[atcClass] ^definition = "Klasifikace WHO ATC"
//* code[dlp] only CodeableConceptIPS
* code.coding[dlp] from CZ_MedicineDlpVS (required)
* code.coding[dlp] ^short = "Kód SÚKL"
* code.coding[dlp] ^definition = "Kód SÚKL z databáze léčivých přípravků (DLP)"

// * form only CodeableConceptIPS
* form MS
* form from $medicine-doseform (preferred)
* form ^definition = "Describes the form of the item.  Powder; tablets; capsule.\r\n\r\nAdministrable Pharmaceutical Dose Form. \r\nThis code represents the form of the medication (e.g. tablet, capsule, liquid)\r\n\r\nSince the EDQM Standards Terms, together with UCUM, is one of the IDMP terminologies actually available for usage, this code system has been selected as referecne terminology for representing Pharmaceutical Dose forms;Pakages and Route of Administration.\r\n\r\nIt is known that also alternative jurisdictional and international terminologies are known to be used for this concept domain, as NCI or SNOMED CT."
* ingredient MS
//* ingredient.itemCodeableConcept only CodeableConceptIPS
* ingredient.itemCodeableConcept MS
* ingredient.itemCodeableConcept from $medicine-active-substances (preferred)
* ingredient.itemCodeableConcept ^comment = "The IDMP ISO 11238 standard addresses the identification and exchange of regulated information on substances. \r\nThe Global Ingredient Archival System (GInAS) will provide a common global identifier for all of the substances used in medicinal products, providing a definition of substances globally consistent with this standard.\r\nThose identifiers however are yet available for concrete usage, therefore in this version of the template, SNOMED CT has been chosen as reference terminology also for the active substances.\r\nThis choice will be revised based on the availability and the maturity of GInAS."
* ingredient.itemCodeableConcept ^binding.description = "SNOMED CT drug substances"
* ingredient.itemCodeableConcept.text MS
* ingredient.strength only RatioIPS   // RatioIPS přidává podmínku MS pro čitatel i jmenovatel
* ingredient.strength MS