SELECT fname, lname, bdate, bplace, address, phone FROM persons
WHERE UPPER(fname) = UPPER(:p1_fname) AND UPPER(lname) = UPPER(:p1_lname)
