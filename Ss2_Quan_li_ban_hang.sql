create database Quan_li_ban_hang;
use Quan_li_ban_hang;

CREATE TABLE customer (
    cID INT PRIMARY KEY,
    cName VARCHAR(50),
    cAge INT
);

CREATE TABLE orders (
    oID INT PRIMARY KEY ,
    cID INT,
    oDate DATETIME,
    oTotalPrice DOUBLE,
    FOREIGN KEY (cID)
        REFERENCES customer (cID)
);

CREATE TABLE product (
    pID INT PRIMARY KEY,
    pName VARCHAR(50),
    pPrice DOUBLE
);

CREATE TABLE orderDetail (
    oID INT,
    pID INT,
    odQTY VARCHAR(50),
    primary key(oID,pID),
    FOREIGN KEY (oID)
        REFERENCES orders (oID),
    FOREIGN KEY (pID)
        REFERENCES product (pID)
);

