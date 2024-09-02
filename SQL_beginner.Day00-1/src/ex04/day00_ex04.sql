SELECT DISTINCT name || ' (age:' || age || ',gender:' || chr(39) || gender || chr(39) || ',address:' || chr(39) || address || chr(39) || ')' 
AS person_information
FROM person
ORDER BY person_information ASC