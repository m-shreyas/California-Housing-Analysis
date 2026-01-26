*------------------------------------------------------------*;
* Clus3: Training;
*------------------------------------------------------------*;
*------------------------------------------------------------* ;
* Clus3: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    ocean_proximity(ASC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* Clus3: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    households housing_median_age latitude longitude median_house_value
   median_income population total_bedrooms total_rooms
%mend DMDBVar;
*------------------------------------------------------------*;
* Clus3: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=EMWS1.Filter_TRAIN
dmdbcat=WORK.Clus3_DMDB
maxlevel = 513
out=WORK.Clus3_DMDB
;
class %DMDBClass;
var %DMDBVar;
run;
quit;
*------------------------------------------------------------* ;
* Clus3: Interval Inputs Macro ;
*------------------------------------------------------------* ;
%macro DMVQINTERVAL;
    households housing_median_age latitude longitude median_house_value
   median_income population total_bedrooms total_rooms
%mend DMVQINTERVAL;
*------------------------------------------------------------* ;
* Clus3: Nominal Inputs Macro ;
*------------------------------------------------------------* ;
%macro DMVQNOMINAL;
    ocean_proximity
%mend DMVQNOMINAL;
*------------------------------------------------------------*;
* Clus3: Run DMVQ procedure;
*------------------------------------------------------------*;
title;
options nodate;
proc dmvq data=WORK.Clus3_DMDB dmdbcat=WORK.Clus3_DMDB std=STD nominal=GLM ordinal=RANK
;
input %DMVQINTERVAL / level=interval;
input %DMVQNOMINAL / level=nominal;
VQ maxc = 6 clusname=_SEGMENT_ CLUSLABEL="Segment Id" DISTLABEL="Distance";
MAKE outvar=EMWS1.Clus3_OUTVAR;
INITIAL radius=0
;
TRAIN tech=FORGY
;
SAVE outstat=EMWS1.Clus3_OUTSTAT outmean=EMWS1.Clus3_OUTMEAN;
code file="C:\Users\skunt\Downloads\HU.Exploratory Analysis\HU.ClusterAnalysis\Workspaces\EMWS1\Clus3\DMVQSCORECODE.sas"
group=Clus3
;
run;
quit;
*------------------------------------------------------------* ;
* Clus3: DMVQ Variables;
*------------------------------------------------------------* ;
%macro dmvqvars;
    households housing_median_age latitude longitude median_house_value
   median_income population total_bedrooms total_rooms ocean_proximity_1H_OCEA
   ocean_proximityINLAND ocean_proximityNEAR_BAY ocean_proximityNEAR_OCE
%mend ;
