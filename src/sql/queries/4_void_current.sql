UPDATE registrations
SET expiry=date('now')
WHERE fname=:c_fn AND lname=:c_ln AND vin=:vin;
