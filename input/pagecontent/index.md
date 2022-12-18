**Propouštěcí zpráva (PZ)** je jednou ze základních součástí zdravotnické dokumentace.

Propouštěcí zpráva slouží především **k řízenému, cílenému předávání informací, vztahujících se k dané hospitalizaci, nezbytných pro zajištění kontinuity péče**.

### Informace o projektu
Tato implementační specifikace byla vypracována v rámci národního projektu interoperability MZČR.

### Účel dokumentu
Tato implementační specifikace určuje způsob reprezentace propouštěcí zprávy pomocí standardu HL7 FHIR.

Alternativní reprezentací propouštěcí zprávy je standard [DASTA](https://www.dastacr.cz/dasta/start.htm).

Vzhledem k rozhodnutí ukončit do roku 2027 další rozvoj a podporu standardu DASTA, doporučujeme všem implementátorům přechod k mezinárodnímu standardu HL7 FHIR.

### Rozsah specifikace
Tato implementační specifikace vychází z dokumentu **Funkční specifikace propouštěcí zprávy**, který stanovuje základní požadavky, obsah a strukturu propouštěcí zprávy.

Návrh řeší základní aspekty lékařských propouštěcích zpráv (včetně zpráv předběžných) při propuštění ze všech typů zařízení lůžkové péče; všeobecných nemocnic, psychiatrických nemocnic; specializovaných lůžkových zařízení nebo zdravotnických zařízení, která vydávají dokument, který lze považovat za propouštěcí zprávu.

Data set zahrnuje pouze ty části propouštěcích zpráv, které jsou společné pro všechny obory. Implementační specifikace v současnosti neobsahuje specializované části potřebné pro některé velmi specifické situace, např. porod. Tyto oborově specifické část by měly být postupně doplněny v navazujících projektech, bude-li to shledáno jako nutné.

Následující obrázek vyjadřuje základní informační bloky propouštěcí zprávy.

{% include img.html img="PZ-composition.png" caption="Obrázek 1: Obsah propouštěcí zprávy" width="70%" %}

### Souvislosti s dalšími specifikacemi

Propouštěcí zpráva obsahuje řadu obecných datových bloků, které jsou využitelné také v dalších typech zdravotnické dokumentace jako je pacientský souhrn, ambulantní zpráva apod.

{% include dependency-table.xhtml %}

### Cross Version Analysis

{% include cross-version-analysis.xhtml %}

### Global Profiles

{% include globals-table.xhtml %}
