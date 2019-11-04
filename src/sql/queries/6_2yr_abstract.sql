SELECT ticks, demerits, twoYrsPts
FROM (SELECT COUNT(tno) AS ticks
     FROM (SELECT tno, vdate
          FROM registrations LEFT OUTER JOIN tickets USING (regno)
          GROUP BY UPPER(fname), UPPER(lname), tno, vdate
          HAVING UPPER(fname)=UPPER(:d_fn) AND UPPER(lname)=UPPER(:d_ln))
     WHERE vdate>=date('now', '-2 years')),
    (SELECT COUNT(ddate) AS demerits, IFNULL(SUM(points), 0) AS twoYrsPts
     FROM (SELECT ddate, points
          FROM demeritNotices
          GROUP BY UPPER(fname), UPPER(lname), ddate, points
          HAVING UPPER(fname)=UPPER(:d_fn) AND UPPER(lname)=UPPER(:d_ln))
     WHERE ddate>=date('now', '-2 years'));
