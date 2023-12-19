--3000J

--1
SELECT Count(*)
FROM input;

--2
SELECT Count(*)
FROM input
Where (nem = 0);

--3
SELECT nev
FROM input
Where (testverek = 0);

--4
SELECT Count(*)
FROM input
Where (testverek = 0);

--5
SELECT nev
FROM input
Where (angol like "2*");

--6
SELECT nev
FROM input
Where (nyelv2 = "olasz");

--7
SELECT Count(*)
FROM input
Where (matinfo = "alfa" AND nem = -1);

--8
SELECT egyuttlakok
FROM input
WHERE egyuttlakok = (SELECT MAX(egyuttlakok) FROM Jplussz);

--9
SELECT nev
FROM input
WHERE testverek = (SELECT MAX(testverek) FROM Jplussz);

--10
SELECT Count(*)
FROM input
WHERE egyuttlakok - testverek <> 3;

--11
SELECT nev
FROM input
Where (SELECT nev FROM Jplussz Where nev = "Hát Izsák") AND nev <> "Hát Izsák"; 

--12
SELECT nyelv2, Count(*)
FROM input
GROUP BY nyelv2;

--13
SELECT INT((DATE()-MAX(szulido))/365), INT((DATE()-MIN(szulido))/365), MAX(szulido)-MIN(szulido)&" nap"
FROM input;

--14
SELECT COUNT(*)
FROM (SELECT DISTINCT angol FROM input);

--15
SELECT TOP 1 testverek
FROM input
GROUP BY testverek
ORDER BY COUNT(*) DESC

--16
SELECT nyelv2, AVG (testverek)
FROM input 
GROUP BY nyelv2;

--17
SELECT angol, min(nev), max(nev)
FROM input
GROUP BY angol;

--18
SELECT COUNT(*)
FROM input
WHERE id = huzottid;

--19
SELECT i1.nev, i2.nev
FROM input as i1, input as i2
WHERE i1.id = i2.huzottid
AND i2.id = i1.huzottid
AND i1.id <> i2.id;

--20
SELECT i1.nev, i2.nev, i3.nev, i4.nev
FROM input as i1, input as i2 , input as i3, input as i4
WHERE i1.id = i2.huzottid 
AND i2.id = i3.huzottid
AND i3.id = i4.huzottid
AND i4.id = i1.huzottid
AND i1.id <> i2.id;

--21
SELECT i1.nev, COUNT(*)
FROM input as i1, input as i2
WHERE i1.id = i2.huzottid
GROUP BY i1.nev
HAVING COUNT(*) > 1;

--22
SELECT i1.nev, COUNT(*)
FROM input as i1, input as i2
WHERE i1.id = i2.huzottid
GROUP BY i1.nev
HAVING COUNT(*) = 0;