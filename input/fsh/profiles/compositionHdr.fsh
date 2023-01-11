Profile: CZ_CompositionHdr
Parent: $clinicaldocument
Id: cz-composition-hdr
Title: "Hospital Discharge Report Composition"
Description: """Clinical document used to represent the Czech national hospital discharge report (HDR) data set.
A hospital discharge report is an electronic health record document containing summary information about course and results of an inpatient care encounter of a subject of care.
The quality of the discharge report is generally considered critical to promoting patient safety during the transition between different providers, particularly in the early post-hospitalization period. In addition, it also contains important information intended for the patient himself (or the person caring for the patient): information about his state of health and subsequent recommended care (e.g. date of follow-up examination, regimen recommendations, etc.).
The HDR dataset is minimal and non-exhaustive; specialty-agnostic and condition-independent. It is designed for supporting continuity of care after discharge of the subject of care form an inpatient encounter.
Discharge summary is a synopsis of a patient's admission to a hospital; it provides pertinent information for the continuation of care following discharge. The summary may include the reason for hospitalization, procedures performed, the care, treatment and services provided, the patient's condition and disposition at discharge, information provided to the patient and family, and provisions for follow-up care.
This profile is based on the ClinicalDocument profile."""
* ^status = #active
* ^publisher = "Národní centrum elektronického zdravotnictví"
* ^purpose = "Propuštěcí zpráva je souhrnem informací o průběhu a výsledku hospitalizace pacienta v nemocnici; poskytuje relevantní informace pro zajištění kontinuity péče po propuštění. Souhrn může obsahovat důvod hospitalizace, anamenstické údaje, provedené výkony, průběh hospitalizace, souhrn medikace, stav pacienta při propuštění, informace poskytnuté pacientovi a rodině, doporučení a informace o zajištění následné péče."
* ^copyright = "Národní centrum elektronického zdravotnictví"
* . ^short = "Hospital discharge report composition"
* . ^definition = "Hospital discharge report composition. \r\nA composition is a set of healthcare-related information that is assembled together into a single logical document that provides a single coherent statement of meaning, establishes its own context and that has clinical attestation with regard to who is making the statement. \r\nWhile a Composition defines the structure, it does not actually contain the content: rather the full content of a document is contained in a Bundle, of which the Composition is the first resource contained."
* text MS
* identifier MS
* status MS
//* type only CodeableConceptIPS
* type = $loinc#34105-7 "Propouštěcí zpráva z nemocnice"
* type MS
* type ^short = "Kind of composition (\"Propouštěcí zpráva z nemocnice\""
* type ^definition = "Specifies that this composition refers to a Hospital discharge report (Loinc \"34105-7\")\r\n"
* subject 1.. MS
* subject only Reference(CZ_Patient)
* subject ^definition = "Who or what the composition is about. \r\nIn general a composition can be about a person, (patient or healthcare practitioner), a device (e.g. a machine) or even a group of subjects (such as a document about a herd of livestock, or a set of patients that share a common exposure).\r\nFor the HDR the subject is always the patient."
* subject.reference 1.. MS
* date MS
* author MS
* author ^short = "Who and/or what authored the HDR"
* author ^definition = "Identifies who is responsible for the information in the HDR, not necessarily who typed it in."
* author only Reference(CZ_Practitioner or CZ_PractitionerRole)
* title MS
* title ^short = "Propouštěcí zpráva z nemocnice"
* title ^definition = "Official human-readable label for the composition.\r\n\r\nFor this document should be \"Propouštěcí zpráva z nemocnice\""
* attester MS
* attester.mode MS
* attester.time MS
* attester.party MS
* attester.party only Reference(CZ_Practitioner or CZ_PractitionerRole or CZ_Organization)
* custodian MS
* custodian only Reference(CZ_Organization)
* relatesTo.target[x] only Identifier or Reference(Composition or CZ_CompositionHdr)
* event ^slicing.discriminator[0].type = #pattern
* event ^slicing.discriminator[=].path = "code"
* event ^slicing.rules = #open
* event ^definition = "The main activity being described by a HDR is the provision of healthcare services over a period of time.
\r\nAt least one event should be used to record period over which a particular performer provided care services to the patient.
\r\nAdditional data from outside this duration may also be included if it is relevant to care provided during that time range (e.g., reviewed during the stated time range).
The start value should represent the date when the treatment relationship between the patient and the healthcare professional started; and the end value the date of the latest care event."
* event contains careProvisioningEvent 0..1 MS
* event[careProvisioningEvent] ^short = "The care provisioning being documented"
* event[careProvisioningEvent] ^definition = "The provision of healthcare over a period of time this HDR is documenting."
* event[careProvisioningEvent].code 1.. MS
* event[careProvisioningEvent].code = $v3-ActClass#PCPR
* event[careProvisioningEvent].period MS
* section 1.. MS
* section ^extension.url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-explicit-type-name"
* section ^extension.valueString = "Section"
* section ^slicing.discriminator[0].type = #pattern
* section ^slicing.discriminator[=].path = "code"
* section ^slicing.ordered = false
* section ^slicing.rules = #open
* section ^short = "Sections composing the Hospital Discharge Report"
* section ^definition = "The root of the sections that make up the HDR composition."
* section.code 1.. MS
//* section.code only CodeableConceptIPS
//* section.text 1.. MS   //text sekce může a nemusí být uveden
//* section.emptyReason ..0  // pokud je sekce prázdná může být uveden důvod
//* section.emptyReason ^mustSupport = false
//* section.section ..0
//* section.section ^mustSupport = false
//* section contains
//    sectionMedications 1..1 MS and
//    sectionAdvanceDirectives 0..1 MS and
//    sectionAllergies 1..1 MS and
//    sectionAlert 0..1 MS and
//    sectionPatientHistory 0..1 MS
//    sectionProblems 1..1 MS and
//    sectionProceduresHx 0..1 MS and
//    sectionImmunizations 0..1 MS and
//    sectionMedicalDevices 0..1 MS and
//    sectionResults 0..1 MS and
//    sectionVitalSigns 0..1 and
//    sectionPastIllnessHx 0..1 and
//    sectionFunctionalStatus 0..1 and
//    sectionPlanOfCare 0..1 and
//    sectionSocialHistory 0..1 and
//    sectionPregnancyHx 0..1

// -------------------------------------
// Medication Summary Section 1 … 1
// to be checked
// -------------------------------------
* section contains sectionMedicationSummary 1..1 MS
* section[sectionMedicationSummary] ^extension.url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-explicit-type-name"
* section[sectionMedicationSummary] ^extension.valueString = "Section"
* section[sectionMedicationSummary] ^short = "Hospital Discharge Report Medication Summary Section"
* section[sectionMedicationSummary] ^definition = "Souhrnná informace o medikaci, doporučené na období po propuštění, s vyznačením, zda se jedná o medikaci změněnou či nově zahájenou. Přehled je oproti dosavadním zvyklostem doplněn o medikaci ukončenou, Součástí souhrnu je také informace o počtu dní, na které byl pacient léčivy vybaven při propuštění."
* section[sectionMedicationSummary].title 1.. MS
* section[sectionMedicationSummary].title ^short = "Medication Summary section"
* section[sectionMedicationSummary].title = "Souhrn medikace"
* section[sectionMedicationSummary].title ^definition = "The label for this particular section.  This will be part of the rendered content for the document, and is often used to build a table of contents.\r\n\r\nSouhrn medikace "
//* section[sectionMedicationSummary].code = $loinc#10160-0
* section[sectionMedicationSummary].code = $loinc#56445-0
* section[sectionMedicationSummary].entry 1.. MS
* section[sectionMedicationSummary].entry only Reference(CZ_MedicationStatement or CZ_MedicationRequest or CZ_MedicationDispense)
* section[sectionMedicationSummary].entry ^short = "Medications relevant for the scope of the HDR"
* section[sectionMedicationSummary].entry ^definition = "Seznam léčiv s vyznačením, zda se jedná o medikaci změněnou (včetně ukončené), pokračující (beze změny), nově zahájenou či doporučenou. Také informace o vybavení pacienta (vydaných léčivech) při propuštění. Pokud pacient nemá žádnou medikaci či medikace není známa, musí být tento fakt rovněž zaznamenán."
* section[sectionMedicationSummary].emptyReason ..0
* section[sectionMedicationSummary].emptyReason ^mustSupport = false


// * section[sectionMedications].entry ^slicing.discriminator[0].type = #profile
// * section[sectionMedications].entry ^slicing.discriminator[=].path = "resolve()"
// * section[sectionMedications].entry ^slicing.rules = #open
// * section[sectionMedications].entry ^short = "Medications relevant for the scope of the patient summary"
// * section[sectionMedications].entry ^definition = "This list the medications relevant for the scope of the patient summary or it is used to indicate that the subject is known not to be on any relevant medication; either that no information is available about medications."
// * section[sectionMedications].entry[medicationStatement] only Reference(MedicationStatementIPS)
// * section[sectionMedications].entry[medicationStatement] ^sliceName = "medicationStatement"
// * section[sectionMedications].entry[medicationRequest] only Reference(MedicationRequestIPS)
// * section[sectionMedications].entry[medicationRequest] ^sliceName = "medicationRequest"

// -------------------------------------
// Allergies and Intolerances Section 1..1
// -------------------------------------
* section contains sectionAllergies 1..1 MS
* section[sectionAllergies] ^extension.url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-explicit-type-name"
* section[sectionAllergies] ^extension.valueString = "Section"
* section[sectionAllergies] ^short = "HDR Allergies and Intolerances Section"
* section[sectionAllergies] ^definition = "Tato sekce obsahuje jak alergie, které se u pacienta projevily a byly jako alergie hodnoceny, tak i jiné projevy nesnášenlivosti, označované jako intolerance.
Uvádějí se zejména alergické reakce na léčivé přípravky a jiné látky, používané při poskytování zdravotní péče – vyvolávající látka (původce), typ (charakter) reakce a její závažnost, případně také jendotlivé projevy.
\r\nNe všechny projevy nesnášenlivosti jsou pravé alergie; informace o alergii se často přebírají, aniž by byl blíže zjišťován charakter a okolnosti reakce.
\r\nPokud byla alergie vyloučena, měl by o tom být učiněn záznam.
\r\nPokud nejsou k dispozici žádné informace o alergiích nebo pokud nejsou žádné alergie u pacienta známy, mělo by to být jasně zdokumentováno v této části.“
\r\n\r\nThis section documents the relevant allergies or intolerances (conditions) for that patient, describing the kind of reaction (e.g. rash, anaphylaxis,..); preferably the agents that cause it; and optionally the criticality and the certainty of the allergy.
\r\nAt a minimum, it should list currently active and any relevant historical allergies and adverse reactions.
\r\nIf no information about allergies is available, or if no allergies are known this should be clearly documented in the section."
* section[sectionAllergies].title 1.. MS
* section[sectionAllergies].code = $loinc#48765-2
* section[sectionAllergies].entry 1.. MS
//* section[sectionAllergies].entry only Reference(CZ_AllergyIntolerance) //or DocumentReference)
* section[sectionAllergies].entry ^slicing.discriminator[0].type = #type
* section[sectionAllergies].entry ^slicing.discriminator[=].path = "resolve()"
* section[sectionAllergies].entry ^slicing.ordered = false
* section[sectionAllergies].entry ^slicing.rules = #open
* section[sectionAllergies].entry ^short = "Relevant allergies or intolerances (conditions) for that patient."
* section[sectionAllergies].entry ^definition = "It lists the relevant allergies or intolerances (conditions) for that patient, describing the kind of reaction (e.g. rash, anaphylaxis,..); preferably the agents that cause it; and optionally the criticality and the certainty of the allergy.\r\nAt a minimum, it should list currently active and any relevant historical allergies and adverse reactions.\r\n This entry shall be used to document that no information about allergies is available, or that no allergies are known ."
* section[sectionAllergies].entry contains
    allergyOrIntolerance 1.. MS
* section[sectionAllergies].entry[allergyOrIntolerance] only Reference(CZ_AllergyIntolerance)
* section[sectionAllergies].entry[allergyOrIntolerance] ^mustSupport = true
* section[sectionAllergies].entry[allergyOrIntolerance] ^short = "Alergie a intolerance"
* section[sectionAllergies].entry[allergyOrIntolerance] ^definition = "Alergie a intolerance"
* section[sectionAllergies].section 0..0
* section[sectionAllergies].section ^mustSupport = false
* section[sectionAllergies].emptyReason ..0
* section[sectionAllergies].emptyReason ^mustSupport = false

/*
// -------------------------------------
// Allergies and Intolerances Section 1..1
// -------------------------------------
* section[sectionAllergies]
  * insert SectionComRules (
    HDR Allergies and Intolerances Section, // SHORT
    Tato sekce obsahuje jak alergie\, které se u pacienta projevily a byly jako alergie hodnoceny\, tak i jiné projevy nesnášenlivosti\, označované jako intolerance.
Uvádějí se zejména alergické reakce na léčivé přípravky a jiné látky\, používané při poskytování zdravotní péče – vyvolávající látka (původce\)\, typ (charakter\) reakce a její závažnost\, případně také jednotlivé projevy.
\r\nNe všechny projevy nesnášenlivosti jsou pravé alergie; informace o alergii se často přebírají\, aniž by byl blíže zjišťován charakter a okolnosti reakce.
\r\nPokud byla alergie vyloučena\, měl by o tom být učiněn záznam.
\r\nPokud nejsou k dispozici žádné informace o alergiích nebo pokud nejsou žádné alergie u pacienta známy\, mělo by to být jasně zdokumentováno v této části.“
\r\n\r\nThis section documents the relevant allergies or intolerances (conditions\) for that patient\, describing the kind of reaction (e.g. rash\, anaphylaxis\,..\); preferably the agents that cause it; and optionally the criticality and the certainty of the allergy.
\r\nAt a minimum\, it should list currently active and any relevant historical allergies and adverse reactions.
\r\nIf no information about allergies is available\, or if no allergies are known this should be clearly documented in the section. // DESC
     , http://loinc.org#48765-2)   // CODE
  * entry 1.. MS
  * entry only Reference(CZ_AllergyIntolerance or DocumentReference)
  * insert SectionEntrySliceComRules(Relevant allergies or intolerances (conditions\) for that patient.,
    It lists the relevant allergies or intolerances (conditions\) for that patient\, describing the kind of reaction (e.g. rash\, anaphylaxis\,..\); preferably the agents that cause it; and optionally the criticality and the certainty of the allergy.\r\nAt a minimum\, it should list currently active and any relevant historical allergies and adverse reactions.\r\n This entry shall be used to document that no information about allergies is available\, or that no allergies are known .)
  // entry slices
  * insert SectionEntrySliceDefRules (allergyOrIntolerance, 1.. , HDR Allergy entry,
    Hospital Discharge Report Allergy entry, CZ_AllergyIntolerance)
*/

// -------------------------------------
// Alert 0 .. 1
// -------------------------------------

//* insert AlertSectionRules
* section contains sectionAlert 0..1 MS
* section[sectionAlert] ^extension.url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-explicit-type-name"
* section[sectionAlert] ^extension.valueString = "Section"
* section[sectionAlert] ^short = "HDR Health Concern Section"
* section[sectionAlert] ^definition = "V sekci Varování jsou uvedeny zdravotní stavy nebo situace, které by mohly vést k naléhavé situaci. Může se jednat o kontraindikaci pro předpis určitého léčivého prostředku nebo léčebného postupu. Popisovaná situace může představovat riziko pro samotného pacienta, ale i pro jeho okolí, třeba v případech infekčních nemocí. Neznalost „Varování“ může vést k chybám ve správné medicínské praxi."
* section[sectionAlert].title 1.. MS
* section[sectionAlert].code 1..
* section[sectionAlert].code = $loinc#75310-3
* section[sectionAlert].text 1..
* section[sectionAlert].text only Narrative
* section[sectionAlert].emptyReason ..0
* section[sectionAlert].emptyReason ^mustSupport = false
* section[sectionAlert].section 0..0  // no sub-section
* section[sectionAlert].section ^mustSupport = false

* section[sectionAlert].entry 0..
* section[sectionAlert].entry ^slicing.discriminator[0].type = #type
* section[sectionAlert].entry ^slicing.discriminator[=].path = "resolve()"
* section[sectionAlert].entry ^slicing.ordered = false
* section[sectionAlert].entry ^slicing.rules = #open
* section[sectionAlert].entry ^short = "Varování"
* section[sectionAlert].entry ^definition = "Informace zde uvedené musí být stručné a výstižné. Musí obsahovat jednoduchou charakteristiku příčiny nebo důvodu varování, jeho povahu a úroveň varování (stupeň naléhavosti)."
* section[sectionAlert].entry contains
    flag 0.. MS
* section[sectionAlert].entry[flag] only Reference(CZ_Flag)
* section[sectionAlert].entry[flag] ^short = "Upozornění"
* section[sectionAlert].entry[flag] ^definition = "Upozornění"

* section[sectionAlert].entry contains
    detectedIssue 0.. MS
* section[sectionAlert].entry[detectedIssue] only Reference(DetectedIssue)
* section[sectionAlert].entry[detectedIssue] ^short = "Detekovaný problém"
* section[sectionAlert].entry[detectedIssue] ^definition = "Indicates an actual or potential clinical issue with or between one or more active or proposed clinical actions for a patient; e.g. Drug-drug interaction, Ineffective treatment frequency, Procedure-condition conflict, etc. "

* section[sectionAlert].entry contains
    riskAssessment 0.. MS
* section[sectionAlert].entry[riskAssessment] only Reference(RiskAssessment)
* section[sectionAlert].entry[riskAssessment] ^short = "Risk assessment"
* section[sectionAlert].entry[riskAssessment] ^definition = "An assessment of the likely outcomes for a patient or other subject as well as the likelihood of each outcome."


// * section[sectionProblems] ^extension.url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-explicit-type-name"
// * section[sectionProblems] ^extension.valueString = "Section"
// * section[sectionProblems] ^short = "IPS Problems Section"
// * section[sectionProblems] ^definition = "The IPS problem section lists and describes clinical problems or conditions currently being monitored for the patient."
// * section[sectionProblems].title 1.. MS
// * section[sectionProblems].code = $loinc#11450-4
// * section[sectionProblems].entry 1.. MS
// * section[sectionProblems].entry only Reference(Condition or DocumentReference)
// * section[sectionProblems].entry ^slicing.discriminator[0].type = #profile
// * section[sectionProblems].entry ^slicing.discriminator[=].path = "resolve()"
// * section[sectionProblems].entry ^slicing.rules = #open
// * section[sectionProblems].entry ^short = "Clinical problems or conditions currently being monitored for the patient."
// * section[sectionProblems].entry ^definition = "It lists and describes clinical problems or conditions currently being monitored for the patient.  This entry shall be used to document that no information about problems is available, or that no relevant problems are known."
// * section[sectionProblems].entry[problem] only Reference(ConditionUvIps)
// * section[sectionProblems].entry[problem] ^sliceName = "problem"
// * section[sectionProblems].entry[problem] ^mustSupport = true

// -------------------------------------
// History of Procedures Section 0 … 1
// -------------------------------------
* section contains sectionProceduresHx ..1 MS
* section[sectionProceduresHx] ^extension.url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-explicit-type-name"
* section[sectionProceduresHx] ^extension.valueString = "Section"
* section[sectionProceduresHx] ^short = "HDR Historical Procedures Section"
* section[sectionProceduresHx] ^definition = "Významné výkony provedené před hospitalizací, jejichž výsledek ovlivňuje možnosti a způsoby poskytování zdravotní péče nebo může ovlivnit diagnostické metody (jejich proveditelnost a hodnocení)."
* section[sectionProceduresHx].title 1.. MS
* section[sectionProceduresHx].title = "Významné výkony"
* section[sectionProceduresHx].code 1..
* section[sectionProceduresHx].code = $loinc#47519-4
* section[sectionProceduresHx].text 1..
* section[sectionProceduresHx].text only Narrative
* section[sectionProceduresHx].emptyReason ..0
* section[sectionProceduresHx].emptyReason ^mustSupport = false
* section[sectionProceduresHx].section 0..0  // no sub-section
* section[sectionProceduresHx].section ^mustSupport = false

* section[sectionProceduresHx].entry 1..
* section[sectionProceduresHx].entry only Reference(Procedure)  //or DocumentReference
* section[sectionProceduresHx].entry ^slicing.discriminator[0].type = #type
* section[sectionProceduresHx].entry ^slicing.discriminator[=].path = "resolve()"
* section[sectionProceduresHx].entry ^slicing.ordered = false
* section[sectionProceduresHx].entry ^slicing.rules = #open
* section[sectionProceduresHx].entry ^short = "Předchozí významné výkony"
* section[sectionProceduresHx].entry ^definition = "Významné předchozí výkony, jejichž výsledek ovlivňuje možnosti a způsoby poskytování zdravotní péče nebo může ovlivnit diagnostické metody (jejich proveditelnost a hodnocení)."
* section[sectionProceduresHx].entry contains
    procedure 0.. MS
* section[sectionProceduresHx].entry[procedure] only Reference(CZ_Procedure)
* section[sectionProceduresHx].entry[procedure] ^short = "Významné výkony"
* section[sectionProceduresHx].entry[procedure] ^definition = "Významné výkony v anamnéze."

// -------------------------------------
// Immunizations Section 0 … 1
// -------------------------------------
* section contains sectionImmunizations 0..1 MS

* section[sectionImmunizations] ^extension.url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-explicit-type-name"
* section[sectionImmunizations] ^extension.valueString = "Section"
* section[sectionImmunizations] ^short = "HDR Immunizations Section/ Historie očkování"
* section[sectionImmunizations] ^definition = "The Immunizations Section defines a patient's current immunization status and pertinent immunization history.\r\nThe primary use case for the Immunization Section is to enable communication of a patient's immunization status.\r\nThe section includes the current immunization status, and may contain the entire immunization history that is relevant to the period of time being summarized."
* section[sectionImmunizations].title 1.. MS
* section[sectionImmunizations].code = $loinc#11369-6
* section[sectionImmunizations].entry 1.. MS
* section[sectionImmunizations].entry only Reference(Immunization or DocumentReference)
* section[sectionImmunizations].entry ^slicing.discriminator[0].type = #type
* section[sectionImmunizations].entry ^slicing.discriminator[=].path = "resolve()"
* section[sectionImmunizations].entry ^slicing.ordered = false
* section[sectionImmunizations].entry ^slicing.rules = #open
* section[sectionImmunizations].entry ^short = "HDR immunization"
* section[sectionImmunizations].entry ^definition = "HDR Immunization entry"
* section[sectionImmunizations].entry contains
    immunization 0.. MS
* section[sectionImmunizations].entry[immunization] only Reference(cz-immunization)


// * section[sectionMedicalDevices] ^extension.url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-explicit-type-name"
// * section[sectionMedicalDevices] ^extension.valueString = "Section"
// * section[sectionMedicalDevices] ^short = "IPS Medical Devices Section"
// * section[sectionMedicalDevices] ^definition = "The medical devices section contains narrative text and coded entries describing the patient history of medical device use."
// * section[sectionMedicalDevices].title 1.. MS
// * section[sectionMedicalDevices].code = $loinc#46264-8
// * section[sectionMedicalDevices].entry 1.. MS
// * section[sectionMedicalDevices].entry only Reference(DeviceUseStatement or DocumentReference)
// * section[sectionMedicalDevices].entry ^slicing.discriminator[0].type = #profile
// * section[sectionMedicalDevices].entry ^slicing.discriminator[=].path = "resolve()"
// * section[sectionMedicalDevices].entry ^slicing.rules = #open
// * section[sectionMedicalDevices].entry ^short = "Patient history of medical device use."
// * section[sectionMedicalDevices].entry ^definition = "It describes the patient history of medical device use. This entry shall be used to document that no information about medical device use is available, or that no relevant medical device use is known."
// * section[sectionMedicalDevices].entry[deviceStatement] only Reference(DeviceUseStatementUvIps)
// * section[sectionMedicalDevices].entry[deviceStatement] ^sliceName = "deviceStatement"
// * section[sectionMedicalDevices].entry[deviceStatement] ^mustSupport = true
// * section[sectionResults] ^extension.url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-explicit-type-name"
// * section[sectionResults] ^extension.valueString = "Results Section"
// * section[sectionResults] ^short = "IPS Results Section"
// * section[sectionResults] ^definition = "This section assembles relevant observation results collected on the patient or produced on in-vitro biologic specimens collected from the patient. Some of these results may be laboratory results, others may be anatomic pathology results, others, radiology results, and others, clinical results."
// * section[sectionResults].title 1.. MS
// * section[sectionResults].code = $loinc#30954-2
// * section[sectionResults].entry 1.. MS
// * section[sectionResults].entry only Reference(Observation or DiagnosticReport or DocumentReference)
// * section[sectionResults].entry ^slicing.discriminator[0].type = #type
// * section[sectionResults].entry ^slicing.discriminator[=].path = "resolve()"
// * section[sectionResults].entry ^slicing.discriminator[+].type = #profile
// * section[sectionResults].entry ^slicing.discriminator[=].path = "resolve()"
// * section[sectionResults].entry ^slicing.rules = #open
// * section[sectionResults].entry ^short = "Relevant observation results collected on the patient or produced on in-vitro biologic specimens collected from the patient."
// * section[sectionResults].entry ^definition = "Relevant observation results collected on the patient or produced on in-vitro biologic specimens collected from the patient. Some of these results may be laboratory results, others may be anatomic pathology results, others, radiology results, and others, clinical results."
// * section[sectionResults].entry[results-observation] only Reference(ObservationResultsUvIps)
// * section[sectionResults].entry[results-observation] ^sliceName = "results-observation"
// * section[sectionResults].entry[results-observation] ^mustSupport = true
// * section[sectionResults].entry[results-diagnosticReport] only Reference(DiagnosticReportUvIps)
// * section[sectionResults].entry[results-diagnosticReport] ^sliceName = "results-diagnosticReport"
// * section[sectionResults].entry[results-diagnosticReport] ^mustSupport = true
// * section[sectionVitalSigns] ^extension.url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-explicit-type-name"
// * section[sectionVitalSigns] ^extension.valueString = "Vital Signs Section"
// * section[sectionVitalSigns] ^label = "Vital signs"
// * section[sectionVitalSigns] ^short = "IPS Vital Signs Section"
// * section[sectionVitalSigns] ^definition = "The Vital signs section includes blood pressure, body temperature, heart rate, and respiratory rate. It may also include other clinical findings, such as height, weight, body mass index, head circumference, and pulse oximetry. In particular, notable vital signs or physical findings such as the most recent, maximum and/or minimum, baseline, or relevant trends may be included"
// * section[sectionVitalSigns].title 1..
// * section[sectionVitalSigns].code = $loinc#8716-3
// * section[sectionVitalSigns].entry only Reference(Observation or DocumentReference)
// * section[sectionVitalSigns].entry ^slicing.discriminator[0].type = #profile
// * section[sectionVitalSigns].entry ^slicing.discriminator[=].path = "resolve()"
// * section[sectionVitalSigns].entry ^slicing.rules = #open
// * section[sectionVitalSigns].entry ^short = "Notable vital signs or physical findings."
// * section[sectionVitalSigns].entry ^definition = "Notable vital signs or physical findings as: blood pressure, body temperature, heart rate, and respiratory rate. It may also include other clinical findings, such as height, weight, body mass index, head circumference, and pulse oximetry. In particular, notable vital signs or physical findings such as the most recent, maximum and/or minimum, baseline, or relevant trends may be included"
// * section[sectionVitalSigns].entry[vitalSign] only Reference($vitalsigns)
// * section[sectionVitalSigns].entry[vitalSign] ^sliceName = "vitalSign"
// * section[sectionPastIllnessHx] ^extension.url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-explicit-type-name"
// * section[sectionPastIllnessHx] ^extension.valueString = "Section"
// * section[sectionPastIllnessHx] ^short = "IPS History of Past Illness Section"
// * section[sectionPastIllnessHx] ^definition = "The History of Past Illness section contains a description of the conditions the patient suffered in the past."
// * section[sectionPastIllnessHx].title 1..
// * section[sectionPastIllnessHx].code = $loinc#11348-0
// * section[sectionPastIllnessHx].entry 1..
// * section[sectionPastIllnessHx].entry only Reference(Condition or DocumentReference)
// * section[sectionPastIllnessHx].entry ^slicing.discriminator[0].type = #profile
// * section[sectionPastIllnessHx].entry ^slicing.discriminator[=].path = "resolve()"
// * section[sectionPastIllnessHx].entry ^slicing.rules = #open
// * section[sectionPastIllnessHx].entry ^short = "Conditions the patient suffered in the past."
// * section[sectionPastIllnessHx].entry ^definition = "It contains a description of the conditions the patient suffered in the past."
// * section[sectionPastIllnessHx].entry[pastProblem] only Reference(ConditionUvIps)
// * section[sectionPastIllnessHx].entry[pastProblem] ^sliceName = "pastProblem"
// * section[sectionFunctionalStatus] ^extension.url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-explicit-type-name"
// * section[sectionFunctionalStatus] ^extension.valueString = "Section"
// * section[sectionFunctionalStatus] ^short = "IPS Functional Status"
// * section[sectionFunctionalStatus] ^definition = "The functional status section shall contain a narrative description of capability of the patient to perform acts of daily living, including possible needs of the patient to be continuously assessed by third parties. The invalidity status may in fact influence decisions about how to administer treatments.\r\nProfiles to express disabilities and functional assessments will be specified by future versions of this guide."
// * section[sectionFunctionalStatus].title 1..
// * section[sectionFunctionalStatus].code = $loinc#47420-5
// * section[sectionFunctionalStatus].entry only Reference(Condition or ClinicalImpression or DocumentReference)
// * section[sectionFunctionalStatus].entry ^slicing.discriminator[0].type = #profile
// * section[sectionFunctionalStatus].entry ^slicing.discriminator[=].path = "resolve()"
// * section[sectionFunctionalStatus].entry ^slicing.rules = #open
// * section[sectionFunctionalStatus].entry ^short = "Optional entry used to represent disabilities and functional assessments"
// * section[sectionFunctionalStatus].entry ^definition = "It describes capabilities of the patient to perform acts of daily living, including possible needs of the patient to be continuously assessed by third parties. The invalidity status may in fact influence decisions about how to administer treatments.\r\nProfiles to express disabilities and functional assessments will be specified by future versions of this guide."
// * section[sectionFunctionalStatus].entry[disability] only Reference(ConditionUvIps)
// * section[sectionFunctionalStatus].entry[disability] ^sliceName = "disability"
// * section[sectionFunctionalStatus].entry[functionalAssessment] only Reference(ClinicalImpression)
// * section[sectionFunctionalStatus].entry[functionalAssessment] ^sliceName = "functionalAssessment"
// * section[sectionPlanOfCare] ^extension.url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-explicit-type-name"
// * section[sectionPlanOfCare] ^extension.valueString = "Section"
// * section[sectionPlanOfCare] ^short = "IPS Plan of Care Section"
// * section[sectionPlanOfCare] ^definition = "The plan of care section contains a narrative description of the expectations for care including proposals, goals, and order requests for monitoring, tracking, or improving the condition of the patient."
// * section[sectionPlanOfCare].title 1..
// * section[sectionPlanOfCare].code = $loinc#18776-5
// * section[sectionPlanOfCare].entry only Reference(CarePlan or DocumentReference)
// * section[sectionPlanOfCare].entry ^slicing.discriminator[0].type = #profile
// * section[sectionPlanOfCare].entry ^slicing.discriminator[=].path = "resolve()"
// * section[sectionPlanOfCare].entry ^slicing.rules = #open
// * section[sectionPlanOfCare].entry ^short = "Optional entry used to represent structured care plans"
// * section[sectionPlanOfCare].entry ^definition = "Dynamic, personalized plan including identified needed healthcare activity, health objectives and healthcare goals, relating to one or more specified health issues in a healthcare process [Source EN ISO 13940]"
// * section[sectionPlanOfCare].entry[carePlan] only Reference(CarePlan)
// * section[sectionPlanOfCare].entry[carePlan] ^sliceName = "carePlan"
// * section[sectionSocialHistory] ^extension.url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-explicit-type-name"
// * section[sectionSocialHistory] ^extension.valueString = "Section"
// * section[sectionSocialHistory] ^short = "IPS Social History Section"
// * section[sectionSocialHistory] ^definition = "The social history section contains a description of the person’s Health related \"lifestyle factors\" or \"lifestyle observations\" (e.g. smoke habits; alcohol consumption; diets, risky habits.)"
// * section[sectionSocialHistory].title 1..
// * section[sectionSocialHistory].code = $loinc#29762-2
// * section[sectionSocialHistory].entry only Reference(Observation or DocumentReference)
// * section[sectionSocialHistory].entry ^slicing.discriminator[0].type = #profile
// * section[sectionSocialHistory].entry ^slicing.discriminator[=].path = "resolve()"
// * section[sectionSocialHistory].entry ^slicing.rules = #open
// * section[sectionSocialHistory].entry ^short = "Health related \"lifestyle factors\" or \"lifestyle observations\" (e.g. smoke habits; alcohol consumption; diets, risky habits.)"
// * section[sectionSocialHistory].entry ^definition = "Description of the person’s Health related “lifestyle factors\" or \"lifestyle observations\" (e.g. smoke habits; alcohol consumption; diets, risky habits.)"
// * section[sectionSocialHistory].entry contains
//     smokingTobaccoUse 0..1 and
//     alcoholUse 0..1
// * section[sectionSocialHistory].entry[smokingTobaccoUse] only Reference(ObservationTobaccoUseUvIps)
// * section[sectionSocialHistory].entry[alcoholUse] only Reference(ObservationAlcoholUseUvIps)
// * section[sectionPregnancyHx] ^extension.url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-explicit-type-name"
// * section[sectionPregnancyHx] ^extension.valueString = "Section"
// * section[sectionPregnancyHx] ^short = "IPS History of Pregnancy Section"
// * section[sectionPregnancyHx] ^definition = "The history of pregnancy section shall contain information about whether the patient is currently pregnant or not.\r\nIt may contain addition summarizing information about the outcome of earlier pregnancies."
// * section[sectionPregnancyHx].title 1..
// * section[sectionPregnancyHx].code = $loinc#10162-6
// * section[sectionPregnancyHx].entry only Reference(Observation or DocumentReference)
// * section[sectionPregnancyHx].entry ^slicing.discriminator[0].type = #profile
// * section[sectionPregnancyHx].entry ^slicing.discriminator[=].path = "resolve()"
// * section[sectionPregnancyHx].entry ^slicing.rules = #open
// * section[sectionPregnancyHx].entry ^short = "Current pregnancy status and, optionally, information about the outcome of earlier pregnancies."
// * section[sectionPregnancyHx].entry ^definition = "It contains information about whether the patient is currently pregnant or not.\r\nIt may contain addition summarizing information about the outcome of earlier pregnancies."
// * section[sectionPregnancyHx].entry[pregnancyStatus] only Reference(ObservationPregnancyStatusUvIps)
// * section[sectionPregnancyHx].entry[pregnancyStatus] ^sliceName = "pregnancyStatus"
// * section[sectionPregnancyHx].entry[pregnancyOutcomeSummary] only Reference(ObservationPregnancyOutcomeUvIps)
// * section[sectionPregnancyHx].entry[pregnancyOutcomeSummary] ^sliceName = "pregnancyOutcomeSummary"

* section contains sectionAdvanceDirectives 0..1 MS
* section[sectionAdvanceDirectives] ^extension.url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-explicit-type-name"
* section[sectionAdvanceDirectives] ^extension.valueString = "Section"
* section[sectionAdvanceDirectives] ^short = "HDR Advance Directives Section"
* section[sectionAdvanceDirectives] ^definition = "The advance directives section contains a information of patient's advance directive."
* section[sectionAdvanceDirectives].title 1..
* section[sectionAdvanceDirectives].code = $loinc#42348-3
* section[sectionAdvanceDirectives].entry only Reference(Consent or DocumentReference)
* section[sectionAdvanceDirectives].entry ^slicing.discriminator[0].type = #profile
* section[sectionAdvanceDirectives].entry ^slicing.discriminator[=].path = "resolve()"
* section[sectionAdvanceDirectives].entry ^slicing.rules = #open
* section[sectionAdvanceDirectives].entry ^short = "Narrative description of the patient's advance directive."
* section[sectionAdvanceDirectives].entry ^definition = "Contains a narrative description or a Consent entry with information about the patient's advance directive."
* section[sectionAdvanceDirectives].entry contains
    advanceDirectivesConsent 1.. MS
* section[sectionAdvanceDirectives].entry[advanceDirectivesConsent] ^sliceName = "advanceDirectivesConsent"
* section[sectionAdvanceDirectives].entry[advanceDirectivesConsent] only Reference(Consent)  // TODO: Create CZ Consent
