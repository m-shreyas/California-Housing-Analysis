*************************************;
*** begin scoring code for regression;
*************************************;

length _WARN_ $4;
label _WARN_ = 'Warnings' ;

drop _Y;
_Y = median_house_value ;

drop _DM_BAD;
_DM_BAD=0;

*** Check households for missing values ;
if missing( households ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check housing_median_age for missing values ;
if missing( housing_median_age ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check latitude for missing values ;
if missing( latitude ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check longitude for missing values ;
if missing( longitude ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check median_income for missing values ;
if missing( median_income ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check population for missing values ;
if missing( population ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check total_bedrooms for missing values ;
if missing( total_bedrooms ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check total_rooms for missing values ;
if missing( total_rooms ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Generate dummy variables for ocean_proximity ;
drop _0_0 _0_1 _0_2 _0_3 ;
*** encoding is sparse, initialize to zero;
_0_0 = 0;
_0_1 = 0;
_0_2 = 0;
_0_3 = 0;
if missing( ocean_proximity ) then do;
   _0_0 = .;
   _0_1 = .;
   _0_2 = .;
   _0_3 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm8 $ 8; drop _dm8 ;
   _dm8 = put( ocean_proximity , $8. );
   %DMNORMIP( _dm8 )
   if _dm8 = '<1H OCEA'  then do;
      _0_0 = 1;
   end;
   else if _dm8 = 'INLAND'  then do;
      _0_1 = 1;
   end;
   else if _dm8 = 'NEAR OCE'  then do;
      _0_0 = -1;
      _0_1 = -1;
      _0_2 = -1;
      _0_3 = -1;
   end;
   else if _dm8 = 'NEAR BAY'  then do;
      _0_3 = 1;
   end;
   else if _dm8 = 'ISLAND'  then do;
      _0_2 = 1;
   end;
   else do;
      _0_0 = .;
      _0_1 = .;
      _0_2 = .;
      _0_3 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** If missing inputs, use averages;
if _DM_BAD > 0 then do;
   _LP0 =     207170.124330117;
   goto REG2DR1;
end;

*** Compute Linear Predictor;
drop _TEMP;
drop _LP0;
_LP0 = 0;

***  Effect: households ;
_TEMP = households ;
_LP0 = _LP0 + (    52.3587919926824 * _TEMP);

***  Effect: housing_median_age ;
_TEMP = housing_median_age ;
_LP0 = _LP0 + (    1135.56421652764 * _TEMP);

***  Effect: latitude ;
_TEMP = latitude ;
_LP0 = _LP0 + (   -27406.0064571322 * _TEMP);

***  Effect: longitude ;
_TEMP = longitude ;
_LP0 = _LP0 + (   -28788.1310687704 * _TEMP);

***  Effect: median_income ;
_TEMP = median_income ;
_LP0 = _LP0 + (    38746.8512670739 * _TEMP);

***  Effect: ocean_proximity ;
_TEMP = 1;
_LP0 = _LP0 + (    -17930.285451706) * _TEMP * _0_0;
_LP0 = _LP0 + (   -54326.4807901228) * _TEMP * _0_1;
_LP0 = _LP0 + (    102841.588734163) * _TEMP * _0_2;
_LP0 = _LP0 + (   -18337.2894353893) * _TEMP * _0_3;

***  Effect: population ;
_TEMP = population ;
_LP0 = _LP0 + (    -43.959116750558 * _TEMP);

***  Effect: total_bedrooms ;
_TEMP = total_bedrooms ;
_LP0 = _LP0 + (    105.287172801035 * _TEMP);

***  Effect: total_rooms ;
_TEMP = total_rooms ;
_LP0 = _LP0 + (    -4.8077694481132 * _TEMP);
*--- Intercept ---*;
_LP0 = _LP0 + (   -2419684.95238524);

REG2DR1:

*** Predicted Value, Error, and Residual;
label P_median_house_value = 'Predicted: median_house_value' ;
P_median_house_value = _LP0;

drop _R;
if _Y = . then do;
   R_median_house_value = .;
end;
else do;
   _R = _Y - _LP0;
    label R_median_house_value = 'Residual: median_house_value' ;
   R_median_house_value = _R;
end;

*************************************;
***** end scoring code for regression;
*************************************;
