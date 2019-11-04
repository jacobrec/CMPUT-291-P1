SELECT fname, lname, bdate, bplace, address, phone FROM persons
WHERE UPPER(fname) = UPPER(TRIM(:p1_fname)) AND UPPER(lname) = UPPER(TRIM(:p1_lname))
