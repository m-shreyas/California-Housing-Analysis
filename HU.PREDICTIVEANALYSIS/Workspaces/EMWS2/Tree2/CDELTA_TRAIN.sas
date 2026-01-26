if upcase(NAME) = "HOUSEHOLDS" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "LATITUDE" then do;
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
