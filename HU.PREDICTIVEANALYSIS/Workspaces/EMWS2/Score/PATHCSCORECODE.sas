*------------------------------------------------------------*;
* TOOL: Input Data Source;
* TYPE: SAMPLE;
* NODE: Ids2;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: Partition Class;
* TYPE: SAMPLE;
* NODE: Part;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: Extension Class;
* TYPE: MODEL;
* NODE: Tree4;
*------------------------------------------------------------*;
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
label _WARN_ = 'Warnings' ;


******      TEMPORARY VARIABLES FOR FORMATTED VALUES      ******;
LENGTH _ARBFMT_8 $      8; DROP _ARBFMT_8;
_ARBFMT_8 = ' '; /* Initialize to avoid warning. */


******             ASSIGN OBSERVATION TO NODE             ******;
IF  NOT MISSING(median_income ) AND
                3.6627 <= median_income  AND
  median_income  <              6.29175 THEN DO;
  _ARBFMT_8 = PUT( ocean_proximity , $8.);
   %DMNORMIP( _ARBFMT_8);
  IF _ARBFMT_8 IN ('NEAR BAY' ,'NEAR OCE' ) THEN DO;
    IF  NOT MISSING(longitude ) AND
      longitude  <             -122.325 THEN DO;
      IF  NOT MISSING(latitude ) AND
                      37.755 <= latitude  AND
        latitude  <               37.945 THEN DO;
        IF  NOT MISSING(latitude ) AND
                        37.785 <= latitude  AND
          latitude  <               37.895 THEN DO;
          _NODE_  =                  135;
          _LEAF_  =                   64;
          P_median_house_value  =            475500.65;
          V_median_house_value  =     444271.117647058;
          END;
        ELSE IF  NOT MISSING(latitude ) AND
                        37.895 <= latitude  THEN DO;
          _NODE_  =                  136;
          _LEAF_  =                   65;
          P_median_house_value  =     393055.555555555;
          V_median_house_value  =     301377.777777777;
          END;
        ELSE DO;
          _NODE_  =                  134;
          _LEAF_  =                   63;
          P_median_house_value  =     364286.409090909;
          V_median_house_value  =     390261.222222222;
          END;
        END;
      ELSE IF  NOT MISSING(latitude ) AND
                      37.945 <= latitude  THEN DO;
        _NODE_  =                   62;
        _LEAF_  =                   66;
        P_median_house_value  =     271859.296296296;
        V_median_house_value  =            261360.05;
        END;
      ELSE DO;
        IF  NOT MISSING(latitude ) AND
          latitude  <               37.595 THEN DO;
          _NODE_  =                  131;
          _LEAF_  =                   58;
          P_median_house_value  =     437325.333333333;
          V_median_house_value  =     421833.555555555;
          END;
        ELSE IF  NOT MISSING(latitude ) AND
                        37.595 <= latitude  AND
          latitude  <               37.725 THEN DO;
          _NODE_  =                  132;
          _LEAF_  =                   59;
          P_median_house_value  =     265771.428571428;
          V_median_house_value  =     284661.764705882;
          END;
        ELSE DO;
          IF  NOT MISSING(longitude ) AND
            longitude  <             -122.495 THEN DO;
            _NODE_  =                  222;
            _LEAF_  =                   60;
            P_median_house_value  =     281742.857142857;
            V_median_house_value  =               270200;
            END;
          ELSE IF  NOT MISSING(longitude ) AND
                        -122.425 <= longitude  THEN DO;
            _NODE_  =                  224;
            _LEAF_  =                   62;
            P_median_house_value  =             258237.5;
            V_median_house_value  =     269033.333333333;
            END;
          ELSE DO;
            _NODE_  =                  223;
            _LEAF_  =                   61;
            P_median_house_value  =     347664.548387096;
            V_median_house_value  =               330380;
            END;
          END;
        END;
      END;
    ELSE IF  NOT MISSING(longitude ) AND
                  -117.165 <= longitude  THEN DO;
      _NODE_  =                   24;
      _LEAF_  =                   75;
      P_median_house_value  =     169980.434782608;
      V_median_house_value  =     172531.034482758;
      END;
    ELSE DO;
      IF  NOT MISSING(latitude ) AND
                      37.365 <= latitude  AND
        latitude  <               37.555 THEN DO;
        IF  NOT MISSING(longitude ) AND
                       -122.05 <= longitude  THEN DO;
          _NODE_  =                  140;
          _LEAF_  =                   70;
          P_median_house_value  =               211900;
          V_median_house_value  =     217866.666666666;
          END;
        ELSE DO;
          _NODE_  =                  139;
          _LEAF_  =                   69;
          P_median_house_value  =     358674.553191489;
          V_median_house_value  =      352865.48076923;
          END;
        END;
      ELSE IF  NOT MISSING(latitude ) AND
                      37.555 <= latitude  THEN DO;
        IF  NOT MISSING(latitude ) AND
                        37.795 <= latitude  AND
          latitude  <               37.905 THEN DO;
          _NODE_  =                  142;
          _LEAF_  =                   73;
          P_median_house_value  =               296875;
          V_median_house_value  =     283283.333333333;
          END;
        ELSE IF  NOT MISSING(latitude ) AND
                        37.905 <= latitude  THEN DO;
          _NODE_  =                  143;
          _LEAF_  =                   74;
          P_median_house_value  =     201770.909090909;
          V_median_house_value  =               205522;
          END;
        ELSE DO;
          IF  NOT MISSING(median_income ) AND
                          4.7224 <= median_income  THEN DO;
            _NODE_  =                  226;
            _LEAF_  =                   72;
            P_median_house_value  =     264496.428571428;
            V_median_house_value  =     251466.666666666;
            END;
          ELSE DO;
            _NODE_  =                  225;
            _LEAF_  =                   71;
            P_median_house_value  =     194857.142857142;
            V_median_house_value  =     204757.142857142;
            END;
          END;
        END;
      ELSE DO;
        IF  NOT MISSING(median_income ) AND
                       4.60325 <= median_income  THEN DO;
          _NODE_  =                  138;
          _LEAF_  =                   68;
          P_median_house_value  =     332251.747252747;
          V_median_house_value  =     321778.878787878;
          END;
        ELSE DO;
          _NODE_  =                  137;
          _LEAF_  =                   67;
          P_median_house_value  =     264051.378378378;
          V_median_house_value  =     282729.647887323;
          END;
        END;
      END;
    END;
  ELSE IF _ARBFMT_8 IN ('INLAND' ) THEN DO;
    IF  NOT MISSING(median_income ) AND
      median_income  <              4.19585 THEN DO;
      IF  NOT MISSING(longitude ) AND
                     -119.99 <= longitude  AND
        longitude  <             -118.785 THEN DO;
        IF  NOT MISSING(latitude ) AND
                        36.815 <= latitude  THEN DO;
          _NODE_  =                  161;
          _LEAF_  =                   98;
          P_median_house_value  =               118425;
          V_median_house_value  =               116900;
          END;
        ELSE DO;
          _NODE_  =                  160;
          _LEAF_  =                   97;
          P_median_house_value  =     88838.4615384615;
          V_median_house_value  =                89800;
          END;
        END;
      ELSE IF  NOT MISSING(longitude ) AND
                    -118.785 <= longitude  THEN DO;
        _NODE_  =                   75;
        _LEAF_  =                   99;
        P_median_house_value  =     150064.846153846;
        V_median_house_value  =     149080.821917808;
        END;
      ELSE DO;
        _NODE_  =                   73;
        _LEAF_  =                   96;
        P_median_house_value  =     153890.291262135;
        V_median_house_value  =               146770;
        END;
      END;
    ELSE IF  NOT MISSING(median_income ) AND
                   5.32055 <= median_income  THEN DO;
      IF  NOT MISSING(longitude ) AND
                     -118.12 <= longitude  AND
        longitude  <             -117.735 THEN DO;
        _NODE_  =                   80;
        _LEAF_  =                  108;
        P_median_house_value  =     369885.857142857;
        V_median_house_value  =               289440;
        END;
      ELSE IF  NOT MISSING(longitude ) AND
                    -117.735 <= longitude  THEN DO;
        _NODE_  =                   81;
        _LEAF_  =                  109;
        P_median_house_value  =            205860.75;
        V_median_house_value  =     202647.619047619;
        END;
      ELSE DO;
        _NODE_  =                   79;
        _LEAF_  =                  107;
        P_median_house_value  =     216331.147540983;
        V_median_house_value  =     188795.121951219;
        END;
      END;
    ELSE DO;
      IF  NOT MISSING(longitude ) AND
                     -118.65 <= longitude  AND
        longitude  <             -117.745 THEN DO;
        IF  NOT MISSING(latitude ) AND
          latitude  <               34.125 THEN DO;
          _NODE_  =                  168;
          _LEAF_  =                  103;
          P_median_house_value  =             220312.5;
          V_median_house_value  =             228612.5;
          END;
        ELSE IF  NOT MISSING(latitude ) AND
                         34.64 <= latitude  THEN DO;
          _NODE_  =                  170;
          _LEAF_  =                  105;
          P_median_house_value  =     136057.142857142;
          V_median_house_value  =     140571.428571428;
          END;
        ELSE DO;
          _NODE_  =                  169;
          _LEAF_  =                  104;
          P_median_house_value  =     278341.176470588;
          V_median_house_value  =             227187.5;
          END;
        END;
      ELSE IF  NOT MISSING(longitude ) AND
                    -117.745 <= longitude  THEN DO;
        _NODE_  =                   78;
        _LEAF_  =                  106;
        P_median_house_value  =     157280.018181818;
        V_median_house_value  =     157207.017543859;
        END;
      ELSE DO;
        IF  NOT MISSING(latitude ) AND
          latitude  <               36.975 THEN DO;
          _NODE_  =                  165;
          _LEAF_  =                  100;
          P_median_house_value  =     115764.516129032;
          V_median_house_value  =     144804.166666666;
          END;
        ELSE IF  NOT MISSING(latitude ) AND
                        39.045 <= latitude  THEN DO;
          _NODE_  =                  167;
          _LEAF_  =                  102;
          P_median_house_value  =               124580;
          V_median_house_value  =             159037.5;
          END;
        ELSE DO;
          _NODE_  =                  166;
          _LEAF_  =                  101;
          P_median_house_value  =     174197.580645161;
          V_median_house_value  =     178715.730337078;
          END;
        END;
      END;
    END;
  ELSE DO;
    IF  NOT MISSING(longitude ) AND
      longitude  <             -118.515 THEN DO;
      IF  NOT MISSING(median_income ) AND
                      5.1093 <= median_income  THEN DO;
        IF  NOT MISSING(latitude ) AND
          latitude  <               34.175 THEN DO;
          _NODE_  =                  147;
          _LEAF_  =                   79;
          P_median_house_value  =     378600.166666666;
          V_median_house_value  =               376567;
          END;
        ELSE IF  NOT MISSING(latitude ) AND
                        34.175 <= latitude  AND
          latitude  <               34.325 THEN DO;
          _NODE_  =                  148;
          _LEAF_  =                   80;
          P_median_house_value  =     254375.609756097;
          V_median_house_value  =            246793.75;
          END;
        ELSE DO;
          IF  NOT MISSING(latitude ) AND
            latitude  <               37.225 THEN DO;
            _NODE_  =                  230;
            _LEAF_  =                   81;
            P_median_house_value  =     357747.526315789;
            V_median_house_value  =             321573.4;
            END;
          ELSE DO;
            _NODE_  =                  231;
            _LEAF_  =                   82;
            P_median_house_value  =     287333.345238095;
            V_median_house_value  =     286275.356164383;
            END;
          END;
        END;
      ELSE DO;
        IF  NOT MISSING(latitude ) AND
          latitude  <               34.365 THEN DO;
          _NODE_  =                  144;
          _LEAF_  =                   76;
          P_median_house_value  =     231587.179487179;
          V_median_house_value  =     250585.259259259;
          END;
        ELSE IF  NOT MISSING(latitude ) AND
                        34.365 <= latitude  AND
          latitude  <                34.66 THEN DO;
          _NODE_  =                  145;
          _LEAF_  =                   77;
          P_median_house_value  =             346862.5;
          V_median_house_value  =             408100.5;
          END;
        ELSE DO;
          _NODE_  =                  146;
          _LEAF_  =                   78;
          P_median_house_value  =     236406.291428571;
          V_median_house_value  =     230578.203007518;
          END;
        END;
      END;
    ELSE IF  NOT MISSING(longitude ) AND
                  -118.515 <= longitude  AND
      longitude  <             -118.335 THEN DO;
      IF  NOT MISSING(latitude ) AND
                      34.025 <= latitude  AND
        latitude  <               34.165 THEN DO;
        _NODE_  =                   69;
        _LEAF_  =                   86;
        P_median_house_value  =     408888.924528301;
        V_median_house_value  =          417244.0625;
        END;
      ELSE IF  NOT MISSING(latitude ) AND
                      34.165 <= latitude  THEN DO;
        IF  NOT MISSING(latitude ) AND
          latitude  <               34.185 THEN DO;
          _NODE_  =                  152;
          _LEAF_  =                   87;
          P_median_house_value  =               293450;
          V_median_house_value  =               276400;
          END;
        ELSE DO;
          IF  NOT MISSING(longitude ) AND
            longitude  <             -118.455 THEN DO;
            _NODE_  =                  234;
            _LEAF_  =                   88;
            P_median_house_value  =     229633.333333333;
            V_median_house_value  =               235680;
            END;
          ELSE IF  NOT MISSING(longitude ) AND
                        -118.365 <= longitude  THEN DO;
            _NODE_  =                  236;
            _LEAF_  =                   90;
            P_median_house_value  =               252120;
            V_median_house_value  =     215766.666666666;
            END;
          ELSE DO;
            _NODE_  =                  235;
            _LEAF_  =                   89;
            P_median_house_value  =     186805.714285714;
            V_median_house_value  =     196653.333333333;
            END;
          END;
        END;
      ELSE DO;
        IF  NOT MISSING(longitude ) AND
          longitude  <             -118.385 THEN DO;
          _NODE_  =                  150;
          _LEAF_  =                   83;
          P_median_house_value  =     388334.292682926;
          V_median_house_value  =     388973.868421052;
          END;
        ELSE DO;
          IF  NOT MISSING(latitude ) AND
                          33.885 <= latitude  THEN DO;
            _NODE_  =                  233;
            _LEAF_  =                   85;
            P_median_house_value  =     240495.454545454;
            V_median_house_value  =     235817.647058823;
            END;
          ELSE DO;
            _NODE_  =                  232;
            _LEAF_  =                   84;
            P_median_house_value  =     334127.272727272;
            V_median_house_value  =     331926.086956521;
            END;
          END;
        END;
      END;
    ELSE DO;
      IF  NOT MISSING(median_income ) AND
                     5.16935 <= median_income  THEN DO;
        _NODE_  =                   72;
        _LEAF_  =                   95;
        P_median_house_value  =     270260.902173913;
        V_median_house_value  =     261142.204081632;
        END;
      ELSE DO;
        IF  NOT MISSING(latitude ) AND
          latitude  <               33.155 THEN DO;
          IF  NOT MISSING(housing_median_age ) AND
            housing_median_age  <                    6 THEN DO;
            _NODE_  =                  237;
            _LEAF_  =                   91;
            P_median_house_value  =               243400;
            V_median_house_value  =               226400;
            END;
          ELSE DO;
            _NODE_  =                  238;
            _LEAF_  =                   92;
            P_median_house_value  =     175384.210526315;
            V_median_house_value  =      176439.47368421;
            END;
          END;
        ELSE IF  NOT MISSING(latitude ) AND
                        34.105 <= latitude  THEN DO;
          _NODE_  =                  156;
          _LEAF_  =                   94;
          P_median_house_value  =     265913.355555555;
          V_median_house_value  =         280781.28125;
          END;
        ELSE DO;
          _NODE_  =                  155;
          _LEAF_  =                   93;
          P_median_house_value  =     211938.446753246;
          V_median_house_value  =     212005.367857142;
          END;
        END;
      END;
    END;
  END;
ELSE IF  NOT MISSING(median_income ) AND
               6.29175 <= median_income  THEN DO;
  IF  NOT MISSING(median_income ) AND
                 7.83595 <= median_income  AND
    median_income  <              9.04475 THEN DO;
    IF  NOT MISSING(housing_median_age ) AND
                      28.5 <= housing_median_age  THEN DO;
      _NODE_  =                   34;
      _LEAF_  =                  120;
      P_median_house_value  =      479862.23076923;
      V_median_house_value  =     473753.289473684;
      END;
    ELSE DO;
      IF  NOT MISSING(total_bedrooms ) AND
                         596 <= total_bedrooms  THEN DO;
        _NODE_  =                   88;
        _LEAF_  =                  119;
        P_median_house_value  =     444641.833333333;
        V_median_house_value  =     440889.736842105;
        END;
      ELSE DO;
        _NODE_  =                   87;
        _LEAF_  =                  118;
        P_median_house_value  =      366270.29787234;
        V_median_house_value  =     405951.757575757;
        END;
      END;
    END;
  ELSE IF  NOT MISSING(median_income ) AND
                 9.04475 <= median_income  THEN DO;
    IF  NOT MISSING(population ) AND
      population  <                   54 THEN DO;
      _NODE_  =                   35;
      _LEAF_  =                  121;
      P_median_house_value  =               273700;
      V_median_house_value  =               231250;
      END;
    ELSE DO;
      _ARBFMT_8 = PUT( ocean_proximity , $8.);
       %DMNORMIP( _ARBFMT_8);
      IF _ARBFMT_8 IN ('INLAND' ) THEN DO;
        _NODE_  =                   90;
        _LEAF_  =                  123;
        P_median_house_value  =     417086.142857142;
        V_median_house_value  =             370850.5;
        END;
      ELSE DO;
        _NODE_  =                   89;
        _LEAF_  =                  122;
        P_median_house_value  =     493042.839285714;
        V_median_house_value  =     488727.468085106;
        END;
      END;
    END;
  ELSE DO;
    IF  NOT MISSING(housing_median_age ) AND
                      26.5 <= housing_median_age  THEN DO;
      _NODE_  =                   32;
      _LEAF_  =                  117;
      P_median_house_value  =     397126.841726618;
      V_median_house_value  =     410495.929824561;
      END;
    ELSE DO;
      _ARBFMT_8 = PUT( ocean_proximity , $8.);
       %DMNORMIP( _ARBFMT_8);
      IF _ARBFMT_8 IN ('NEAR BAY' ,'NEAR OCE' ) THEN DO;
        _NODE_  =                   82;
        _LEAF_  =                  110;
        P_median_house_value  =     351966.150943396;
        V_median_house_value  =     366873.617647058;
        END;
      ELSE IF _ARBFMT_8 IN ('INLAND' ) THEN DO;
        IF  NOT MISSING(latitude ) AND
          latitude  <                34.19 THEN DO;
          _NODE_  =                  178;
          _LEAF_  =                  114;
          P_median_house_value  =               299850;
          V_median_house_value  =               261920;
          END;
        ELSE IF  NOT MISSING(latitude ) AND
                         34.19 <= latitude  AND
          latitude  <               37.495 THEN DO;
          _NODE_  =                  179;
          _LEAF_  =                  115;
          P_median_house_value  =               197830;
          V_median_house_value  =     215133.333333333;
          END;
        ELSE DO;
          _NODE_  =                  180;
          _LEAF_  =                  116;
          P_median_house_value  =     288652.380952381;
          V_median_house_value  =     291476.923076923;
          END;
        END;
      ELSE DO;
        IF  NOT MISSING(longitude ) AND
          longitude  <             -121.985 THEN DO;
          _NODE_  =                  175;
          _LEAF_  =                  111;
          P_median_house_value  =             408300.3;
          V_median_house_value  =             378387.5;
          END;
        ELSE IF  NOT MISSING(longitude ) AND
                      -117.705 <= longitude  THEN DO;
          _NODE_  =                  177;
          _LEAF_  =                  113;
          P_median_house_value  =     292273.076923076;
          V_median_house_value  =     312363.727272727;
          END;
        ELSE DO;
          _NODE_  =                  176;
          _LEAF_  =                  112;
          P_median_house_value  =     332267.036697247;
          V_median_house_value  =          325416.3125;
          END;
        END;
      END;
    END;
  END;
ELSE DO;
  _ARBFMT_8 = PUT( ocean_proximity , $8.);
   %DMNORMIP( _ARBFMT_8);
  IF _ARBFMT_8 IN ('<1H OCEA' ,'NEAR OCE' ) THEN DO;
    IF  NOT MISSING(longitude ) AND
      longitude  <             -122.735 THEN DO;
      IF  NOT MISSING(latitude ) AND
        latitude  <               38.725 THEN DO;
        _NODE_  =                   42;
        _LEAF_  =                   12;
        P_median_house_value  =     168616.666666666;
        V_median_house_value  =     176561.538461538;
        END;
      ELSE IF  NOT MISSING(latitude ) AND
                      38.725 <= latitude  AND
        latitude  <               39.855 THEN DO;
        _NODE_  =                   43;
        _LEAF_  =                   13;
        P_median_house_value  =     121730.434782608;
        V_median_house_value  =     131823.809523809;
        END;
      ELSE DO;
        IF  NOT MISSING(median_income ) AND
                       2.94745 <= median_income  THEN DO;
          _NODE_  =                   98;
          _LEAF_  =                   15;
          P_median_house_value  =               111900;
          V_median_house_value  =                99120;
          END;
        ELSE DO;
          _NODE_  =                   97;
          _LEAF_  =                   14;
          P_median_house_value  =                83200;
          V_median_house_value  =                80144;
          END;
        END;
      END;
    ELSE IF  NOT MISSING(longitude ) AND
                  -122.735 <= longitude  AND
      longitude  <             -118.305 THEN DO;
      IF  NOT MISSING(latitude ) AND
        latitude  <               33.985 THEN DO;
        IF  NOT MISSING(latitude ) AND
          latitude  <               33.885 THEN DO;
          _NODE_  =                   99;
          _LEAF_  =                   16;
          P_median_house_value  =               261900;
          V_median_house_value  =               243000;
          END;
        ELSE IF  NOT MISSING(latitude ) AND
                        33.885 <= latitude  AND
          latitude  <               33.925 THEN DO;
          IF  NOT MISSING(longitude ) AND
            longitude  <             -118.345 THEN DO;
            _NODE_  =                  194;
            _LEAF_  =                   17;
            P_median_house_value  =               246800;
            V_median_house_value  =               222100;
            END;
          ELSE DO;
            _NODE_  =                  195;
            _LEAF_  =                   18;
            P_median_house_value  =     192085.714285714;
            V_median_house_value  =               179225;
            END;
          END;
        ELSE DO;
          IF  NOT MISSING(longitude ) AND
            longitude  <             -118.355 THEN DO;
            _NODE_  =                  196;
            _LEAF_  =                   19;
            P_median_house_value  =     188133.333333333;
            V_median_house_value  =     233254.545454545;
            END;
          ELSE DO;
            _NODE_  =                  197;
            _LEAF_  =                   20;
            P_median_house_value  =     137680.769230769;
            V_median_house_value  =     137357.142857142;
            END;
          END;
        END;
      ELSE IF  NOT MISSING(latitude ) AND
                      33.985 <= latitude  AND
        latitude  <               34.175 THEN DO;
        IF  NOT MISSING(longitude ) AND
                      -118.355 <= longitude  THEN DO;
          IF  NOT MISSING(latitude ) AND
                          34.045 <= latitude  THEN DO;
            _NODE_  =                  199;
            _LEAF_  =                   23;
            P_median_house_value  =     277593.580645161;
            V_median_house_value  =     278721.212121212;
            END;
          ELSE DO;
            _NODE_  =                  198;
            _LEAF_  =                   22;
            P_median_house_value  =      145803.03030303;
            V_median_house_value  =               168908;
            END;
          END;
        ELSE DO;
          _NODE_  =                  102;
          _LEAF_  =                   21;
          P_median_house_value  =     321033.366666666;
          V_median_house_value  =      313626.20289855;
          END;
        END;
      ELSE DO;
        _ARBFMT_8 = PUT( ocean_proximity , $8.);
         %DMNORMIP( _ARBFMT_8);
        IF _ARBFMT_8 IN ('NEAR OCE' ) THEN DO;
          _NODE_  =                  105;
          _LEAF_  =                   27;
          P_median_house_value  =     245767.179104477;
          V_median_house_value  =               227423;
          END;
        ELSE DO;
          IF  NOT MISSING(longitude ) AND
            longitude  <             -121.865 THEN DO;
            _NODE_  =                  200;
            _LEAF_  =                   24;
            P_median_house_value  =     209209.302325581;
            V_median_house_value  =     231700.029411764;
            END;
          ELSE IF  NOT MISSING(longitude ) AND
                        -121.865 <= longitude  AND
            longitude  <             -120.435 THEN DO;
            _NODE_  =                  201;
            _LEAF_  =                   25;
            P_median_house_value  =     152712.328767123;
            V_median_house_value  =     157922.916666666;
            END;
          ELSE DO;
            _NODE_  =                  202;
            _LEAF_  =                   26;
            P_median_house_value  =     205359.539682539;
            V_median_house_value  =     214944.117647058;
            END;
          END;
        END;
      END;
    ELSE DO;
      IF  NOT MISSING(longitude ) AND
        longitude  <             -118.165 THEN DO;
        IF  NOT MISSING(latitude ) AND
          latitude  <               33.885 THEN DO;
          _NODE_  =                  106;
          _LEAF_  =                   28;
          P_median_house_value  =     187793.333333333;
          V_median_house_value  =               182058;
          END;
        ELSE IF  NOT MISSING(latitude ) AND
                        34.025 <= latitude  THEN DO;
          IF  NOT MISSING(longitude ) AND
                        -118.225 <= longitude  THEN DO;
            _NODE_  =                  207;
            _LEAF_  =                   33;
            P_median_house_value  =            149293.75;
            V_median_house_value  =               152200;
            END;
          ELSE DO;
            _NODE_  =                  206;
            _LEAF_  =                   32;
            P_median_house_value  =            217493.75;
            V_median_house_value  =     205841.463414634;
            END;
          END;
        ELSE DO;
          IF  NOT MISSING(longitude ) AND
            longitude  <             -118.275 THEN DO;
            _NODE_  =                  203;
            _LEAF_  =                   29;
            P_median_house_value  =     127787.775510204;
            V_median_house_value  =     123655.882352941;
            END;
          ELSE IF  NOT MISSING(longitude ) AND
                        -118.225 <= longitude  THEN DO;
            _NODE_  =                  205;
            _LEAF_  =                   31;
            P_median_house_value  =     144857.575757575;
            V_median_house_value  =               146880;
            END;
          ELSE DO;
            _NODE_  =                  204;
            _LEAF_  =                   30;
            P_median_house_value  =     103044.736842105;
            V_median_house_value  =               106550;
            END;
          END;
        END;
      ELSE IF  NOT MISSING(longitude ) AND
                    -117.145 <= longitude  THEN DO;
        IF  NOT MISSING(median_income ) AND
          median_income  <               1.9042 THEN DO;
          IF  NOT MISSING(latitude ) AND
                          32.715 <= latitude  THEN DO;
            _NODE_  =                  212;
            _LEAF_  =                   37;
            P_median_house_value  =               117375;
            V_median_house_value  =     130972.727272727;
            END;
          ELSE DO;
            _NODE_  =                  211;
            _LEAF_  =                   36;
            P_median_house_value  =     88369.2307692307;
            V_median_house_value  =                92400;
            END;
          END;
        ELSE IF  NOT MISSING(median_income ) AND
                        1.9042 <= median_income  AND
          median_income  <              2.57705 THEN DO;
          _NODE_  =                  112;
          _LEAF_  =                   38;
          P_median_house_value  =     121549.056603773;
          V_median_house_value  =               127132;
          END;
        ELSE DO;
          _NODE_  =                  113;
          _LEAF_  =                   39;
          P_median_house_value  =     149291.549295774;
          V_median_house_value  =     147117.391304347;
          END;
        END;
      ELSE DO;
        _ARBFMT_8 = PUT( ocean_proximity , $8.);
         %DMNORMIP( _ARBFMT_8);
        IF _ARBFMT_8 IN ('NEAR OCE' ) THEN DO;
          _NODE_  =                  110;
          _LEAF_  =                   35;
          P_median_house_value  =      215368.37755102;
          V_median_house_value  =     229203.107692307;
          END;
        ELSE DO;
          _NODE_  =                  109;
          _LEAF_  =                   34;
          P_median_house_value  =     183525.475155279;
          V_median_house_value  =     179737.686619718;
          END;
        END;
      END;
    END;
  ELSE IF _ARBFMT_8 IN ('INLAND' ) THEN DO;
    IF  NOT MISSING(median_income ) AND
      median_income  <              2.05115 THEN DO;
      IF  NOT MISSING(total_bedrooms ) AND
        total_bedrooms  <                 23.5 THEN DO;
        _NODE_  =                   51;
        _LEAF_  =                   40;
        P_median_house_value  =               156000;
        V_median_house_value  =     177857.142857142;
        END;
      ELSE IF  NOT MISSING(total_bedrooms ) AND
                         596 <= total_bedrooms  THEN DO;
        _NODE_  =                   53;
        _LEAF_  =                   46;
        P_median_house_value  =     88366.6666666666;
        V_median_house_value  =      86508.064516129;
        END;
      ELSE DO;
        IF  NOT MISSING(latitude ) AND
                        37.315 <= latitude  AND
          latitude  <               39.265 THEN DO;
          _NODE_  =                  115;
          _LEAF_  =                   44;
          P_median_house_value  =                87500;
          V_median_house_value  =     94338.8888888889;
          END;
        ELSE IF  NOT MISSING(latitude ) AND
                        39.265 <= latitude  THEN DO;
          _NODE_  =                  116;
          _LEAF_  =                   45;
          P_median_house_value  =                65700;
          V_median_house_value  =     73009.2790697674;
          END;
        ELSE DO;
          IF  NOT MISSING(longitude ) AND
                        -118.735 <= longitude  AND
            longitude  <              -116.97 THEN DO;
            _NODE_  =                  214;
            _LEAF_  =                   42;
            P_median_house_value  =     82988.6363636363;
            V_median_house_value  =     89244.4444444444;
            END;
          ELSE IF  NOT MISSING(longitude ) AND
                         -116.97 <= longitude  THEN DO;
            _NODE_  =                  215;
            _LEAF_  =                   43;
            P_median_house_value  =     61670.3703703703;
            V_median_house_value  =                61225;
            END;
          ELSE DO;
            _NODE_  =                  213;
            _LEAF_  =                   41;
            P_median_house_value  =     60315.0943396226;
            V_median_house_value  =     57645.9770114942;
            END;
          END;
        END;
      END;
    ELSE IF  NOT MISSING(median_income ) AND
                   2.05115 <= median_income  AND
      median_income  <               2.6077 THEN DO;
      IF  NOT MISSING(latitude ) AND
        latitude  <                34.92 THEN DO;
        IF  NOT MISSING(longitude ) AND
          longitude  <             -117.565 THEN DO;
          _NODE_  =                  120;
          _LEAF_  =                   47;
          P_median_house_value  =     135371.428571428;
          V_median_house_value  =     122907.692307692;
          END;
        ELSE DO;
          _NODE_  =                  121;
          _LEAF_  =                   48;
          P_median_house_value  =     98333.8461538461;
          V_median_house_value  =     94758.6206896551;
          END;
        END;
      ELSE IF  NOT MISSING(latitude ) AND
                       34.92 <= latitude  AND
        latitude  <               37.305 THEN DO;
        _NODE_  =                   55;
        _LEAF_  =                   49;
        P_median_house_value  =             73202.99;
        V_median_house_value  =     74852.1126760563;
        END;
      ELSE DO;
        IF  NOT MISSING(latitude ) AND
                         38.99 <= latitude  THEN DO;
          _NODE_  =                  125;
          _LEAF_  =                   51;
          P_median_house_value  =     83192.6470588235;
          V_median_house_value  =     81235.0877192982;
          END;
        ELSE DO;
          _NODE_  =                  124;
          _LEAF_  =                   50;
          P_median_house_value  =     106808.571428571;
          V_median_house_value  =     110479.569892473;
          END;
        END;
      END;
    ELSE DO;
      IF  NOT MISSING(latitude ) AND
        latitude  <               34.855 THEN DO;
        IF  NOT MISSING(longitude ) AND
          longitude  <             -118.015 THEN DO;
          _NODE_  =                  126;
          _LEAF_  =                   52;
          P_median_house_value  =               221920;
          V_median_house_value  =     196390.909090909;
          END;
        ELSE IF  NOT MISSING(longitude ) AND
                      -116.215 <= longitude  THEN DO;
          _NODE_  =                  128;
          _LEAF_  =                   54;
          P_median_house_value  =             76131.25;
          V_median_house_value  =     96333.3333333333;
          END;
        ELSE DO;
          _NODE_  =                  127;
          _LEAF_  =                   53;
          P_median_house_value  =     134491.778481012;
          V_median_house_value  =     122497.580645161;
          END;
        END;
      ELSE IF  NOT MISSING(latitude ) AND
                      34.855 <= latitude  AND
        latitude  <               36.825 THEN DO;
        _NODE_  =                   58;
        _LEAF_  =                   55;
        P_median_house_value  =     84531.5789473684;
        V_median_house_value  =     83870.4225352112;
        END;
      ELSE DO;
        IF  NOT MISSING(latitude ) AND
                         39.33 <= latitude  THEN DO;
          _NODE_  =                  130;
          _LEAF_  =                   57;
          P_median_house_value  =     96182.9787234042;
          V_median_house_value  =     98427.2727272727;
          END;
        ELSE DO;
          _NODE_  =                  129;
          _LEAF_  =                   56;
          P_median_house_value  =     125776.897689769;
          V_median_house_value  =     121134.134615384;
          END;
        END;
      END;
    END;
  ELSE DO;
    IF  NOT MISSING(longitude ) AND
      longitude  <             -122.405 THEN DO;
      IF  NOT MISSING(housing_median_age ) AND
        housing_median_age  <                 47.5 THEN DO;
        _NODE_  =                   37;
        _LEAF_  =                    1;
        P_median_house_value  =      250956.52173913;
        V_median_house_value  =             256466.8;
        END;
      ELSE DO;
        _NODE_  =                   38;
        _LEAF_  =                    2;
        P_median_house_value  =     365732.879310344;
        V_median_house_value  =     324851.358974359;
        END;
      END;
    ELSE DO;
      IF  NOT MISSING(latitude ) AND
        latitude  <               37.445 THEN DO;
        _NODE_  =                   39;
        _LEAF_  =                    3;
        P_median_house_value  =             335812.5;
        V_median_house_value  =               220680;
        END;
      ELSE IF  NOT MISSING(latitude ) AND
                      37.925 <= latitude  THEN DO;
        IF  NOT MISSING(longitude ) AND
          longitude  <             -122.335 THEN DO;
          IF  NOT MISSING(median_income ) AND
            median_income  <              1.84985 THEN DO;
            _NODE_  =                  192;
            _LEAF_  =                    9;
            P_median_house_value  =     79988.8888888889;
            V_median_house_value  =                84900;
            END;
          ELSE DO;
            _NODE_  =                  193;
            _LEAF_  =                   10;
            P_median_house_value  =               109440;
            V_median_house_value  =               120710;
            END;
          END;
        ELSE DO;
          _NODE_  =                   96;
          _LEAF_  =                   11;
          P_median_house_value  =               142715;
          V_median_house_value  =     151096.774193548;
          END;
        END;
      ELSE DO;
        IF  NOT MISSING(latitude ) AND
                        37.855 <= latitude  THEN DO;
          IF  NOT MISSING(longitude ) AND
                        -122.265 <= longitude  THEN DO;
            _NODE_  =                  191;
            _LEAF_  =                    8;
            P_median_house_value  =             357733.5;
            V_median_house_value  =               387200;
            END;
          ELSE DO;
            _NODE_  =                  190;
            _LEAF_  =                    7;
            P_median_house_value  =     200233.333333333;
            V_median_house_value  =               180200;
            END;
          END;
        ELSE DO;
          IF  NOT MISSING(longitude ) AND
            longitude  <             -122.335 THEN DO;
            _NODE_  =                  187;
            _LEAF_  =                    4;
            P_median_house_value  =     239064.705882353;
            V_median_house_value  =     207983.333333333;
            END;
          ELSE IF  NOT MISSING(longitude ) AND
                        -122.145 <= longitude  THEN DO;
            _NODE_  =                  189;
            _LEAF_  =                    6;
            P_median_house_value  =     181635.714285714;
            V_median_house_value  =     174860.714285714;
            END;
          ELSE DO;
            _NODE_  =                  188;
            _LEAF_  =                    5;
            P_median_house_value  =     142343.689320388;
            V_median_house_value  =     148586.967391304;
            END;
          END;
        END;
      END;
    END;
  END;

****************************************************************;
******          END OF DECISION TREE SCORING CODE         ******;
****************************************************************;

drop _LEAF_;
*------------------------------------------------------------*;
* TOOL: Model Compare Class;
* TYPE: ASSESS;
* NODE: MdlComp;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: Model Compare Class;
* TYPE: ASSESS;
* NODE: MdlComp3;
*------------------------------------------------------------*;
