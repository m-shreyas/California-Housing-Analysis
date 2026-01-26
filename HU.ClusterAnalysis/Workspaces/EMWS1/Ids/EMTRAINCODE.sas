*------------------------------------------------------------*;
* Data Source Setup;
*------------------------------------------------------------*;
libname EMWS1 "C:\Users\skunt\Downloads\HU.Exploratory Analysis\HU.ClusterAnalysis\Workspaces\EMWS1";
*------------------------------------------------------------*;
* Ids: Creating DATA data;
*------------------------------------------------------------*;
data EMWS1.Ids_DATA (label="")
/ view=EMWS1.Ids_DATA
;
set HUDATA.EM_SAVE_TRAIN;
run;
