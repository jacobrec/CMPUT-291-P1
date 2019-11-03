INSERT INTO persons (fname, lname, bdate, bplace, address, phone)
VALUES (:n_fname, :n_lname, :bdate, :bplace, (SELECT address FROM persons WHERE fname = :m_fname AND lname = :m_lname), (SELECT phone FROM persons WHERE fname = :m_fname AND lname = :m_lname))
