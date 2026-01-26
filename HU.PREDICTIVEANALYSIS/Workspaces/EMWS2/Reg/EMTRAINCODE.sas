*------------------------------------------------------------*;
* Reg: Create decision matrix;
*------------------------------------------------------------*;
data WORK.median_house_value(label="median_house_value");
  length   median_house_value                   8
           ;

 median_house_value=14999;
output;
 median_house_value=500001;
output;
 median_house_value=257500;
output;
;
run;
proc datasets lib=work nolist;
modify median_house_value(type=PROFIT label=median_house_value);
run;
quit;
data EM_DMREG / view=EM_DMREG;
set EMWS2.Part_TRAIN(keep=
households housing_median_age latitude longitude median_house_value
median_income ocean_proximity population total_bedrooms total_rooms);
run;
*------------------------------------------------------------* ;
* Reg: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    ocean_proximity(ASC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* Reg: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    households housing_median_age latitude longitude median_house_value
   median_income population total_bedrooms total_rooms
%mend DMDBVar;
*------------------------------------------------------------*;
* Reg: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=WORK.EM_DMREG
dmdbcat=WORK.Reg_DMDB
maxlevel = 513
;
class %DMDBClass;
var %DMDBVar;
target
median_house_value
;
run;
quit;
*------------------------------------------------------------*;
* Reg: Run DMREG procedure;
*------------------------------------------------------------*;
proc dmreg data=EM_DMREG dmdbcat=WORK.Reg_DMDB
validata = EMWS2.Part_VALIDATE
outest = EMWS2.Reg_EMESTIMATE
outterms = EMWS2.Reg_OUTTERMS
outmap= EMWS2.Reg_MAPDS namelen=200
;
class
ocean_proximity
;
model median_house_value =
households
housing_median_age
latitude
longitude
median_income
ocean_proximity
population
total_bedrooms
total_rooms
/error=normal
coding=DEVIATION
nodesignprint
;
;
score data=EMWS2.Part_TEST
out=_null_
outfit=EMWS2.Reg_FITTEST
role = TEST
;
code file="\\uisnutvdiprof1a\redirected$\smupp\Documents\HU.PREDICTIVEANALYSIS\Workspaces\EMWS2\Reg\EMPUBLISHSCORE.sas"
group=Reg
;
code file="\\uisnutvdiprof1a\redirected$\smupp\Documents\HU.PREDICTIVEANALYSIS\Workspaces\EMWS2\Reg\EMFLOWSCORE.sas"
group=Reg
residual
;
run;
quit;
