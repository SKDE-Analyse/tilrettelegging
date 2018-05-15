/**********************************************************************
***********************************************************************
	6.	Fordele de tilrettelagte variablene i to datasett
***********************************************************************
**********************************************************************/

/* Kobler først på variablene emigrert og dodDato fra egen fil */

/* Merge med sql */

%Macro Merge_dod_emigrert (innDataSett=, utDataSett=);

proc sql;
create table &utDataSett as
select &innDataSett..*, emigrertDato, dodDato, fodselsAar_ident09052017, fodt_mnd_ident09052017, kjonn_ident09052017
from &innDataSett left join NPR_skde.T17_doed_NyEmigrert_kjonn_faar
on &innDataSett..pid=T17_doed_NyEmigrert_kjonn_faar.pid;
quit; 

data &utDataSett;
set &innDataSett;
label emigrertDato='Emigrert dato - per 20170509 (NPR)';
label dodDato='Dødedato - per 20170509 (NPR)';
label fodselsAar_ident09052017='Fødselsår fra f.nr. ved siste kontakt med spes.helsetjenesten';
label fodt_mnd_ident09052017='Fødselsmåned fra f.nr. ved siste kontakt med spes.helsetjenesten';
label kjonn_ident09052017='Kjønn fra f.nr. ved siste kontakt med spes.helsetjenesten';
length DodDato emigrertdato 4;
run;

%Mend Merge_dod_emigrert;

%Macro Splitte (innDataSett=, utDataSettEN=,utDataSettTO=);
Data &UtdatasettEN;
retain aar pid inndato utdato ErMann alder koblingsID komnr bydel bohf borhf borhf boshhn hdiag hdiag2 hdiag3tegn bdiag1-bdiag9 ncmp1-ncmp10 ncsp1-ncsp10 ; 
set &Inndatasett;
keep 
Alder
AvtSpes
Bdiag:
BoHF
BoRHF
BoShHN
Bydel
DodDato
Episodefag
ErMann
Fylke
Hdiag
Hdiag2
Hdiag3tegn
ICD10Kap
Inndato
InstitusjonId
KoblingsID
KomNr
NPRId_reg
Normaltariff:
PID
SpesialistKomHN
Tdiag:
Utdato
aar
episodeFag
fag_skde
fodselsar
ncmp:
ncsp:
Komplett
AvtaleRHF
;
run;


Data &UtdatasettTO;
set &Inndatasett;
keep	
ATC:
KoblingsID
/*Ald_gr5*/
EmigrertDato
ICD10KatBlokk
/*Pas_system*/
/*ald_gr*/
bydel2
ErMann
Fag
fagLogg
hjemmelstr
innmateHast
kjonn
komnrHjem2
kontakt
kontaktType
stedAktivitet
tell:
TilSted
/*polIndir*/
/*polkonAktivitet*/
AvtSpesKomHN
debitor
fodselsAar_ident09052017
fodt_mnd_ident09052017
kjonn_ident09052017
ulikt_kjonn

;
run;

%Mend Splitte;




