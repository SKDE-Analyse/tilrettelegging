/***********************************************************************************************
************************************************************************************************
MACRO FOR KONVERTERING AV STRINGER TIL NUMERISK, DATO OG TID

Innhold:
1.1 Omkoding av stringer med tall til numeriske variable. KomNr og PID.
1.2 Konvertering av stringer til dato- og tidsvariable
1.3 Fjerner blanke felt og punktum i stringvariable, samt ny navngiving
1.4 Dropliste og variable lables

************************************************************************************************
***********************************************************************************************/

%Macro Konvertering (Utdatasett=, Inndatasett=);
Data &Utdatasett;
Drop gyldig: TilSted FraSted omsorgsniva henv: ;  
Set &Inndatasett;
where kontakt in (4,5);


/*
********************************************************
1.1 Omkoding av stringer med tall til numeriske variable
********************************************************
*/



/*Gjenbruk av variabelnavn*/
PID=lnr+0;



KomNr=KomNrHjem2+0;

bydel_org=bydel;
drop bydel;
bydel=.;




/*
*******************************************************
1.2 Konvertering av stringer til dato- og tidsvariable
*******************************************************
*/
	/*Datoer*/
	Inndato1=Input(Inndato,Anydtdte10.);
	Utdato1=Input(Utdato,Anydtdte10.);
	
	

	Format Inndato1 Utdato1 Eurdfdd10.;
	Drop Inndato UtDato  ;
	rename Inndato1=Inndato Utdato1=UtDato; 


if utdato lt MDY (1,1,2010) then utdato = .;
if utdato gt MDY (1,1,2016) then utdato = .;

/*
**********************************************************************************************************************
1.3 	Fjerner blanke felt og punktum i stringvariable, samt ny navngiving. For 2014 navnes dup_tilstand til Tdiag.
**********************************************************************************************************************;


/*Fjerner punktum i diagnosekoder'/
/*Ous har rapportert enkelte diagnosekoder med punktum, eks.'C50.9' */
if substr(tilstand_1_1,4,1)='.' then substr(tilstand_1_1,4,1)=' '; 
if substr(tilstand_1_2,4,1)='.' then substr(tilstand_1_2,4,1)=' '; 

Tilstand_1_1=compress(Tilstand_1_1,,'s'); /*Fjerner space*/
Tilstand_1_2=compress(Tilstand_1_2,,'s');

/*Fjerner komma etter diagnosekoden'*/
if substr(tilstand_1_1,5,1)=',' then substr(tilstand_1_1,5,1)=' ';
Tilstand_1_1=compress(Tilstand_1_1,,'s'); /*Fjerner space*/

array Tilstand_{9} $
	tilstand_2_1 tilstand_3_1 tilstand_4_1 tilstand_5_1 tilstand_6_1 tilstand_7_1 tilstand_8_1 tilstand_9_1 tilstand_10_1;
		do i=1 to 9;
               if substr(tilstand_{i},4,1)='.' then substr(tilstand_{i},4,1)=' '; 
			   Tilstand_{i}= compress(tilstand_{i},,'s');
    	end;

/*Fjerner blanke felt i diagnosevariable, justerer til stor forbokstav (propcase) og navner om til hdiag/bdiag.*/
Hdiag=upcase(compress(Tilstand_1_1));
Hdiag2=upcase(compress(Tilstand_1_2));

array Bdiag{9} $
    Bdiag1-Bdiag9 ;

array Tilstand{9} $
	tilstand_2_1 tilstand_3_1 tilstand_4_1 tilstand_5_1 tilstand_6_1 tilstand_7_1 tilstand_8_1 tilstand_9_1 tilstand_10_1;
		do i=1 to 9;
               Bdiag{i}=upcase(compress(Tilstand{i}));
		
    	end;
drop tilstand_1_1 tilstand_1_2 tilstand_2_1 tilstand_3_1 tilstand_4_1 tilstand_5_1 tilstand_6_1 tilstand_7_1 tilstand_8_1 tilstand_9_1 tilstand_10_1 i; 


/*Fjerner blanke felt i prosedyrevariable, og fjerner underscore (_) i variabelnavn*/
array ncsp{10} $ ncsp1-ncsp10;
array ncsp_{10} $ ncsp_1-ncsp_10;
          do i=1 to 10;
               ncsp{i}=upcase(compress(ncsp_{i}));
          end;
drop ncsp_: i; 

array ncmp{10} $ ncmp1-ncmp10;
array ncmp_{10} $ ncmp_1-ncmp_10;
          do i=1 to 10;
               ncmp{i}=upcase(compress(ncmp_{i}));
          end;
drop ncmp_: i; 


/*Fjerner blanke felt i takstvariable, og navner om til Normaltariff1-15*/
array Normaltariff{15} $
	Normaltariff1-Normaltariff15;
array takst_{15} $
	takst_:;
          do i=1 to 15;
               Normaltariff{i}=compress(takst_{i});
			   Normaltariff{i}=lowcase(Normaltariff{i});
			   Normaltariff{i}=propcase(Normaltariff{i});
          end;
drop takst_: i;
Tell_normaltariff = Tell_takst;
drop tell_takst;

/*Dup_tilstand er fem variabler som samler usorterte diagnoser for 25545 kontakter i 2014. Disse er er identifisert med "dupli" som Hdiag. Navner om til Tdiag.*/

if aar = 2014 then do;
	array Tdiag{5} $
 	   Tdiag1-Tdiag5;

	array Dup_Tilstand{5} $
		Dup_tilstand_1 - Dup_tilstand_5;
			do i=1 to 5;
               Tdiag{i}=upcase(compress(Dup_Tilstand{i}));
 	   		end;
	drop Dup_tilstand_1 - Dup_tilstand_5 i; 
end;


/*
*************************************************
1.4 Dropliste og variable lables
*************************************************
*/
Drop lnr  ;

run;
%Mend Konvertering;
