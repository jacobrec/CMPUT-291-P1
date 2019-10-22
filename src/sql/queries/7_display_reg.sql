SELECT fname, lname, make, model, color, year FROM registrations
    JOIN vehicles USING(vin)
    JOIN persons USING(fname, lname)
    WHERE regno = :regno;
