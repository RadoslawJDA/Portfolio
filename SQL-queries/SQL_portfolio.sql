--Skills used: Joins, Windows Functions, Aggregate Functions, Creating View

--Average salary in each department(department name and the salary)
SELECT	d.dept as department,
	SUM(e.Salary) as average_salary
FROM
EMP e join DEPT d
on e.Dept_id = d.Dept_id
GROUP BY(d.Dept)
Order by 2 desc

--Create view of data for later visualizations
Create View average_department_salary
as
SELECT	d.dept as department, 
	AVG(Salary) as average_salary
FROM
EMP e join DEPT d
on e.Dept_id = d.Dept_id
GROUP BY(d.Dept)

Select * From average_department_salary order by 2 desc


--For each employee number of days he worked for the company till today

SELECT	LastName, 
	Date_of_employment, 
	GETDATE() as today,
	(Datediff(dd, Date_of_employment, GETDATE()) + 1)
	- (Datediff(ww, Date_of_employment, GETDATE()) * 2)
	- (CASE WHEN DateName(dw, Date_of_employment) = 'Sunday' Then  1 else 0 END)
	- (CASE WHEN DateName(dw, GETDATE()) = 'Saturday' Then  1 else 0 END)
FROM
EMP


--All duplicated records in EMP table (in order to identify duplicates please ignore column Id)
SELECT	LastName, 
	Date_of_employment, 
	Dept_id,
	Salary,
	count(*) as count 
from EMP
GROUP BY LastName, Date_of_employment, Dept_id, Salary
Having count(*) > 1


-- HackerRank 
-- https://www.hackerrank.com/challenges/the-pads/problem?isFullScreen=true

SELECT  CONCAT(Name,'(',LEFT(Occupation,1),')')
FROM OCCUPATIONS
ORDER BY Name;

SELECT CONCAT('There are a total of ', COUNT(Occupation), ' ', LOWER(Occupation), 's.')
FROM OCCUPATIONS
GROUP BY Occupation
ORDER BY COUNT(Occupation);

