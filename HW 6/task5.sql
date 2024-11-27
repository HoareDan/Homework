-- 1
SELECT  first_name, surname, bill_date, COUNT(*) AS num_bills
FROM restStaff
INNER JOIN restBill
ON waiter_no = staff_no
GROUP BY first_name, surname, bill_date
HAVING COUNT(*) >= 2;



-- 2
SELECT room_name , COUNT(*) AS  Table_Amount
FROM restRest_table
WHERE no_of_seats > 6 
GROUP BY room_name;


-- 3
SELECT room_name , Sum(bill_total) AS Bill_Amount
FROM restBill
INNER JOIN restRest_table
ON restRest_table.table_no = restBill.table_no
GROUP BY room_name;



-- 4
SELECT restStaff.first_name, restStaff.surname, SUM(restBill.bill_total) AS total_bill
FROM restStaff
JOIN restStaff AS waiterStaff ON restStaff.staff_no = waiterStaff.headwaiter
JOIN restBill ON waiterStaff.staff_no = restBill.waiter_no
GROUP BY restStaff.first_name, restStaff.surname
ORDER BY total_bill DESC;


-- 5
SELECT cust_name
from restBill
GROUP BY cust_name
HAVING AVG(bill_total)>400.00;



-- 6
SELECT first_name, surname, COUNT(*) as NUM_BILLS
from restStaff
INNER JOIN restBill
ON waiter_no = staff_no
GROUP BY first_name,surname ,bill_date
HAVING COUNT(*) >=3;
