INSERT INTO registrations VALUES
    (:regno, date('now', 'localtime'), date('now', '+1 year', 'localtime'), :pno, :vin, :n_fn, :n_ln);
