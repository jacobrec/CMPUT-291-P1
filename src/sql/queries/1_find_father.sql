SELECT fname, lname, bdate, bplace, address, phone FROM persons
WHERE UPPER(fname) = UPPER(TRIM(:f_fname)) AND UPPER(lname) = UPPER(TRIM(:f_lname))
