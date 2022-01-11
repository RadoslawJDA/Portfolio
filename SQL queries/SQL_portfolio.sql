/*

Skills used: Joins, Windows Functions, Aggregate Functions, Creating View

*/


--All employees with salary greater than 4000

Select	LastName, 
		Dept_id 
from EMP
WHERE Salary > 4000


--Number of rows in the table EMP.

Select 
	count(*) as mumber_of_rows 
from EMP


--All employees in IT department

SELECT	LastName, 
		Salary, 
		Date_of_employment 
FROM
EMP e join DEPT d
on e.Dept_id = d.Dept_id
WHERE
d.dept = 'IT'


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




--making duplicate
Insert into EMP
	(LastName, Dept_id, Salary, Date_of_employment)
VALUES
('Kowalski', 6, 4000, '2014-01-31')


-- creating tables and insreting values needed for queries 
DROP table EMP
Create Table EMP 
(
Id int NOT NULL IDENTITY(1,1) PRIMARY KEY, 
LastName varchar(50), 
Dept_id int, 
Salary int, 
Date_of_employment date
)

DROP table DEPT
Create Table DEPT
( 
Dept_id int, 
Dept varchar(50), 
Dept_Manager_id int
)


Insert into EMP
	(LastName, Dept_id, Salary, Date_of_employment)
VALUES
('Kowalski', 1, 4000, '2014-01-31'),
('Nowak', 100, 6000, '2014-03-01'),
('Maliniak', 1, 5000, '2015-05-03'),
('Lewandowski', 4, 2700, '2016-01-01'),
('Czarnecki', 35, 2000, '2016-01-01'),
('Kowalski', 6, 4000, '2014-01-31')


Insert into DEPT
	(Dept_id, Dept, Dept_Manager_id)
Values
(100, 'Ksiêgowoœæ', 2),
(1, 'IT', 3),
(4, 'HR', 4),
(35, 'Handel', 5)

