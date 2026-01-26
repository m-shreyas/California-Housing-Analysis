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
    IF  NOT MISSING(median_income ) AND 
      median_income  <              8.02825 THEN DO;
      _NODE_  =                   14;
      _LEAF_  =                   12;
      P_median_house_value  =     378233.691891891;
      V_median_house_value  =     396061.748148148;
      END;
    ELSE DO;
      IF  NOT MISSING(population ) AND 
        population  <                   54 THEN DO;
        _NODE_  =                   30;
        _LEAF_  =                   13;
        P_median_house_value  =               273700;
        V_median_house_value  =               231250;
        END;
      ELSE DO;
        _NODE_  =                   31;
        _LEAF_  =                   14;
        P_median_house_value  =     464780.663414634;
        V_median_house_value  =     465633.210843373;
        END;
      END;
    END;
  ELSE DO;
    _ARBFMT_8 = PUT( ocean_proximity , $8.);
     %DMNORMIP( _ARBFMT_8);
    IF _ARBFMT_8 IN ('INLAND' ) THEN DO;
      IF  NOT MISSING(housing_median_age ) AND 
                        27.5 <= housing_median_age  THEN DO;
        _NODE_  =                   27;
        _LEAF_  =                   11;
        P_median_house_value  =     302333.407407407;
        V_median_house_value  =     256214.380952381;
        END;
      ELSE DO;
        _NODE_  =                   26;
        _LEAF_  =                   10;
        P_median_house_value  =     213947.368421052;
        V_median_house_value  =     199311.458333333;
        END;
      END;
    ELSE DO;
      IF  NOT MISSING(housing_median_age ) AND 
                        36.5 <= housing_median_age  THEN DO;
        _NODE_  =                   25;
        _LEAF_  =                    9;
        P_median_house_value  =     367645.221311475;
        V_median_house_value  =     375040.911504424;
        END;
      ELSE DO;
        _NODE_  =                   24;
        _LEAF_  =                    8;
        P_median_house_value  =     299091.809369951;
        V_median_house_value  =     298342.676767676;
        END;
      END;
    END;
  END;
ELSE DO;
  _ARBFMT_8 = PUT( ocean_proximity , $8.);
   %DMNORMIP( _ARBFMT_8);
  IF _ARBFMT_8 IN ('INLAND' ) THEN DO;
    IF  NOT MISSING(median_income ) AND 
                   3.42985 <= median_income  THEN DO;
      _NODE_  =                   11;
      _LEAF_  =                    7;
      P_median_house_value  =     150458.589225589;
      V_median_house_value  =     148865.962441314;
      END;
    ELSE DO;
      IF  NOT MISSING(median_income ) AND 
                      2.4454 <= median_income  THEN DO;
        _NODE_  =                   21;
        _LEAF_  =                    6;
        P_median_house_value  =     113241.528244274;
        V_median_house_value  =      110364.62882096;
        END;
      ELSE DO;
        _NODE_  =                   20;
        _LEAF_  =                    5;
        P_median_house_value  =     82873.8866571018;
        V_median_house_value  =     83119.5009560229;
        END;
      END;
    END;
  ELSE DO;
    IF  NOT MISSING(median_income ) AND 
      median_income  <               3.2219 THEN DO;
      IF  NOT MISSING(median_income ) AND 
        median_income  <               2.4608 THEN DO;
        _NODE_  =                   16;
        _LEAF_  =                    1;
        P_median_house_value  =     155294.618439716;
        V_median_house_value  =     155028.656583629;
        END;
      ELSE DO;
        _NODE_  =                   17;
        _LEAF_  =                    2;
        P_median_house_value  =     196227.078014184;
        V_median_house_value  =          194701.4496;
        END;
      END;
    ELSE DO;
      IF  NOT MISSING(longitude ) AND 
                    -118.305 <= longitude  THEN DO;
        _NODE_  =                   19;
        _LEAF_  =                    4;
        P_median_house_value  =       212161.2022756;
        V_median_house_value  =     209417.880910683;
        END;
      ELSE DO;
        _NODE_  =                   18;
        _LEAF_  =                    3;
        P_median_house_value  =     264813.653281097;
        V_median_house_value  =     265872.191852825;
        END;
      END;
    END;
  END;

*****  RESIDUALS R_ *************;
IF MISSING( median_house_value ) THEN R_median_house_value  = .;
ELSE R_median_house_value  = median_house_value  - P_median_house_value ;

****************************************************************;
******          END OF DECISION TREE SCORING CODE         ******;
****************************************************************;

