SELECT fname, lname, bdate, bplace, address, phone FROM persons
WHERE UPPER(fname) = UPPER(:m_fname) AND UPPER(lname) = UPPER(:m_lname)
