if ROLE in('INPUT', 'REJECTED') then do;
if upcase(NAME) in(
'HOUSEHOLDS'
'HOUSING_MEDIAN_AGE'
'LATITUDE'
'LONGITUDE'
'MEDIAN_INCOME'
'OCEAN_PROXIMITY'
'POPULATION'
'TOTAL_BEDROOMS'
'TOTAL_ROOMS'
) then ROLE='INPUT';
else do;
ROLE='REJECTED';
COMMENT = "Reg3: Rejected using backward selection";
end;
end;
