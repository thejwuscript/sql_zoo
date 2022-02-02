--11.
--The capital of Luxembourg is Luxembourg. Show all the countries where the capital is the same as the name of the country

--Find the country where the name is the capital city.
SELECT name
  FROM world
 WHERE name LIKE capital;

--12.
--The capital of Mexico is Mexico City. Show all the countries where the capital has the country together with the word "City".

--Find the country where the capital is the country plus "City".
SELECT name
  FROM world
 WHERE capital LIKE concat(name, '_City');

--13.
--Find the capital and the name where the capital includes the name of the country.
SELECT capital, name
FROM world
WHERE capital LIKE concat(name, '%');

--14.
--Find the capital and the name where the capital is an extension of name of the country.

--You should include Mexico City as it is longer than Mexico. You should not include Luxembourg as the capital is the same as the country.
SELECT capital, name
FROM world
WHERE capital LIKE concat(name, '_%');

--15.
--For Monaco-Ville the name is Monaco and the extension is -Ville.

--Show the name and the extension where the capital is an extension of name of the country.
SELECT name,
REPLACE(capital, name, '')
FROM world
WHERE capital LIKE concat(name, '_%');