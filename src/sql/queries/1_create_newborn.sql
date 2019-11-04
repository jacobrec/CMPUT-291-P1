INSERT INTO persons (fname, lname, bdate, bplace, address, phone)
VALUES (:n_fname, :n_lname, :bdate, :bplace, 
	(SELECT address FROM persons WHERE UPPER(fname) = UPPER(:m_fname) AND UPPER(lname) = UPPER(:m_lname)), 
	(SELECT phone FROM persons WHERE UPPER(fname) = UPPER(:m_fname) AND UPPER(lname) = UPPER(:m_lname)))
