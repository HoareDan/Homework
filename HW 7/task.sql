-- 1
GO 
CREATE VIEW samsBills
AS SELECT first_name, surname, bill_date, cust_name, bill_total
FROM restBill
INNER JOIN restStaff
ON waiter_no = staff_no
WHERE first_name = "Sam" and surname ="Pitt";


-- 2
GO
SELECT * 
FROM samsBills
WHERE bill_total > 400;


-- 3
--rt = roomTotal , bt = billTotal
GO
CREATE VIEW roomTotals
AS SELECT  rt.room_name , SUM (rb.bill_total) as total_sum
FROM restBill rb
JOIN restRest_table rt
ON rb.table_no = rt.table_no
GROUP BY rt.room_name;



-- 4
GO
--BT= bill_total; rs = restStaff , staff = restStaff for name/surname/staff_no
CREATE VIEW teamTotals
AS SELECT 
CONCAT(staff.first_name," ", staff.surname) AS headwaiter_name, 
SUM(rb.bill_total) AS total_sum
FROM restBill rb
 JOIN restStaff rs
ON rb.waiter_no = rs.staff_no
 JOIN restStaff staff
ON rs.headwaiter = staff.staff_no
GROUP BY staff.first_name,staff.surname;
