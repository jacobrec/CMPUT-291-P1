INSERT INTO persons VALUES
    ("Jacob", "Reckhard", date('1998-12-08'), "Edmonton", "3301 Eaglehead Rd", "087-043-2825"),
    ("Testy", "McTestface", date('2001-06-21'), "Ottawa", "123 Test St", "123-456-7890"),
    ("Speedy", "McSpeedFace", date('2001-06-21'), "Fast City", "987 Fast St", "333-444-7777"),
    ("Arun", "Navras", date('1996-07-11'), "Edmonton", "987 Fast St", "780-696-9420"),
    ("Peter", "\\newline", date('1970-01-01'), "Tokyo", "% Street", "780-114-5128"),
    ("Navras", "Kamal", date('1999-02-03'), "Edmonton", "White Ave", "780-157-7853"),
    ('Michael', 'Fox', '1961-06-09', '', '', '555-000-0000'),
    ('Michelle', 'Vixen', '1962-08-19', '', '', '555-000-0001'),
    ('Little', 'Fox', '1995-01-21', '', '', '555-000-0002'),
    ('Big', 'Fox', '1990-08-14', '', '', '555-000-0003'),
    ('No', 'Vixen', '1961-12-02', '', '', '555-000-0005'),
    ('Stray', 'Fox', '1986-03-30', '', '', '555-000-0006'),
    ('Twin', 'Fox', '1986-03-30', '', '', '555-000-0004'),
    ('Another', 'Vixen', '1964-02-03', '', '', '555-000-0007'),
    ('Old', 'Fox', '1939-05-17', '', '', '555-000-0008'),
    ('Old', 'Vixen', '1940-10-25', '', '', '555-000-0009'),
    ('Sage', 'Fox', '1916-04-04', '', '', '555-000-0010'),
    ('Sage', 'Vixen', '1915-08-30', '', '', '555-000-0011'),
    ('Elder', 'Fox', '1908-01-19', '', '', '555-000-0012'),
    ('Elder', 'Vixen', '1912-06-23', '', '', '555-000-0013'),
    ('Uncle', 'Fox', '1941-04-28', '', '', '555-000-0014'),
    ('Aunt', 'Vixen', '1943-09-16', '', '', '555-000-0015'),
    ('Mr.', 'Fox', '1963-08-12', '', '', '555-000-0016'),
    ('Felicity', 'Vixen', '1966-03-22', '', '', '555-000-0017'),
    ('Ash', 'Fox', '1994-05-23', '', '', '555-000-0018'),
    ('Dr.', 'Fox', '1965-11-20', '', '', '555-000-0019'),
    ('Doc', 'Brown', '1923-12-02', '', '', '555-000-0020');

INSERT INTO users VALUES
    ("jacob", "password", "o", "Jacob", "Reckhard", "Edmonton"),
    ("navras", "drowssap", "a", "Navras", "Kamal", "Edmonton"),
    ("testy", "password", "a", "Testy", "McTestface", "Edmonton");

--births
INSERT INTO births VALUES
    (1, 'Little', 'Fox', '1995-01-21', '', 'M', 'Michael', 'Fox', 'Michelle', 'Vixen'),
    (2, 'Big', 'Fox', '1990-08-15', '', 'M', 'Michael', 'Fox', 'Michelle', 'Vixen'),
    (3, 'Twin', 'Fox', '1986-04-01', '', 'M', 'Michael', 'Fox', 'No', 'Vixen'),
    (4, 'Stray', 'Fox', '1986-04-01', '', 'M', 'Michael', 'Fox', 'No', 'Vixen'),
    (11, 'Michael', 'Fox', '1961-06-12', '', 'M', 'Old', 'Fox', 'Old', 'Vixen'),
    (5, 'Another', 'Vixen', '1964-02-04', '', 'F', 'Old', 'Fox', 'Old', 'Vixen'),
    (6, 'Old', 'Fox', '1939-05-17', '', 'M', 'Elder', 'Fox', 'Elder', 'Vixen'),
    (7, 'Old', 'Vixen', '1940-10-25', '', 'F', 'Sage', 'Fox', 'Sage', 'Vixen'),
    (9, 'Uncle', 'Fox', '1941-04-28', '', 'M', 'Elder', 'Fox', 'Elder', 'Vixen'),
    (10, 'Mr.', 'Fox', '1963-09-17', '', 'M', 'Uncle', 'Fox', 'Aunt', 'Vixen'),
    (12, 'Ash', 'Fox', '1994-05-25', '', 'M', 'Mr.', 'Fox', 'Felicity', 'Vixen'),
    (13, 'Dr.', 'Fox', '1965-11-25', '', 'M', 'Uncle', 'Fox', 'Aunt', 'Vixen');

--marriages
INSERT INTO marriages VALUES
    (1, '1984-12-20', '', 'Michael', 'Fox', 'No', 'Vixen'),
    (2, '1989-02-10', '', 'Michelle', 'Vixen', 'Michael', 'Fox'),
    (3, '1958-05-16', '', 'Old', 'Fox', 'Old', 'Vixen'),
    (4, '1938-07-07', '', 'Elder', 'Fox', 'Elder', 'Vixen'),
    (5, '1938-04-23', '', 'Sage', 'Fox', 'Sage', 'Vixen'),
    (6, '1961-09-27', '', 'Aunt', 'Vixen', 'Uncle', 'Fox'),
    (7, '1988-10-04', '', 'Felicity', 'Vixen', 'Mr.', 'Fox');

--vehicles
INSERT INTO vehicles VALUES
    ("v1000", "Zoom", "Fast", 2017, "Red"),
    ("v1001", "Suzuki", "Aerio", 2006, "Blue"),
    ("v1002", "Suzuki", "Swift", 2008, "Yellow"),
    ("v1003", "Toyota", "Echo", 2003, "Red"),
    ("v1004", "Honda", "Accord", 2004, "Beige"),
    ('v2001', 'Chevrolet', 'Camaro', 1969, 'red'),
    ('v2002', 'Chevrolet', 'Camaro', 1969, 'yellow'),
    ('v2003', 'Toyota', 'MR2', 1992, 'white'),
    ('v2004', 'Mazda', 'Miata', 1989, 'red'),
    ('v2005', 'Mazda', 'RX7', 1989, 'white'),
    ('v2006', 'Jeep', 'Wrangler', 1988, 'black'),
    ('v2007', 'Honda', 'Civic', 1989, 'red'),
    ('v2008', 'Mitsubishi', 'Eclipse', 1989, 'red'),
    ('v2009', 'Lotus', 'Elise', 1996, 'orange'),
    ('v2010', 'Lotus', 'Esprit', 1996, 'blue'),
    ('v2011', 'Delorean', 'DMC-12', 1981, 'silver'),
    ('v2012', 'Dodge', 'Caravan', 1984, 'red');

--registrations
INSERT INTO registrations VALUES
    (16, date('1017-08-08'), date('1020-08-08'), "IAM-SPD", "v1000", "Speedy", "McSpeedFace"),
    (17, date('2017-08-08'), date('2020-08-08'), "IAM-SPD", "v1000", "Speedy", "McSpeedFace"),
    (18, date('1017-08-09'), date('1020-08-09'), "BLU-100", "v1001", "Jacob", "Reckhard"),
    (19, date('2017-08-09'), date('2020-08-09'), "BLU-100", "v1001", "Jacob", "Reckhard"),
    (20, date('1017-06-09'), date('1020-06-09'), "WCC-189", "v1003", "Navras", "Kamal"),
    (21, date('2017-06-09'), date('2020-06-09'), "WCC-189", "v1003", "Navras", "Kamal"),
    (22, date('1017-06-06'), date('1020-06-06'), "CHO-099", "v1004", "Peter", "\\newline"),
    (23, date('2017-06-06'), date('2020-06-06'), "CHO-099", "v1004", "Peter", "\\newline"),
    (24, date('2017-01-08'), date('2020-01-08'), "NULL", "v1002", "Arun", "Navras"),
    (1, '1970-12-12', '1985-12-13', 'P1', 'v2001', 'Sage', 'Fox'),
    (2, '2018-12-12', '2025-12-13', 'P2', 'v2004', 'Old', 'Vixen'),
    (3, '2019-06-06', '2025-06-07', 'P3', 'v2002', 'Another', 'Vixen'),
    (4, '1990-06-06', '2019-12-13', 'P4', 'v2012', 'Michelle', 'Vixen'),
    (5, '1990-06-6', '2018-12-13', 'P5', 'v2012', 'Michael', 'Fox'),
    (6, '1985-10-21', '2200-12-31', 'P6', 'v2011', 'Michael', 'Fox'),
    (7, '2010-12-12', '2025-12-13', 'P7', 'v2006', 'Big', 'Fox'),
    (8, '2018-12-12', '2030-12-13', 'P8', 'v2008', 'Little', 'Fox'),
    (9, '2019-01-12', '2019-08-13', 'P9', 'v2005', 'Little', 'Fox'),
    (10, '2019-06-30', '2022-08-13', 'P10', 'v2003', 'Little', 'Fox'),
    (11, '2018-12-12', '2030-08-13', 'P11', 'v2009', 'Uncle', 'Fox'),
    (12, '2017-12-12', '2029-08-13', 'P12', 'v2007', 'Mr.', 'Fox'),
    (13, '2017-12-13', '2029-08-14', 'P13', 'v2007', 'Felicity', 'Vixen'),
    (14, '2018-12-12', '2030-08-13', 'P14', 'v2010', 'Dr.', 'Fox'),
    (15, '1981-10-01', '2200-12-31', 'P15', 'v2011', 'Doc', 'Brown');

--demerits
INSERT INTO demeritNotices VALUES
    ('2019-06-06','Little', 'Fox', 8, 'reckless driving'),
    ('2019-01-19','Little', 'Fox', 3, 'red light violation'),
    ('2019-01-21','Little', 'Fox', 3, 'ran a red light'),
    ('2019-01-20','Little', 'Fox', 3, 'speeding'),
    ('2000-01-20','Michelle', 'Vixen', 3, 'speeding'),
    ('1970-01-20','Sage', 'Fox', 8, 'reckess driving'),
    ('2019-01-20','Doc', 'Brown', 50, 'time travel');

--tickets
INSERT INTO tickets VALUES
    (1, 10, 300, 'reckless driving', '2019-06-06'),
    (2, 9, 100, 'red light violation', '2019-01-19'),
    (3, 9, 100, 'ran a red light', '2019-01-21'),
    (4, 9, 50, 'speeding', '2019-01-20'),
    (5, 4, 50, 'speeding', '2000-01-20'),
    (6, 1, 300, 'reckess driving', '1970-01-20'),
    (7, 15, 1.21, 'time travel', '2019-01-20');
