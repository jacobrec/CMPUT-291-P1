INSERT INTO persons VALUES
    ("Jacob", "Reckhard", date('1998-12-08'), "Edmonton", "3301 Eaglehead Rd", "087-043-2825"),
    ("Testy", "McTestface", date('2001-06-21'), "Ottawa", "123 Test St", "123-456-7890"),
    ("Speedy", "McSpeedFace", date('2001-06-21'), "Fast City", "987 Fast St", "333-444-7777"),
    ("Arun", "Navras", date('1996-07-11'), "Edmonton", "987 Fast St", "780-696-9420"),
    ("Peter", "\\newline", date('1970-01-01'), "Tokyo", "% Street", "780-114-5128"),
    ("Navras", "Kamal", date('1999-02-03'), "Edmonton", "White Ave", "780-157-7853");

INSERT INTO users VALUES
    ("jacob", "password", "o", "Jacob", "Reckhard", "Edmonton"),
    ("navras", "drowssap", "a", "Navras", "Kamal", "Edmonton"),
    ("testy", "password", "a", "Testy", "McTestface", "Edmonton");

INSERT INTO vehicles VALUES
    ("v1000", "Zoom", "Fast", 2017, "Red"),
    ("v1001", "Suzuki", "Aerio", 2006, "Blue"),
    ("v1002", "Suzuki", "Swift", 2008, "Yellow"),
    ("v1003", "Toyota", "Echo", 2003, "Red"),
    ("v1004", "Honda", "Accord", 2004, "Beige");

INSERT INTO registrations VALUES
    (1, date('1017-08-08'), date('1020-08-08'), "IAM-SPD", "v1000", "Speedy", "McSpeedFace"),
    (2, date('2017-08-08'), date('2020-08-08'), "IAM-SPD", "v1000", "Speedy", "McSpeedFace"),
    (3, date('1017-08-09'), date('1020-08-09'), "BLU-100", "v1001", "Jacob", "Reckhard"),
    (4, date('2017-08-09'), date('2020-08-09'), "BLU-100", "v1001", "Jacob", "Reckhard"),
    (5, date('1017-06-09'), date('1020-06-09'), "WCC-189", "v1003", "Navras", "Kamal"),
    (6, date('2017-06-09'), date('2020-06-09'), "WCC-189", "v1003", "Navras", "Kamal"),
    (7, date('1017-06-06'), date('1020-06-06'), "CHO-099", "v1004", "Peter", "newline"),
    (8, date('2017-06-06'), date('2020-06-06'), "CHO-099", "v1004", "Peter", "newline"),
    (9, date('2017-01-08'), date('2020-01-08'), "NULL", "v1002", "Arun", "Navras");

