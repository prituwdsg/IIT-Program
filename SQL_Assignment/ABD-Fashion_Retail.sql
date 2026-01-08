/*Problem Statement
ABC Fashion is a leading retailer with a vast customer base and a team of dedicated sales
representatives. They have a Sales Order Processing System that helps manage customer
orders and interactions.*/

--Creating DB for ABC Retail--

Create Database ABC_Fashion

USE ABC_Fashion;


--Creating Table Salesman--

Create Table Salesman (SalesmanId int,Name varchar(255),Commission decimal(10,2),City varchar(50),Age int)

Insert into Salesman (SalesmanID, Name,Commission,City,Age)
Values (101,'Joe',50,'California',17),(102,'Simon',75,'Texas',25),
(103,'Jessie',105,'Florida',35),
(104,'Danny',100,'Texas',22),
(105,'Lia',65,'NewJersey',30);

--Creating Table Customer--
Create Table Customer (SalesmanId int,CustomerId int, CustomerName varchar (255),PurchaseAmount int)
Insert into Customer (SalesmanId,CustomerId,CustomerName,PurchaseAmount) 
Values (101,2345,'Andrew',550),(102,2346,'Roman',600),(103,1575,'Lucky',4500),(104,2345,'Andrew',4000),(107,3747,'Remona',2700),(110,4004,'Julia',4545)

--Creating Table Orders--

Create Table Orders(OrderId int,CustomerId int, SalesmanId int,OrderDate date, Amount decimal)
Insert into Orders (OrderId,CustomerId,SalesmanId,OrderDate,Amount)
Values
(5001,2345,101,'2021-07-04',550),(5003,1234,105,'2022-02-15',1500)

--1. Inserting a new record in Orders Table--

Insert into Orders (OrderId,CustomerId,SalesmanId,OrderDate,Amount)
values (5004,1575,103,'2024-06-29',4500)

/*2. Add Primary key constraint for SalesmanId column in Salesman table. */

/*Primary key constraint cannot be added to a nullable column*/

ALTER TABLE Salesman 
Alter column SalesmanId int not null 

ALTER TABLE Salesman 
ADD CONSTRAINT PK_Salesman PRIMARY KEY(SalesmanId)

--3.Add default constraint for City column in Salesman table--

ALTER TABLE Salesman add constraint df_city Default'SanJose' for city 

--4. Add Foreign key constraint for SalesmanId column in Customer table--

ALTER TABLE Customer with nocheck ADD CONSTRAINT fk_Salesman_Customer FOREIGN KEY (SalesmanId) REFERENCES Salesman (SalesmanId)

--5. Add not null constraint in Customer_name column for the Customer table--

Alter table Customer Alter column CustomerName varchar (255) not null

--6. Fetch the data where the Customer’s name is ending with ‘N’ also get the purchase amount value greater than 500--

Select* from Customer where (CustomerName like '%N') and (PurchaseAmount >500)

/*7. Using SET operators, retrieve the first result with unique SalesmanId values from two tables, 
and the other result containing SalesmanId with duplicates from two tables*/

-------unique SalesmanId values from two tables (Salesman and Customer tables)------------------------


Select SalesmanId from Salesman Union (Select SalesmanId from Customer)

-----Using set operator , SalesmanId with duplicates from two tables-------


Select SalesmanId from Salesman Intersect Select SalesmanId from Customer;

/* 8. Display the below columns which has the matching data.
Orderdate, Salesman Name, Customer Name, Commission, and City which has the range of Purchase Amount between 500 to 1500.*/

Select Salesman.SalesmanId, Salesman.Name, Salesman.Commission, Salesman.City, Customer.CustomerName, Orders.OrderDate, Orders.SalesmanId from Salesman
Join Customer on Customer.SalesmanId=Salesman.SalesmanId
Join Orders on Orders.SalesmanId=Customer.SalesmanId
where Customer.PurchaseAmount between 500 and 1500

--9. Using right join fetch all the results from Salesman and Orders table.-----

Select * from Salesman Right Join Orders on Salesman.SalesmanId=Orders.SalesmanId

-----End-----------------------------------------------------------------------

