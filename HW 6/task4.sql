-- 1
SELECT cust_name
FROM restBill
WHERE bill_total > 450.00
  AND waiter_no IN (
      SELECT staff_no
      FROM restStaff
      WHERE headwaiter = (
          SELECT staff_no
          FROM restStaff
          WHERE first_name = 'Charles'
      )
 );


-- 2
SELECT first_name, surname
FROM restStaff
WHERE staff_no = (
SELECT headwaiter
FROM restStaff
WHERE staff_no = (
SELECT waiter_no
FROM restBill
WHERE cust_name = "Nerida Smith" AND bill_date = 160111));


-- 3
SELECT cust_name
FROM restBill
WHERE bill_total = (
SELECT MIN(bill_total)
FROM restBill);



-- 4
SELECT first_name,surname 
FROM restStaff
WHERE staff_no NOT in (
SELECT waiter_no
FROM restBill);

-- 5
SELECT cust_name, first_name, surname, room_name
FROM restBill
JOIN restRest_table ON restBill.table_no = restRest_table.table_no
JOIN restStaff ON restBill.waiter_no = staff_no
WHERE bill_total = (
    SELECT MAX(bill_total)
    FROM restBill
);



