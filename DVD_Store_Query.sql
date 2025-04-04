/* Q1: Which store has more invoices? */


SELECT 
  staff_id,
	COUNT(*) as "Total Rentals"
FROM rental
GROUP BY staff_id;


/* Q2: Who is the manager for each store? */


SELECT 
	first_name as "First Name", 
	last_name as "Last Name", 
	store_id as "Store ID"
FROM staff


/* Q3: What are top 3 values of total invoice? */
  

SELECT amount, COUNT(*) as "Number of Invoices"
FROM payment
GROUP BY amount
ORDER BY amount DESC
limit 3;


/* Q4: 4)	Which store has better customers? We’d like to know which store has more customers so we can run some promotions for that particular store. 
Write a query that returns the store with the higher sales. Return both the store information and sum of all invoice totals. */


SELECT 
    s.store_id as "Store ID",
    a.address "Address",
    a.address2 "Address 2",
    a.district "District",
    c.city AS "City Name",
    a.phone as "Phone Number",
    COUNT(r.rental_id) AS "Total Invoices"
FROM 
    store s
JOIN 
    staff st ON s.store_id = st.store_id
JOIN 
    address a ON st.address_id = a.address_id
JOIN 
    rental r ON st.staff_id = r.staff_id
JOIN 
    city c ON a.city_id = c.city_id
GROUP BY 
    s.store_id, a.address, a.address2, a.district, c.city, a.city_id, a.postal_code, a.phone
ORDER BY 
    "Total Invoices" DESC;


/* Q5: 5)	Who’s the best customer? The customer that has spent the most money will be declared as the best customer. 
Write a query that returns the person who has spent the most money including first name, last name, address info, contact info, and total number of rentals.*/

SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
	c.email,
	a.address,
	a.address2,
	a.district,
	a.postal_code,
	a.phone,
    COUNT(r.rental_id) AS "Rental Count"
FROM 
    rental r
JOIN 
    customer c ON r.customer_id = c.customer_id
JOIN
	address a ON c.address_id = a.address_id
GROUP BY 
    c.customer_id, 
	c.first_name,
	c.last_name,
	c.email,
	a.address,
	a.address2, 
	a.district,
	a.postal_code,
	a.phone
ORDER BY 
    "Rental Count" DESC
	limit 1;
