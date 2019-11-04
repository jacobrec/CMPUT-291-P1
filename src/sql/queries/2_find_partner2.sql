SELECT fname, lname, bdate, bplace, address, phone FROM persons
WHERE UPPER(fname) = UPPER(:p2_fname) AND UPPER(lname) = UPPER(:p2_lname)
