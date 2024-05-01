# SQL-FinalLab
The Structured Query Language (SQL) Final Lab

## Overview
This lab challenges students to practice a variety of SQL queries utilizing all the SQL features we have learned in class.  

For this lab, we will use the data in the Classic Models database.  See Appendix “A” for an overview and introduction to the Classic Models database.  You should become familiar with the Classic Models database prior to coding SQL queries for this lab.

## Results Submission
Copy and paste your SQL queries into a document.  Number each query to match its problem.  Save the document as a PDF and submit it for peer-review grading. 

### Query SELECT Problems Using the Classic Models database
For this lab you must create and execute queries against the ClassicModels database to fulfill the requirements listed below.  As a HINT, the expected number of rows in the answer set is shown in parentheses.

1. List  the names of the cities in alphabetical order where Classic Models has offices. (7)
2. List the EmployeeNumber, LastName, FirstName, Extension for all employees working out of the Paris office. (5)
3. List the ProductCode, ProductName, ProductVendor, QuantityInStock and ProductLine for all products with a QuantityInStock between 200 and 1200. (11)
4. (Use a SUBQUERY) List the ProductCode, ProductName, ProductVendor, BuyPrice and MSRP for the least expensive (lowest MSRP) product sold by ClassicModels.  (“MSRP” is the Manufacturer’s Suggested Retail Price.)  (1)    
5. What is the ProductName and Profit of the product that has the highest profit (profit = MSRP minus BuyPrice). (1)
6. List the country and the number of customers from that country for all countries having just two  customers.  List the countries sorted in ascending alphabetical order. Title the column heading for the count of customers as “Customers”.(7)   
7. List the ProductCode, ProductName, and number of orders for the products with exactly 25 orders.  Title the column heading for the count of orders as “OrderCount”. (12)
8. List the EmployeeNumber, Firstname + Lastname  (concatenated into one column in the answer set, separated by a blank and referred to as ‘name’) for all the employees reporting to Diane Murphy or Gerard Bondur. (8)
9. List the EmployeeNumber, LastName, FirstName of the president of the company (the one employee with no boss.)  (1)
10. List the ProductName for all products in the “Classic Cars” product line from the 1950’s.  (6)
11. List the month name and the total number of orders for the month in 2004 in which ClassicModels customers placed the most orders. (1)
12. List the firstname, lastname of employees who are Sales Reps who have no assigned customers.  (2)
13. List the customername of customers from Switzerland with no orders. (2)
14. List the customername and total quantity of products ordered for customers who have ordered more than 1650 products across all their orders.  (8)

### Query DML/DDL Problems Using the Classic Models database
1. Create a NEW table named “TopCustomers” with three columns: CustomerNumber (integer), ContactDate (DATE) and  OrderTotal (a real number.)  None of these columns can be NULL.
2. Populate the new table “TopCustomers” with the CustomerNumber, today’s date, and the total value of all their orders (PriceEach * quantityOrdered) for those customers whose order total value is greater than $140,000. (should insert 10 rows )
3. List the contents of the TopCustomers table in descending OrderTotal sequence. (10) 
4. Add a new column to the TopCustomers table called OrderCount (integer).
5. Update the Top Customers table, setting the OrderCount to a random number between 1 and 10.  Hint:  use (RANDOM() *10)
6. List the contents of the TopCustomers table in descending OrderCount sequence. (10 rows)
7. Drop the TopCustomers table. (no answer set)

## Appendix “A” – Overview of the Classic Models database
### Classic Models Company
Classic Models is a retailer of diecast miniature collectible model cars, motorcycles, airplanes, trains and ships.  

### Classic Models Database 
The sample “Classic Models” database consists of the following eight tables:

| **Customers**         | **Stores customer data**                                |
|:----------------------|:------------------------------------------------------- |
| **Products** | Stores information about the scale models.              |
| **ProductLines** | Stores a list of Classic Models’ various product lines. |
| **Orders** | Stores sales orders placed by customers.  |
| **OrderDetails** | Stores sales order line items for each sales order.  |
| **Payments** | Stores payments made by customers for purchases |
| **Employees** | Stores all Classic Models employee information  |
| **Offices** | Stores sales office data. |
