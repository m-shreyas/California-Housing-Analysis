*------------------------------------------------------------*;
* Data Source Setup;
*------------------------------------------------------------*;
libname EMWS2 "\\uisnutvdiprof1a\redirected$\smupp\Documents\HU.PREDICTIVEANALYSIS\Workspaces\EMWS2";
*------------------------------------------------------------*;
* Ids2: Creating DATA data;
*------------------------------------------------------------*;
data EMWS2.Ids2_DATA (label="")
/ view=EMWS2.Ids2_DATA
;
set HUDATA.HOUSING_80_TRAIN;
run;
