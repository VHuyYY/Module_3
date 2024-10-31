create database Ss1;
use ss1;
create table class(
id int,
name varchar(50),
primary key(id)
);

create table teacher(
id int,
name varchar(50),
age int,
country varchar(50),
primary key (id)
);

select *
from class

select *
from teacher