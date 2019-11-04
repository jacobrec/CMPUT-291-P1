SELECT fname, lname, bdate, bplace, address, phone FROM persons
WHERE UPPER(fname) = UPPER(TRIM(:p2_fname)) AND UPPER(lname) = UPPER(TRIM(:p2_lname))
