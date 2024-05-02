/*
    Query SELECT Problems Using the Classic Models database

    For this lab you must create and execute queries against the ClassicModels database to fulfill the requirements listed below.
    As a HINT, the expected number of rows in the answer set is shown in parentheses.

    Autor: Roberto González
*/


/*
    P1
    List the names of the cities in alphabetical order where Classic Models has offices. (7) 
*/
SELECT city as "City"
FROM offices
ORDER BY city;


/*
    P2
    List the EmployeeNumber, LastName, FirstName, Extension for all employees working out of the Paris office. (5)
*/
SELECT employeeNumber,
        LastName,
        FirstName,
        Extension
FROM employees, offices
WHERE employees.officeCode = offices.officeCode AND city = 'Paris';


/*
    P3
    List the ProductCode, ProductName, ProductVendor, QuantityInStock and ProductLine for all products
    with a QuantityInStock between 200 and 1200. (11)
*/
SELECT
    productCode, productName, productVendor,
    quanityInStock, productLine
FROM products
WHERE quantityInStock BETWEEN 200 AND 1200;


/*
    P4
    (Use a SUBQUERY) List the ProductCode, ProductName, ProductVendor, BuyPrice and MSRP
    for the least expensive (lowest MSRP) product sold by ClassicModels.
    (“MSRP” is the Manufacturer’s Suggested Retail Price.) (1)
*/
SELECT
    productCode, productName,
    productVendor, buyPrice, MSRP
FROM products
WHERE MSRP = ( SELECT MIN(MSRP) FROM products );


/*
    P5
    What is the ProductName and Profit of the product that has the highest profit (profit = MSRP minus BuyPrice). (1)
*/
SELECT productName, MSRP-buyPrice AS "profit"
FROM products
ORDER BY MSRP-buyPrice DESC
LIMIT 1;


/*
    P6
    List the country and the number of customers from that country for all countries having just two customers. 
    List the countries sorted in ascending alphabetical order. Title the column heading for the count of customers as “Customers”.(8)
*/
SELECT country, COUNT(customerNumber) AS "Customers"
FROM customers
GROUP BY country
HAVING COUNT(customerNumber) = 2
ORDER BY country ASC;


/*
    P7
    List the ProductCode, ProductName, and number of orders for the products with exactly 25 orders. 
    Title the column heading for the count of orders as “OrderCount”. (12)
*/
SELECT
    p.productCode,
    p.productName,
    COUNT(d.orderNumber) AS "OrderCount"
FROM products p
    JOIN orderdetails d
    ON p.productCode = d.productCode
GROUP BY p.productCode
HAVING COUNT(d.orderNumber) = 25;


/*
    P8
    List the EmployeeNumber, Firstname + Lastname (concatenated into one column in the answer set, 
    separated by a blank and referred to as ‘name’) for all the employees reporting 
    to Diane Murphy or Gerard Bondur. (8)
*/
SELECT
    e.employeeNumber,
    e.firstName || ' ' || e.lastName AS "name"
FROM employee e
    JOIN employee m
    ON e.reportsto = m.employeeNumber
WHERE
    (m.lastName = 'Murphy' AND m.firstName = 'Diane') OR
    (m.lastName = 'Bondur' AND m.firstName = 'Gerard');


/*
    P9
    List the EmployeeNumber, LastName, FirstName of the president of the company 
    (the one employee with no boss.) (1)
*/
SELECT
    employeeNumber,
    lastName,
    firstName
FROM employees
WHERE reportsto is NULL;


/*
    P10
    List the ProductName for all products in the “Classic Cars” product line from the 1950’s. (6)
*/
SELECT productName
FROM products
WHERE
    (productLine LIKE '%Classic_Cars%') AND
    (productName LIKE '195_ %');


/*
    P11
    List the month name and the total number of orders for the month in 2004 in which ClassicModels 
    customers placed the most orders. (1)
*/
SELECT
    to_char(orderDate, 'Month') AS "Month",
    COUNT(orderNumber)
FROM orders
WHERE DATE_PART('year', orderDate) = 2004
GROUP BY TO_CHAR(orderDate, 'Month')
ORDER BY COUNT(orderNumber) DESC
LIMIT 1;


/*
    P12
    List the firstname, lastname of employees who are Sales Reps who have no assigned customers. (2)
*/
-- Explicit JOIN
SELECT
    firstName,
    lastName
FROM employees e
    LEFT OUTER JOIN customers c
    ON e.employeeNumber = c.salesRepEmployeeNumber
WHERE 
    e.jobTitle LIKE '%Sales Rep%' AND
    c.customerNumber IS NULL;

-- Subquery
SELECT
    firstName,
    lastName
FROM employees
WHERE NOT employeeNumber
    IN(
        SELECT DISTINCT salesRepEmployeeNumber
        FROM customers
        WHERE NOT salesRepEmployeeNumber IS NULL
    )
    AND jobTitle LIKE '%Sales Rep%';

/*
    P13
    List the customername of customers from Switzerland with no orders. (2)
*/
SELECT c.customerName
FROM customers c
    LEFT OUTER JOIN orders o
    ON c.customerName = o.customerName
WHERE
    (o.customerNumber IS NULL) AND
    (c.country LIKE 'Switzerland');


/*
    P14
    List the customername and total quantity of products ordered for customers who have ordered
    more than 1650 products across all their orders. (8)
*/
SELECT 
    c.customerNumber,
    SUM(d.quantityOrdered)
FROM customers c
    LEFT OUTER JOIN orders o
    ON c.customerNumber = o.customerNumber
        LEFT OUTER JOIN orderDetails d
        ON o.orderNumber = d.orderNumber
GROUP BY c.customerNumber
HAVING SUM(d.quantityOrdered) > 1650
ORDER BY SUM(d.quantityOrdered);

