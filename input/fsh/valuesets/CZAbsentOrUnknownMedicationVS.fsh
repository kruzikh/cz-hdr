ValueSet: CZ_AbsentOrUnknownMedicationVS
Id: cz-absent-or-unknown-medications-vs
Title: "Absent or Unknown Medication (IPS)"
Description: "Absent or Unknown Medication"
* ^meta.profile = "http://hl7.org/fhir/StructureDefinition/shareablevalueset"
* ^identifier.use = #official
//* ^identifier.system = "http://art-decor.org/ns/oids/vs"
//* ^identifier.value = "2.16.840.1.113883.11.22.15"
* ^status = #active
* ^experimental = false
* ^publisher = "NCEZ"
* ^contact.name = "NCEZ"
* ^contact.telecom[0].system = #phone
* ^contact.telecom[=].value = "+420 "
* ^contact.telecom[+].system = #email
* ^contact.telecom[=].value = "ncez@mzcr.cz"
* ^immutable = false
* ^copyright = "Produced by HL7 under the terms of HL7® Governance and Operations Manual relating to Intellectual Property (Section 16), specifically its copyright, trademark and patent provisions. This document is licensed under Creative Commons 'No Rights Reserved' (CC0)."
* AbsentAndUnknownDataUvIps#no-medication-info "Žádné informace o medikaci"
* AbsentAndUnknownDataUvIps#no-known-medications "Žádná známá medikace"