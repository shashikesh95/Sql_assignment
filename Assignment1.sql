create database if not exists company;
use company;
create table if not exists SalesPeople(
Snum int not null ,
Sname varchar(50) unique,
City varchar(50) ,
Comm decimal(5,2),
primary key (Snum)
);

insert into SalesPeople values
(1001, 'Peel', 'London', .12),
(1002, 'Serres', 'Sanjose', .13),
(1004, 'Motika', 'London', .11),
(1007, 'Rifkin', 'Barcelona', .15),
(1003, 'Axelrod', 'Newyork', .10);


create table if not exists Customers(
Cnum int primary key ,
Cname varchar(50), 
City varchar(50) not null,
Snum int,
foreign key (Snum) references SalesPeople(Snum)
);

insert into Customers values(2001, 'Hoffman', 'London', 1001),
(2002,  'Giovanni', 'Rome', 1003),
(2003,  'Liu', 'Sanjose', 1002),
(2004,  'Grass', 'Berlin', 1002),
(2006, 'Clemens', 'London', 1001),
(2008, 'Cisneros', 'Sanjose', 1007),
(2007, 'Pereira', 'Rome', 1004);

create table if not exists Orders
(Onum int primary key ,
Amt decimal(8,3),
Odate date ,
Cnum int,
Snum int ,
foreign key (Cnum) references Customers(Cnum),
foreign key (Snum) references SalesPeople(Snum)
);

insert into Orders values
(3001, 18.69, '1990-10-3', 2008, 1007),
(3003, 767.19, '1990-10-3', 2001, 1001),
(3002, 1900.10, '1990-10-3', 2007, 1004),
(3005, 5160.45, '1990-10-3', 2003, 1002),
(3006, 1098.16, '1990-10-3', 2008, 1007),
(3009, 1713.23, '1990-10-4', 2002, 1003),
(3007, 75.75,   '1990-10-4', 2004, 1002),
(3008, 4273.00, '1990-10-5', 2006, 1001),
(3010, 1309.95, '1990-10-6', 2004, 1002),
(3011, 9891.88, '1990-10-6', 2006, 1001)
;


select count(*) from SalesPeople where Sname like 'a%' or 'A%';

select s.Sname, o.amt 
from SalesPeople as s
inner join Orders as o
on s.Snum = o.Snum
where o.amt > 2000 ;

select count(*),city from SalesPeople where city like 'newyork';

select count(*),city from SalesPeople where city like 'london' or 'paris';

select count(o.Onum),o.odate, s.Snum, s.Sname 
from Orders as o
inner join SalesPeople as s
on o.Snum = s.Snum 
group by o.Snum