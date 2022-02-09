--1.
--The first example shows the goal scored by a player with the last name 'Bender'. The * says to list all the columns in the table - a shorter way of saying matchid, teamid, player, gtime
--Modify it to show the matchid and player name for all goals scored by Germany. To identify German players, check for: teamid = 'GER'
SELECT matchid, player FROM goal 
  WHERE teamid = 'GER';
  
--2.
--From the previous query you can see that Lars Bender's scored a goal in game 1012. Now we want to know what teams were playing in that match.
--Show id, stadium, team1, team2 for just game 1012
SELECT id,stadium,team1,team2
  FROM game WHERE id=1012;
--3.
--Modify it to show the player, teamid, stadium and mdate for every German goal.
SELECT player, teamid, stadium, mdate
  FROM game JOIN goal ON (id=matchid)
WHERE teamid = 'GER';
  
--4.
--Use the same JOIN as in the previous question.

--Show the team1, team2 and player for every goal scored by a player called Mario player LIKE 'Mario%'
SELECT team1, team2, player 
FROM game JOIN goal ON (id=matchid)
WHERE player LIKE 'Mario%';

--  5.
--Show player, teamid, coach, gtime for all goals scored in the first 10 minutes gtime<=10
SELECT player, teamid, coach, gtime
  FROM goal JOIN eteam on teamid=id
 WHERE gtime<=10;

--  6.
--List the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach.
SELECT mdate, teamname
FROM game JOIN eteam ON (team1=eteam.id)
WHERE coach = 'Fernando Santos';

--7.
--List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'
SELECT player
FROM game JOIN goal ON (id=matchid)
WHERE stadium = 'National Stadium, Warsaw';
--10.
--Find the routes involving two buses that can go from Craiglockhart to Lochend.
--Show the bus no. and company for the first bus, the name of the stop for the transfer,
--and the bus no. and company for the second bus.
SELECT Origin.num, Origin.company, Origin.name, Destination.num, Destination.company
FROM
  (SELECT b.num, b.company, stopsa.name 
  FROM route a
  JOIN route b ON (a.company=b.company AND a.num=b.num)
  JOIN stops stopsb ON (b.stop=stopsb.id)
  JOIN stops stopsa ON (a.stop=stopsa.id)
  WHERE stopsb.name='Craiglockhart') AS Origin
JOIN
  (SELECT stopsc.name, c.num, c.company  
  FROM route c
  JOIN route d ON (c.company=d.company AND c.num=d.num)
  JOIN stops stopsd ON (d.stop=stopsd.id)
  JOIN stops stopsc ON (c.stop=stopsc.id)
  WHERE stopsd.name='Lochend') AS Destination
ON Origin.name = Destination.name
ORDER BY Origin.num, Origin.name, Destination.num;
