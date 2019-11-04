-- User provides an existing registration number
-- System sets the new expiry date to one year from today's date if the current registration has expired or expires today
-- Otherwise, set the new expiry date to to one year after the current expiry date
UPDATE registrations
    SET expiry =
    CASE
        WHEN expiry <= DATE('now', 'localtime') THEN DATE('now', '+1 year', 'localtime')
        ELSE DATE(expiry, '+1 year', 'localtime')
    END
    WHERE regno = :regno

