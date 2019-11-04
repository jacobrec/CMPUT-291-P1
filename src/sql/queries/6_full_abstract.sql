SELECT ticks, IFNULL(demerits, 0), IFNULL(allPts, 0)
FROM (SELECT COUNT(tno) AS ticks, UPPER(fname) AS fname, UPPER(lname) AS lname
     FROM registrations LEFT OUTER JOIN tickets USING (regno)
     GROUP BY UPPER(fname), UPPER(lname))
     LEFT OUTER JOIN
     (SELECT COUNT(*) AS demerits, SUM(points) AS allPts,
        UPPER(fname) AS fname, UPPER(lname) AS lname
     FROM demeritNotices
     GROUP BY UPPER(fname), UPPER(lname))
     USING (fname, lname)
GROUP BY fname, lname
HAVING UPPER(fname)=UPPER(:d_fn) AND UPPER(lname)=UPPER(:d_ln);
