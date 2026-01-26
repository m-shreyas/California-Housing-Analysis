

length _FILTERFMT1  $200;
drop _FILTERFMT1 ;
_FILTERFMT1= put(ocean_proximity,$8.);
length _FILTERNORM1  $32;
drop _FILTERNORM1 ;
%dmnormcp(_FILTERFMT1,_FILTERNORM1);
if
_FILTERNORM1 not in ( 'ISLAND')
and
( households eq . or (-647.4495783<=households) and (households<=1646.5289387))
and ( housing_median_age eq . or (-9.117186402<=housing_median_age) and (housing_median_age<=66.39615927))
and ( latitude eq . or (29.224004242<=latitude) and (latitude<=42.039718626))
and ( longitude eq . or (-125.5802996<=longitude) and (longitude<=-113.5591093))
and ( median_house_value eq . or (-139331.0307<=median_house_value) and (median_house_value<=553042.66453))
and ( median_income eq . or (-1.828794151<=median_income) and (median_income<=9.5701361567))
and ( population eq . or (-1971.909621<=population) and (population<=4822.8631095))
and ( total_bedrooms eq . or (-726.2846577<=total_bedrooms) and (total_bedrooms<=1802.0257628))
and ( total_rooms eq . or (-3909.082673<=total_rooms) and (total_rooms<=9180.6088361))
;
