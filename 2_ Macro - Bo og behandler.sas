
/***********************************************************************************************
************************************************************************************************
MACRO FOR BOVARIABLE

Innhold:
2.1 Numerisk kommunenummer og bydel (for Oslo, Stavanger, Bergen og Trondheim)
2.2 Boområder
	BoShHN - Opptaksområder for lokalsykehusene i Helse Nord
	BoHF - Opptaksområder for helseforetakene
	BoRHF - Opptaksområder for RHF'ene
	Fylke
2.3	Vertskommuner i Helse Nord
	SpesialistkommunerHN
2.4 Spesialistenes avtale-RHF 

************************************************************************************************
***********************************************************************************************/

%Macro Bo_beh (Utdatasett=, Inndatasett=);
Data &Utdatasett;
Set &Inndatasett;

/*
********************************************************
2.1 Numerisk kommunenummer og bydel etter SSB-modell med kommunenummer først (for Oslo, Stavanger, Bergen og Trondheim)
********************************************************
*/

bydel2_num=bydel2+0;
/* Oslo */
if komNr=0301 and bydel2_num=01 then bydel=030101; /* Gamle Oslo */
if komNr=0301 and bydel2_num=02 then bydel=030102; /* Grünerløkka */
if komNr=0301 and bydel2_num=03 then bydel=030103; /* Sagene */
if komNr=0301 and bydel2_num=04 then bydel=030104; /* St. Hanshaugen */
if komNr=0301 and bydel2_num=05 then bydel=030105; /* Frogner */
if komNr=0301 and bydel2_num=06 then bydel=030106; /* Ullern */
if komNr=0301 and bydel2_num=07 then bydel=030107; /* Vestre Aker */
if komNr=0301 and bydel2_num=08 then bydel=030108; /* Nordre Aker */
if komNr=0301 and bydel2_num=09 then bydel=030109; /* Bjerke */
if komNr=0301 and bydel2_num=10 then bydel=030110; /* Grorud */
if komNr=0301 and bydel2_num=11 then bydel=030111; /* Stovner */
if komNr=0301 and bydel2_num=12 then bydel=030112; /* Alna */
if komNr=0301 and bydel2_num=13 then bydel=030113; /* Østensjø */
if komNr=0301 and bydel2_num=14 then bydel=030114; /* Nordstrand */
if komNr=0301 and bydel2_num=15 then bydel=030115; /* Søndre Nordstrand */
if komNr=0301 and bydel2_num=16 then bydel=030116; /* Sentrum */
if komNr=0301 and bydel2_num=17 then bydel=030117; /* Marka */
if komNr=0301 and bydel2_num=. then bydel=030199; /* Uoppgitt bydel Oslo */


/* Stavanger */
if komNr=1103 and bydel2_num=01 then bydel=110301; /* Hundvåg */
if komNr=1103 and bydel2_num=02 then bydel=110302; /* Tasta */
if komNr=1103 and bydel2_num=03 then bydel=110303; /* Eiganes/Våland */
if komNr=1103 and bydel2_num=04 then bydel=110304; /* Madla */
if komNr=1103 and bydel2_num=05 then bydel=110305; /* Storhaug */
if komNr=1103 and bydel2_num=06 then bydel=110306; /* Hillevåg */
if komNr=1103 and bydel2_num=07 then bydel=110307; /* Hinna */
if komNr=1103 and bydel2_num=. then bydel=110399; /* Uoppgitt bydel Stavanger */


/* Bergen */
if komNr=1201 and bydel2_num=01 then bydel=120101; /* Arna */
if komNr=1201 and bydel2_num=02 then bydel=120102; /* Bergenhus */
if komNr=1201 and bydel2_num=03 then bydel=120103; /* Fana */
if komNr=1201 and bydel2_num=04 then bydel=120104; /* Fyllingsdalen */
if komNr=1201 and bydel2_num=05 then bydel=120105; /* Laksevåg */
if komNr=1201 and bydel2_num=06 then bydel=120106; /* Ytrebygda */
if komNr=1201 and bydel2_num=07 then bydel=120107; /* Årstad */
if komNr=1201 and bydel2_num=08 then bydel=120108; /* Åsane */
if komNr=1201 and bydel2_num=. then bydel=120199; /* Uoppgitt bydel Bergen */

/* Trondheim */
if komNr=1601 and bydel2_num=01 then bydel=160101; /* Midtbyen */
if komNr=1601 and bydel2_num=02 then bydel=160102; /* Østbyen */
if komNr=1601 and bydel2_num=03 then bydel=160103; /* Lerkendal */
if komNr=1601 and bydel2_num=04 then bydel=160104; /* Heimdal */
if komNr=1601 and bydel2_num=. then bydel=160199; /* Uoppgitt bydel Trondheim */





/*
********************************************************
2.2 Boområder
********************************************************
*/


if KomNr in (1901/*Harstad*/,1915 /*Bjarkøy*/) then KomNr=1903 /*Harstad*/; 
if KomNr in (1723/*Mosvik*/,1729 /*Inderøy*/) then KomNr=1756 /*Inderøy*/; 

/*Ukjente kommunenummer*/
if KomNr in (0,8888,9999) then KomNr=9999; 


/*BoShHN - Opptaksområder for lokalsykehusene i Helse Nord*/
If KomNr>1800 then do;
if KomNr in (2002,2003,2023,2024,2025,2027,2028,2030) then BoShHN=1;
else if KomNr in (2004,2011,2012,2014,2015,2017,2018,2019,2020,2021,2022) then BoShHN=2;
else if KomNr in (1902,1922,1924,1925,1926,1927,1928,1929,1931,1933,1936,1938,1939,1940,1941,1942,1943) then BoShHN=3;
else if KomNr in (1851,1852,1903,1911,1913,1917) then BoShHN=4;
else if KomNr in (1805,1853,1854,1919,1920,1923) then BoShHN=5;
else if KomNr in (1866,1867,1868,1870,1871) then BoShHN=6;
else if KomNr in (1859,1860,1865,1874) then BoShHN=7;
else if KomNr in (1804,1837,1838,1839,1840,1841,1845,1848,1849,1850,1856,1857) then BoShHN=8;
else if KomNr in (1828,1832,1833,1836) then BoShHN=9;
else if KomNr in (1824,1825,1826) then BoShHN=10;
else if KomNr in (1811,1812,1813,1815,1816,1818,1820,1822,1827,1834,1835) then BoShHN=11;
end;
/*BoHF - Opptaksområder for helseforetakene*/
	If KomNr>1800 then do;
If BoShHN in (1,2) then BoHF=1;
else If BoShHN in (3,4,5) then BoHF=2;
else If BoShHN in (6,7,8) then BoHF=3;
else If BoShHN in (9,10,11,12) then BoHF=4;
	end;
	If KomNr<1800 then do;
if KomNr in (1632,1633,1702,1703,1711,1714,1717,1718,1719,1721,1724,1725,1736,1738,1739,1740,1742,1743,1744,1748,1749,1750,1751,1755,1756) then BoHF=6;
else if KomNr in (1567,1601,1612,1613,1617,1620,1621,1622,1624,1627,1630,1634,1635,1636,1638,1640,1644,1648,1653,1657,1662,1663,1664,1665) then BoHF=7;
else if KomNr in (1502,1504,1505,1511,1514,1515,1516,1517,1519,1520,1523,1524,1525,1526,1528,1529,1531,1532,1534,1535,1539,1543,1545,1546,1547,1548,1551,
1554,1557,1560,1563,1566,1571,1573,1576) then BoHF=8;
else if KomNr in (1401,1411,1412,1413,1416,1417,1418,1419,1420,1421,1422,1424,1426,1428,1429,1430,1431,1432,1433,1438,1439,1441,1443,1444,1445,1449) then BoHF=10;
else if KomNr in (1201,1233,1234,1235,1238,1241,1242,1243,1244,1245,1246,1247,1251,1252,1253,1256,1259,1260,1263,1264,1265,1266) then BoHF=11;
else if KomNr in (1106,1134,1135,1145,1146,1149,1151,1160,1211,1216,1219,1221,1222,1223,1224,1227,1228,1231,1232) then BoHF=12;
else if KomNr in (1101,1102,1103,1111,1112,1114,1119,1120,1121,1122,1124,1127,1129,1130,1133,1141,1142,1144) then BoHF=13;
else if KomNr in (101,104,105,106,111,118,119,122,123,124,125,127,128,135,136,137,138) then BoHF=14;
else if KomNr in (121,211,213,214,215,216,217,221,226,227,228,229,230,231,233,234,235,237,238,239) then BoHF=15;
		
else if KomNr in (236,402,403,412,415,417,418,419,420,423,425,426,427,428,429,430,432,434,436,437,438,439,441,501,502,511,512,513,514,515,516,517,519,520,521,
522,528,529,533,534,536,538,540,541,542,543,544,545) then BoHF=19;
else if KomNr in (219,220,532,602,604,605,612,615,616,617,618,619,620,621,622,623,624,625,626,627,628,631,632,633,711,713) then BoHF=20;
else if KomNr in (701,702,704,706,709,714,716,719,720,722,723,728) then BoHF=21;
else if KomNr in (805,806,807,811,814,815,817,819,821,822,826,827,828,829,830,831,833,834) then BoHF=22;
else if KomNr in (901,904,906,911,912,914,919,926,928,929,935,937,938,940,941,1001,1002,1003,1004,1014,1017,1018,1021,1026,1027,1029,1032,1034,1037,1046) then BoHF=23;
	end;
else if KomNr in (2100,2111,2121,2131,2211,2311,2321,9000,9900) then BoHF=24; /*24='Boomr utlandet/Svalbard' */
else if KomNr in(., 0000,8888,9999) then  BoHF=99; /*99='Ukjent/ugyldig kommunenr'*/
/*else If KomNr in (301) then do;*/
		If bydel in (030110,030111,030112) then BoHF=15;/*AHUS*/
          if bydel in (030108,030109,030113,030114,030115,030117,030199) then BoHF=16;/*OUS*/
          if bydel in (030101,030102,030103,030104,030116) then BoHF=17;/*Lovisenberg*/
          if bydel in (030105,030106,030107) then BoHF=18;/*Diakonhjemmet*/
	/*end;*/


/*BoRHF - Opptaksområder for RHF'ene*/
If BoHF in (1:4) then BoRHF=1;
else If BoHF in (6:8) then BoRHF=2;
else If BoHF in (10:13) then BoRHF=3;
else If BoHF in (14:23) then BoRHF=4;
else if BOHF in (24) then BoRHF=24; 
else if BoHF in (99) then BoRHF=99;

/*Fylke*/
if 101<=komnr<=138 then Fylke=1;
else if 211<=komnr<=239 then Fylke=2;
else if komnr=301 then Fylke=3;
else if 402<=komnr<=441 then Fylke=4;
else if 501<=komnr<=545 then Fylke=5;
else if 602<=komnr<=633 then Fylke=6;
else if 701<=komnr<=728 then Fylke=7;
else if 805<=komnr<=834 then Fylke=8;
else if 901<=komnr<=941 then Fylke=9;
else if 1001<=komnr<=1046 then Fylke=10;
else if 1101<=komnr<=1160 then Fylke=11;
else if 1201<=komnr<=1266 then Fylke=12;
else if 1401<=komnr<=1449 then Fylke=14;
else if 1502<=komnr<=1576 then Fylke=15;
else if 1601<=komnr<=1665 then Fylke=16;
else if 1702<=komnr<=1756 then Fylke=17;
else if 1804<=komnr<=1874 then Fylke=18;
else if 1901<=komnr<=1943 then Fylke=19;
else if 2002<=komnr<=2030 then Fylke=20;
if KomNr in (2100,2111,2121,2131,2211,2311,2321,9000,9900) then Fylke=24; /*24='Boomr utlandet/Svalbard' */
if KomNr in(., 0000,8888,9999) then  Fylke=99; /*99='Ukjent/ugyldig kommunenr'*/

/*
**************************************************************************
2.3 Definerer SpesialistKomHN og vertskommuner (Vertskommuner Helse Nord)
**************************************************************************
*/


if InstitusjonID in (707149) then SpesialistKomHN='1902';
else if  InstitusjonID in (706001) then SpesialistKomHN='2012';
else if  InstitusjonID in (113674) then SpesialistKomHN='1804';
else if  InstitusjonID in (113743) then SpesialistKomHN='1804';
else if  InstitusjonID in (113769) then SpesialistKomHN='1804';
else if  InstitusjonID in (113794) then SpesialistKomHN='1804';
else if  InstitusjonID in (113832) then SpesialistKomHN='1902';
else if  InstitusjonID in (113330) then SpesialistKomHN='1902';
else if  InstitusjonID in (113659) then SpesialistKomHN='1804';
else if  InstitusjonID in (113678) then SpesialistKomHN='1833';
else if  InstitusjonID in (706003) then SpesialistKomHN='2021';
else if  InstitusjonID in (113327) then SpesialistKomHN='1902';
else if  InstitusjonID in (113605) then SpesialistKomHN='1902';
else if  InstitusjonID in (113866) then SpesialistKomHN='2021';
else if  InstitusjonID in (113682) then SpesialistKomHN='1902';
else if  InstitusjonID in (113740) then SpesialistKomHN='1804';
else if  InstitusjonID in (113440) then SpesialistKomHN='1903';
else if  InstitusjonID in (113572) then SpesialistKomHN='1804';
else if  InstitusjonID in (113588) then SpesialistKomHN='1805';
else if  InstitusjonID in (113630) then SpesialistKomHN='1804';
else if  InstitusjonID in (113192) then SpesialistKomHN='1805';
else if  InstitusjonID in (113400) then SpesialistKomHN='1902';
else if  InstitusjonID in (113463) then SpesialistKomHN='1820';
else if  InstitusjonID in (113477) then SpesialistKomHN='1868';
else if  InstitusjonID in (4201135) then SpesialistKomHN='1804';
else if  InstitusjonID in (113594) then SpesialistKomHN='1868';
else if  InstitusjonID in (113744) then SpesialistKomHN='2012';
else if  InstitusjonID in (113784) then SpesialistKomHN='1902';
else if  InstitusjonID in (113908) then SpesialistKomHN='1868';
else if  InstitusjonID in (113223) then SpesialistKomHN='1804';
else if  InstitusjonID in (113306) then SpesialistKomHN='1902';
else if  InstitusjonID in (113366) then SpesialistKomHN='1902';
else if  InstitusjonID in (113542) then SpesialistKomHN='1805';
else if  InstitusjonID in (113587) then SpesialistKomHN='1804';
else if  InstitusjonID in (113597) then SpesialistKomHN='1902';
/* else if  InstitusjonID in (706002) then SpesialistKomHN='2012';*/
else if  InstitusjonID in (706002) then SpesialistKomHN='1902';/* Arnfinn 3/4-2018: Marco Filipponi holder til i Tromsø...*/
else if  InstitusjonID in (113653) then SpesialistKomHN='1813';
else if  InstitusjonID in (113656) then SpesialistKomHN='1902';
else if  InstitusjonID in (113701) then SpesialistKomHN='1833';
else if  InstitusjonID in (113756) then SpesialistKomHN='1804';
else if  InstitusjonID in (113761) then SpesialistKomHN='1804';
else if  InstitusjonID in (113785) then SpesialistKomHN='2020';
else if  InstitusjonID in (113792) then SpesialistKomHN='1841';
else if  InstitusjonID in (113799) then SpesialistKomHN='1902';
else if  InstitusjonID in (113857) then SpesialistKomHN='1824';
else if  InstitusjonID in (113862) then SpesialistKomHN='1870';
else if  InstitusjonID in (113863) then SpesialistKomHN='1860';
else if  InstitusjonID in (113890) then SpesialistKomHN='1902';
else if  InstitusjonID in (4208625) then SpesialistKomHN='1902';
else if  InstitusjonID in (4208629) then SpesialistKomHN='1804';
else if  InstitusjonID in (4208630) then SpesialistKomHN='1931';
else if  InstitusjonID in (4208690) then SpesialistKomHN='1870';
else if  InstitusjonID in (4209020) then SpesialistKomHN='2012';
else if  InstitusjonID in (4209420) then SpesialistKomHN='1841';
/*Supplert av PO 9/3 2017*/
else if  InstitusjonID in (4209470) then SpesialistKomHN='1804';
else if  InstitusjonID in (4208007) then SpesialistKomHN='1804';
else if  InstitusjonID in (4205450) then SpesialistKomHN='1902';
else if  InstitusjonID in (4205982) then SpesialistKomHN='2012';
else if  InstitusjonID in (113810) then SpesialistKomHN='1804';
else if  InstitusjonID in (113249) then SpesialistKomHN='1804';
else if  InstitusjonID in (113672) then SpesialistKomHN='1805';
else if  InstitusjonID in (113834) then SpesialistKomHN='2012';
/*Supplert av PO 7/7 2017*/
else if  InstitusjonID in (4211315) then SpesialistKomHN='1902'; /*Sandvik, Johan*/ /*Det ser ut til at han også jobber fra Bodø*/
else if  InstitusjonID in (4211824) then SpesialistKomHN='1833'; /*Stoll, Richard*/
else if  InstitusjonID in (4212778) then SpesialistKomHN='1902'; /*Stenklev, Niels Christian*/
else if  InstitusjonID in (4212875) then SpesialistKomHN='1902'; /*Bjarghov, Steinar*/
/*Supplert av Arnfinn 27/3 2018*/
else if  InstitusjonID in (4208245) then SpesialistKomHN='1902'; /* Henrik Tjälve */
else if  InstitusjonID in (4210478) then SpesialistKomHN='1805'; /* Trond Børvik (gitt som Trond Børlie fra NPR)*/

SpesKomHN = SpesialistKomHN +0;
Drop SpesialistKomHN;
Rename SpesKomHN=SpesialistKomHN;


If KomNr=SpesialistKomHN then AvtSpesKomHN=1;
else AvtSpesKomHN = .;



/*
************************************************************************************************
2.4 Spesialistenes avtale-RHF 
************************************************************************************************
*/
/*Egen numerisk variabel for avtaleRHF*/
If InstitusjonID in (113447,113672,113834,113298,113316,113330,113674,
113743,113769,113794,113832,706001,113659,113678,113327,113440,113605,113682,706003,
113740,113866,113572,113630,113588,113192,113249,113400,113463,113477,113594,113744,
113784,113810,113908,4201135,113223,113306,113366,113542,113587,113597,113653,113656,
113701,113756,113761,113785,113792,113799,113857,113862,113863,113890,706002,707149,
4205982,4205450,4208007,4208625,4208629,4208630,4208690,4209020,4209420,4209470,4212778,4212875,4211824,4211315) 
then AvtaleRHF=1;/* Helse Nord RHF*/

Else if institusjonID in (113239,113783,4201406,4204404,707150,113365,113767,4204399,
113333,113399,113926,4201240,4204111,4204397,4204398,4204400,113406,113420,113513,
113676,114504,113194,113531,113649,113776,113917,4201239,113788,113467,113581,113821,
113830,113898,706011,113266,113454,113495,113613,113758,113846,113867,113183,113260,
113474,113549,114431,113764,113706,114503,113638,113736,113259,113282,113612,706010,
113777,113212,113331,113351,113428,113498,113551,113553,113557,113680,113687,113698,
113884,113905,114436,706012,113157,113204,113221,113224,113296,113309,113332,113376,
113408,113419,113475,113518,113530,113543,113611,113689,113723,113840,113872,114432,
114433,114434,114435,4201238,113550,4204078,4204404,4204494,4208473,4208617,4208618,
4208886,4209007,4209071,4209427,4209475,4209476,4204495,4207590,4204399,
113926,4204111,4204397,4204398,4207591,4209530,4210005,4210250,4211897,4212297,4212812,4213021) 
Then AvtaleRHF=2;/*Helse Midt-Norge RHF*/


Else if institusjonID in (113574,113802,113912,4204368,4204369,4204370,4204372,113349,
4204219,4204490,4204371,4204373,4201202,114441,4204486,113808,4201203,4204367,113621,
113364,113324,113515,113196,113211,113228,113242,113297,113305,113424,113483,113585,
113669,113684,113729,113770,113778,113839,113923,114439,706000,113270,113441,113456,
113578,113628,113655,113722,113919,113173,113177,113182,113186,113199,113202,113227,
113236,113253,113303,113320,113340,113360,113375,113391,113397,113407,113414,113484,
113496,113527,113579,113702,113719,113725,113817,113847,113882,113886,113911,113913,
705990,113409,113685,113854,113861,113381,113523,113591,113705,113860,113907,114440,
113401,113321,113482,113679,113892,113274,113361,113377,113389,113478,113504,113512,
113519,113546,113554,113562,113568,113576,113595,113614,113634,113660,113683,113731,
113775,113793,113805,113826,113831,113859,113869,707139,113160,113161,113171,113176,
113275,113280,113343,113344,113379,113403,113415,113417,113437,113448,113453,113466,
113471,113476,113590,113618,113640,113641,113647,113681,113691,113694,113700,113750,
113765,113803,113811,113856,113891,114437,114438,705996,705997,707138,4201201,4204368,
4204369,4204370,4204372,4204490,4207801,4204485,4207418,4204371,4204373,4201202,4204219,
114441,4204486,4201203,4204367,4207370,4208550,4208589,4208632,4209005,4209395,4209399,
4209404,4209406,4209407,4209409,4209425,4209537,4209536,4210003,4210484,4212328,4212482,
4212844,4212850,4211306,4211802,4211805) then AvtaleRHF=3;/*Helse Vest RHF*/





Else if InstitusjonID in (4204492,113436,113721,113833,4204512,113175,113461,113563,
113665,113666,113885,4201197,4204356,113425,113816,113901,4201229,113451,113536,113870,
113560,113181,113818,113820,113243,113264,113537,113763,113800,113293,113607,4204160,
113234,113254,113313,113380,113433,113458,113468,113487,113490,113555,113623,113639,
113709,113728,113787,113804,113881,706532,113165,113188,113216,113257,113258,113272,113278,113372,
113385,113387,113410,113443,113470,113532,113552,113657,113686,113720,113737,113738,
113766,113801,113865,113879,113925,114409,706553,706554,707140,113213,113405,113533,
113753,113159,113167,113168,113172,113191,113200,113214,113217,113247,113248,113250,
113281,113301,113307,113312,113314,113317,113325,113350,113374,113383,113393,113396,
113398,113421,113422,113426,113429,113445,113459,113462,113508,113514,113520,113524,
113589,113592,113603,113604,113610,113631,113643,113664,113668,113692,113704,113708,
113712,113717,113745,113747,113754,113759,113771,113781,113815,113838,113853,113864,
113897,113910,113916,705976,705980,705982,706547,707143,707147,4201243,4201245,113178,
113179,113190,113209,113220,113262,113268,113277,113291,113295,113337,113352,113363,
113402,113423,113431,113446,113492,113502,113505,113522,113539,113540,113545,113548,
113558,113564,113599,113601,113635,113636,113637,113670,113695,113696,113715,113724,
113734,113806,113809,113836,113845,113883,113903,113918,113921,114411,114426,114427,
707142,707145,707159,4201236,113510,113197,113208,113222,113244,113290,113356,113394,
113469,113479,113480,113485,113526,113584,113828,113849,113851,113878,113888,113900,
114412,114423,705979,705985,705986,113231,113285,113506,113673,113850,706558,113358,
113411,113449,113499,113535,113606,113651,113699,113707,113742,113812,113813,113835,
113871,113880,113924,113156,113302,113315,113486,113538,113602,113757,113791,113894,
113909,114425,705987,113198,113261,113357,113412,113516,113571,113629,113633,113697,
113823,113896,114422,705988,707144,113184,113201,113347,113353,113521,113642,113762,
113844,113902,4201198,113914,113342,113439,113893,113166,113255,113288,113444,705983,
4201234,113162,113189,113215,113226,113229,113273,113279,113511,113556,113569,113617,
113626,113627,113650,113714,113726,113774,114408,4201230,4201231,113163,113354,113434,
113507,113547,113566,113648,113654,113658,113497,113768,113790,113164,113210,113218,
113319,113341,113517,113529,113615,113843,113876,114421,707141,113203,113225,113246,
113252,113263,113267,113269,113276,113284,113287,113289,113300,113311,113326,113328,
113329,113335,113345,113348,113362,113367,113368,113384,113388,113392,113413,113416,
113427,113450,113481,113493,113500,113503,113528,113534,113541,113561,113565,113570,
113575,113580,113586,113593,113596,113598,113600,113616,113619,113620,113622,113644,
113652,113671,113690,113703,113713,113727,113751,113752,113760,113773,113780,113786,
113796,113797,113798,113819,113825,113827,113855,113906,113915,113920,113922,114413,
114424,115014,705977,705984,707148,4201247,113158,113169,113170,113174,113180,113185,
113187,113205,113206,113207,113219,113230,113235,113237,113238,113240,113241,113245,
113251,113265,113271,113283,113286,113292,113294,113304,113310,113322,113323,113334,
113338,113339,113346,113355,113369,113370,113371,113373,113378,113382,113386,113390,
113395,113404,113430,113432,113438,113442,113452,113455,113460,113464,113465,113472,
113473,113488,113489,113491,113501,113509,113525,113559,113567,113573,113577,113582,
113608,113609,113624,113632,113645,113646,113661,113662,113663,113667,113675,113677,
113688,113693,113710,113711,113732,113733,113735,113739,113741,113746,113748,113755,
113772,113779,113782,113789,113795,113814,113822,113824,113829,113837,113841,113842,
113848,113852,113858,113868,113874,113875,113877,113887,113889,113895,114410,705978,
705981,707146,4201235,4201237,4201241,4201315,4207536,4201200,4201371,4204438,4207442,
4207841,4201246,4201233,4201406,4204119,4207428,4205054,4204354,4204355,4204437,
4207830,4201244,4204353,4201232,4201337,4201396,4201398,4204487,4204493,4207405,
4207829,4207840,4207906,4208003,706544,4201366,4204374,4207899,4208096,4208210,4208500,
4208593,4208594,4208595,4208596,4208597,4208598,4208599,4208600,4208601,4208659,4208660,
4208662,4208663,4208678,4208686,4208689,4208692,4208713,4208748,4208764,4208798,4208982,
4209002,4209003,4209004,4209070,4209396,4209397,4209398,4209400,4209402,4209403,4209411,
4209414,4209416,4209417,4209418,4209421,4209422,4209423,4209428,4209429,4209430,4209433,
4209442,4209444,4209503,4209504,4209505,4209506,4209507,4209526,4210128,4210130,4210131,
4210132,4210163,4210219,4210249,4210376,4210549,4210550,4210551,4210552,4210584,4210591,
4211931,4212202,4212206,4212207,4212208,4212209,4212286,4212298,4212425,4212440,4212595,
4212828,4212925,4212985,4210960,4211307,4211803,4211804,4211806,4211826) then AVtaleRHF=4; /*Helse Sør-Øst-RHF*/


/*Format AvtSpesKommHN SpesialistKomHN KomNr_Navn. ;*/
Format Bydel bydel.; 
Format BoShHN BoShHN.;
Format BoHF BoHF_kort.; 
Format Borhf Avtalerhf Borhf.;
Format Fylke Fylke.;



run;

%Mend Bo_beh;