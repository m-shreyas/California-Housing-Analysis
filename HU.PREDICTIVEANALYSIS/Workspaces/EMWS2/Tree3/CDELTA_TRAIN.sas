if upcase(NAME) = "HOUSEHOLDS" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "HOUSING_MEDIAN_AGE" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "LATITUDE" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "LONGITUDE" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "POPULATION" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "Q_MEDIAN_HOUSE_VALUE" then do;
ROLE = "ASSESS";
end;
else 
if upcase(NAME) = "TOTAL_BEDROOMS" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "TOTAL_ROOMS" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "_NODE_" then do;
ROLE = "SEGMENT";
LEVEL = "NOMINAL";
end;
