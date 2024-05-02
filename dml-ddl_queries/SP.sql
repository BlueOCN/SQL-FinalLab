/*
    Query DML/DDL Problems Using the Classic Models database

    For this lab you must create and execute queries against the ClassicModels database to fulfill the requirements listed below.
    As a HINT, the expected number of rows in the answer set is shown in parentheses.

    Autor: Roberto González
*/


/*
    P1
    Create a NEW table named “TopCustomers” with three columns: CustomerNumber (integer), ContactDate (DATE) 
    and OrderTotal (a real number.) None of these columns can be NULL.
*/
CREATE TABLE topCustomers (
    customerNumber INTEGER NOT NULL,
    contactDate DATE NOT NULL,
    orderTotal REAL NOT NULL
);


/*
    P2
    Populate the new table “TopCustomers” with the CustomerNumber, today’s date, and the total value of all 
    their orders (PriceEach * quantityOrdered) for those customers whose order total value is greater than $140,000. 
    (should insert 10 rows )
*/
INSERT INTO topCustomers (
    SELECT
        c.customerNumber,
        current_date AS "contactDate",
        SUM(d.priceEach * d.quantityOrdered) as "orderTotal"
    FROM customers c
        LEFT OUTER JOIN orders o
        ON c.customerNumber = o.customerNumber
            LEFT OUTER JOIN orderDetails d
            ON c.orderNumber = d.orderNumber
    GROUP BY c.customerNumber
    HAVING SUM(d.priceEach * d.quantityOrdered) > 140000;
);


/*
    P3
    List the contents of the TopCustomers table in descending OrderTotal sequence. (10)
*/
SELECT *
FROM topCustomers
ORDER BY orderTotal DESC;


/*
    P4
    Add a new column to the TopCustomers table called OrderCount (integer).
*/
ALTER TABLE IF EXISTS topCustomers
ADD COLUMN IF NOT EXISTS orderCount INTEGER;

/*
    P5
    Update the Top Customers table, setting the OrderCount to a random number between 1 and 10.
    Hint: use (RANDOM() *10)
*/
UPDATE topCustomers 
SET (orderCount) = (RANDOM()*10);

/*
    P6
    List the contents of the TopCustomers table in descending OrderCount sequence. (10 rows)
*/
SELECT *
FROM topCustomers
ORDER BY orderCount DESC;


/*
    P7
    Drop the TopCustomers table. (no answer set)
*/
DROP TABLE IF EXISTS topCustomers;

