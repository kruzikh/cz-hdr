// -------------------------------------------------------------------------------
//  Logical Model				hdr-subject.fsh
// -------------------------------------------------------------------------------
Logical: Subjekt
Id: subjekt
Title: "Subjekt (A1.1 - A1.2)"
Description:  """Pacient nebo jiný subjekt"""
* identifikace 1..1 BackboneElement "A.1.1 Identifikace pacienta/subjektu" """A.1.1 Identifikace pacienta/subjektu"""
* identifikace.krestni 1..* string "A.1.1.1 Křestní jméno" """Křestní jméno pacienta/subjektu"""
* identifikace.prijmeni 1..* string "A.1.1.2 Příjmení" """Příjmení pacienta/subjektu """
* identifikace.datumNarozeni 1..1 dateTime "A.1.1.3 Datum narození" """Datum, případně i čas narození"""
* identifikace.identifikator 1..* Identifier "A.1.1.4 Identifikátor pacienta" """Typ identifikátoru a identifikátor osoby. Identifikátor musí být unikátní v rámci daného typu identifikátoru. Povinné je zadání alespoň jednoho  národního či mezinárodního identifikátoru (rodné číslo, číslo pasu a pod.) """
* identifikace.statniObcanstvi 0..* CodeableConcept "A.1.1.5 Státní občanství" """Státní občanství dle zákona 186/2013. Státní občanství jak je uváděno na oficiálních dokladech k prokázání identity. """
* identifikace.uredniPohlavi 1..1 CodeableConcept "A.1.1.6 Administrativní pohlaví" """Úřední/administrativní pohlaví (pohlaví uváděné v dokladech pro úřední účely).
Biologické pohlaví pacienta, které může být odlišné od pohlaví administrativního může být vedeno v jiných částech zdravotnické dokumentace. """
* kontaktniInformace 0..1 BackboneElement "A.1.2 Kontaktní informace pacienta/subjektu" """Kontaktní informace pacienta/subjektu"""
* kontaktniInformace.adresa 0..* Address "A.1.2.1 Address" """Mailing and home or office addresses. The addresses are always sequences of address parts (e.g. street address line, country, ZIP code, city) even if postal address formats may vary depending on the country. An address may or may not include a specific use code; if this attribute is not present it is assumed to be the default address useful for any purpose. - Preferred system(s):  ISO 3166"""
* kontaktniInformace.telecom 0..* ContactPoint "A.1.2.2 Telecom" """Telecommunication contact information (addresses) associated to a person. Multiple telecommunication addresses might be provided. - Preferred system(s): """
//* kontaktníInformace.preferovanýLékař 0..*
//--- END
//--- END
//--- END










// -------------------------------------------------------------------------------
//  Map to FHIR R4
// -------------------------------------------------------------------------------
Mapping: Subject2Fhir
Id: fhir
Title: "CZ HDR Subject model to FHIR R4 Map"
Source: subjekt
Target: "hl7.org/fhir/r4"

* -> "Patient.conformsTo('https://ncez.mzcr.cz/standards/fhir/ig/core/StructureDefinition/cz-patient')"
* identifikace -> "Patient"
* identifikace.krestni -> "Patient.name.given"
* identifikace.prijmeni -> "Patient.name.family"
* identifikace.datumNarozeni -> "Patient.birthDate"
* identifikace.identifikator -> "Patient.identifier"
* identifikace.statniObcanstvi -> "Patient.nationality"
* identifikace.uredniPohlavi -> "Patient.gender"
* kontaktniInformace -> "Patient.address"
* kontaktniInformace.adresa -> "Patient.address"
* kontaktniInformace.telecom -> "Patient.telecom"
// --END
// --END
