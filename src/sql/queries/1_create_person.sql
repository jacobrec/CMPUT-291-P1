INSERT INTO persons (fname, lname, bdate, bplace, address, phone)
VALUES (TRIM(:name), TRIM(:lname), TRIM(:bdate), TRIM(:bplace), TRIM(:address), TRIM(:phone))
