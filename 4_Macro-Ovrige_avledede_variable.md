
# Dokumentasjon for filen *npr/4_Macro-Ovrige_avledede_variable.sas*

************************************************************************************************
MACRO FOR AVLEDEDE VARIABLE

Innhold i macroen:
	4.1 Retting av ugyldig fÃ¸dselsÃ¥r og avleding av aldersgrupper
	4.2 Definisjon av Alder, Ald_gr og Ald_gr5
	4.3 Omkoding av KJONN til ErMann 
	4.5 DRGTypeHastegrad

************************************************************************************************
********************************************************
4.1 Retting av ugyldig fÃ¸dselsÃ¥r
*********************************************************
I datasettet er det registrert 27 personer over 110 Ã¥r, som er hÃ¸yeste oppnÃ¥dde alder for bosatte i Norge i denne perioden, jfr. 
Wikipedias kronologiske liste over eldste levende personer i Norge siden 1964 (http:
//no.wikipedia.org/wiki/Liste_over_Norges_eldste_personer#Kronologisk_liste_over_eldste_levende_personer_i_Norge_siden_01.01.1964).
HÃ¸yeste alder i datasetett er 141 Ã¥r. Feilaktig hÃ¸y alder kan pÃ¥virke gjennomsnittsalder i smÃ¥ strata. Velger derfor Ã¥ definere 
alder som ugyldig nÃ¥r oppgitt alder er hÃ¸yere enn eldste person registret i Norge pÃ¥ dette tidspunktet.

Satte opprinnelig et krav om at personene mÃ¥tte vÃ¦re bosatt i Norge, ettersom det er her vi har tall for eldste nÃ¥levende personer.
Dette innebÃ¦rer imidlertid at mange opphold for personer bosatt i utlandet med alder over 110 Ã¥r, og en sÃ¦rlig opphopning rundt 
Ã¥rstallet 1899 (som kan mistenkes vÃ¦re brukt som missing-verdi.Velger derfor ogsÃ¥ Ã¥ nullstille alder for utenlandske borgere etter 
