*------------------------------------------------------------*;
* Variable Macros;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* General Variable Macros;
*------------------------------------------------------------*;
%let EM_NUM_VARS = 18;
   %macro EM_VARS;
    EM_PREDICTION EM_SEGMENT EM_VALUETARGET LABEL R_median_house_value
   V_median_house_value _NODE_ _WARN_ _dataobs_ b_median_house_val
   housing_median_age latitude longitude median_house_value median_income
   ocean_proximity population total_bedrooms
   %mend EM_VARS;
%let EM_NUM_CLASS = 6;
   %macro EM_CLASS;
    EM_SEGMENT LABEL _NODE_ _WARN_ b_median_house_val ocean_proximity
   %mend EM_CLASS;
%let EM_NUM_INTERVAL = 12;
   %macro EM_INTERVAL;
    EM_PREDICTION EM_VALUETARGET R_median_house_value V_median_house_value
   _dataobs_ housing_median_age latitude longitude median_house_value
   median_income population total_bedrooms
   %mend EM_INTERVAL;
%let EM_NUM_REPORT_VARS = 0;
   %macro  EM_REPORT_VARS; %mend;
%let EM_NUM_CLASS_REPORT = 0;
   %macro  EM_CLASS_REPORT; %mend;
%let EM_NUM_INTERVAL_REPORT = 0;
   %macro  EM_INTERVAL_REPORT; %mend;
*------------------------------------------------------------*;
* Target Variable Macros;
*------------------------------------------------------------*;
%let EM_NUM_TARGET = 1;
   %macro EM_TARGET;
    median_house_value
   %mend EM_TARGET;
%let EM_NUM_TARGET_LEVEL = 1;
   %macro EM_TARGET_LEVEL;
    INTERVAL
   %mend EM_TARGET_LEVEL;
%let EM_NUM_BINARY_TARGET = 0;
   %macro  EM_BINARY_TARGET; %mend;
%let EM_NUM_ORDINAL_TARGET = 0;
   %macro  EM_ORDINAL_TARGET; %mend;
%let EM_NUM_NOMINAL_TARGET = 0;
   %macro  EM_NOMINAL_TARGET; %mend;
%let EM_NUM_INTERVAL_TARGET = 1;
   %macro EM_INTERVAL_TARGET;
    median_house_value
   %mend EM_INTERVAL_TARGET;
*------------------------------------------------------------*;
* Input Variable Macros;
*------------------------------------------------------------*;
%let EM_NUM_INPUT = 7;
   %macro EM_INPUT;
    housing_median_age latitude longitude median_income ocean_proximity population
   total_bedrooms
   %mend EM_INPUT;
%let EM_NUM_BINARY_INPUT = 0;
   %macro  EM_BINARY_INPUT; %mend;
%let EM_NUM_ORDINAL_INPUT = 0;
   %macro  EM_ORDINAL_INPUT; %mend;
%let EM_NUM_NOMINAL_INPUT = 1;
   %macro EM_NOMINAL_INPUT;
    ocean_proximity
   %mend EM_NOMINAL_INPUT;
%let EM_NUM_INTERVAL_INPUT = 6;
   %macro EM_INTERVAL_INPUT;
    housing_median_age latitude longitude median_income population total_bedrooms
   %mend EM_INTERVAL_INPUT;
*------------------------------------------------------------*;
* Rejected Variable Macros;
*------------------------------------------------------------*;
%let EM_NUM_REJECTED = 0;
   %macro  EM_REJECTED; %mend;
%let EM_NUM_BINARY_REJECTED = 0;
   %macro  EM_BINARY_REJECTED; %mend;
%let EM_NUM_ORDINAL_REJECTED = 0;
   %macro  EM_ORDINAL_REJECTED; %mend;
%let EM_NUM_NOMINAL_REJECTED = 0;
   %macro  EM_NOMINAL_REJECTED; %mend;
%let EM_NUM_INTERVAL_REJECTED = 0;
   %macro  EM_INTERVAL_REJECTED; %mend;
*------------------------------------------------------------*;
* Misc Variable Macros;
*------------------------------------------------------------*;
%let EM_NUM_ASSESS = 2;
   %macro EM_ASSESS;
    EM_VALUETARGET _WARN_
   %mend EM_ASSESS;
%let EM_NUM_INTERVAL_ASSESS = 1;
   %macro EM_INTERVAL_ASSESS;
    EM_VALUETARGET
   %mend EM_INTERVAL_ASSESS;
%let EM_NUM_CLASS_ASSESS = 1;
   %macro EM_CLASS_ASSESS;
    _WARN_
   %mend EM_CLASS_ASSESS;
%let EM_NUM_CENSOR = 0;
   %macro  EM_CENSOR; %mend;
%let EM_NUM_CLASSIFICATION = 0;
   %macro  EM_CLASSIFICATION; %mend;
%let EM_NUM_COST = 0;
   %macro  EM_COST; %mend;
%let EM_NUM_CROSSID = 0;
   %macro  EM_CROSSID; %mend;
%let EM_NUM_DECISION = 0;
   %macro  EM_DECISION; %mend;
%let EM_NUM_FREQ = 0;
   %macro  EM_FREQ; %mend;
%let EM_NUM_ID = 1;
   %macro EM_ID;
    _dataobs_
   %mend EM_ID;
%let EM_NUM_LABEL = 1;
   %macro EM_LABEL;
    LABEL
   %mend EM_LABEL;
%let EM_NUM_PREDICT = 2;
   %macro EM_PREDICT;
    EM_PREDICTION V_median_house_value
   %mend EM_PREDICT;
%let EM_NUM_REFERRER = 0;
   %macro  EM_REFERRER; %mend;
%let EM_NUM_REJECTS = 3;
   %macro EM_REJECTS;
    P_median_house_value households total_rooms
   %mend EM_REJECTS;
%let EM_NUM_RESIDUAL = 1;
   %macro EM_RESIDUAL;
    R_median_house_value
   %mend EM_RESIDUAL;
%let EM_NUM_SEGMENT = 3;
   %macro EM_SEGMENT;
    EM_SEGMENT _NODE_ b_median_house_val
   %mend EM_SEGMENT;
%let EM_NUM_SEQUENCE = 0;
   %macro  EM_SEQUENCE; %mend;
%let EM_NUM_TEXT = 0;
   %macro  EM_TEXT; %mend;
%let EM_NUM_TIMEID = 0;
   %macro  EM_TIMEID; %mend;
%let EM_NUM_TREATMENT = 0;
   %macro  EM_TREATMENT; %mend;
%let EM_NUM_KEY = 0;
   %macro  EM_KEY; %mend;
*------------------------------------------------------------*;
* End Create EM Macro Variables and Macros;
*------------------------------------------------------------*;
