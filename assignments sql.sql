-- Q1A
select* from employees;
select employeeNumber,firstName,lastName from employees where jobTitle ="Sales Rep" and reportsTo = 1102;
-- Q1B
select* from products;
select distinct productline from products where productLine like ("%cars");
-- Q2
select * from customers;
SELECT customerNumber,customerName,case WHEN country in ("usa","canada") Then "North America" 
                                        WHEN country in ("UK","France","germany") THEN "Europe" 
                                        else "Other" end as "customerSegment"
                                        FROM customers;
-- Q3A
select*from orderdetails;
select productCode,sum(quantityOrdered) as total_ordered from orderdetails group by productCode order by total_ordered desc limit 10;
-- Q3B
select * from payments;
select monthname(paymentDate) as month_name,count(paymentDate) as num_payments from payments group by month_name having num_payments>20 order by num_payments desc ;
-- Q4A
create database Customers_Orders;
create table customers(customer_id int primary key auto_increment,first_name varchar(50) not null,last_name varchar(50) not null,email varchar(255) unique,phone_number varchar(20));
select * from customers;
describe customers;
insert into customers values(1,"sai","krishna","sai@gmail.com","77999000");
-- Q4B
create table orders(order_id int primary key auto_increment,customer_id int ,order_date date,Total_amount decimal(10,2) check(Total_amount>0),foreign key(customer_id) references customers(customer_id));
select * from orders;
describe orders;
insert into orders values(1,1,"2013-2-9",3000);
insert into orders values(2,2,"2013-2-9",3000);
-- Q5
select*from customers;
select* from orders;
select distinct country,count(orderNumber) as order_count from customers inner join orders on customers.customerNumber=orders.customerNumber group by country order by order_count desc limit 5;
-- Q6
create table projects(Employee_id int primary key auto_increment,FullName varchar(50) not null,Gender enum("Male","female"),Manager_id int);
insert into projects values(1,"Pranaya","Male",3);
insert into projects values(2,"Priyanka","female",1);
insert into projects values(3,"Preety","female",null);
insert into projects values(4,"Anuarag","Male",1);
insert into projects values(5,"sambit","Male",1);
insert into projects values(6,"Rajesh","Male",3);
insert into projects values(7,"Hina","female",3);
select*from projects;
select e1.FullName as ManagerName,e2.FullName as EmployeeName from projects e1 join projects e2 on e1.Manager_id=e2.Employee_id;
-- Q7
create table facility(Facility_id int,Name varchar(50),state varchar(20),country varchar(20));
alter table facility modify facility_id int primary key auto_increment;
alter table facility add column city varchar(30) not null after Name;
describe facility;
-- Q8
select * from products;
select * from productlines;
select * from orders;
select * from orderdetails;
CREATE VIEW product_category_sales AS
SELECT 
    pl.productLine AS productLine,
    SUM(od.quantityOrdered * od.priceEach) AS total_sales,
    COUNT(DISTINCT o.orderNumber) AS number_of_orders
FROM 
    Products p
JOIN 
    ProductLines pl ON p.productLine = pl.productLine
JOIN 
    OrderDetails od ON p.productCode = od.productCode
JOIN 
    Orders o ON od.orderNumber = o.orderNumber
GROUP BY 
    pl.productLine;
-- Q9
select * from customers;
select * from payments;
call classicmodels.Get_country_payments(2003, 'France');
-- Q10
select * from customers;
select * from orders;
select c.customerName, count(o.orderNumber) as order_count,dense_rank() over(order by count(o.orderNumber) desc) as order_frequency from customers c join orders o on c.customerNumber=o.customerNumber group by customerName;
-- Q10(b)
select * from orders;
select year(orderdate) as Year1,  monthname(orderdate) as month1,count(orderNumber) as Total_orders,format(lag(count(orderNumber)) over(partition by year(orderdate)),'p') as YOY from orders group by year(orderdate),monthname(orderdate);
-- Q11
select * from products;
SELECT productline, COUNT(*) AS Total
FROM  products 
where buyPrice > ( select avg(buyPrice) from products) group by productLine;
-- Q12
create table emp_eh(emp_id int primary key,empName varchar(50),emailaddress varchar(60));
describe emp_eh;
insert into emp_eh values (1,"sai","sai@gmail.com");
insert into emp_eh values (1,"sai","sai@gmail.com");
-- Q13
CREATE TABLE Emp_BIT (
    Name VARCHAR(100),
    Occupation VARCHAR(100),
    Working_date DATE,
    Working_hours INT
);

INSERT INTO Emp_BIT (Name, Occupation, Working_date, Working_hours) VALUES
('Robin', 'Scientist', '2020-10-04', 12),
('Warner', 'Engineer', '2020-10-04', 10),
('Peter', 'Actor', '2020-10-04', 13),
('Marco', 'Doctor', '2020-10-04', 14),
('Brayden', 'Teacher', '2020-10-04', 12),
('Antonio', 'Business', '2020-10-04', 11);
select * from emp_bit;
insert into emp_bit values("sai","analyst","2021-01-02",-1);
