INSERT INTO persons (fname, lname, bdate, bplace, address, phone)
VALUES (TRIM(:fname), TRIM(:lname), TRIM(:bdate), TRIM(:bplace), TRIM(:address), TRIM(:phone))
