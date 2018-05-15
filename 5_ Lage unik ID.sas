/***********************************************************************************************
************************************************************************************************
5. MACRO FOR Å KOBLINGS_ID 

************************************************************************************************
***********************************************************************************************/


%macro KoblingsID (innDataSett=, utDataSett=);



proc sort data=&innDataSett;
by PID inndato utdato;
run;

data &utDataSett;
set &innDataSett;
by PID InnDato Utdato;


If aar = 2016 then do;
count +1;
KoblingsID = count + 1731600000000;
end;


If aar = 2015 then do;
count +1;
KoblingsID = count + 1731500000000;
end;

If aar = 2014 then do;
count +1;
KoblingsID = count + 1731400000000;
end;


If aar = 2013 then do;
count +1;
KoblingsID = count + 1731300000000;
end;

If aar = 2012 then do;
count +1;
KoblingsID = count + 1731200000000;
end;


run;

%mend KoblingsID;

