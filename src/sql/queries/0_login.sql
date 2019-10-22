SELECT fname, lname, utype, city FROM users WHERE UPPER(uid) = UPPER(:usr) AND pwd = :passwd
