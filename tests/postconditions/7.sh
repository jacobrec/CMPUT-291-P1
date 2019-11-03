echo "SELECT regno, fine, violation FROM tickets WHERE vdate=DATE('$(date "+%Y-%m-%d")')" | sqlite3 src/sql/test.db
echo "SELECT regno, fine, violation, vdate FROM tickets WHERE vdate=DATE('2016-08-08')" | sqlite3 src/sql/test.db
