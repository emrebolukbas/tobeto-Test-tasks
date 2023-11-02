--1. Product isimlerini (`ProductName`) ve birim başına miktar (`QuantityPerUnit`) değerlerini almak için sorgu yazın.
SELECT product_name, quantity_per_unit FROM products

--2. Ürün Numaralarını (`ProductID`) ve Product isimlerini (`ProductName`) 
--değerlerini almak için sorgu yazın. Artık satılmayan ürünleri (`Discontinued`) filtreleyiniz

SELECT product_id, product_name FROM products
WHERE discontinued=0

--3. Durdurulan Ürün Listesini, Ürün kimliği ve ismi (`ProductID`, `ProductName`) değerleriyle almak için bir sorgu yazın.

SELECT product_id, product_name FROM products
WHERE reorder_level =0

--4. Ürünlerin maliyeti 20'dan az olan Ürün listesini (`ProductID`, `ProductName`, `UnitPrice`) almak için bir sorgu yazın.

SELECT product_id, product_name, unit_price FROM products
WHERE unit_price < 20

--5. Ürünlerin maliyetinin 15 ile 25 arasında olduğu Ürün listesini (`ProductID`, `ProductName`, `UnitPrice`) almak için bir sorgu yazın.

SELECT product_id, product_name, unit_price FROM products
WHERE unit_price BETWEEN 15 AND 25

--6. Ürün listesinin (`ProductName`, `UnitsOnOrder`, `UnitsInStock`) stoğun siparişteki miktardan az olduğunu almak için bir sorgu yazın.

SELECT product_name, units_on_order, units_in_stock From products
WHERE units_in_stock < units_on_order

--7. İsmi `a` ile başlayan ürünleri listeleyeniz.

SELECT *FROM products
 WHERE product_name LIKE 'A%'
 
 --8. İsmi `i` ile biten ürünleri listeleyeniz.
 
 SELECT *FROM products
 WHERE product_name LIKE '%i'
 
 --9. Ürün birim fiyatlarına %18’lik KDV ekleyerek listesini almak (ProductName, UnitPrice, UnitPriceKDV) için bir sorgu yazın.
 SELECT product_name, unit_price, (unit_price*1.18) AS unit_price_KDV  FROM products
 
 --10. Fiyatı 30 dan büyük kaç ürün var?
 SELECT COUNT(*) FROM products
 WHERE unit_price >30
 
 --11. Ürünlerin adını tamamen küçültüp fiyat sırasına göre tersten listele
  SELECT LOWER (product_name) FROM products
  ORDER BY product_name DESC
  
  --12. Çalışanların ad ve soyadlarını yanyana gelecek şekilde yazdır
  SELECT first_name, last_name from employees
  
  --13. Region alanı NULL olan kaç tedarikçim var?
   SELECT COUNT(*) FROM suppliers
   WHERE region is null
   
   --14. a.Null olmayanlar?
   SELECT * FROM suppliers
   WHERE region IS NOT null
   
   --15. Ürün adlarının hepsinin soluna TR koy ve büyültüp olarak ekrana yazdır.
  SELECT UPPER(CONCAT(' TR ',product_name)) FROM products 
  
  --16. a.Fiyatı 20den küçük ürünlerin adının başına TR ekle
  SELECT UPPER(CONCAT(' TR ',product_name)) FROM products 
  WHERE unit_price < 20
  
  --17. En pahalı ürün listesini (`ProductName` , `UnitPrice`) almak için bir sorgu yazın.
  SELECT product_name, unit_price FROM products
  WHERE unit_price=(SELECT MAX (unit_price) FROM products)
  
  --18. En pahalı on ürünün Ürün listesini (`ProductName` , `UnitPrice`) almak için bir sorgu yazın.
  SELECT  product_name, unit_price FROM products
  ORDER BY unit_price DESC LIMIT 10
  
 --19. Ürünlerin ortalama fiyatının üzerindeki Ürün listesini (`ProductName` , `UnitPrice`) almak için bir sorgu yazın.
 
 SELECT product_name, unit_price FROM products
 WHERE unit_price > (SELECT AVG(unit_price) FROM products)
 
 --20. Stokta olan ürünler satıldığında elde edilen miktar ne kadardır.
  SELECT product_name,unit_price, units_in_stock, ( unit_price * units_in_stock) AS total_price from products
  SELECT SUM( unit_price * units_in_stock) AS total_price from products
  
  --21. Mevcut ve Durdurulan ürünlerin sayılarını almak için bir sorgu yazın.
 SELECT COUNT(*) FROM products
 WHERE units_in_stock>0 AND reorder_level=0
 
 --22. Ürünleri kategori isimleriyle birlikte almak için bir sorgu yazın.
 
 SELECT product_name, category_name
 FROM products p INNER JOIN categories c ON p.category_id = c.category_id
 

 SELECT product_name, category_name
 FROM products p, categories c
 WHERE p.category_id= c.category_id
 
 
 --23. Ürünlerin kategorilerine göre fiyat ortalamasını almak için bir sorgu yazın.
 
 SELECT category_name, AVG(unit_price) AS average_price
 FROM products p INNER JOIN categories c ON p.category_id = c.category_id
 GROUP BY category_name
 
 SELECT category_id, AVG(unit_price) AS average_price
 FROM products
 GROUP BY category_id
 
 --24. En pahalı ürünümün adı, fiyatı ve kategorisin adı nedir?
 
 SELECT product_name, unit_price, category_name
 FROM products p INNER JOIN categories c ON p.category_id = c.category_id
ORDER BY unit_price DESC LIMIT 1

--25. En çok satılan ürününün adı, kategorisinin adı ve tedarikçisinin adı

SELECT product_name, category_name, company_name
from products p, categories c, suppliers s
WHERE p.category_id = c.category_id AND p.supplier_id= s.supplier_id 
AND reorder_level=(SELECT MAX(reorder_level)FROM products)

