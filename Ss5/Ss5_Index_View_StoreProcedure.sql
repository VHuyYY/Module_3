create database Ss5_demo1;
use Ss5_demo1;


create table products(
Id int primary key auto_increment,
productCode int,
productName varchar(50),
productPrice double,
productAmount int,
productDescription varchar(50),
productStatus varchar(50)
);

INSERT INTO products (productCode, productName, productPrice, productAmount, productDescription, productStatus) VALUES
(101, 'Laptop', 1200.50, 50, 'High performance laptop', 'In Stock'),
(102, 'Smartphone', 699.99, 200, 'Latest smartphone model', 'Out of Stock'),
(103, 'Tablet', 299.99, 120, 'Portable tablet', 'In Stock'),
(104, 'Headphones', 150.75, 80, 'Noise-cancelling headphones', 'In Stock'),
(105, 'Smartwatch', 199.99, 150, 'Fitness smartwatch', 'Out of Stock'),
(106, 'Camera', 499.99, 100, 'High resolution camera', 'In Stock'),
(107, 'Gaming Console', 399.99, 60, 'Latest gaming console', 'In Stock'),
(108, 'Desktop', 899.99, 40, 'Powerful desktop', 'Out of Stock'),
(109, 'Printer', 129.99, 75, 'Color printer', 'In Stock'),
(110, 'Router', 89.99, 200, 'Wireless router', 'In Stock');
 -- -------------------------------------------- --
-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
CREATE UNIQUE INDEX idx_productCode ON products (productCode);

-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
CREATE INDEX idx_productName_productPrice ON products (productName, productPrice);

-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
EXPLAIN SELECT * FROM products WHERE productCode = 101;
EXPLAIN SELECT * FROM products WHERE productName = 'Laptop' AND productPrice = 1200.50;
-- So sánh câu truy vấn trước và sau khi tạo index
-- Trước khi tạo index, cột type có thể là ALL, cho thấy truy vấn cần quét toàn bộ bảng.
-- Sau khi tạo index, cột type có thể chuyển sang ref hoặc const, biểu thị rằng truy vấn sử dụng index để tìm kiếm nhanh hơn và không cần quét toàn bộ bảng.
 -- ----------------------------------------- --
-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
create view product_Information as
select productCode , productName, productPrice, productStatus
from products;
-- Tiến hành sửa đổi view
create or replace view product_Information as
select productCode , productName, productPrice, productAmount
from products;
-- Tiến hành xoá view
drop view product_information;
-- ---------------------------------------------------------------------- --
-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
DELIMITER //
create PROCEDURE getAll_product()
begin
select * from products;
end //
DELIMITER ;
call getAll_product();
-- Tạo store procedure thêm một sản phẩm mới
DELIMITER //
create PROCEDURE add_products(
 in p_productCode int,
 in p_productName varchar(50),
 in p_productPrice double,
 in p_productAmount int,
 in p_productDescription varchar(50),
 in p_productStatus varchar(50)
)
begin
INSERT INTO products (productCode, productName, productPrice, productAmount, productDescription, productStatus) 
VALUES (p_productCode, p_productName, p_productPrice, p_productAmount, p_productDescription, p_productStatus);
end //
DELIMITER ;
call add_products(111, 'Mouse', 25.99, 100, 'Wireless mouse', 'In Stock');
-- Tạo store procedure sửa thông tin sản phẩm theo id
DELIMITER //
create PROCEDURE update_products(
 in p_Id int,
 in p_productCode int,
 in p_productName varchar(50),
 in p_productPrice double,
 in p_productAmount int,
 in p_productDescription varchar(50),
 in p_productStatus varchar(50)
)
	begin
	update products
set
	productCode = p_productCode,
    productName = p_productName,
    productPrice = p_productPrice,
    productAmount = p_productAmount,
    productDescription = p_productDescription,
    productStatus = p_productStatus
    where Id = p_Id;
    end //
DELIMITER ;
	call update_products (1, 101, 'Updated Laptop', 1300.00, 45, 'Updated description for high performance laptop', 'In Stock');
-- Tạo store procedure xoá sản phẩm theo id
DELIMITER //
	create PROCEDURE delete_products(
	in p_Id int  
)
	begin
	delete from products
	where Id = p_Id;
	End //
DELIMITER ;
	call delete_products(11);