*------------------------------------------------------------*;
* Clus6: Preliminary Clustering;
*------------------------------------------------------------*;
*------------------------------------------------------------* ;
* Clus6: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    ocean_proximity(ASC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* Clus6: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    households housing_median_age latitude longitude median_house_value
   median_income population total_bedrooms total_rooms
%mend DMDBVar;
*------------------------------------------------------------*;
* Clus6: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=EMWS1.Smpl_DATA
dmdbcat=WORK.Clus6_DMDB
maxlevel = 513
out=WORK.Clus6_DMDB
;
class %DMDBClass;
var %DMDBVar;
run;
quit;
*------------------------------------------------------------* ;
* Clus6: Interval Inputs Macro ;
*------------------------------------------------------------* ;
%macro DMVQINTERVAL;
    households housing_median_age latitude longitude median_house_value
   median_income population total_bedrooms total_rooms
%mend DMVQINTERVAL;
*------------------------------------------------------------* ;
* Clus6: Nominal Inputs Macro ;
*------------------------------------------------------------* ;
%macro DMVQNOMINAL;
    ocean_proximity
%mend DMVQNOMINAL;
*------------------------------------------------------------*;
* Clus6: Run DMVQ procedure;
*------------------------------------------------------------*;
title;
options nodate;
proc dmvq data=WORK.Clus6_DMDB dmdbcat=WORK.Clus6_DMDB std=STD nominal=GLM ordinal=RANK
;
input %DMVQINTERVAL / level=interval;
input %DMVQNOMINAL / level=nominal;
VQ maxc = 50 clusname=_SEGMENT_ CLUSLABEL="Segment Id" DISTLABEL="Distance";
MAKE outvar=EMWS1.Clus6_OUTVAR;
INITIAL radius=0
;
TRAIN tech=FORGY
;
SAVE outstat=WORK.Clus6_OUTSTAT outmean=EMWS1.Clus6_OUTMEAN;
code file="C:\Users\skunt\Downloads\HU.Exploratory Analysis\HU.ClusterAnalysis\Workspaces\EMWS1\Clus6\DMVQSCORECODE.sas"
group=Clus6
;
run;
quit;
*------------------------------------------------------------* ;
* Clus6: DMVQ Variables;
*------------------------------------------------------------* ;
%macro dmvqvars;
    households housing_median_age latitude longitude median_house_value
   median_income population total_bedrooms total_rooms ocean_proximity_1H_OCEA
   ocean_proximityINLAND ocean_proximityNEAR_BAY ocean_proximityNEAR_OCE
%mend ;
*------------------------------------------------------------*;
* Clus6: Determining the number of clusters;
*------------------------------------------------------------*;
proc cluster data=EMWS1.Clus6_OUTMEAN method=AVERAGE pseudo outtree=EMWS1.Clus6_CLUSSEED
;
var %dmvqvars;
copy _SEGMENT_;
run;
quit;
proc sort data =EMWS1.Clus6_CLUSSEED out=WORK._SEED_;
by _ncl_;
where (_ccc_ > -99999.0);
run;
data WORK._SEED2_;
retain oJump occc oncl;
set WORK._SEED_;
_lccc_=lag(_ccc_);
if _lccc_ > . then jump = _ccc_ - _lccc_;
if jump<0 and ojump>0 then do;
* Have a local Max;
numclus = oncl;
cccvalue = occc;
output;
end;
ojump = jump;
occc = _ccc_;
oncl = _ncl_;
run;
proc print data=WORK._SEED2_ label;
var numclus cccvalue;
label numclus="%sysfunc(sasmsg(sashelp.dmine, rpt_numclus_vlabel ,  NOQUOTE))";
label cccvalue="%sysfunc(sasmsg(sashelp.dmine, rpt_ccc_vlabel ,     NOQUOTE))";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_OptClus_title, NOQUOTE))";
run;
title10;
data WORK._SEED2_;
length msg $200;
set WORK._SEED2_ end=eof;
retain select cccSelect 0 numSel;
if _N_=1 then numSel = numClus;
if cccvalue>=3 then do;
if 20>= numclus >= 2 and cccSelect<1 then do;
cccSelect = 1;
select =1;
numSel = numClus;
end;
end;
else if 20>= numclus >= 2 and select<1 then do;
select = 1;
numSel = numClus;
end;
if eof then do;
if ^(select=1 and cccselect=1) then do;
put "*------------------------------------------------------------*";
put '*;';
put "WARNING: The number of clusters selected based on the CCC values may not be valid.  Please refer to the documentation on the Cubic Clustering Criterion.";
put '*;';
put "*------------------------------------------------------------*";
end;
if select<1 then do;
msg = sasmsg('sashelp.dmine', 'rpt_noCCCclusternum_note', 'NOQUOTE');
put msg;
end;
if cccselect<1 then do;
msg = sasmsg('sashelp.dmine', 'rpt_noValidclusterNum_note', 'NOQUOTE');
put msg;
end;
call symput('em_maxC', strip(put(numSel,best.)));
end;
run;
*------------------------------------------------------------*;
* Clus6: Training;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* Clus6: Run DMVQ procedure;
*------------------------------------------------------------*;
title;
options nodate;
proc dmvq data=WORK.Clus6_DMDB dmdbcat=WORK.Clus6_DMDB std=STD nominal=GLM ordinal=RANK
;
input %DMVQINTERVAL / level=interval;
input %DMVQNOMINAL / level=nominal;
VQ maxc = 15 clusname=_SEGMENT_ CLUSLABEL="Segment Id" DISTLABEL="Distance";
MAKE outvar=EMWS1.Clus6_OUTVAR;
INITIAL radius=0
;
TRAIN tech=FORGY
;
SAVE outstat=EMWS1.Clus6_OUTSTAT outmean=EMWS1.Clus6_OUTMEAN;
code file="C:\Users\skunt\Downloads\HU.Exploratory Analysis\HU.ClusterAnalysis\Workspaces\EMWS1\Clus6\DMVQSCORECODE.sas"
group=Clus6
;
run;
quit;
