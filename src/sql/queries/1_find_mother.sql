SELECT fname, lname, bdate, bplace, address, phone FROM persons
WHERE UPPER(fname) = UPPER(TRIM(:m_fname)) AND UPPER(lname) = UPPER(TRIM(:m_lname))
