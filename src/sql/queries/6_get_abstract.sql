SELECT ticks, demerits, twoYrsPts, allPts
FROM (SELECT COUNT(*) AS ticks
    FROM tickets LEFT OUTER JOIN registrations USING (regno)
    GROUP BY fname, lname
    HAVING UPPER(fname)=UPPER(:d_fn) AND UPPER(lname)=UPPER(:d_ln)),
    (SELECT COUNT(*) AS demerits, IFNULL(SUM(points), 0) AS allPts
    FROM demeritNotices
    GROUP BY fname, lname
    HAVING UPPER(fname)=UPPER(:d_fn) AND UPPER(lname)=UPPER(:d_ln)),
    (SELECT IFNULL(SUM(points), 0) AS twoYrsPts
    FROM demeritNotices
    GROUP BY fname, lname
    HAVING UPPER(fname)=UPPER(:d_fn) AND UPPER(lname)=UPPER(:d_ln)
    AND ddate>=date('now', '-2 years'));
