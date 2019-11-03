INSERT INTO marriages (regno, regdate, regplace, p1_fname, p1_lname, p2_fname, p2_lname)
VALUES (:regno, DATE("now"), :regplace, :p1_fname, :p1_lname, :p2_fname, :p2_lname)
