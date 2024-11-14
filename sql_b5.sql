use database_b5;
-- Exercise3
-- Hiển thị thông tin công trình có chi phí cao nhất
select * from building 
where cost = (
	select max(cost) from building
);

-- Hiển thị thông tin công trình có chi phí lớn hơn tất cả các công trình được xây dựng ở Cần Thơ
select * from building 
where cost >  all (
	select cost from building where city = 'can tho'
);

-- Hiển thị thông tin công trình có chi phí lớn hơn một trong các công trình được xây dựng ở Cần Thơ
select * from building 
where cost > (
	select min(cost) from building where city = 'can tho' 
);

-- Hiển thị thông tin công trình chưa có kiến trúc sư thiết kế
SELECT * 
FROM building 
WHERE id NOT IN (SELECT building_id FROM design);


-- Hiển thị thông tin các kiến trúc sư cùng năm sinh và cùng nơi tốt nghiệp
select * from architect
where (birthday, place) in (
	select birthday, place from architect
    group by birthday, place
    having count(id)>1
);

-- GỢI Ý:
-- Sử dụng các tham số như IN, NOT IN, ALL để thực hiện các truy vấn lồng


-- Exercise 04
-- Áp dụng các kiến thức đã học về các mệnh đề truy vấn trong SQL, thực hiện các yêu cầu sau
-- Hiển thị thù lao trung bình của từng kiến trúc sư
select architect_id, avg(benefit) from design
group by architect_id;



-- Hiển thị chi phí đầu tư cho các công trình ở mỗi thành phố
select city, sum(cost) from building
group by city;


-- Tìm các công trình có chi phí trả cho kiến trúc sư lớn hơn 50
select building_id from design
where benefit > 50;

-- Tìm các thành phố có ít nhất một kiến trúc sư tốt nghiệp

-- GỢI Ý:
-- Sử dụng các tham số như GROUP BY, HAVING


-- Exercise 05
-- Áp dụng các kiến thức đã học về các mệnh đề truy vấn trong SQL, thực hiện các yêu cầu sau
-- Hiển thị tên công trình, tên chủ nhân và tên chủ thầu của công trình đó
select b.name, h.name, c.name from building as b
inner join host as h on b.host_id=h.id
inner join contractor as c on b.contractor_id=c.id;

-- Hiển thị tên công trình (building), tên kiến trúc sư (architect) 
-- và thù lao của kiến trúc sư ở mỗi công trình (design)

select b.name, a.name, d.benefit from building as b 
inner join design as d on d.building_id = b.id
inner join architect as a on d.architect_id=a.id;

-- Hãy cho biết tên và địa chỉ công trình (building) do chủ thầu Công ty xây dựng số 6 thi công (contractor)
select b.name, b.address from building as b
inner join contractor as c on b.contractor_id=c.id
where c.name = 'cty xd so 6';


-- Tìm tên và địa chỉ liên lạc của các chủ thầu (contractor) thi công công trình ở Cần Thơ (building) 
-- do kiến trúc sư Lê Kim Dung thiết kế (architect, design)
select * from building as b
inner join contractor as c on b.contractor_id=c.id
inner join design as d on d.building_id= b.id
inner join architect as a on d.architect_id=a.id
where a.name = 'le kim dung';



-- Hãy cho biết nơi tốt nghiệp của các kiến trúc sư (architect) đã thiết kế (design) công trình Khách Sạn Quốc Tế ở Cần Thơ (building)
select a.place from architect as a
inner join design as d on d.architect_id=a.id
inner join building as b on d.building_id = b.id
where b.name = 'khach san quoc te' and b.city = 'can tho';



-- Cho biết họ tên, năm sinh, năm vào nghề của các công nhân có chuyên môn hàn hoặc điện (worker) 
-- đã tham gia các công trình (work) mà chủ thầu Lê Văn Sơn (contractor) đã trúng thầu (building)

select wr.name, wr.birthday from building as b
inner join work as w on w.building_id = b.id
inner join worker as wr on w.worker_id = wr.id
inner join contractor as c on b.contractor_id=c.id
where c.name = 'le van son' and (wr.skill) in ('han', 'dien');

-- Những công nhân nào (worker) đã bắt đầu tham gia công trình Khách sạn Quốc Tế ở Cần Thơ (building) 
-- trong giai đoạn từ ngày 15/12/1994 đến 31/12/1994 (work) số ngày tương ứng là bao nhiêu

select wr.id, wr.name from building as b 
inner join work as w on w.building_id= b.id
inner join worker as wr on w.worker_id = wr.id
where b.name='khach san quoc te' and b.city='can tho' and w.date between '1994-12-15' and '1994-12-31';


-- Cho biết họ tên và năm sinh của các kiến trúc sư đã tốt nghiệp ở TP Hồ Chí Minh (architect) 
-- và đã thiết kế ít nhất một công trình (design) có kinh phí đầu tư trên 400 triệu đồng (building)

select distinct a.name, a.birthday from architect as a
inner join design as d on d.architect_id=a.id
inner join building as b on b.id=d.building_id
where b.cost > 400000000 and a.place='tp hcm';


-- Cho biết tên công trình có kinh phí cao nhất
select name from building 
where cost = (
	select max(cost) from building
);
-- Cho biết tên các kiến trúc sư (architect) vừa thiết kế các công trình (design) do Phòng dịch vụ sở xây dựng (contractor) 
-- thi công vừa thiết kế các công trình do chủ thầu Lê Văn Sơn thi công
select distinct a.name from architect as a
inner join design as d on d.architect_id = a.id
inner join building as b on d.building_id=b.id
inner join contractor as c on b.contractor_id= c.id
where c.name in ('le van son','phong dich vu so xd');



-- Cho biết họ tên các công nhân (worker) có tham gia (work) các công trình ở Cần Thơ (building) 
-- nhưng không có tham gia công trình ở Vĩnh Long
SELECT name
FROM worker
WHERE id IN (
SELECT DISTINCT worker_id 
FROM work AS w INNER JOIN building AS b ON w.building_id = b.id
WHERE b.city = 'can tho'
) AND id NOT IN (
SELECT DISTINCT worker_id 
FROM work AS w INNER JOIN building AS b ON w.building_id = b.id
WHERE b.city = 'vinh long'
);
-- Cho biết tên của các chủ thầu đã thi công các 
-- công trình có kinh phí lớn hơn tất cả các công trình do chủ thầu phòng Dịch vụ Sở xây dựng thi công
SELECT DISTINCT c.name 
FROM building AS b INNER JOIN contractor AS c ON b.contractor_id = c.id
WHERE b.cost > ALL (
SELECT MAX(cost)
FROM building AS b INNER JOIN contractor AS c ON b.contractor_id = c.id
WHERE c.name  = 'phong dich vu so xd'
);
-- Cho biết họ tên các kiến trúc sư có thù lao thiết kế một công trình nào đó dưới giá trị trung bình thù lao thiết kế cho một công trình
SELECT a.name 
FROM design AS d 
INNER JOIN architect AS a ON d.architect_id = a.id
WHERE d.benefit < (
    SELECT AVG(avg_benefit) 
    FROM (
        SELECT AVG(benefit) AS avg_benefit 
        FROM design
        GROUP BY building_id
    ) AS subquery
);
-- Tìm tên và địa chỉ những chủ thầu đã trúng thầu công trình có kinh phí thấp nhất
SELECT c.name, c.address
FROM contractor AS c
WHERE id IN (
SELECT contractor_id FROM building AS b
WHERE b.cost = (SELECT MIN(cost) FROM building)
);
-- Tìm họ tên và chuyên môn của các công nhân (worker) tham gia (work)
-- các công trình do kiến trúc sư Le Thanh Tung thiet ke (architect) (design)
SELECT name, skill
FROM worker 
WHERE id IN (
SELECT worker_id 
FROM work w INNER JOIN building b ON w.building_id = b.id
WHERE b.id IN(
SELECT building_id FROM design d INNER JOIN architect a ON d.architect_id = a.id
WHERE a.id = 1 
)
);
-- Tìm các cặp tên của chủ thầu có trúng thầu các công trình tại cùng một thành phố
SELECT c.name
FROM building b INNER JOIN contractor c ON b.contractor_id = c.id
WHERE b.id IN (
SELECT id
FROM building b JOIN (
SELECT city FROM building
GROUP BY city
HAVING COUNT(id)>1
 ) b2 ON b.city = b2.city
);
-- Tìm tổng kinh phí của tất cả các công trình theo từng chủ thầu
SELECT contractor_id, SUM(cost) 
FROM building 
GROUP BY contractor_id;
-- Cho biết họ tên các kiến trúc sư có tổng thù lao thiết kế các công trình lớn hơn 25 triệu
SELECT name 
FROM architect
WHERE id IN (
SELECT architect_id
FROM design
GROUP BY architect_id
HAVING SUM(benefit) >25
);
-- Cho biết số lượng các kiến trúc sư có tổng thù lao thiết kế các công trình lớn hơn 25 triệu
SELECT COUNT(name) AS 'số lượng các kiến trúc sư có tổng thù lao thiết kế các công trình lớn hơn 25 triệu'
FROM architect
WHERE id IN (
SELECT architect_id
FROM design
GROUP BY architect_id
HAVING SUM(benefit) >25
);
-- Tìm tổng số công nhân đã than gia ở mỗi công trình
SELECT building_id, COUNT(worker_id) 
FROM work 
GROUP BY building_id;
-- Tìm tên và địa chỉ công trình có tổng số công nhân tham gia nhiều nhất
SELECT b.name, b.address
FROM building b 
WHERE id IN (
SELECT building_id 
FROM work
GROUP BY building_id
HAVING COUNT(worker_id) >= ALL (
SELECT COUNT(worker_id) FROM work
GROUP BY building_id
)
);
-- Cho biêt tên các thành phố và kinh phí trung bình cho mỗi công trình của từng thành phố tương ứng
SELECT city, AVG(cost)
FROM building
GROUP BY city;
-- Cho biết họ tên các công nhân có tổng số ngày tham gia vào 
-- các công trình lớn hơn tổng số ngày tham gia của công nhân Nguyễn Hồng Vân
SELECT name 
FROM worker 
WHERE id IN (
SELECT worker_id FROM work 
GROUP BY worker_id
HAVING COUNT(date) > (
SELECT COUNT(date)
FROM work
WHERE worker_id = 6 ) 
);
-- Cho biết tổng số công trình mà mỗi chủ thầu đã thi công tại mỗi thành phố
SELECT b.contractor_id, b.city, COUNT(b.id) AS total_buildings
FROM building b
GROUP BY b.contractor_id, b.city
ORDER BY b.contractor_id, b.city;
-- Cho biết họ tên công nhân có tham gia ở tất cả các công trình
SELECT w.name
FROM worker w
JOIN work wo ON w.id = wo.worker_id
GROUP BY w.id, w.name
HAVING COUNT( wo.building_id) = (
    SELECT COUNT(DISTINCT wo.building_id)
    FROM work wo
);
