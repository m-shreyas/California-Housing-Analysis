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
               5.13655 <= median_income  THEN DO;
  IF  NOT MISSING(median_income ) AND
                 6.94935 <= median_income  THEN DO;
    IF  NOT MISSING(median_income ) AND
      median_income  <              8.02825 THEN DO;
      IF  NOT MISSING(total_bedrooms ) AND
        total_bedrooms  <                174.5 THEN DO;
        _NODE_  =                   28;
        _LEAF_  =                   36;
        P_median_house_value  =               253500;
        V_median_house_value  =     401073.181818181;
        END;
      ELSE DO;
        IF  NOT MISSING(housing_median_age ) AND
                          26.5 <= housing_median_age  THEN DO;
          _NODE_  =                   57;
          _LEAF_  =                   39;
          P_median_house_value  =     437200.352112676;
          V_median_house_value  =     441092.886792452;
          END;
        ELSE DO;
          IF  NOT MISSING(longitude ) AND
            longitude  <                 -122 THEN DO;
            _NODE_  =                   90;
            _LEAF_  =                   37;
            P_median_house_value  =     407363.909090909;
            V_median_house_value  =     407009.181818181;
            END;
          ELSE DO;
            _NODE_  =                   91;
            _LEAF_  =                   38;
            P_median_house_value  =     339837.688311688;
            V_median_house_value  =            353358.45;
            END;
          END;
        END;
      END;
    ELSE DO;
      IF  NOT MISSING(population ) AND
        population  <                   54 THEN DO;
        _NODE_  =                   30;
        _LEAF_  =                   40;
        P_median_house_value  =               273700;
        V_median_house_value  =               231250;
        END;
      ELSE DO;
        IF  NOT MISSING(median_income ) AND
          median_income  <              9.04475 THEN DO;
          IF  NOT MISSING(housing_median_age ) AND
                            28.5 <= housing_median_age  THEN DO;
            _NODE_  =                   93;
            _LEAF_  =                   42;
            P_median_house_value  =     485231.512820512;
            V_median_house_value  =     472529.285714285;
            END;
          ELSE DO;
            _NODE_  =                   92;
            _LEAF_  =                   41;
            P_median_house_value  =     387566.085106383;
            V_median_house_value  =           416012.725;
            END;
          END;
        ELSE DO;
          _ARBFMT_8 = PUT( ocean_proximity , $8.);
           %DMNORMIP( _ARBFMT_8);
          IF _ARBFMT_8 IN ('INLAND' ) THEN DO;
            _NODE_  =                   95;
            _LEAF_  =                   44;
            P_median_house_value  =     417086.142857142;
            V_median_house_value  =             370850.5;
            END;
          ELSE DO;
            _NODE_  =                   94;
            _LEAF_  =                   43;
            P_median_house_value  =     493042.839285714;
            V_median_house_value  =     488727.468085106;
            END;
          END;
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
        _LEAF_  =                   35;
        P_median_house_value  =     302333.407407407;
        V_median_house_value  =     256214.380952381;
        END;
      ELSE DO;
        IF  NOT MISSING(median_income ) AND
                       6.35325 <= median_income  THEN DO;
          _NODE_  =                   53;
          _LEAF_  =                   34;
          P_median_house_value  =     271807.407407407;
          V_median_house_value  =      263309.09090909;
          END;
        ELSE DO;
          _NODE_  =                   52;
          _LEAF_  =                   33;
          P_median_house_value  =     199209.433962264;
          V_median_house_value  =     191029.411764705;
          END;
        END;
      END;
    ELSE DO;
      IF  NOT MISSING(housing_median_age ) AND
                        36.5 <= housing_median_age  THEN DO;
        IF  NOT MISSING(median_income ) AND
                       5.85235 <= median_income  THEN DO;
          _NODE_  =                   51;
          _LEAF_  =                   32;
          P_median_house_value  =     409004.137254902;
          V_median_house_value  =            395642.24;
          END;
        ELSE DO;
          _NODE_  =                   50;
          _LEAF_  =                   31;
          P_median_house_value  =     337936.704225352;
          V_median_house_value  =      358690.65079365;
          END;
        END;
      ELSE DO;
        IF  NOT MISSING(longitude ) AND
                      -117.195 <= longitude  THEN DO;
          _NODE_  =                   49;
          _LEAF_  =                   30;
          P_median_house_value  =               226600;
          V_median_house_value  =     242220.588235294;
          END;
        ELSE DO;
          IF  NOT MISSING(median_income ) AND
                         5.91885 <= median_income  THEN DO;
            _NODE_  =                   89;
            _LEAF_  =                   29;
            P_median_house_value  =     329685.460674157;
            V_median_house_value  =     327130.450980392;
            END;
          ELSE DO;
            _NODE_  =                   88;
            _LEAF_  =                   28;
            P_median_house_value  =     285408.854237288;
            V_median_house_value  =     282916.392996108;
            END;
          END;
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
      IF  NOT MISSING(latitude ) AND
        latitude  <               34.675 THEN DO;
        IF  NOT MISSING(longitude ) AND
          longitude  <             -117.985 THEN DO;
          _NODE_  =                   44;
          _LEAF_  =                   23;
          P_median_house_value  =     252338.461538461;
          V_median_house_value  =      207919.23076923;
          END;
        ELSE DO;
          _NODE_  =                   45;
          _LEAF_  =                   24;
          P_median_house_value  =     148872.270967741;
          V_median_house_value  =     147445.652173913;
          END;
        END;
      ELSE DO;
        IF  NOT MISSING(longitude ) AND
                       -119.99 <= longitude  THEN DO;
          IF  NOT MISSING(latitude ) AND
                          37.285 <= latitude  THEN DO;
            _NODE_  =                   87;
            _LEAF_  =                   27;
            P_median_house_value  =     136122.222222222;
            V_median_house_value  =     142266.666666666;
            END;
          ELSE DO;
            _NODE_  =                   86;
            _LEAF_  =                   26;
            P_median_house_value  =     104090.384615384;
            V_median_house_value  =     107203.508771929;
            END;
          END;
        ELSE DO;
          _NODE_  =                   46;
          _LEAF_  =                   25;
          P_median_house_value  =     154722.996515679;
          V_median_house_value  =     154089.603960396;
          END;
        END;
      END;
    ELSE DO;
      IF  NOT MISSING(median_income ) AND
                      2.4454 <= median_income  THEN DO;
        IF  NOT MISSING(latitude ) AND
          latitude  <                 34.2 THEN DO;
          IF  NOT MISSING(longitude ) AND
            longitude  <             -117.715 THEN DO;
            _NODE_  =                   78;
            _LEAF_  =                   19;
            P_median_house_value  =     179145.454545454;
            V_median_house_value  =     169664.705882352;
            END;
          ELSE DO;
            _NODE_  =                   79;
            _LEAF_  =                   20;
            P_median_house_value  =      121139.50420168;
            V_median_house_value  =     114988.888888888;
            END;
          END;
        ELSE DO;
          IF  NOT MISSING(latitude ) AND
            latitude  <               36.825 THEN DO;
            _NODE_  =                   80;
            _LEAF_  =                   21;
            P_median_house_value  =     86390.9090909091;
            V_median_house_value  =     85132.9896907216;
            END;
          ELSE DO;
            _NODE_  =                   81;
            _LEAF_  =                   22;
            P_median_house_value  =     116165.042979942;
            V_median_house_value  =     114371.020408163;
            END;
          END;
        END;
      ELSE DO;
        IF  NOT MISSING(housing_median_age ) AND
          housing_median_age  <                  7.5 THEN DO;
          _NODE_  =                   40;
          _LEAF_  =                   16;
          P_median_house_value  =     157423.076923076;
          V_median_house_value  =               133650;
          END;
        ELSE DO;
          IF  NOT MISSING(median_income ) AND
                         2.05115 <= median_income  THEN DO;
            _NODE_  =                   77;
            _LEAF_  =                   18;
            P_median_house_value  =     89907.6050724637;
            V_median_house_value  =     87796.3157894737;
            END;
          ELSE DO;
            _NODE_  =                   76;
            _LEAF_  =                   17;
            P_median_house_value  =     75740.4411764706;
            V_median_house_value  =     78804.0216718266;
            END;
          END;
        END;
      END;
    END;
  ELSE DO;
    IF  NOT MISSING(median_income ) AND
      median_income  <               3.2219 THEN DO;
      IF  NOT MISSING(median_income ) AND
        median_income  <               2.4608 THEN DO;
        IF  NOT MISSING(total_bedrooms ) AND
          total_bedrooms  <                688.5 THEN DO;
          IF  NOT MISSING(population ) AND
            population  <                651.5 THEN DO;
            _NODE_  =                   60;
            _LEAF_  =                    1;
            P_median_house_value  =     175266.683760683;
            V_median_house_value  =     170577.691489361;
            END;
          ELSE DO;
            _NODE_  =                   61;
            _LEAF_  =                    2;
            P_median_house_value  =     138201.133182844;
            V_median_house_value  =     145197.822888283;
            END;
          END;
        ELSE DO;
          _NODE_  =                   33;
          _LEAF_  =                    3;
          P_median_house_value  =     191402.772413793;
          V_median_house_value  =     176279.217821782;
          END;
        END;
      ELSE DO;
        IF  NOT MISSING(housing_median_age ) AND
                          50.5 <= housing_median_age  THEN DO;
          IF  NOT MISSING(longitude ) AND
            longitude  <             -122.405 THEN DO;
            _NODE_  =                   66;
            _LEAF_  =                    6;
            P_median_house_value  =     354770.916666666;
            V_median_house_value  =     290528.619047619;
            END;
          ELSE DO;
            _NODE_  =                   67;
            _LEAF_  =                    7;
            P_median_house_value  =      236783.76744186;
            V_median_house_value  =     201344.444444444;
            END;
          END;
        ELSE DO;
          IF  NOT MISSING(latitude ) AND
                          37.925 <= latitude  THEN DO;
            _NODE_  =                   65;
            _LEAF_  =                    5;
            P_median_house_value  =     145190.526315789;
            V_median_house_value  =     139852.173913043;
            END;
          ELSE DO;
            _NODE_  =                   64;
            _LEAF_  =                    4;
            P_median_house_value  =     195202.929824561;
            V_median_house_value  =     195221.657088122;
            END;
          END;
        END;
      END;
    ELSE DO;
      IF  NOT MISSING(longitude ) AND
                    -118.305 <= longitude  THEN DO;
        IF  NOT MISSING(longitude ) AND
                      -117.165 <= longitude  THEN DO;
          IF  NOT MISSING(median_income ) AND
                          4.1862 <= median_income  THEN DO;
            _NODE_  =                   75;
            _LEAF_  =                   15;
            P_median_house_value  =          190364.0625;
            V_median_house_value  =               185150;
            END;
          ELSE DO;
            _NODE_  =                   74;
            _LEAF_  =                   14;
            P_median_house_value  =     153197.260273972;
            V_median_house_value  =            159243.75;
            END;
          END;
        ELSE DO;
          _ARBFMT_8 = PUT( ocean_proximity , $8.);
           %DMNORMIP( _ARBFMT_8);
          IF _ARBFMT_8 IN ('NEAR OCE' ) THEN DO;
            _NODE_  =                   73;
            _LEAF_  =                   13;
            P_median_house_value  =     285867.757575757;
            V_median_house_value  =     264586.369863013;
            END;
          ELSE DO;
            _NODE_  =                   72;
            _LEAF_  =                   12;
            P_median_house_value  =     209282.708108108;
            V_median_house_value  =     207726.711165048;
            END;
          END;
        END;
      ELSE DO;
        IF  NOT MISSING(housing_median_age ) AND
                          47.5 <= housing_median_age  THEN DO;
          IF  NOT MISSING(longitude ) AND
                          -122.3 <= longitude  THEN DO;
            _NODE_  =                   71;
            _LEAF_  =                   11;
            P_median_house_value  =     281789.513157894;
            V_median_house_value  =     269933.333333333;
            END;
          ELSE DO;
            _NODE_  =                   70;
            _LEAF_  =                   10;
            P_median_house_value  =     369685.916666666;
            V_median_house_value  =     354157.285714285;
            END;
          END;
        ELSE DO;
          IF  NOT MISSING(latitude ) AND
            latitude  <               34.165 THEN DO;
            _NODE_  =                   68;
            _LEAF_  =                    8;
            P_median_house_value  =     309265.687898089;
            V_median_house_value  =            342818.56;
            END;
          ELSE DO;
            _NODE_  =                   69;
            _LEAF_  =                    9;
            P_median_house_value  =     240554.555397727;
            V_median_house_value  =     236962.917137476;
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
