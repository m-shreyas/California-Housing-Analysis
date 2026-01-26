****************************************************************;
******             DECISION TREE SCORING CODE             ******;
****************************************************************;

******         LENGTHS OF NEW CHARACTER VARIABLES         ******;
LENGTH _WARN_  $    4; 

******              LABELS FOR NEW VARIABLES              ******;
label _NODE_ = 'Node' ;
label _LEAF_ = 'Leaf' ;
label P_median_house_value = 'Predicted: median_house_value' ;
label V_median_house_value = 'Validated: median_house_value' ;
label R_median_house_value = 'Residual: median_house_value' ;
label _WARN_ = 'Warnings' ;


******      TEMPORARY VARIABLES FOR FORMATTED VALUES      ******;
LENGTH _ARBFMT_8 $      8; DROP _ARBFMT_8; 
_ARBFMT_8 = ' '; /* Initialize to avoid warning. */


******             ASSIGN OBSERVATION TO NODE             ******;
IF  NOT MISSING(median_income ) AND 
               5.13655 <= median_income  THEN DO;
  IF  NOT MISSING(median_income ) AND 
                 6.94935 <= median_income  THEN DO;
    _NODE_  =                    7;
    _LEAF_  =                    4;
    P_median_house_value  =     421827.263291139;
    V_median_house_value  =     433088.940594059;
    END;
  ELSE DO;
    _NODE_  =                    6;
    _LEAF_  =                    3;
    P_median_house_value  =     295902.940066592;
    V_median_house_value  =     295963.655172413;
    END;
  END;
ELSE DO;
  _ARBFMT_8 = PUT( ocean_proximity , $8.);
   %DMNORMIP( _ARBFMT_8);
  IF _ARBFMT_8 IN ('INLAND' ) THEN DO;
    _NODE_  =                    5;
    _LEAF_  =                    2;
    P_median_house_value  =     113724.923946557;
    V_median_house_value  =     111894.384506041;
    END;
  ELSE DO;
    _NODE_  =                    4;
    _LEAF_  =                    1;
    P_median_house_value  =     212216.790068391;
    V_median_house_value  =     210687.121476776;
    END;
  END;

*****  RESIDUALS R_ *************;
IF MISSING( median_house_value ) THEN R_median_house_value  = .;
ELSE R_median_house_value  = median_house_value  - P_median_house_value ;

****************************************************************;
******          END OF DECISION TREE SCORING CODE         ******;
****************************************************************;

