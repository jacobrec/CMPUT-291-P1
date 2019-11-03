INSERT INTO registrations VALUES
    (:regno, date('now'), date('now','+1 year'), :pno, :vin, :n_fn, :n_ln);
