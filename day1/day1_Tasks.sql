USE SQL_practice;

SELECT * FROM Products;

-- 1.1 Select the name and price of all products with a price larger than or equal to $180, 
-- and sort first by price (in descending order), and then by name (in ascending order)
SELECT Name, Price
FROM Products
WHERE Price >= 180
ORDER BY Price desc, Name asc;


-- 1.2 Select the average price of each manufacturer's products, showing only the manufacturer's code
SELECT Manufacturer, ROUND(AVG(Price),1) AS AVG_Price
FROM Products
GROUP BY Manufacturer;


-- 1.3 Select the average price of each manufacturer's products, showing the manufacturer's name
SELECT M.Name, ROUND(AVG(P.Price),1) AS AVG_Price
FROM Products P
JOIN Manufacturers M
	ON P.Manufacturer = M.Code
GROUP BY M.Name;

-- 1.4 Select the names of manufacturer whose products have an average price larger than or equal to $150
SELECT M.Name, AVG(P.Price) AS AVG_Price
FROM Products P
JOIN Manufacturers M 
	ON P.Manufacturer = M.Code
GROUP BY M.Name
HAVING AVG(P.Price) >= 150;


-- 1.5 Select the name and price of the cheapest product
-- Option 1
SELECT Name, Price
FROM Products
ORDER BY Price ASC
LIMIT 1;

-- Option 2
SELECT Name, Price
FROM Products
WHERE Price = (SELECT min(Price) FROM Products);


-- 1.6 Select the name of each manufacturer along with the name and price of its most expensive product
-- Create a Full list with prices
SELECT M.Name, P.Name, Price
FROM Products P
JOIN Manufacturers M 
	ON P.Manufacturer = M.Code
ORDER BY M.Name;

-- Select most expensive product w.r.t manufacturer
SELECT M.Name, P.Name, P.Price
FROM Products P
JOIN Manufacturers M 
	ON P.Manufacturer = M.Code
    AND P.Price = (SELECT MAX(P.Price) FROM Products P WHERE P.Manufacturer = M.Code);


-- 1.7 Add a new product: Loudspeakers, $70, manufacturer 2
INSERT INTO Products( Code, Name , Price , Manufacturer) VALUES ( 11, 'Loudspeakers' , 70 , 2 );


-- 1.8 Update the name of product 8 to "Laser Printer"
 UPDATE Products
   SET Name = 'Laser Printer'
   WHERE Code = 8;


-- 1.9 Apply a 10% discount to all products
SELECT Name,Price, (Price - Price * 0.1) AS discount
FROM products;


-- 1.10 Apply a 10% discount to all products with a price larger than or equal to $120.
SELECT Name,Price, (Price - Price * 0.1) AS discount
FROM products
WHERE Price >= 120;
