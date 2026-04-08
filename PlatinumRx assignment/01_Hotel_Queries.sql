-- Q1: For every user, get the last booked room
SELECT user_id, room_no
FROM bookings b1
WHERE booking_date = (
    SELECT MAX(booking_date)
    FROM bookings b2
    WHERE b1.user_id = b2.user_id
);


-- Q2: Get booking_id and total billing amount for November 2021
SELECT 
    bc.booking_id,
    SUM(i.item_rate * bc.item_quantity) AS total_bill
FROM booking_commercials bc
JOIN items i ON bc.item_id = i.item_id
WHERE strftime('%Y-%m', bc.bill_date) = '2021-11'
GROUP BY bc.booking_id;


-- Q3: Get bill_id and bill amount for October 2021 where bill > 1000
SELECT 
    bc.bill_id,
    SUM(i.item_rate * bc.item_quantity) AS bill_amount
FROM booking_commercials bc
JOIN items i ON bc.item_id = i.item_id
WHERE strftime('%Y-%m', bc.bill_date) = '2021-10'
GROUP BY bc.bill_id
HAVING bill_amount > 1000;


-- Q4: Most ordered and least ordered item of each month in 2021
WITH item_orders AS (
    SELECT 
        strftime('%Y-%m', bill_date) AS month,
        item_id,
        SUM(item_quantity) AS total_qty
    FROM booking_commercials
    WHERE strftime('%Y', bill_date) = '2021'
    GROUP BY month, item_id
),
ranked AS (
    SELECT *,
        RANK() OVER (PARTITION BY month ORDER BY total_qty DESC) AS max_rank,
        RANK() OVER (PARTITION BY month ORDER BY total_qty ASC) AS min_rank
    FROM item_orders
)
SELECT *
FROM ranked
WHERE max_rank = 1 OR min_rank = 1;


-- Q5: Customers with second highest bill value of each month in 2021
WITH bill_values AS (
    SELECT 
        u.user_id,
        strftime('%Y-%m', bc.bill_date) AS month,
        SUM(i.item_rate * bc.item_quantity) AS total_bill
    FROM booking_commercials bc
    JOIN bookings b ON bc.booking_id = b.booking_id
    JOIN users u ON b.user_id = u.user_id
    JOIN items i ON bc.item_id = i.item_id
    WHERE strftime('%Y', bc.bill_date) = '2021'
    GROUP BY u.user_id, month
),
ranked AS (
    SELECT *,
        DENSE_RANK() OVER (PARTITION BY month ORDER BY total_bill DESC) AS rnk
    FROM bill_values
)
SELECT *
FROM ranked
WHERE rnk = 2;