USE SQL_day7;

-- 7.1 Who receieved a 1.5kg package?
    -- The result is "Al Gore's Head".
SELECT * 
FROM Package
WHERE Weight = 1.5;

SELECT Cl.Name, Pa.Weight
FROM Client Cl
JOIN Package Pa
	ON Cl.AccountNumber = Pa.Recipient
WHERE Pa.Weight = 1.5;

-- 7.2 What is the total weight of all the packages that he ("Al Gore's Head") sent?
SELECT Cl.Name, SUM(Pa.Weight) AS Total_Weight
FROM Client Cl
JOIN Package Pa
	ON Cl.AccountNumber = Pa.Recipient
WHERE Cl.Name = "Al Gore's Head";