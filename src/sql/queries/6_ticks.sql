SELECT tno, vdate, violation, fine, regno, make, model
FROM tickets LEFT OUTER JOIN registrations USING (regno) LEFT OUTER JOIN vehicles USING (vin)
WHERE UPPER(fname)=UPPER(:d_fn) AND UPPER(lname)=UPPER(:d_ln)
ORDER BY vdate DESC;
