*------------------------------------------------------------*;
* Clus4: Training;
*------------------------------------------------------------*;
*------------------------------------------------------------* ;
* Clus4: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    ocean_proximity(ASC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* Clus4: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    households housing_median_age latitude longitude median_house_value
   median_income population total_bedrooms total_rooms
%mend DMDBVar;
*------------------------------------------------------------*;
* Clus4: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=EMWS1.Filter_TRAIN
dmdbcat=WORK.Clus4_DMDB
maxlevel = 513
out=WORK.Clus4_DMDB
;
class %DMDBClass;
var %DMDBVar;
run;
quit;
*------------------------------------------------------------* ;
* Clus4: Interval Inputs Macro ;
*------------------------------------------------------------* ;
%macro DMVQINTERVAL;
    households housing_median_age latitude longitude median_house_value
   median_income population total_bedrooms total_rooms
%mend DMVQINTERVAL;
*------------------------------------------------------------* ;
* Clus4: Nominal Inputs Macro ;
*------------------------------------------------------------* ;
%macro DMVQNOMINAL;
    ocean_proximity
%mend DMVQNOMINAL;
*------------------------------------------------------------*;
* Clus4: Run DMVQ procedure;
*------------------------------------------------------------*;
title;
options nodate;
proc dmvq data=WORK.Clus4_DMDB dmdbcat=WORK.Clus4_DMDB std=STD nominal=GLM ordinal=RANK
;
input %DMVQINTERVAL / level=interval;
input %DMVQNOMINAL / level=nominal;
VQ maxc = 6 clusname=_SEGMENT_ CLUSLABEL="Segment Id" DISTLABEL="Distance";
MAKE outvar=EMWS1.Clus4_OUTVAR;
INITIAL radius=0
;
TRAIN tech=FORGY
;
SAVE outstat=EMWS1.Clus4_OUTSTAT outmean=EMWS1.Clus4_OUTMEAN;
code file="C:\Users\skunt\Downloads\HU.Exploratory Analysis\HU.ClusterAnalysis\Workspaces\EMWS1\Clus4\DMVQSCORECODE.sas"
group=Clus4
;
run;
quit;
*------------------------------------------------------------* ;
* Clus4: DMVQ Variables;
*------------------------------------------------------------* ;
%macro dmvqvars;
    households housing_median_age latitude longitude median_house_value
   median_income population total_bedrooms total_rooms ocean_proximity_1H_OCEA
   ocean_proximityINLAND ocean_proximityNEAR_BAY ocean_proximityNEAR_OCE
%mend ;
