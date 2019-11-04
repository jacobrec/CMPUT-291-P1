SELECT fname, lname, bdate, bplace, address, phone FROM persons
WHERE UPPER(fname) = UPPER(:f_fname) AND UPPER(lname) = UPPER(:f_lname)
