### Vyjádření stavu "známá nepřítomenost" a "není znám"

V souladu s přístupem použitým pro implementační specifikaci IPS CDA požadujeme, aby u vybraných sekcí byly výrazy „známá nepřítomnost“ a „není znám“ výslovně uplatněny v jednotlivých položkách dotčeného zdroje (resource) a nikoli pomocí atributu emptyReason v sekci.

Toto pravidlo platí pro následující povinné sekce:
* Alergie a intolerance (Allergies and Intolerances)
* Souhrn medikace (Medication Summary)
* Klinický souhrn

V ostatních případech může být stav „neznámé“ nebo „žádné informace“ buď výslovně uveden (jak je uvedeno výše), nebo může být vynechán.

### Must Support (MS)

Implementace profilů dle specifikace propouštěcí zprávy (PZ):
* MUSÍ naplnit všechny hodnoty elementů označených jako MS
* MUSÍ být schopny zpracovávat instance zdrojů obsahující datové elementy označené jako "MS", včetně prvků s chybějícími daty, aniž by došlo k chybě nebo k selhání aplikace.
* BY MĚLY umět zobrazit datové elementy "MS" koncovému uživateli nebo je zpracovat (např. uložit) pro jiné účely.

Implementátoři propouštěcí zprávy dle této specifikace:
* MUSÍ být schopni implementovat všechny profily označené "MS" v profilu CZ_CompositionHdr

##### Volitelné datové elementy mustSupport (kardinalita 0..1 nebo 0..*)

<p>Pokud zdrojový systém vytvářející propouštěcí zprávu neobsahuje potřebná data, nebo se autor propouštěcí zprávy tato data rozhodl neuvést a jde o datové elementy označené v PZ specifikaci jako volitelné, pak daný datový element nebude vytvořen.</p>

##### Požadované datové elementy mustSupport (kardinalita 1..1 nebo 1..*)
<p>Pokud systém vytvářející propouštěcí zprávu nemá požadovaná data k dispozici, musí být uveden důvod, proč data nejsou uvedena, a to následujícícm způsobem:</p>

1.  Pro *non-coded* datové elementy se použije [Data Absent Reason Extension](http://hl7.org/fhir/extension-data-absent-reason.html) v datovém typu.

    Příklad: Instance zdroje "Patient" u něhož není známo datum narození (protože je element birthDate primitivní datový typ, je extenze aplikována na element _birthDate). Ostatní požadované elementy zdroje Patient nejsou v tomto zjednodušeném příkladu zobrazeny (jsou zobrazeny jako ...).

    ~~~
    {
      "resourceType" : "Patient",
      ...
      "_birthDate": {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/StructureDefinition/data-absent-reason",
            "valueCode" : "unknown"
          }
        ]
      },
      ...
    }
    ~~~

2. Pro *coded* datové elementy:
   - *example*, *preferred*, or *extensible* binding (CodeableConcept datatypes):
      - pokud zdrojový systém obsahuje pouze textovou informaci a neobsahuje kódovaná data, použije se pouze element text.
      - pokud není ve zdrojovém systému ani textová ani kódovaná informace:
        - použije se vhodný kódovaný koncept vyjadřující výjimku, pokud v asociovaném číselníku existuje
        - použije se vhodný koncept z číselníku [Data Absent Reason Code System](http://hl7.org/fhir/extension-data-absent-reason.html), a to pouze pokud nelze opužít postup v předchozím bodě.
   - *required* binding (CodeableConcept or code datatypes):
      - použije se "exceptional" koncept z předepsaného číselníku