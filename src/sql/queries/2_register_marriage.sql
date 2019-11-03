-- User provides the names of the partners
-- System automatically adds a unique registration number, todays date as registration date, registration place to the user's city
-- If any partner is not in the database of persons, add them by getting at least their first and last names, and if provided their birth place, address, and phone number
INSERT INTO marriages (regno, regdate, regplace, p1_fname, p1_lname, p2_fname, p2_lname)
VALUES (:regno, DATE("now"), :regplace, :p1_fname, :p1_lname, :p2_fname, :p2_lname)
