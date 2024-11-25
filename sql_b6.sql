use sqlb6;
create table customers(
	customerID int primary key auto_increment,
    customerName varchar(50),
    contactName varchar(50),
    country varchar(50)
);

create table `order`(
	orderID int primary key auto_increment,
    customerID int,
    orderDate date,
    totalAmount decimal,
    foreign key (customerID) references customers(customerID)
    
);

create table products(
	productID int primary key auto_increment,
    productName varchar(50),
    price decimal
);

create table orderDetails(
	orderDetailID int primary key auto_increment,
    orderID int,
    productID int,
    quantity int,
    unitPrice decimal,
    foreign key (orderID) references `order`(orderID),
    foreign key (productID) references products(productID)
    
    
);
-- Hãy tạo một view để hiển thị thông tin đơn hàng
create view `don hang` as
select * from `order`;

-- Hãy tạo một view để hiển thị chi tiết đơn hàng
create view `don hang chi tiet` as
select * from orderDetails;

-- Hãy tạo chỉ mục cho bảng Orders
create index `total` on `order`(totalAmount); 


show indexes from `order`;

-- Hãy tạo chỉ mục cho bảng OrdersDetails
create index `quantity` on orderDetails(quantity);
