echo "SELECT fname FROM births WHERE UPPER(fname) = 'BABY' AND UPPER(lname) = 'BOY'" | sqlite3 src/sql/test.db
echp "SELECT fname FROM persons WHERE UPPER(fname) = 'EVIL' AND UPPER(lname) = 'WITCH'" | sqlite3 src/sql/test.sb
