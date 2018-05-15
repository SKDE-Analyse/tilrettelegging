
/**********************************************************************
***********************************************************************
	7.2	Fordele de tilrettelagte variablene i to datasett
***********************************************************************
**********************************************************************/


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




