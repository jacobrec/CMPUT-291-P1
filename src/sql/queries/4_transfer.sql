UPDATE registrations
SET expiry=date('now')
WHERE fname=:c_fn AND lname=:c_ln;

INSERT INTO registrations VALUES
    (:regno, date('now'), date('now','+1 year') :pno, :vin, :n_fn, :n_ln);
