SELECT regno, fine, violation, vdate, IFNULL(SUM(amount), 0), IFNULL(MAX(pdate), '0000-01-01')
FROM tickets AS t LEFT OUTER JOIN payments AS p USING (tno)
GROUP BY tno HAVING tno=:tno;
