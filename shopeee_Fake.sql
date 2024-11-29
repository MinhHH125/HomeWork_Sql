use shoppe_fake;

-- Exercise 03
-- Áp dụng các kiến thức đã học về các mệnh đề truy vấn trong SQL, thực hiện các yêu cầu sau
-- Liệt kê tất cả các thông tin về sản phẩm (products).

select * from products;

-- Tìm tất cả các đơn hàng (orders) có tổng giá trị (totalPrice) lớn hơn 500,000.
select * from orders 
where totalPrice > 500000;

-- Liệt kê tên và địa chỉ của tất cả các cửa hàng (stores).
select s.addressStore, s.storeName from stores as s;

-- Tìm tất cả người dùng (users) có địa chỉ email kết thúc bằng '@gmail.com'.
select * from users
where users.email like '%@gmail.com';

-- Hiển thị tất cả các đánh giá (reviews) với mức đánh giá (rate) bằng 5.

select * from reviews
where rate = 5;

-- Liệt kê tất cả các sản phẩm có số lượng (quantity) dưới 10.
select * from products 
where quantity <10;

-- Tìm tất cả các sản phẩm thuộc danh mục categoryId = 1.
select * from products as p
where p.categoryId=1;

-- Đếm số lượng người dùng (users) có trong hệ thống.
select count(u.userId) from users as u;

-- Tính tổng giá trị của tất cả các đơn hàng (orders).
select sum(orders.totalPrice) from orders; 


-- Tìm sản phẩm có giá cao nhất (price).
select max(p.price) from products as p;


-- Liệt kê tất cả các cửa hàng đang hoạt động (statusStore = 1).
select * from stores 
where stores.statusstore=1;


-- Đếm số lượng sản phẩm theo từng danh mục (categories).
select p.categoryId, count(p.productId) from products as p
group by p.categoryId;

-- Tìm tất cả các sản phẩm mà chưa từng có đánh giá.
select * from reviews as rv
where rv.content = null;


-- Hiển thị tổng số lượng hàng đã bán (quantityOrder) của từng sản phẩm.
select p.productName, sum(od.quantityOrder) from order_details as od
inner join products as p on od.productId = p.productId
group by od.productId;


-- Tìm các người dùng (users) chưa đặt bất kỳ đơn hàng nào.
select u.userId,u.userName, o.userId from users as u
left join orders as o on o.userId = u.userId 
where o.userId is null;



-- Hiển thị thông tin của sản phẩm, kèm số lượng hình ảnh liên quan.
select count(i.productId),p.* from products as p 
inner join images as i on i.productId = p.productId
group by i.productId;

-- Hiển thị các sản phẩm kèm số lượng đánh giá và đánh giá trung bình.
SELECT p.*, COUNT(r.productID) AS 'so luong danh gia', AVG(r.rate) AS 'danh gia trung binh'
FROM products p JOIN reviews r ON p.productId = r.productId
GROUP BY r.productId;


-- Tìm người dùng có số lượng đánh giá nhiều nhất.
SELECT u.* , COUNT(r.reviewId) reviewCount
FROM users u JOIN reviews r ON  u.userId = r.userId
GROUP BY userId
ORDER BY reviewCount DESC
LiMIT 1;

-- Hiển thị top 3 sản phẩm bán chạy nhất (dựa trên số lượng đã bán).

select p.productName from products as p
order by p.quantitySold desc
limit 3;

-- Tìm sản phẩm bán chạy nhất tại cửa hàng có storeId = 'S001'.
select p.productName from products as p
where p.quantitySold = (
   select max(p.quantitySold) from products as p
   join stores as s on p.storeId = s.storeId
   group by p.storeId = "S001"
);







-- Hiển thị danh sách tất cả các sản phẩm có giá trị tồn kho lớn hơn 1 triệu (giá * số lượng).
select (p.price*p.quantity) as cost, p.* from products as p
where p.price*p.quantity > 1000000;

-- Tìm cửa hàng có tổng doanh thu cao nhất.
select s.storeName, sum(o.totalPrice) tota from orders o
inner join stores s on o.storeId = s.storeId
group by s.storeId
order by total desc
limit 1;



-- Hiển thị danh sách người dùng và tổng số tiền họ đã chi tiêu.
select u.userName, sum(o.totalPrice) from users as u
inner join orders as o on o.userId = u.userId
group by o.userId;

-- Tìm đơn hàng có tổng giá trị cao nhất và liệt kê thông tin chi tiết.
select * from orders as o
order by o.totalPrice desc
limit 1;

-- Tính số lượng sản phẩm trung bình được bán ra trong mỗi đơn hàng.
SELECT orderID, AVG(quantityOrder)
FROM order_details
GROUP BY orderID;

-- Hiển thị tên sản phẩm và số lần sản phẩm đó được thêm vào giỏ hàng.
select p.productName, count(c.productId) from products as p
inner join carts as c on c.productId = p.productId
group by c.productId;

-- Tìm tất cả các sản phẩm đã bán nhưng không còn tồn kho trong kho hàng.
SELECT * FROM products
WHERE quantitySold > 0 AND quantity =0;

-- Tìm các đơn hàng được thực hiện bởi người dùng có email là duong@gmail.com'.
select o.* from orders o
inner join users u on o.userId = u.userId
where u.email like '%duong@gmail.com%';

-- Hiển thị danh sách các cửa hàng kèm theo tổng số lượng sản phẩm mà họ sở hữu.
select s.storeName, sum(p.quantity) totalQuantity
from stores s
inner join products p on s.storeId = p.storeId
group by s.storeId;


-- Exercise 04
-- Tạo view (Bảng ảo) để hiển thị dữ liệu theo các yêu cầu sau

-- View hiển thị tên sản phẩm (productName) và giá (price)
-- từ bảng products với giá trị giá (price) lớn hơn 500,000 có tên là expensive_products
 create view expensive_products as
 select p.productName, p.price from products as p
 where p.price > 500000;
 
-- Truy vấn dữ liệu từ view vừa tạo expensive_products
select * from expensive_products;

-- Làm thế nào để cập nhật giá trị của view? Ví dụ, cập nhật giá (price) thành 600,000 cho sản phẩm có tên Product A trong view expensive_products.
update expensive_products
set price = 600000
where productName = 'Product A';

-- Làm thế nào để xóa view expensive_products?
drop view expensive_products;

--  Tạo một view hiển thị tên sản phẩm (productName), tên danh mục (categoryName) bằng cách kết hợp bảng products và categories.
create view products_category as
select p.productName, c.categoryName
from products p
inner join categories c on p.categoryId = c.categoryId;

-- Exercise 05
-- Làm thế nào để tạo một index trên cột productName của bảng products?
create index idx_productName on products (productName);


-- Hiển thị danh sách các index trong cơ sở dữ liệu?
SHOW INDEX FROM shopee.products;

-- Trình bày cách xóa index idx_productName đã tạo trước đó?
drop index idx_productName on products;

-- Tạo một procedure tên getProductByPrice để lấy danh sách sản phẩm với 
-- giá lớn hơn một giá trị đầu vào (priceInput)?
-- Làm thế nào để gọi procedure getProductByPrice với đầu vào là 500000?
delimiter $$
create procedure getProductByPrice(in priceInput int)
begin
select * from products as p
where p.price > priceInput;
end$$
delimiter ;

call getProductByPrice(500000);

-- Tạo một procedure getOrderDetails trả về thông tin chi tiết đơn hàng với đầu vào là orderId?
delimiter $$
create procedure getOrderDetails(in orderID1 varchar(100))
begin
select * from order_details as od
where od.orderId = orderID1;
end $$
delimiter ;
call getOrderDetails('c0c5c360-63c7-4695-99ba-0c013e135691');


-- Làm thế nào để xóa procedure getOrderDetails?
DROP PROCEDURE getOrderDetails;

-- Tạo một procedure tên addNewProduct để thêm mới một sản phẩm vào bảng products. 
-- Các tham số gồm productName, price, description, và quantity.
delimiter $$
create procedure addNewProduct
(
	in productName varchar(255),
    in price int,
    in `description` longtext,
    in quantity int
)
begin
insert into products(
	productId, productName, price, `description`, quantity
)
value(productId, productName, price, `description`, quantity);
end $$
delimiter ;


-- Tạo một procedure tên deleteProductById để xóa sản phẩm khỏi bảng products dựa trên tham số productId.
delimiter $$
create procedure deleteProductById(in productID varchar(100))
begin
delete from products as p
where p.productId = productID;
end $$
delimiter ;

-- Tạo một procedure tên searchProductByName để tìm kiếm sản phẩm theo tên (tìm kiếm gần đúng) từ bảng products.
DELIMITER $$
CREATE PROCEDURE searchProductByName(IN productNameIP VARCHAR(255))
BEGIN
	SELECT * 
	FROM products
	WHERE productName LIKE CONCAT('%', productNameIP, '%');
END $$
DELIMITER ;

call searchProductByName('Chuột không dây 2.4ghz 1600 Dpi hình');
-- Tạo một procedure tên filterProductsByPriceRange để lấy danh sách sản phẩm có giá trong khoảng từ minPrice đến maxPrice.
delimiter $$
create procedure filterProductsByPriceRange(in minPrice int, in maxPrice int)
begin
select * from products as p 
where p.price > minPrice and p.price < maxPrice; 
end $$
delimiter ;
-- Tạo một procedure tên paginateProducts để phân trang danh sách sản phẩm, với hai tham số pageNumber và pageSize.
delimiter $$
create procedure paginate(in page_size int, in page_number int)
begin
declare offset_value int;
set offset_value = page_size*(page_number-1);
select * from employees
limit page_size
offset offset_value;
end $$
delimiter ;


