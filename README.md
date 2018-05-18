# SAS-koder for tilrettelegging av NPR-data


## Kj�re tilretteleggingen

F�rst m� makro-filene inkluderes i prosjektet:

```

%let kodebane = \\hn.helsenord.no\unn-avdelinger\skde.avd\Analyse\Data\SAS\Tilrettelegging\Somatikk\koder\;

%include "&kodebane.Formater.sas";

%include "&kodebane.1_ Macro - Konvertering og stringrydding.sas";
%include "&kodebane.2_ Macro - Bo og behandler.sas";
%include "&kodebane.3_ Macro - ICD10.sas";
%include "&kodebane.4_ Macro - �vrige avledede variable.sas";
%include "&kodebane.5_ Lage unik ID.sas";
%include "&kodebane.6_ Macro - Labler og formater.sas";
%include "&kodebane.7_ Redusere variabelst�rrelser.sas";
%include "&kodebane.8_ Dele datasett.sas";

```

S� inkluderes kj�refilen (da kj�res alle makroene):

```
%include "&kodebane.Kj�ring av macroer.sas";
```

