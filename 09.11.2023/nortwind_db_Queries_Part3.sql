--85. Kaç farklı ülkeye ihracat yapıyorum..?
select count(distinct country) from customers
--86a.Bu ülkeler hangileri..?
select distinct country from customers

--87. En Pahalı 5 ürün
select product_name, unit_price from products
order by unit_price desc limit 5 

--88. ALFKI CustomerID’sine sahip müşterimin sipariş sayısı..?
select count(*) from orders o
inner join customers c on o.customer_id=c.customer_id 
where c.customer_id='ALFKI'

--89. Ürünlerimin toplam maliyeti
select sum(unit_price*units_in_stock) as cost_ from products

--90. Şirketim, şimdiye kadar ne kadar ciro yapmış..?
select sum((unit_price*quantity)*(1-discount)) as ciro from order_details

--91. Ortalama Ürün Fiyatım
select avg(unit_price) from products

--92. En Pahalı Ürünün Adı
select product_name from products
where unit_price=(select max(unit_price) from products)

--93. En az kazandıran sipariş
select order_id from order_details
where (unit_price*quantity)=(select min(unit_price*quantity) from order_details)

--94. Müşterilerimin içinde en uzun isimli müşteri
select contact_name from customers 
where length(contact_name)=(select max(length(contact_name)) from customers) 
--==
select contact_name from customers 
order by length(contact_name) desc limit 1 

--95. Çalışanlarımın Ad, Soyad ve Yaşları
select first_name, last_name, EXTRACT(YEAR FROM AGE(birth_date)) AS "Age"
from employees;

--96. Hangi üründen toplam kaç adet alınmış..?
select product_id, sum(quantity) from order_details
group by product_id 

--97. Hangi siparişte toplam ne kadar kazanmışım..?
select order_id, sum((unit_price*quantity)*(1-discount)) from order_details
group by order_id 

--98. Hangi kategoride toplam kaç adet ürün bulunuyor..?
select count(c.category_id), category_name from products p
inner join categories c on p.category_id=c.category_id
group by c.category_id

--99. 1000 Adetten fazla satılan ürünler?
select product_id, sum(quantity) from order_details 
group by product_id
having sum(quantity)>1000

--100. Hangi Müşterilerim hiç sipariş vermemiş..?
select * from customers c
left join orders o on c.customer_id=o.customer_id
where order_id is null 

--101. Hangi tedarikçi hangi ürünü sağlıyor ?
select company_name, product_name from products p 
inner join suppliers s on p.supplier_id=s.supplier_id

--102. Hangi sipariş hangi kargo şirketi ile ne zaman gönderilmiş..?
select order_id, shipped_date, ship_name from orders

--103. Hangi siparişi hangi müşteri verir..?
select order_id, customer_id from orders 

--104. Hangi çalışan, toplam kaç sipariş almış..?
select employee_id, count(order_id) from orders
group by employee_id

--105. En fazla siparişi kim almış..?
select employee_id, count(order_id) from orders
group by employee_id 
order by count(order_id) desc limit 1 


--106. Hangi siparişi, hangi çalışan, hangi müşteri vermiştir..?
select order_id, employee_id, customer_id from orders

--107. Hangi ürün, hangi kategoride bulunmaktadır..? Bu ürünü kim tedarik etmektedir..?
select product_id, category_id, supplier_id from products

--108. Hangi siparişi hangi müşteri vermiş, hangi çalışan almış, hangi tarihte, hangi kargo şirketi tarafından gönderilmiş 
--hangi üründen kaç adet alınmış,hangi fiyattan alınmış, ürün hangi kategorideymiş bu ürünü hangi tedarikçi sağlamış
select o.order_id, o.customer_id, o.employee_id, order_date, ship_name, quantity, od.unit_price, category_id, supplier_id from order_details od
inner join orders o on od.order_id=o.order_id
inner join products p on od.product_id=p.product_id

--109. Altında ürün bulunmayan kategoriler
select c.category_id, category_name, product_name from categories c
left join products p on c.category_id=p.category_id
where p.product_id is null 
order by c.category_id asc 
--Altında ürün bulunmayan kategori yoktur.

--110. Manager ünvanına sahip tüm müşterileri listeleyiniz.
select contact_name, contact_title from customers
where contact_title like '%Manager%'

--111. FR ile başlayan 5 karekter olan tüm müşterileri listeleyiniz.
select * from customers
where customer_id like 'FR___'

--112. (171) alan kodlu telefon numarasına sahip müşterileri listeleyiniz.
select * from customers
where phone like '(171)%'

--113. BirimdekiMiktar alanında boxes geçen tüm ürünleri listeleyiniz.
select * from products
where quantity_per_unit like '%boxes%'

--114. Fransa ve Almanyadaki (France,Germany) Müdürlerin (Manager) Adını ve Telefonunu listeleyiniz.(MusteriAdi,Telefon)
select contact_name, phone from customers
where country = 'France' or country ='Germany' and contact_title like '%Manager%'

--115. En yüksek birim fiyata sahip 10 ürünü listeleyiniz.
select product_name, unit_price from products
order by unit_price desc limit 10 

--116. Müşterileri ülke ve şehir bilgisine göre sıralayıp listeleyiniz.
select * from customers 
order by country, city


--117. Personellerin ad,soyad ve yaş bilgilerini listeleyiniz.
select first_name, last_name, EXTRACT(YEAR FROM AGE(birth_date)) AS "Age"
from employees;

--118. 35 gün içinde sevk edilmeyen satışları listeleyiniz.
select * from orders
where shipped_date - order_date >= 35

--119. Birim fiyatı en yüksek olan ürünün kategori adını listeleyiniz. (Alt Sorgu)
select category_name from products p
inner join categories c on p.category_id=c.category_id
where unit_price = (select max(unit_price) from products)

--120. Kategori adında 'on' geçen kategorilerin ürünlerini listeleyiniz. (Alt Sorgu)
select * from products
where category_id in (select category_id from categories
				   where category_name like '%on%')


--121. Konbu adlı üründen kaç adet satılmıştır.
select od.product_id, p.product_name, sum(quantity) as sales from order_details od
inner join products p on od.product_id=p.product_id
where p.product_name = 'Konbu'
group by od.product_id, p.product_name


--122. Japonyadan kaç farklı ürün tedarik edilmektedir.
select distinct count(*) from products p
inner join suppliers s on p.supplier_id=s.supplier_id
where country ='Japan' 

--123. 1997 yılında yapılmış satışların en yüksek, en düşük ve ortalama nakliye ücretlisi ne kadardır?
Select
    MAX(freight), 
    MIN(freight), 
    AVG(freight) 
from orders
where EXTRACT(YEAR FROM order_date) = 1997;

--124. Faks numarası olan tüm müşterileri listeleyiniz.
select * from customers
where fax is not null

--125. 1996-07-16 ile 1996-07-30 arasında sevk edilen satışları listeleyiniz. 
select * from orders
where shipped_date between '1996-07-16' and '1996-07-30'




