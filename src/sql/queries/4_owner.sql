SELECT fname, lname
FROM registrations
WHERE vin=:vin 
ORDER BY regdate DESC;
