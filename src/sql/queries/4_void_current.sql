UPDATE registrations
SET expiry=date('now')
WHERE UPPER(fname)=UPPER(:c_fn) AND UPPER(lname)=UPPER(:c_ln) AND vin=:vin;
