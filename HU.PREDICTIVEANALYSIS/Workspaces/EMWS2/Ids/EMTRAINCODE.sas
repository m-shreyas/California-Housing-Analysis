*------------------------------------------------------------*;
* Data Source Setup;
*------------------------------------------------------------*;
libname EMWS2 "\\uisnutvdiprof1a\redirected$\smupp\Documents\HU.PREDICTIVEANALYSIS\Workspaces\EMWS2";
*------------------------------------------------------------*;
* Ids: Creating DATA data;
*------------------------------------------------------------*;
data EMWS2.Ids_DATA (label="")
/ view=EMWS2.Ids_DATA
;
set HUDATA.HOUSING_20_TRAIN;
run;
