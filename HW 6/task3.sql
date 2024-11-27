-- 1
SELECT DISTINCT first_name, surname 
FROM restStaff 
INNER JOIN restBill 
on staff_no = waiter_no 
WHERE cust_name = "Tanya Singh";


-- 2
SELECT room_date
FROM restRoom_management rm
INNER JOIN restStaff  
ON rm.headwaiter = staff_no
WHERE staff_no = 10 
AND room_name = 'Green'
  AND rm.room_date BETWEEN 160201 AND 160229;

-- 3
SELECT s.first_name, s.surname
FROM restStaff s
INNER JOIN restStaff z ON s.headwaiter = z.headwaiter
WHERE z.first_name = 'Zoe' AND z.surname = 'Ball';


-- 4
SELECT cust_name , bill_total , first_name ,surname 
FROM restBill
INNER JOIN restStaff 
ON waiter_no = staff_no
ORDER BY bill_total DESC;

-- 5
SELECT DISTINCT first_name , surname 
FROM restStaff
INNER JOIN restBill
ON staff_no = waiter_no
WHERE table_no IN ( 
SELECT table_no
FROM restBill
WHERE bill_no IN  (00014,00017));


-- 6
SELECT restStaff.first_name, restStaff.surname
FROM restStaff
INNER JOIN restRoom_management 
ON restStaff.staff_no = restRoom_management.headwaiter
WHERE restRoom_management.room_name = 'Blue' AND restRoom_management.room_date = 160312
UNION
SELECT restStaff.first_name, restStaff.surname
FROM restStaff
INNER JOIN restBill 
ON restStaff.staff_no = restBill.waiter_no
INNER JOIN restRest_table 
ON restBill.table_no = restRest_table.table_no
WHERE restRest_table.room_name = 'Blue' AND restBill.bill_date = 160312;
