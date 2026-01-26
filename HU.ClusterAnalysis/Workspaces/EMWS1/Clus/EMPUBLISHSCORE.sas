*****************************************;
*** Begin Scoring Code from PROC DMVQ ***;
*****************************************;


*** Begin Class Look-up, Standardization, Replacement ;
drop _dm_bad; _dm_bad = 0;

*** Standardize households ;
drop T_households ;
if missing( households ) then T_households = .;
else T_households = (households - 460.667173175302) * 0.00373346618036;

*** Standardize housing_median_age ;
drop T_housing_median_age ;
if missing( housing_median_age ) then T_housing_median_age = .;
else T_housing_median_age = (housing_median_age
         - 29.0152965608063) * 0.08054514381116;

*** Standardize latitude ;
drop T_latitude ;
if missing( latitude ) then T_latitude = .;
else T_latitude = (latitude - 35.6522109101961) * 0.46629910149133;

*** Standardize longitude ;
drop T_longitude ;
if missing( longitude ) then T_longitude = .;
else T_longitude = (longitude - -119.585392290936) * 0.49921170523417;

*** Standardize median_house_value ;
drop T_median_house_value ;
if missing( median_house_value ) then T_median_house_value = .;
else T_median_house_value = (median_house_value
         - 201774.895355315) * 9.0404194412757E-6;

*** Standardize median_income ;
drop T_median_income ;
if missing( median_income ) then T_median_income = .;
else T_median_income = (median_income - 3.72515609076639) * 0.62428040828707;

*** Standardize population ;
drop T_population ;
if missing( population ) then T_population = .;
else T_population = (population - 1312.21840652383) * 0.00129327358299;

*** Standardize total_bedrooms ;
drop T_total_bedrooms ;
if missing( total_bedrooms ) then T_total_bedrooms = .;
else T_total_bedrooms = (total_bedrooms - 493.8815493246) * 0.00343596145552;

*** Standardize total_rooms ;
drop T_total_rooms ;
if missing( total_rooms ) then T_total_rooms = .;
else T_total_rooms = (total_rooms - 2391.7644228334) * 0.0006967173091;

*** Generate dummy variables for ocean_proximity ;
drop ocean_proximity_1H_OCEA ocean_proximityINLAND ocean_proximityNEAR_BAY
        ocean_proximityNEAR_OCE ;
if missing( ocean_proximity ) then do;
   ocean_proximity_1H_OCEA = .;
   ocean_proximityINLAND = .;
   ocean_proximityNEAR_BAY = .;
   ocean_proximityNEAR_OCE = .;
end;
else do;
   length _dm8 $ 8; drop _dm8 ;
   _dm8 = put( ocean_proximity , $8. );
   %DMNORMIP( _dm8 )
   if _dm8 = '<1H OCEA'  then do;
      ocean_proximity_1H_OCEA = 0.5630148015253;
      ocean_proximityINLAND = -0.34239942333019;
      ocean_proximityNEAR_BAY = -0.17687796590212;
      ocean_proximityNEAR_OCE = -0.19207712157532;
   end;
   else if _dm8 = 'INLAND'  then do;
      ocean_proximity_1H_OCEA = -0.44401556869702;
      ocean_proximityINLAND = 0.73010443432617;
      ocean_proximityNEAR_BAY = -0.17687796590212;
      ocean_proximityNEAR_OCE = -0.19207712157532;
   end;
   else if _dm8 = 'NEAR OCE'  then do;
      ocean_proximity_1H_OCEA = -0.44401556869702;
      ocean_proximityINLAND = -0.34239942333019;
      ocean_proximityNEAR_BAY = -0.17687796590212;
      ocean_proximityNEAR_OCE = 1.3014946040102;
   end;
   else if _dm8 = 'NEAR BAY'  then do;
      ocean_proximity_1H_OCEA = -0.44401556869702;
      ocean_proximityINLAND = -0.34239942333019;
      ocean_proximityNEAR_BAY = 1.41333227125889;
      ocean_proximityNEAR_OCE = -0.19207712157532;
   end;
   else do;
      ocean_proximity_1H_OCEA = .;
      ocean_proximityINLAND = .;
      ocean_proximityNEAR_BAY = .;
      ocean_proximityNEAR_OCE = .;
      _DM_BAD = 1;
   end;
end;

*** End Class Look-up, Standardization, Replacement ;


*** Omitted Cases;
if _dm_bad then do;
   _SEGMENT_ = .; Distance = .;
   goto CLUSvlex ;
end; *** omitted;

*** Compute Distances and Cluster Membership;
label _SEGMENT_ = 'Segment Id' ;
label Distance = 'Distance' ;
array CLUSvads [3] _temporary_;
drop _vqclus _vqmvar _vqnvar;
_vqmvar = 0;
do _vqclus = 1 to 3; CLUSvads [_vqclus] = 0; end;
if not missing( T_households ) then do;
   CLUSvads [1] + ( T_households - -0.2517355013205 )**2;
   CLUSvads [2] + ( T_households - -0.51418817100541 )**2;
   CLUSvads [3] + ( T_households - 1.54992259787094 )**2;
end;
else _vqmvar + 1;
if not missing( T_housing_median_age ) then do;
   CLUSvads [1] + ( T_housing_median_age - 0.0973255466021 )**2;
   CLUSvads [2] + ( T_housing_median_age - 0.20983963149076 )**2;
   CLUSvads [3] + ( T_housing_median_age - -0.62177433695955 )**2;
end;
else _vqmvar + 1;
if not missing( T_latitude ) then do;
   CLUSvads [1] + ( T_latitude - -0.67032044984197 )**2;
   CLUSvads [2] + ( T_latitude - 0.67758902082938 )**2;
   CLUSvads [3] + ( T_latitude - -0.05086295028301 )**2;
end;
else _vqmvar + 1;
if not missing( T_longitude ) then do;
   CLUSvads [1] + ( T_longitude - 0.57163521579176 )**2;
   CLUSvads [2] + ( T_longitude - -0.57708575245289 )**2;
   CLUSvads [3] + ( T_longitude - 0.04184809763416 )**2;
end;
else _vqmvar + 1;
if not missing( T_median_house_value ) then do;
   CLUSvads [1] + ( T_median_house_value - 0.50683900941623 )**2;
   CLUSvads [2] + ( T_median_house_value - -0.51065824978326 )**2;
   CLUSvads [3] + ( T_median_house_value - 0.03503576752118 )**2;
end;
else _vqmvar + 1;
if not missing( T_median_income ) then do;
   CLUSvads [1] + ( T_median_income - 0.49541038071582 )**2;
   CLUSvads [2] + ( T_median_income - -0.48359028146715 )**2;
   CLUSvads [3] + ( T_median_income - 0.00249753310026 )**2;
end;
else _vqmvar + 1;
if not missing( T_population ) then do;
   CLUSvads [1] + ( T_population - -0.23260232706303 )**2;
   CLUSvads [2] + ( T_population - -0.49116660484601 )**2;
   CLUSvads [3] + ( T_population - 1.46490196874905 )**2;
end;
else _vqmvar + 1;
if not missing( T_total_bedrooms ) then do;
   CLUSvads [1] + ( T_total_bedrooms - -0.27400459637395 )**2;
   CLUSvads [2] + ( T_total_bedrooms - -0.49338122211896 )**2;
   CLUSvads [3] + ( T_total_bedrooms - 1.55789443907318 )**2;
end;
else _vqmvar + 1;
if not missing( T_total_rooms ) then do;
   CLUSvads [1] + ( T_total_rooms - -0.19806341730842 )**2;
   CLUSvads [2] + ( T_total_rooms - -0.51945466299145 )**2;
   CLUSvads [3] + ( T_total_rooms - 1.45399860276902 )**2;
end;
else _vqmvar + 1;
if not missing( ocean_proximity_1H_OCEA ) then do;
   CLUSvads [1] + ( ocean_proximity_1H_OCEA - 0.24308294354998 )**2;
   CLUSvads [2] + ( ocean_proximity_1H_OCEA - -0.24044816168929 )**2;
   CLUSvads [3] + ( ocean_proximity_1H_OCEA - 0.00768603139506 )**2;
end;
else _vqmvar + 0.25;
if not missing( ocean_proximityINLAND ) then do;
   CLUSvads [1] + ( ocean_proximityINLAND - -0.23051705243021 )**2;
   CLUSvads [2] + ( ocean_proximityINLAND - 0.22048443308394 )**2;
   CLUSvads [3] + ( ocean_proximityINLAND - 0.00809024793142 )**2;
end;
else _vqmvar + 0.25;
if not missing( ocean_proximityNEAR_BAY ) then do;
   CLUSvads [1] + ( ocean_proximityNEAR_BAY - -0.11736990627748 )**2;
   CLUSvads [2] + ( ocean_proximityNEAR_BAY - 0.12592473211481 )**2;
   CLUSvads [3] + ( ocean_proximityNEAR_BAY - -0.02377061245157 )**2;
end;
else _vqmvar + 0.25;
if not missing( ocean_proximityNEAR_OCE ) then do;
   CLUSvads [1] + ( ocean_proximityNEAR_OCE - 0.07072871966892 )**2;
   CLUSvads [2] + ( ocean_proximityNEAR_OCE - -0.06869997129612 )**2;
   CLUSvads [3] + ( ocean_proximityNEAR_OCE - -0.000339946411 )**2;
end;
else _vqmvar + 0.25;
_vqnvar = 10 - _vqmvar;
if _vqnvar <= 1.477928890381E-11 then do;
   _SEGMENT_ = .; Distance = .;
end;
else do;
   _SEGMENT_ = 1; Distance = CLUSvads [1];
   _vqfzdst = Distance * 0.99999999999988; drop _vqfzdst;
   do _vqclus = 2 to 3;
      if CLUSvads [_vqclus] < _vqfzdst then do;
         _SEGMENT_ = _vqclus; Distance = CLUSvads [_vqclus];
         _vqfzdst = Distance * 0.99999999999988;
      end;
   end;
   Distance = sqrt(Distance * (10 / _vqnvar));
end;
CLUSvlex :;

***************************************;
*** End Scoring Code from PROC DMVQ ***;
***************************************;
*------------------------------------------------------------*;
* Clus: Creating Segment Label;
*------------------------------------------------------------*;
length _SEGMENT_LABEL_ $80;
label _SEGMENT_LABEL_='Segment Description';
if _SEGMENT_ = 1 then _SEGMENT_LABEL_="Cluster1";
else
if _SEGMENT_ = 2 then _SEGMENT_LABEL_="Cluster2";
else
if _SEGMENT_ = 3 then _SEGMENT_LABEL_="Cluster3";
