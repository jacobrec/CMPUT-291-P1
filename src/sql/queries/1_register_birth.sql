INSERT INTO births (regno, fname, lname, gender, regdate, regplace, m_fname, m_lname, f_fname, f_lname)
VALUES (TRIM(:regno), TRIM(:n_fname), TRIM(:n_lname), TRIM(:n_gender), DATE("now", 'localtime'), TRIM(:regplace), TRIM(:m_fname), TRIM(:m_lname), TRIM(:f_fname), TRIM(:f_lname))
