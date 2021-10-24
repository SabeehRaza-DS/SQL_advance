USE SQL_day5;

-- 5.1 Select the name of all the pieces
SELECT *
FROM Pieces;

-- 5.2  Select all the providers' data
SELECT *
FROM Providers;

-- 5.3 Obtain the average price of each piece (show only the piece code and the average price)
SELECT P.Name, AVG(Pr.Price) AS AVG_Price
FROM Pieces P
JOIN Provides Pr
	ON P.Code = Pr.Piece
GROUP BY P.Name;

-- 5.4  Obtain the names of all providers who supply piece 1
SELECT P.Name, Pr.Provider, Pro.Name
FROM Pieces P
JOIN Provides Pr
	ON P.Code = Pr.Piece
JOIN Providers Pro
	ON Pr.Provider = Pro.Code
GROUP BY P.Name, Pr.Provider, Pro.Name;

-- 5.5 Select the name of pieces provided by provider with code "HAL"
SELECT P.Name, Pr.Provider, Pro.Name
FROM Pieces P
JOIN Provides Pr
	ON P.Code = Pr.Piece
JOIN Providers Pro
	ON Pr.Provider = Pro.Code
WHERE Pr.Provider = 'HAL';

-- 5.6
-- ---------------------------------------------
-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
-- Interesting and important one.
-- For each piece, find the most expensive offering of that piece and include the piece name, provider name, and price 
-- (note that there could be two providers who supply the same piece at the most expensive price).
-- ---------------------------------------------
SELECT P.Name, Pr.Provider, Pro.Name, Pr.Price
FROM Pieces P
JOIN Provides Pr
	ON P.Code = Pr.Piece
JOIN Providers Pro
	ON Pr.Provider = Pro.Code
WHERE Pr.Price = (SELECT MAX(Price) FROM Provides WHERE Piece = P.Code)
ORDER BY P.Name;

-- 5.7 Add an entry to the database to indicate that "Skellington Supplies" (code "TNBC") will provide sprockets (code "1") for 7 cents each
INSERT INTO Provides(Piece, Provider, Price) VALUES(1,'TNBC',7);

-- 5.8 Increase all prices by one cent
SELECT Provider, Price, (Price + 0.1) AS Price_inc
FROM Provides;

-- 5.9 Update the database to reflect that "Susan Calvin Corp." (code "RBT") will not supply bolts (code 4)
DELETE FROM Provides
WHERE Piece = 4 AND Provider = 'RBT';

SELECT *
FROM Provides
WHERE NOT (Piece = 4 AND Provider = 'RBT');

-- 5.10 Update the database to reflect that "Susan Calvin Corp." (code "RBT") will not supply any pieces 
    -- (the provider should still remain in the database)
UPDATE Provides SET Piece=' ';