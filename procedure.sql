CREATE database Products;
USE Products;
CREATE table Products(
Id int not null
auto_increment
primary key,
productCode int,
productName varchar(50),
productPrice varchar(20),
productAmount varchar(20),
productDescription varchar(100),
productStatus bit

);
INSERT INTO Products
VAlUE (1,12,'May giat','2000000','10','TOSHIBA',1),
		(2,21,'Quat','1200000','100','SAMSUG',0),
		(3,44,'Dieu Hoa','32000121','5','SAMSUNG',1),
		(4,23,'Ti Vi','23000000','30','LG',1);
CREATE UNIQUE INDEX code
ON Products(productCode);
ALTER TABLE Products ADD INDEX Composite_index(productName,productPrice);
SELECT * FROM Products where ProductName='Quat' or productPrice<'32000000';

CREATE VIEW productView AS
SELECT productCode, productName, productPrice, productStatus
FROM Products;

CREATE OR REPLACE VIEW productView as
SELECT productCode, productName, productPrice, productStatus
FROM Products;

DROP VIEW productView;


SELECT * FROM productView;

DELIMITER //
CREATE PROCEDURE getInfo()
BEGIN
SELECT * FROM Products;
END //
DELIMITER ;

call getInfo()

DELIMITER //
CREATE PROCEDURE AddProduct
(
  product_Code int,
  product_Name varchar(50),
  product_Price varchar(20),
  product_Amount varchar(20),
  product_Description varchar(100),
  product_Status bit
)
BEGIN
  INSERT INTO Products (productCode, productName, productPrice, productAmount, productDescription, productStatus)
  VALUES (product_Code, product_Name, product_Price, product_Amount, product_Description, product_Status);
END //

call Addproduct(14,'Dien Thoai','1000000','1000','NOKIA',1);

DELIMITER //
CREATE PROCEDURE UpdateProductById(
	productId int,
	product_Code int,
  product_Name varchar(50),
  product_Price varchar(20),
  product_Amount varchar(20),
  product_Description varchar(100),
  product_Status bit
)
BEGIN
UPDATE Products
SET productCode = product_Code,
	productName = product_Name,
    productPrice = product_Price,
    productAmount = product_Amount,
    productDescription = product_Description,
    productStatus = product_Status

WHERE Id = productId;
END //
call UpdateProductById(1,33,'May Giat','2500000','11','USA',1);


DELIMITER //
CREATE PROCEDURE deleteById(
productId int
)
BEGIN
DELETE FROM Products WHERE Id = productId;
END //

call deleteById(3);

SELECT * FROM Products.Products;


