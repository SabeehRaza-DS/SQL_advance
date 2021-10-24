-- 3.1 Select all warehouses
SELECT *
FROM Warehouses;

-- 3.2 Select all boxes with a value larger than $150
SELECT *
FROM Boxes
WHERE Value > 150;

-- 3.3 Select all distinct contents in all the boxes
SELECT DISTINCT Contents
FROM Boxes;

-- 3.4 Select the average value of all the boxes
SELECT AVG(Value)
FROM Boxes;

-- 3.5 Select the warehouse code and the average value of the boxes in each warehouse
SELECT Warehouse, AVG(Value)
FROM Boxes
GROUP BY Warehouse;

-- 3.6 Same as previous exercise, but select only those warehouses where the average value of the boxes is greater than 150
SELECT Warehouse, AVG(Value)
FROM Boxes
GROUP BY Warehouse
HAVING AVG(Value) > 150;

-- 3.7 Select the code of each box, along with the name of the city the box is located in
SELECT B.Code, W.Location
FROM Boxes B
JOIN Warehouses W
	ON B.Warehouse = W.Code;

-- 3.8 Select the warehouse codes, along with the number of boxes in each warehouse. 

SELECT Warehouse, COUNT(*)
FROM Boxes 
GROUP bY Warehouse;

-- Optionally, take into account that some warehouses are empty 
-- (i.e., the box count should show up as zero, instead of omitting the warehouse from the result)

INSERT INTO Warehouses(Code,Location,Capacity) VALUES(6,'Test',99);

SELECT W.Code, COUNT(B.Warehouse) AS Boxes_Count
FROM Warehouses W
LEFT JOIN  Boxes B
		ON W.Code = B.Warehouse
GROUP BY W.Code;
    
-- 3.9 Select the codes of all warehouses that are saturated (a warehouse is saturated 
-- if the number of boxes in it is larger than the warehouse's capacity)

SELECT *							-- First show all data
FROM Boxes B
JOIN Warehouses W
	ON B.Warehouse = W.Code;

SELECT W.Code, W.Location, W.Capacity, COUNT(B.Warehouse) AS Boxes_Count
FROM Warehouses W
LEFT JOIN  Boxes B
		ON W.Code = B.Warehouse
GROUP BY W.Code
HAVING W.Capacity < COUNT(B.Warehouse);

-- 3.10 Select the codes of all the boxes located in Chicago
SELECT *
FROM Boxes B
JOIN Warehouses W
	ON B.Warehouse = W.Code
WHERE W.Location = 'Chicago';

-- 3.11 Create a new warehouse in New York with a capacity for 3 boxes
INSERT INTO Warehouses(Code,Location,Capacity) VALUES(7,'New York',3);

-- 3.12 Create a new box, with code "H5RT", containing "Papers" with a value of $200, and located in warehouse 2
INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('H5RT','Papers',200,2);

-- 3.13 Reduce the value of all boxes by 15%
SELECT *, (Value - (0.15*Value)) AS Discount
FROM Boxes;

-- 3.14 Remove all boxes with a value lower than $100
SELECT *
FROM Boxes
WHERE Value > 100;

-- 3.15 Remove all boxes from saturated warehouses
SELECT W.Code, W.Location, W.Capacity, COUNT(B.Warehouse) AS Box_Count
FROM Boxes B
JOIN Warehouses W
	ON B.Warehouse = W.Code
GROUP BY W.Code
HAVING Box_Count < W.Capacity;


-- 3.16 Add Index for column "Warehouse" in table "boxes"
    -- !!!NOTE!!!: index should NOT be used on small tables in practice
CREATE INDEX index_Warehouse
ON Boxes (Warehouse);

-- 3.17 Print all the existing indexes
    -- !!!NOTE!!!: index should NOT be used on small tables in practice
SHOW INDEXES FROM Boxes;

SHOW INDEXES FROM Boxes 
IN SQL_day3;

SELECT * FROM Boxes;

SHOW INDEXES FROM Boxes 
IN SQL_day3;

SHOW INDEX IN Boxes 
FROM SQL_day3;

SHOW KEYS FROM Boxes
IN SQL_day3;   
   
-- 3.18 Remove (drop) the index you added just
    -- !!!NOTE!!!: index should NOT be used on small tables in practice
ALTER TABLE Boxes
DROP INDEX index_Warehouse;   