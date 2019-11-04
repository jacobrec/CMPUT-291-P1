SELECT fname, lname, bdate, bplace, address, phone FROM persons
WHERE UPPER(fname) = UPPER(:n_fname) AND UPPER(lname) = UPPER(:n_lname)
