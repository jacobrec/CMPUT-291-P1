INSERT INTO persons (fname, lname, bdate, bplace, address, phone)
VALUES (TRIM(:n_fname), TRIM(:n_lname), TRIM(:bdate), TRIM(:bplace), 
	(SELECT address FROM persons WHERE UPPER(fname) = UPPER(TRIM(:m_fname)) AND UPPER(lname) = UPPER(TRIM(:m_lname))), 
	(SELECT phone FROM persons WHERE UPPER(fname) = UPPER(TRIM(:m_fname)) AND UPPER(lname) = UPPER(TRIM(:m_lname))))
