INSERT INTO marriages (regno, regdate, regplace, p1_fname, p1_lname, p2_fname, p2_lname)
VALUES (TRIM(:regno), DATE("now", 'localtime'), TRIM(:regplace), TRIM(:p1_fname), TRIM(:p1_lname), TRIM(:p2_fname), TRIM(:p2_lname))
