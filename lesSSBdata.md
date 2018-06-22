
# Dokumentasjon for filen *ssb/lesSSBdata.sas*


## Makro `lesSSBdata`

Makro for å lese Excel-fil med innbyggertall fra SSB

Følgende må gjøres før denne makroen kjøres
1. Last ned data fra SSB som *Semikolonseparert med overskrift (csv)*.
2. Åpne csv-fil i Excel
  - Fjern i to øverste radene
  - Erstatt `kjønn` med `kjonn` og `Personer ÅÅÅÅ` med `Personer`
  - Sjekk at fanen heter `Personer`
  - Lagre som `xlxs`-fil med navnet `Innb20XX_bydel` eller `Innb20XX_kommune` i mappen `Analyse\Data\SAS\Tilrettelegging\Innbyggere`.

Makroen gjør følgende:
- Leser fanen `Personer` fra filen `Innb&aar._bydel` (hvis `bydel ne 0`) eller `Innb&aar._kommune` (hvis `bydel = 0`).
- Konverterer variablene fra *character* til *numeric*. 
- Lagrer et sas-datasett med navnet `&utdata`.
