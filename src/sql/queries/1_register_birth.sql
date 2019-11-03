INSERT INTO births (regno, fname, lname, gender, regdate, regplace, m_fname, m_lname, f_fname, f_lname)
VALUES (:regno, :n_fname, :n_lname, :n_gender, DATE("now"), :regplace, :m_fname, :m_lname, :f_fname, :f_lname)
