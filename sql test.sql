---- 1. From the following table, write a SQL query to count the number of countries that parƟcipated in the 2016-EURO Cup. 

SELECT COUNT(DISTINCT country_name) AS num_countries
FROM soccer_country;

---- 2. From the following table, write a SQL query to find the number of matches that ended with a result. 
--- use table match_mast 
select * from match_mast;
SELECT COUNT(*) AS results
FROM match_mast
WHERE results IS NOT NULL;

----- 3. From the following table, write a SQL query to find out when the Football EURO cup 2016 will begin. 
-- use table match_mast 

SELECT MIN(play_date) AS Euro_cup_Start_date
FROM match_mast;

---  4. From the following table, write a SQL query to find out where the final match of the EURO cup 2016 was played. 
---- Return venue name, city. 
----- use tables: soccer_venue, soccer_city, match_mast 
select venue_id as vanue_final
from match_mast
where play_stage = 'F';
select city_id 
from soccer_venue
where ï»¿venue_id = 20008;

select city as final_match_place
from soccer_city
where ï»¿city_id=10002 ;

---- SHOW COLUMNS FROM soccer_venue;

------ 5.
---- From the following tables, write a SQL query to find the number of goals scored by each team in each match during normal play. 
-- Return match number, country name and goal score. 
-- use tables: match_details, soccer_country 
SELECT
  m.match_no,
  m.team_id AS team_id,
  COUNT(g.goal_score) AS goals_scored
FROM
  match_details
JOIN
  goals g ON m.match_no = g.match_no
WHERE
  g.decided_by = 'N'
GROUP BY
  m.match_no,
  m.team_id

UNION

SELECT
  m.match_no,
  m.team_id AS team_id,
  COUNT(g.goal_score) AS goals_scored
FROM
  match_details m
JOIN
  goals g ON m.match_no = g.match_no
WHERE
  g.decided_by = 'N'
GROUP BY
  m.match_no,
  m.team_id;




