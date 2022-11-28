Profile: CZ_Immunization
Parent: Immunization
Id: cz-immunization
Title: "Immunization (CZ)"
Description: """This profile represents the constraints applied to the Immunization resource by the International Patient Summary (IPS) FHIR Implementation Guide. A record of an immunization is represented in the patient summary as an instance of an Immunization resource constrained by this profile.

It describes the event of a patient being administered a vaccination or a record of a vaccination as reported by a patient, a clinician or another party."""
* ^status = #active
* ^purpose = "This profile constrains the representation of a record of a vaccination of the patient, in the context of the hospital discharge report or patient summary as specified by the Czech national interoperability project."
* . ^definition = "Describes the event of a patient being administered a vaccination or a record of a vaccination as reported by a patient, a clinician or another party and may include vaccine reaction information and what vaccination protocol was followed"
* status MS

* vaccineCode 1..1 MS
//* vaccineCode only CodeableConceptIPS
//* vaccineCode from $vaccines-uv-ips (preferred)
* vaccineCode from cz-locto-vs (preferred)
* vaccineCode ^short = "Vaccine that was administered or was to be administered."
* vaccineCode ^definition = "Vaccine that was administered or was to be administered. Several kinds of vaccine product coding could be provided.\r\nPatient summary assumes that either the type of the vaccine for particular disease (e.g. MMR vaccine) or diseases against which the patient has been immunized is provided; or the known absent / unknown.\r\n\r\nOther coded information can be provided as well as:\r\n\r\n- The IDMP Pharmaceutical Product Identifier (PhPID), Level 1, [Substance(s)]. Example: Amoxicillin and Clavulanate Potassium; or any other equivalent coded concept.\r\n- The IDMP Pharmaceutical Product Identifier (PhPID), Level 2 [Substance(s) + Strength + reference strength]. Example: Amoxicillin 875 mg and Clavulanate Potassium 125 mg; or any other equivalent coded concept.\r\n- The IDMP Pharmaceutical Product Identifier (PhPID), Level 3 [Substance(s) + administrable dose form]. Example: Amoxicillin and Clavulanate Potassium, Oral Tablet; or any other equivalent coded concept.\r\n- The IDMP Pharmaceutical Product Identifier (PhPID), Level 4 [Substance(s) + strength + reference strength + administrable dose form]. Example: Amoxicillin 875 mg and clavulanate potassium 125 mg, oral tablet; or any other equivalent coded concept.\r\n- The IDMP Medicinal Product Identifier (MPID) or any equivalent Medicinal Product Identifier. IDMP MPID uniquely identifies a Medicinal Product, reflecting (but not replacing) any other authorization numbers allocated by a regulator. MPID implies one (set of) PhPID. The MPID shall use a common segment pattern related to a Medicinal Product, which, when each segment is valued shall define a specific MPID concept.\r\n- The IDMP Packaged Medicinal Product Identifier (PCID) or any equivalent Packaged Medicinal Product Identifier. Uniquely identifies a Medicinal Product based on its packaging. This implies one MPID can be associated with more than one PCID, if the same Medicinal Product has more than one type of package.\r\n- Any other kind of code that that identifies, classifies or clusters the administered product (e.g. the medicinal product or the product class).\r\n\r\nThe value sets used for the PhPID, MPID and PCID identifiers are provisional and include only few equivalent concepts used for exemplification purposes, they will be updated with real IDMP identifiers when they will become available."
* vaccineCode.coding ^slicing.discriminator.type = #pattern
* vaccineCode.coding ^slicing.discriminator.path = "$this"
* vaccineCode.coding ^slicing.description = "Discriminated by the bound value set"
* vaccineCode.coding ^slicing.rules = #open
* vaccineCode.coding ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* vaccineCode.coding ^binding.extension.valueString = "VaccineCode"
* vaccineCode.coding ^binding.description = "Type of vaccine administered. Type of vaccine could be expressed using SNOMED CT or ATC codes from the eHDSI value set or usign national value set LOCTO from DASTA code system or the known absent / unknown."
* vaccineCode.coding contains
    eHDSIVaccine 0..1 MS and
    LOCTO 0..1 MS and
    absentOrUnknownImmunization 0..1 MS
* vaccineCode.coding[eHDSIVaccine] from cz-ehdsi-vaccine-vs (required)
* vaccineCode.coding[eHDSIVaccine] ^short = "eHDSIVaccine"
* vaccineCode.coding[eHDSIVaccine] ^definition = "Type of vaccine administered using eHDSIVaccine value set."
* vaccineCode.coding[eHDSIVaccine] ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* vaccineCode.coding[eHDSIVaccine] ^binding.extension.valueString = "eHDSI Value set (CZ)"

* vaccineCode.coding[LOCTO] from cz-locto-vs (required)
* vaccineCode.coding[LOCTO] ^short = "LOCTO"
* vaccineCode.coding[LOCTO] ^definition = "Type of vaccine administered using LOCTO (DASTA) value set."
* vaccineCode.coding[LOCTO] ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* vaccineCode.coding[LOCTO] ^binding.extension.valueString = "LOCTO"

* vaccineCode.coding[absentOrUnknownImmunization] from $absent-or-unknown-immunizations-uv-ips (required)
* vaccineCode.coding[absentOrUnknownImmunization] ^short = "Absent Unknown Immunization"
* vaccineCode.coding[absentOrUnknownImmunization] ^definition = "A reference to a code indicating that there there are no known immunizations or that this information is unknown."
* vaccineCode.coding[absentOrUnknownImmunization] ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* vaccineCode.coding[absentOrUnknownImmunization] ^binding.extension.valueString = "Absent Unknown Immunization"


* patient only Reference(CZ_Patient)
* patient MS
* patient.reference 1.. MS
* occurrence[x] 1..1 MS
* occurrence[x].extension contains $data-absent-reason named data-absent-reason 0..1 MS
* occurrence[x].extension[data-absent-reason] ^short = "occurrence[x] absence reason"
* occurrence[x].extension[data-absent-reason] ^definition = "Provides a reason why the occurrence is missing."
//* site only CodeableConceptIPS

* site from $target-site-uv-ips (preferred)
//* route only CodeableConceptIPS
* route from $medicine-route-of-administration (preferred)  // TODO navázat na český překlad EDQM resp eHDSIRoute...
* route ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* route ^binding.extension.valueString = "ImmunizationRoute"

* protocolApplied.targetDisease from CZ_VaccineTargetDiseasesUvIps (preferred)
* protocolApplied.targetDisease ^slicing.discriminator.type = #pattern
* protocolApplied.targetDisease ^slicing.discriminator.path = "$this"
* protocolApplied.targetDisease ^slicing.description = "Discriminated by bound value set"
* protocolApplied.targetDisease ^slicing.rules = #open
* protocolApplied.targetDisease contains targetDiseaseCode 0..1
* protocolApplied.targetDisease[targetDiseaseCode] from CZ_VaccineTargetDiseasesUvIps (required)
* protocolApplied.targetDisease[targetDiseaseCode] ^short = "Code for a disease the vaccination is against from the IPS TargetDisease value set."
* protocolApplied.targetDisease[targetDiseaseCode] ^definition = "Code for a disease the vaccination is against from the IPS TargetDisease value set."
* protocolApplied.targetDisease[targetDiseaseCode] ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* protocolApplied.targetDisease[targetDiseaseCode] ^binding.extension.valueString = "CzTargetDiseasesGpsUvIps"
/*
* protocolApplied.targetDisease[targetDiseaseCode] from $cz-target-disease-mkn-10-vs (required)
*/