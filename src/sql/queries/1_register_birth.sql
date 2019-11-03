-- Register a birth by providing a first name, last name, gender, birth date, birth place, first and last names of both parents. 
-- Registration date is set to today's date, and registration place to city of the user
-- Automatically assign a unique registration number to the birth record
-- Address / phone number of newborn are set to those of the mother
-- If any parent is not in the database, add them, getting at least their first and last names, and also their birth place, address, and phone number if they are provided
-- Newborn and previously unknown parents are added as a person to the persons database

INSERT INTO births (regno, fname, lname, gender, regdate, regplace, m_fname, m_lname, f_fname, f_lname)
VALUES (:regno, :n_fname, :n_lname, :n_gender, DATE("now"), :regplace, :m_fname, :m_lname, :f_fname, :f_lname)
