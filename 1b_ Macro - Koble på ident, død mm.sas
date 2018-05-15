/* Kobler først på variablene emigrert og dodDato fra egen fil */

/* Merge med sql */

%Macro Merge_dod_emigrert_ident (innDataSett=, utDataSett=);

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

%Mend Merge_dod_emigrert_ident;
