[![Build Status](https://travis-ci.org/SKDE-Analyse/tilrettelegging.svg?branch=master)](https://travis-ci.org/SKDE-Analyse/tilrettelegging)
[![Dokumentasjon](https://img.shields.io/badge/Dokumentasjon--grey.svg)](https://skde-analyse.github.io/tilrettelegging)

# **FLYTTET TIL https://github.com/SKDE-Analyse/sas_codes**  

# SAS-koder for tilrettelegging av NPR-data

## Kjøre tilretteleggingen av NPR-data

Først må makro-filene inkluderes i prosjektet:

```
%let kodebane = \\hn.helsenord.no\unn-avdelinger\skde.avd\Analyse\Data\SAS\Tilrettelegging\saskoder\npr\;

%include "&kodebane.Formater.sas";

%include "&kodebane.1_Macro-Konvertering_og_stringrydding.sas";
%include "&kodebane.2_Macro-Bo_og_behandler.sas";
%include "&kodebane.3_Macro-ICD10.sas";
%include "&kodebane.4_Macro-Ovrige_avledede_variable.sas";
%include "&kodebane.5_Macro-Lage_unik_ID.sas";
%include "&kodebane.6_Macro-Labler_og_formater.sas";
%include "&kodebane.7_Macro-Redusere_variabelstorrelser.sas";
%include "&kodebane.8_Macro-Dele_datasett.sas";
```

Så inkluderes kjørefilen (da kjøres alle makroene):

```
%include "&kodebane.Kjoring_av_macroer.sas";
```

## Kjøre tilrettelegging av innbyggertall fra SSB

Følgende kode ble kjørt for å legge til innbyggertallene 1. januar 2018:
```
%let kodebane = \\hn.helsenord.no\unn-avdelinger\skde.avd\Analyse\Data\SAS\Tilrettelegging\saskoder\ssb\;
%include "&kodebane.lesSSBdata.sas";

%lesSSBdata(aar=2018, utdata = bydel, bydel = 1);

%lesSSBdata(aar=2018, utdata = kommune, bydel = 0);

data innbygg.innb_2004_2017_bydel_allebyer;
set innbygg.innb_2004_2016_bydel_allebyer kommune bydel;
run;
```

Se ellers [SKDE-dokumentasjon](https://skde-analyse.github.io/dokumentasjon/tilrettelegging-av-data.html#tilrettelegging-av-innbyggertall-fra-ssb).



## Linker til dokumentasjon av de ulike filene

- [npr/1_Macro-Konvertering_og_stringrydding.sas](1_Macro-Konvertering_og_stringrydding)
- [npr/2_Macro-Bo_og_behandler.sas](2_Macro-Bo_og_behandler)
- [npr/3_Macro-ICD10.sas](3_Macro-ICD10)
- [npr/4_Macro-Ovrige_avledede_variable.sas](4_Macro-Ovrige_avledede_variable)
- [npr/5_Macro-Lage_unik_ID.sas](5_Macro-Lage_unik_ID)
- [npr/6_Macro-Labler_og_formater.sas](6_Macro-Labler_og_formater)
- [npr/7_Macro-Redusere_variabelstorrelser.sas](7_Macro-Redusere_variabelstorrelser)
- [npr/8_Macro-Dele_datasett.sas](8_Macro-Dele_datasett)
- Filen Formater.sas er ikke dokumentert.
- Filen Kjoring_av_macroer.sas er ikke dokumentert.
- [ssb/lesSSBdata.sas](lesSSBdata)
