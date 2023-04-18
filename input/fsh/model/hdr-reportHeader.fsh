// -------------------------------------------------------------------------------
//  Logical Model				hdr-report.fsh
// -------------------------------------------------------------------------------
Logical: HdrReportLM
Id: hdr-report-lm
Title: "LM Propouštěcí zpráva - administrativní údaje"
Description:  """Logický informační model: Propouštěcí zpráva - administrativní údaje"""
* header 1..1 BackboneElement "A.1 Hlavička dokumentu" """A.1 Záhlaví dokumentu s administrativními údaji"""
* header.identifikacePacienta 1..1 https://ncez.mzcr.cz/standards/fhir/ig/hdr/StructureDefinition/subjekt "A.1.1 - A1.2 Patient/subject" """A.1.1 Identification of the patient/subject and A.1.2 Patient/subject related contact information  """
// https://ncez.mzcr.cz/fhir/ig/hdr/StructureDefinition/cz-subjekt-hdr "A.1.1 - A1.2 Patient/subject" """A.1.1 Identification of the patient/subject and A.1.2 Patient/subject related contact information  """

/*
* hlavička.payer 0..1 http://hl7.eu/fhir/ig/xeh/StructureDefinition/Payer "A.1.3 Health insurance and payment information" """A.1.3 Health insurance and payment information"""
* hlavička.informationRecipient 0..1 http://hl7.eu/fhir/ig/xeh/StructureDefinition/Recipient "A.1.4 Information recipient" """A.1.4 Information recipient (intended recipient or recipients of the report, additional recipients might be identified by the ordering party, e.g. GP, other specialist), if applicable"""
* hlavička.author 0..* http://hl7.eu/fhir/ig/xeh/StructureDefinition/Author "A.1.5 Author" """A.1.5 Author (by whom the Laboratory result report or a subset of its results was authored)"""
* hlavička.legalAuthenticator 0..* http://hl7.eu/fhir/ig/xeh/StructureDefinition/LegalAuthenticator "A.1.6 Legal authenticator" """A.1.6 Legal authenticator (The person taking responsibility for the medical content of the document)"""
* hlavička.validator 0..* http://hl7.eu/fhir/ig/xeh/StructureDefinition/Validator "A.1.7 Result validator" """A.1.7 Result validator"""
* hlavička.metadata 1..1 BackboneElement "A.1.8 Laboratory report metadata" """A.1.8 Laboratory report metadata"""
* hlavička.metadata.type 1..1 CodeableConcept "A.1.8.1 Document type" """A coded type of the document. Fixed value ""Laboratory report"" - Preferred system(s): LOINC"""
* hlavička.metadata.status 1..1 CodeableConcept "A.1.8.2 Document status" """The status of the laboratory test result report. E.g., preliminary, final. - Preferred system(s): hl7:DiagnosticReportStatus"""
* hlavička.metadata.dateTime 1..1 dateTime "A.1.8.3 Report date and time" """Date and time of the result report creation. - Preferred system(s): ISO 8601"""
* hlavička.metadata.title 0..1 string "A.1.8.4 Document title" """Document title, e.g. ""Laboratory Result report"" - Preferred system(s): """
* hlavička.metadata.custodian 0..1 BackboneElement "A.1.8.5 Report custodian" """Organisation that is in charge of maintaining the laboratory report - Preferred system(s): """
* order 0..* http://hl7.eu/fhir/ig/xeh/StructureDefinition/Order "A.2-A.3 Order" """A.2 Order information (Laboratory Result Report could respond to multiple test orders)
A.3 Order reason (Laboratory Result Report could respond to multiple reasons)
"""
* specimen 0..* http://hl7.eu/fhir/ig/xeh/StructureDefinition/SpecimenLab "A.4 Specimen information" """A.4 Specimen information"""
* result 0..* http://hl7.eu/fhir/ig/xeh/StructureDefinition/Result "A.5 Results data elements" """A.5 Resul ts data elements"""
*/
//--- END
//--- END
//--- END



// -------------------------------------------------------------------------------
//  Map to FHIR R4
// -------------------------------------------------------------------------------
Mapping: HdrReport2FhirMap
Id: fhir
Title: "eHN Lab model to FHIR R4 Map"
Source: hdr-report-lm
Target: "hl7.org/fhir/r4"

* -> "Bundle.conformsTo('https://ncez.mzcr.cz/fhir/ig/hdr/StructureDefinition/Bundle-cz-hdr')"
* header -> "Composition.conformsTo('https://ncez.mzcr.cz/fhir/ig/hdr/StructureDefinition/Composition-cz-hdr')"
* header.identifikacePacienta -> "Composition.subject"
/*
* hlavička.payer -> "ServiceRequest.conformsTo('http://hl7.eu/fhir/ig/xeh/StructureDefinition/ServiceRequest-lab-xeh').insurance.resolve()"
* hlavička.informationRecipient -> ".extension('http://hl7.org/fhir/StructureDefinition/cqf-receivingOrganization') [TBD}"
* hlavička.author -> "Composition.author"
* hlavička.legalAuthenticator -> "Composition.attester.where(mode=http://hl7.org/fhir/composition-attestation-mode#legal)"
* hlavička.validator -> "Composition.attester.where(mode=http://hl7.org/fhir/composition-attestation-mode#professional)"
* hlavička.metadata -> "Composition"
* hlavička.metadata.type -> "Composition.type"
* hlavička.metadata.status -> "Composition.status"
* hlavička.metadata.dateTime -> "Bundle.timestamp"
* hlavička.metadata.title -> "Composition.title"
* hlavička.metadata.custodian -> "Composition.custodian"
* order -> "Composition.extension('http://hl7.eu/fhir/ig/xeh/StructureDefinition/composition-basedOn-order-or-requisition').valueReference.resolve()"
* order -> "Composition.extension('http://hl7.eu/fhir/ig/xeh/StructureDefinition/composition-basedOn-order-or-requisition').valueIdentifier"
* specimen -> "Observation.conformsTo('http://hl7.eu/fhir/ig/xeh/StructureDefinition/Observation-results-laboratory-eu-xeh').specimen.resolve()"
* result -> "Composition.section:no-subsections.entry.resolve()"
* result -> "Composition.section:subsections.section.entry.resolve()"
*/

// --END
// --END
// --END
