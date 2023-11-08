--26. Stokta bulunmayan ürünlerin ürün listesiyle birlikte tedarikçilerin ismi ve iletişim numarasını 
--(`ProductID`, `ProductName`, `CompanyName`, `Phone`) almak için bir sorgu yazın.
select p.product_id, product_name, company_name, phone from products p
inner join suppliers s on p.supplier_id = s.supplier_id 
where units_in_stock = 0

--27. 1998 yılı mart ayındaki siparişlerimin adresi, siparişi alan çalışanın adı, çalışanın soyadı
select o.order_date, o.ship_address, e.first_name, e.last_name  from orders o
inner join employees e on o.employee_id = e.employee_id
where o.order_date between '1998-03-01' and '1998-03-31'

--28. 1997 yılı şubat ayında kaç siparişim var?
select count(*) as total_orders  from order_details od
inner join orders o on od.order_id = o.order_id
where o.order_date between '1998-02-01' and '1998-02-28'


--29. London şehrinden 1998 yılında kaç siparişim var?
select count(*) as total_orders  from order_details od
inner join orders o on od.order_id = o.order_id
where o.order_date between '1998-01-01' and '1998-12-31' and ship_city= 'London'

--30. 1997 yılında sipariş veren müşterilerimin contactname ve telefon numarası
select contact_name, phone from orders o
inner join customers c on o.customer_id = c.customer_id
where o.order_date between '1997-01-01' and '1997-12-31'

--31. Taşıma ücreti 40 üzeri olan siparişlerim
select * from orders
where freight > 40

--32. Taşıma ücreti 40 ve üzeri olan siparişlerimin şehri, müşterisinin adı
select contact_name, ship_city,freight from orders o
inner join customers c on c.customer_id=o.customer_id
where freight > 40

--33. 1997 yılında verilen siparişlerin tarihi, şehri, çalışan adı -soyadı (ad soyad birleşik olacak ve büyük harf),
select order_date, ship_city, UPPER(concat(first_name, ' ', last_name)) as Full_Name from orders o
inner join employees c on o.employee_id = c.employee_id
where o.order_date between '1997-01-01' and '1997-12-31'

--34. 1997 yılında sipariş veren müşterilerin contactname i, ve telefon numaraları ( telefon formatı 2223322 gibi olmalı )
select c.contact_name, replace(replace(replace(replace(replace (phone,'-',''),'.',''),'(',''),')',''),' ','') as Phone_Number from orders o
inner join customers c on o.customer_id = c.customer_id
where o.order_date between '1997-01-01' and '1997-12-31' 

--35. Sipariş tarihi, müşteri contact name, çalışan ad, çalışan soyad

select order_date, contact_name, first_name, last_name from orders o
inner join employees e on e.employee_id = o.employee_id
inner join customers c on o.customer_id = c.customer_id


--36. Geciken siparişlerim?
select * from orders 
where required_date < shipped_date


--37. Geciken siparişlerimin tarihi, müşterisinin adı
select order_date, contact_name from orders o
inner join customers c on o.customer_id = c.customer_id
where required_date < shipped_date


--38. 10248 nolu siparişte satılan ürünlerin adı, kategorisinin adı, adedi
select product_name, category_name, quantity from products p
inner join order_details od on p.product_id = od.product_id
inner join categories c on p.category_id = c.category_id
where order_id = 10248 

--39. 10248 nolu siparişin ürünlerinin adı , tedarikçi adı
select product_name, company_name from products p
inner join order_details od on p.product_id = od.product_id
inner join suppliers s on p.supplier_id = s.supplier_id
where order_id = 10248 

--40. 3 numaralı ID ye sahip çalışanın 1997 yılında sattığı ürünlerin adı ve adeti
select product_name, quantity from order_details od
inner join orders o on od.order_id = o.order_id
inner join products p on od.product_id = p.product_id  
where (order_date between '1997-01-01' and '1997-12-31') and o.employee_id = 3

--41. 1997 yılında bir defasinda en çok satış yapan çalışanımın ID,Ad soyad
select od.quantity, o.employee_id, e.first_name, e.last_name from orders o 
inner join employees e on o.employee_id = e.employee_id
inner join order_details od on od.order_id = o.order_id
where (order_date between '1997-01-01' and '1997-12-31')
order by od.quantity DESC LIMIT 1

--42. 1997 yılında en çok satış yapan çalışanımın ID,Ad soyad ****
select sum(od.quantity), e.employee_id, e.first_name, e.last_name from orders o 
inner join employees e on o.employee_id = e.employee_id
inner join order_details od on od.order_id = o.order_id
where (order_date between '1997-01-01' and '1997-12-31')
group by e.employee_id
order by sum(od.quantity) DESC LIMIT 1

--43. En pahalı ürünümün adı,fiyatı ve kategorisin adı nedir?
select product_name, unit_price, category_name from products p
inner join categories c on p.category_id = c.category_id
order by unit_price DESC LIMIT 1

--44. Siparişi alan personelin adı,soyadı, sipariş tarihi, sipariş ID. Sıralama sipariş tarihine göre
select e.first_name, e.last_name, o.order_date, o.order_id from orders o
inner join employees e on o.employee_id = e.employee_id
order by order_date 

--45. SON 5 siparişimin ortalama fiyatı ve order id nedir?
select (unit_price*quantity/5) as avg_price, o.order_id from orders o
inner join order_details od on o.order_id = od.order_id
order by order_date DESC LIMIT 5

--46. Ocak ayında satılan ürünlerimin adı ve kategorisinin adı ve toplam satış miktarı nedir?
select product_name, category_name, quantity from products p
inner join categories c on p.category_id = c.category_id
inner join order_details od on p.product_id = od.product_id
where order_id in (select order_id from orders where extract(month from order_date)=1)

--47. Ortalama satış miktarımın üzerindeki satışlarım nelerdir?
select * from order_details
where quantity > (select avg(quantity) from order_details)

--48. En çok satılan ürünümün(adet bazında) adı, kategorisinin adı ve tedarikçisinin adı
select product_name, category_name, company_name from products p
inner join categories c on p.category_id = c.category_id
inner join suppliers s on p.supplier_id = s.supplier_id
order by units_on_order desc limit 1 

--49. Kaç ülkeden müşterim var
select count(distinct country) from customers

--50. 3 numaralı ID ye sahip çalışan (employee) son Ocak ayından BUGÜNE toplamda ne kadarlık ürün sattı?
select sum(quantity) from orders o
inner join employees e on o.employee_id=e.employee_id
inner join order_details od on o.order_id = od.order_id
where EXTRACT(YEAR FROM order_date) >= (SELECT EXTRACT(YEAR FROM MAX(order_date)) from orders) and e.employee_id = 3


--51. 10248 nolu siparişte satılan ürünlerin adı, kategorisinin adı, adedi
select product_name, category_name, quantity from products p
inner join order_details od on p.product_id = od.product_id
inner join categories c on p.category_id = c.category_id
where order_id = 10248 


--52. 10248 nolu siparişin ürünlerinin adı , tedarikçi adı
select product_name, company_name from products p
inner join order_details od on p.product_id = od.product_id
inner join suppliers s on p.supplier_id = s.supplier_id
where order_id = 10248 


--53. 3 numaralı ID ye sahip çalışanın 1997 yılında sattığı ürünlerin adı ve adeti
select product_name, quantity from order_details od
inner join orders o on od.order_id = o.order_id
inner join products p on od.product_id = p.product_id  
where (order_date between '1997-01-01' and '1997-12-31') and o.employee_id = 3


--54. 1997 yılında bir defasinda en çok satış yapan çalışanımın ID,Ad soyad
select sum(od.quantity), e.employee_id, e.first_name, e.last_name from orders o 
inner join employees e on o.employee_id = e.employee_id
inner join order_details od on od.order_id = o.order_id
where (order_date between '1997-01-01' and '1997-12-31')
group by e.employee_id
order by sum(od.quantity) DESC LIMIT 1


--55. 1997 yılında en çok satış yapan çalışanımın ID,Ad soyad ****
select sum(od.quantity), e.employee_id, e.first_name, e.last_name from orders o 
inner join employees e on o.employee_id = e.employee_id
inner join order_details od on od.order_id = o.order_id
where (order_date between '1997-01-01' and '1997-12-31')
group by e.employee_id
order by sum(od.quantity) DESC LIMIT 1


--56. En pahalı ürünümün adı,fiyatı ve kategorisin adı nedir?
select product_name, unit_price, category_name from products p
inner join categories c on p.category_id = c.category_id
order by unit_price DESC LIMIT 1


--57. Siparişi alan personelin adı,soyadı, sipariş tarihi, sipariş ID. Sıralama sipariş tarihine göre
select e.first_name, e.last_name, o.order_date, o.order_id from orders o
inner join employees e on o.employee_id = e.employee_id
order by order_date

--58. SON 5 siparişimin ortalama fiyatı ve orderid nedir?
select (unit_price*quantity/5) as avg_price, o.order_id from orders o
inner join order_details od on o.order_id = od.order_id
order by order_date DESC LIMIT 5

--59. Ocak ayında satılan ürünlerimin adı ve kategorisinin adı ve toplam satış miktarı nedir?
select product_name, category_name, quantity from products p
inner join categories c on p.category_id = c.category_id
inner join order_details od on p.product_id = od.product_id
where order_id in (select order_id from orders where extract(month from order_date)=1)

--60. Ortalama satış miktarımın üzerindeki satışlarım nelerdir?
select * from order_details
where quantity > (select avg(quantity) from order_details)


--61. En çok satılan ürünümün(adet bazında) adı, kategorisinin adı ve tedarikçisinin adı
select product_name, category_name, company_name from products p
inner join categories c on p.category_id = c.category_id
inner join suppliers s on p.supplier_id = s.supplier_id
order by units_on_order desc limit 1

--62. Kaç ülkeden müşterim var
select count(distinct country) from customers

--63. Hangi ülkeden kaç müşterimiz var
select country, count(*) from customers 
group by country 

--64. 3 numaralı ID ye sahip çalışan (employee) son Ocak ayından BUGÜNE toplamda ne kadarlık ürün sattı?
select sum(quantity) from orders o
inner join employees e on o.employee_id=e.employee_id
inner join order_details od on o.order_id = od.order_id
where EXTRACT(YEAR FROM order_date) >= (SELECT EXTRACT(YEAR FROM MAX(order_date)) from orders) and e.employee_id = 3
						
--65. 10 numaralı ID ye sahip ürünümden son 3 ayda ne kadarlık ciro sağladım?
select sum(unit_price*quantity) from order_details od
inner join orders o on od.order_id=o.order_id
where product_id = 10 and order_date >= (select max(order_date)-interval '3 months' from orders)  


--66. Hangi çalışan şimdiye kadar toplam kaç sipariş almış..?
select e.employee_id, e.first_name, e.last_name, count(o.order_id) from orders o 
inner join order_details od on od.order_id = o.order_id
inner join employees e on o.employee_id = e.employee_id
group by e.employee_id, e.first_name, e.last_name

--67. 91 müşterim var. Sadece 89’u sipariş vermiş. Sipariş vermeyen 2 kişiyi bulun
select contact_name from customers c
left join orders o on c.customer_id = o.customer_id 
where order_id is null
--==
select contact_name from orders o
right join customers c on c.customer_id = o.customer_id 
where order_id is null

--68. Brazil’de bulunan müşterilerin Şirket Adı, TemsilciAdi, Adres, Şehir, Ülke bilgileri
select company_name, contact_name, address, city, country from customers
where country = 'Brazil'

--69. Brezilya’da olmayan müşteriler
select contact_name from customers
where country != 'Brazil'


--70. Ülkesi (Country) YA Spain, Ya France, Ya da Germany olan müşteriler
select contact_name, country from customers
where country = 'Spain' or country = 'France' or country = 'Germany'

--71. Faks numarasını bilmediğim müşteriler
select contact_name from customers 
where fax is null

--72. Londra’da ya da Paris’de bulunan müşterilerim
select * from customers 
where city = 'London' or city ='Paris'

--73. Hem Mexico D.F’da ikamet eden HEM DE ContactTitle bilgisi ‘owner’ olan müşteriler
select * from customers 
where city = 'México D.F.' and contact_title= 'Owner'

--74. C ile başlayan ürünlerimin isimleri ve fiyatları
select product_name, unit_price from products
where product_name like 'C%'

--75. Adı (FirstName) ‘A’ harfiyle başlayan çalışanların (Employees); Ad, Soyad ve Doğum Tarihleri
select first_name, last_name, birth_date from employees
where first_name like 'A%'

--76. İsminde ‘RESTAURANT’ geçen müşterilerimin şirket adları
select company_name from customers
where company_name like '%Restaurant%'
--==
select company_name from customers
where position('Restaurant' in company_name) != 0

--77. 50$ ile 100$ arasında bulunan tüm ürünlerin adları ve fiyatları
select product_name, unit_price from products
where unit_price between 50 and 100


--78. 1 temmuz 1996 ile 31 Aralık 1996 tarihleri arasındaki siparişlerin (Orders), SiparişID (OrderID) ve SiparişTarihi (OrderDate) bilgileri
select order_id, order_date from orders
where order_date between '1996-07-01' and '1996-12-31'


--79. Ülkesi (Country) YA Spain, Ya France, Ya da Germany olan müşteriler
select contact_name, country from customers
where country = 'Spain' or country = 'France' or country = 'Germany'


--80. Faks numarasını bilmediğim müşteriler
select contact_name from customers 
where fax is null

--81. Müşterilerimi ülkeye göre sıralıyorum:
select contact_name, country from customers
order by country

--82. Ürünlerimi en pahalıdan en ucuza doğru sıralama, sonuç olarak ürün adı ve fiyatını istiyoruz
select product_name, unit_price from products
order by unit_price desc 

--*******83. Ürünlerimi en pahalıdan en ucuza doğru sıralasın, ama stoklarını küçükten-büyüğe doğru göstersin sonuç olarak ürün adı ve fiyatını istiyoruz
select product_name, unit_price, units_in_stock from products
order by unit_price desc, units_in_stock asc


--84. 1 Numaralı kategoride kaç ürün vardır..?
select count(*) from products 
where category_id=1

--85. Kaç farklı ülkeye ihracat yapıyorum..?
select count(distinct country) from customers