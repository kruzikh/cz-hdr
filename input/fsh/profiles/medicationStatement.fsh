Profile: CZ_MedicationStatement
Parent: MedicationStatement
Id: cz-medication-statement
Title: "Medication Statement (CZ)"
Description: "This profile represents the constraints applied to the MedicationStatement resource by the Czech national interoperability project. "
* ^status = #active
* ^publisher = "Národní centrum elektronického zdravotnictví"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://ncez.mzcr.cz"
* ^purpose = "This profile constrains the representation of a medication statement related to the patient, in the context of the Czech hospital discharge record as specified by the national interoperability project."
* status ^comment = "In the scope of the HDR the entered-in-error concept is not allowed."

* medication[x] MS
* medication[x] from cz-medicine-dlp-vs (preferred)
* medication[x] ^slicing.discriminator.type = #type
* medication[x] ^slicing.discriminator.path = "$this"
* medication[x] ^slicing.rules = #closed
* medication[x] ^definition = "Identifies the medication being administered or the reason for absent or unknown Medication. This is either a link to a resource representing the details of the medication or a simple attribute carrying a code. To improve global interoperability is strongly encouraged that the reference to a medication resource is used, limiting the usage of the medicationCodeableConcept only to the cases in which no other information than a simple code is available."
* medication[x] ^binding.description = "The type of medication"

* medicationReference 0..1 MS
* medicationReference only Reference(Medication)  //ToDo CZ_Medication
* medicationReference ^sliceName = "medicationReference"
* medicationCodeableConcept 0..1 MS
//* medicationCodeableConcept only CodeableConceptIPS
* medicationCodeableConcept from $absent-or-unknown-medications-uv-ips (extensible)
* medicationCodeableConcept ^sliceName = "medicationCodeableConcept"
* medicationCodeableConcept ^short = "Code for the medication being administered or an absent or unknown medication"
* medicationCodeableConcept ^definition = "Code for the medication being administered or a negated/excluded medication statement.  If negated, this describes a categorical negated statement (e.g., \"No known medications\")."
* medicationCodeableConcept ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* medicationCodeableConcept ^binding.extension.valueString = "UnknownMedicationCode"
* medicationCodeableConcept ^binding.description = "Representation of unknown or absent medications"
* subject only Reference(CZ_Patient)
* subject MS
* subject.reference 1.. MS
* effective[x] 1..1 MS
* effective[x].extension contains $data-absent-reason named data-absent-reason 0..1 MS
* effective[x].extension[data-absent-reason] ^short = "effective[x] absence reason"
* effective[x].extension[data-absent-reason] ^definition = "Provides a reason why the effectiveTime is missing."
* dosage MS
* dosage.text MS
* dosage.timing MS
//* dosage.route only CodeableConceptIPS
* dosage.route from $medicine-route-of-administration (preferred)
* dosage.route ^binding.description = "EDQM Standards Terms"