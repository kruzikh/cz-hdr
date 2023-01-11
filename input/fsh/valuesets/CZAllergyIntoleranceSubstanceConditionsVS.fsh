ValueSet: CZ_AllergyIntoleranceSubstanceConditionsVS
Id: cz-allergy-intolerance-substance-condition-vs
Title: "Czech national Allergy Intolerance value set"
Description: "This value set currently includes the codes for allergy or intolerance findings from eHDSI value set maintained by MyHealth@EU project. This value set includes codes from the SNOMED International Patient Set (IPS) subset of SNOMED CT (IPS Free Set) that are included in: descendants of 373873005 \\|Pharmaceutical / biologic product (product)\\|; descendants of 105590001 \\|Substance (substance)\\|; descendants of 418038007 \\|Propensity to adverse reactions to substance (finding)\\|."
* ^date = "2022-11-19T14:31:00+01:00"
* ^publisher = "NCEZ"
* ^jurisdiction = $m49.htm#CZE
* ^immutable = false
* ^copyright = "The SNOMED International IPS Terminology is distributed by International Health Terminology Standards Development Organisation, trading as SNOMED International, and is subject the terms of the [Creative Commons Attribution 4.0 International Public License](https://creativecommons.org/licenses/by/4.0/). For more information, see [SNOMED IPS Terminology](https://www.snomed.org/snomed-ct/Other-SNOMED-products/international-patient-summary-terminology)"
* include codes from system http://snomed.info/sct|http://snomed.info/sct/900000000000207008
    where constraint = "(< 373873005 |Pharmaceutical / biologic product (product)| OR < 105590001 |Substance (substance)| OR < 418038007 |Propensity to adverse reactions to substance (finding)|) AND ^ 816080008 |International Patient Summary (foundation metadata concept)|"
