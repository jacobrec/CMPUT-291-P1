SELECT make, model, color, year, plate, regdate, MAX(expiry), fname, lname
    FROM vehicles
    JOIN registrations USING(vin)
    WHERE year LIKE :year
      AND LOWER(color) LIKE LOWER(:color)
      AND LOWER(make) LIKE LOWER(:make)
      AND LOWER(model) LIKE LOWER(:model)
      AND LOWER(plate) LIKE LOWER(:plate)

    GROUP BY vin

