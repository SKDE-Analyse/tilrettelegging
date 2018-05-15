/***********************************************************************************************
************************************************************************************************
MACRO FOR FORMATER OG LABLER

Innhold:
4.1 Labler og formater
4.2 Dropper variable
************************************************************************************************
***********************************************************************************************/

%Macro Formater (Utdatasett=, Inndatasett=);
Data &Utdatasett;
Set &Inndatasett;




/*	
********************************
4.1	Legger på labels og formater
********************************
*/
label Alder='Alder (SKDE)';
/*label Ald_gr5 ='Aldersgruppe 5 kategorier (SKDE)'; format Ald_gr5 Ald_5gr.; */
/*label ald_gr='Aldersgruppe (NPR)'; format ald_gr ald_gr.; */
label BoHF='Opptaksområde (HF) (SKDE)'; format BoHF boHF_kort.; 
label BoRHF='Opptaksområde (RHF) (SKDE)'; format BoRHF boRHF.; 
label BoShHN='Opptaksområde (sykehus HN) (SKDE)';format BoShHN boshHN.; 
label erMann='Er mann (kjønn, mann=1) (SKDE)'; format ErMann ErMann.; 
label kjonn='Kjønn (NPR-melding)'; format kjonn kjonn.; 
label Fylke='Fylke (pasientens bosted) (SKDE)'; format Fylke fylke.; 
label innmateHast='Hastegrad ved ankomst (NPR-melding)'; 
label innDato='Innskrivelsesdato (NPR-melding)';
label utDato='Utskrivelsesdato (NPR-melding)';
label InstitusjonID='Org.nr. til rapporteringsenhet (NPR-melding)'; format InstitusjonId InstitusjonId.;
label KomNR='Kommunenummer vasket mot Folkeregisteret, numerisk (NPR-melding/SKDE)'; 
label bydel='Bydel vasket mot Folkeregisteret (NPR-melding/SKDE)'; format bydel bydel.; 
label Hdiag='Hovedtilstand kode 1 (NPR-melding)';
label Hdiag2='Hovedtilstand kode 2 (NPR-melding)';
label Hdiag3tegn='Hovedtilstand kode 1, 3 tegn (SKDE)'; *format Hdiag3tegn icd3tegn.; 
label Bdiag1='Bitilstand kode 1 (NPR-melding)';
label Bdiag2='Bitilstand kode 2 (NPR-melding)';
label Bdiag3='Bitilstand kode 3 (NPR-melding)';
label Bdiag4='Bitilstand kode 4 (NPR-melding)';
label Bdiag5='Bitilstand kode 5 (NPR-melding)';
label Bdiag6='Bitilstand kode 6 (NPR-melding)';
label Bdiag7='Bitilstand kode 7 (NPR-melding)';
label Bdiag8='Bitilstand kode 8 (NPR-melding)';
label Bdiag9='Bitilstand kode 9 (NPR-melding)';
format Hdiag: Bdiag: $icd_2015F.;
label ncmp1='NCMP kode 1 (NPR-melding)'; label ncmp2='NCMP kode 2 (NPR-melding)'; 
label ncmp3='NCMP kode 3 (NPR-melding)'; label ncmp4='NCMP kode 4 (NPR-melding)';
label ncmp5='NCMP kode 5 (NPR-melding)'; label ncmp6='NCMP kode 6 (NPR-melding)'; 
label ncmp7='NCMP kode 7 (NPR-melding)'; label ncmp8='NCMP kode 8 (NPR-melding)';
label ncmp9='NCMP kode 9 (NPR-melding)'; label ncmp10='NCMP kode 10 (NPR-melding)'; 
format NCMP: $NCMP_2015F.;
label ncsp1='NCSP kode 1 (NPR-melding)'; label ncsp2='NCSP kode 2 (NPR-melding)'; label ncsp3='NCSP kode 3 (NPR-melding)';
label ncsp4='NCSP kode 4 (NPR-melding)'; label ncsp5='NCSP kode 5 (NPR-melding)'; label ncsp6='NCSP kode 6 (NPR-melding)'; 
label ncsp7='NCSP kode 7 (NPR-melding)'; label ncsp8='NCSP kode 8 (NPR-melding)'; label ncsp9='NCSP kode 9 (NPR-melding)'; 
label ncsp10='NCSP kode 10 (NPR-melding)'; 
format NCSP: $NCSP_2015F.;
Label PID="Personentydig løpenummer, numerisk (NPR)"; 
label NPRId_reg='Status for kobling mot ident-melding (NPR)';format NPRId_reg NPRId_reg.;
label tell_ICD10='Antall ICD-10-koder innrapportert (NPR)';
label tell_NCMP='Antall NCMP-koder innrapportert (NPR)';
label tell_NCSP='Antall NCSP-koder innrapportert (NPR)';
label tell_ATC='Antall ATC-koder innrapportert (NPR)';
label tell_Normaltariff='Antall normaltariff-koder innrapportert (NPR)';
label fodselsar='Fødselsår';
label ICD10Kap='ICD-10-kapittel';
label ICD10KatBlokk='ICD-10-kategoriblokk';
label fag='Fagområde 2011-2014';
label fagLogg='Fagområde 2015';
label fag_SKDE='Fagområde, harmonisert 2011-2015 (SKDE)'; format FAG_SKDE FAG_SKDE.;
label SpesialistKomHN='Kommunenummer for avtalespesialistens praksis';
label AvtSpesKomHN='Kontakt med avtalespesialist i HN';
label AvtSpes='Kontakt med avtalespesialist';
label AvtRHF='RHFet spesialisten har avtale med';
label Normaltariff1='Normaltariff kode 1'; label Normaltariff2='Normaltariff kode 2';
label Normaltariff3='Normaltariff kode 3'; label Normaltariff4='Normaltariff kode 4';
label Normaltariff5='Normaltariff kode 5'; label Normaltariff6='Normaltariff kode 6';
label Normaltariff7='Normaltariff kode 7'; label Normaltariff8='Normaltariff kode 8';
label Normaltariff9='Normaltariff kode 9'; label Normaltariff10='Normaltariff kode 10';
label Normaltariff11='Normaltariff kode 11'; label Normaltariff12='Normaltariff kode 12';
label Normaltariff13='Normaltariff kode 13'; label Normaltariff14='Normaltariff kode 14';
label Normaltariff15='Normaltariff kode 15';
label Tdiag1='Diagnose som ikke kan sorteres i H/Bi kode 1'; label Tdiag2='Diagnose som ikke kan sorteres i H/Bi kode 2';
label Tdiag3='Diagnose som ikke kan sorteres i H/Bi kode 3'; label Tdiag4='Diagnose som ikke kan sorteres i H/Bi kode 4';
label Tdiag5='Diagnose som ikke kan sorteres i H/Bi kode 5';
label tilSted='Til sted (NPK)'; format tilsted tilsted.;
label debitor='Debitor (NPR-melding)'; format debitor debitor.;

label ATC_1='ATC kode 1 (ATC/NPR-melding)'; 
label ATC_2='ATC kode 2 (ATC/NPR-melding)'; 
label ATC_3='ATC kode 3 (ATC/NPR-melding)'; 
label ATC_4='ATC kode 4 (ATC/NPR-melding)'; 
label ATC_5='ATC kode 5 (ATC/NPR-melding)';

label ulikt_kjonn='Ulikt kjønn i innrapportert data og i f.nr./D-nr.)';
/*	
*******************
4.2	Dropper variable
*******************
*/

drop tell_takst;




run;

%mend formater;

