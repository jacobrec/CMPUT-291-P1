SELECT * FROM users WHERE UPPER(uid) = UPPER(:usr) AND pwd = :passwd
