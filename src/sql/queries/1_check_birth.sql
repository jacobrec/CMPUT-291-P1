SELECT regno, fname, lname, regdate, regplace, gender, m_fname || " " || m_lname, f_fname || " " || f_lname
FROM births
WHERE regno = :regno
