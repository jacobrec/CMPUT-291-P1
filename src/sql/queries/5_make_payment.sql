INSERT INTO payments (tno, pdate, amount) VALUES
    (:tno, date('now', 'localtime'), :pamt);
