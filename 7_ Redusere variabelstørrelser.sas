
/**********************************************************************
***********************************************************************
	6.1	Redusere lengde på variable
***********************************************************************
**********************************************************************/


%macro reduser_lengde(innDataSett=, utDataSett=);

data &utDataSett;
set &innDataSett;

length ncmp: $6;
length ncsp: $6;
length cyto_: $6; 

length bohf borhf boshhn fylke 3;
length bydel 6;
length hdiag hdiag2 $6;
length bdiag: $5;
length tdiag: $5;
length hdiag3tegn $3;
length aar 3;
length ald_gr: 3;
length ErMann 3;
length fodselsar 4;
length ICD10Kap: 3;
length innmateHast kjonn kontaktType 3;
length inndato utdato KomNr 4;
length institusjonID  6;
length NPRId_reg stedAktivitet 3;
length tell_: 3;
length pid 5;
length versjon $6;
format KoblingsID 32.;


run;

%mend reduser_lengde;





