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
    List the EmployeeNumber, LastName, FirstName, Extension for all employees working out of the Paris office. (5)
*/
/*
    P7
    List the EmployeeNumber, LastName, FirstName, Extension for all employees working out of the Paris office. (5)
*/
/*
    P8
    List the EmployeeNumber, LastName, FirstName, Extension for all employees working out of the Paris office. (5)
*/
/*
    P9
    List the EmployeeNumber, LastName, FirstName, Extension for all employees working out of the Paris office. (5)
*/
/*
    P10
    List the EmployeeNumber, LastName, FirstName, Extension for all employees working out of the Paris office. (5)
*/
/*
    P11
    List the EmployeeNumber, LastName, FirstName, Extension for all employees working out of the Paris office. (5)
*/
/*
    P12
    List the EmployeeNumber, LastName, FirstName, Extension for all employees working out of the Paris office. (5)
*/
/*
    P13
    List the EmployeeNumber, LastName, FirstName, Extension for all employees working out of the Paris office. (5)
*/
/*
    P14
    List the EmployeeNumber, LastName, FirstName, Extension for all employees working out of the Paris office. (5)
*/