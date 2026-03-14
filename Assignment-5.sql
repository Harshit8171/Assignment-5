		-- Basic level --

Select Sport, count(Name) as Total_Athletes
From Athlete_olympics
Group by Sport;

Select Sex, count(*) as Total_Athletes
From Athlete_olympics
group by Sex;

Select top 10 Team, Count(*) as Total_Athletes
From Athlete_olympics
group by team
order by Total_Athletes DESC

Select Name,team,Sport,Event, Medal
from Athlete_olympics
where Medal = 'Gold';

Select Name, Age,
Case
	When Age < 20 then 'Young'
	When Age between 20 AND 30 then 'Adult'
	When Age > 30 Then 'Senior'
END as age_group
From Athlete_olympics;

Select Sport, Avg(Height) as AVG_Height
From Athlete_olympics
group by Sport;

Select Name , team, Sport, Season
from Athlete_olympics
Where season = 'summer';

Select NOC, count(Medal) as Total_Medal
from Athlete_olympics
Where Medal is not null
Group by NOC;

Select Name, Medal, 
CASE
	When Medal IN ('Gold','Silver','Bronze') Then 'Winner'
		Else 'No Medal'
End as Medal_Status
From Athlete_olympics;

Select Top 5 Sport, count(Event) as Total_Events
From Athlete_olympics
group by Sport
order by Total_Events DESC;


		-- Intermediate Level --


Select NOC,
		SUM(CASE when Medal = 'Gold' Then 1 Else 0 End) as Gold_Medals,
		SUM(CASE when Medal = 'Silver' Then 1 Else 0 End) as Silver_Medals,
		SUM(CASE when Medal = 'Bronze' Then 1 Else 0 End) as Bronze_Medals
From Athlete_olympics
Group by NOC;

Select 
CASE
	When Medal IN ('Gold','Silver','Bronze') Then 'Medal Wineer'
	 Else 'No Medal'
End as Medal_Status,
Avg(Age) as Average_Age
From Athlete_olympics
Group by Medal;

Select Sport , count(Distinct Name) as Total_Athletes
From Athlete_olympics
group by Sport
order by Total_Athletes DESC;

SELECT NOC, COUNT(DISTINCT Sport) AS Sports_Count
FROM athlete_olympics
WHERE Medal IS NOT NULL
GROUP BY NOC
HAVING COUNT(DISTINCT Sport) > 10;

SELECT Name, Weight,
CASE
    WHEN Weight < 60 THEN 'Light'
    WHEN Weight BETWEEN 60 AND 80 THEN 'Medium'
    WHEN Weight > 80 THEN 'Heavy'
END AS Weight_Category
FROM athlete_olympics;

SELECT top 5 Name, COUNT(DISTINCT Games) AS Total_Games
FROM athlete_olympics
GROUP BY Name
ORDER BY Total_Games DESC;

SELECT Sport, AVG(Height) AS Avg_Height
FROM athlete_olympics
GROUP BY Sport
HAVING AVG(Height) > 180;

SELECT NOC
FROM athlete_olympics
WHERE Medal = 'Gold'
GROUP BY NOC
HAVING 
COUNT(DISTINCT CASE WHEN Season = 'Summer' THEN 1 END) > 0
AND
COUNT(DISTINCT CASE WHEN Season = 'Winter' THEN 1 END) > 0;

SELECT Sport,
       COUNT(CASE WHEN Medal IS NOT NULL THEN 1 END) * 100.0 / COUNT(*) AS Medal_Percentage
FROM athlete_olympics
GROUP BY Sport;

SELECT Event, COUNT(*) AS Gold_Medals
FROM athlete_olympics
WHERE Medal = 'Gold'
GROUP BY Event
HAVING COUNT(*) > 5;

		-- Advanced level --

SELECT NOC,
       COUNT(Medal) AS Total_Medals,
       CASE
           WHEN COUNT(Medal) > 100 THEN 'Elite'
           WHEN COUNT(Medal) BETWEEN 50 AND 100 THEN 'Strong'
           ELSE 'Developing'
       END AS Medal_Category
FROM athlete_olympics
WHERE Medal IS NOT NULL
GROUP BY NOC;

SELECT Name, COUNT(DISTINCT Year) AS Olympic_Years
FROM athlete_olympics
GROUP BY Name
HAVING COUNT(DISTINCT Year) >= 3;

SELECT top 10 NOC,
       COUNT(Medal) * 1.0 / COUNT(DISTINCT Name) AS Medal_Per_Athlete
FROM athlete_olympics
WHERE Medal IS NOT NULL
GROUP BY NOC
ORDER BY Medal_Per_Athlete DESC;

SELECT NOC, Sport, COUNT(Medal) AS Total_Medals
FROM athlete_olympics
WHERE Medal IS NOT NULL
GROUP BY NOC, Sport
ORDER BY NOC, Total_Medals DESC;

SELECT Year,
       COUNT(CASE WHEN Sex = 'F' THEN 1 END) * 100.0 / COUNT(*) AS Female_Percentage
FROM athlete_olympics
GROUP BY Year
ORDER BY Year;

SELECT Sport, MIN(Age) AS Youngest_Gold_Age
FROM athlete_olympics
WHERE Medal = 'Gold'
GROUP BY Sport;

SELECT Event, COUNT(DISTINCT Name) AS Total_Athletes
FROM athlete_olympics
GROUP BY Event
ORDER BY Total_Athletes DESC;

SELECT NOC
FROM athlete_olympics
GROUP BY NOC
HAVING 
SUM(CASE WHEN Medal = 'Gold' THEN 1 ELSE 0 END) = 0
AND
SUM(CASE WHEN Medal IN ('Silver','Bronze') THEN 1 ELSE 0 END) > 0;

SELECT Name, COUNT(DISTINCT Sport) AS Sports_Played
FROM athlete_olympics
GROUP BY Name
HAVING COUNT(DISTINCT Sport) > 1;

SELECT NOC, Year, COUNT(Medal) AS Total_Medals
FROM athlete_olympics
WHERE Medal IS NOT NULL
GROUP BY NOC, Year
ORDER BY Total_Medals DESC;
