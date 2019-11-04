SELECT fname, lname, bdate, bplace, address, phone FROM persons
WHERE UPPER(fname) = UPPER(TRIM(:n_fname)) AND UPPER(lname) = UPPER(TRIM(:n_lname))
