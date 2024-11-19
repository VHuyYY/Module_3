create database Ss3_quan_li_ban_hang;
use Ss3_quan_li_ban_hang;

CREATE TABLE customer (
    cID INT PRIMARY KEY,
    cName VARCHAR(50),
    cAge INT
);

CREATE TABLE orders (
    oID INT PRIMARY KEY,
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
    PRIMARY KEY (oID , pID),
    FOREIGN KEY (oID)
        REFERENCES orders (oID),
    FOREIGN KEY (pID)
        REFERENCES product (pID)
);

INSERT INTO customer (cID, cName, cAge) VALUES
    (1, 'Minh Quan', 10),
    (2, 'Ngoc Oanh', 20),
    (3, 'Hong Ha', 50);
    
    INSERT INTO orders (oID, cID, oDate, oTotalPrice) VALUES
    (1, 1, '2006-03-21', NULL),
    (2, 2, '2006-03-23', NULL),
    (3, 1, '2006-03-16', NULL);
    
    INSERT INTO product (pID, pName, pPrice) VALUES
    (1, 'May Giat', 3),
    (2, 'Tu Lanh', 5),
    (3, 'Dieu Hoa', 7),
    (4, 'Quat', 1),
    (5, 'Bep Dien', 2);
    
    INSERT INTO orderDetail (oID, pID, odQTY) VALUES
    (1, 1, 3),
    (1, 3, 7),
    (1, 4, 2),
    (3, 1, 8),
    (2, 5, 4),
    (2, 3, 3);
-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select *
from orders;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
SELECT c.cName AS customerName, p.pName AS productName
FROM Customer c
JOIN orders o ON c.cID = o.cID
JOIN OrderDetail od ON o.oID = od.oID
JOIN Product p ON od.pID = p.pID;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
SELECT c.cName AS CustomerName
FROM Customer c
LEFT JOIN orders o ON c.cID = o.cID
WHERE o.oID IS NULL;

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)
SELECT o.oID, o.oDate, 
       SUM(od.odQTY * p.pPrice) AS TotalPrice
FROM orders o
JOIN orderDetail od ON o.oID = od.oID
JOIN product p ON od.pID = p.pID
GROUP BY o.oID, o.oDate;	



