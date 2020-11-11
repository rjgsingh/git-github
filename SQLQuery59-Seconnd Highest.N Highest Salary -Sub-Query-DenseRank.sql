use EmpDB

select * 
from Employee

select max(salary)
from Employee;

select max(salary)
from Employee
where Salary<(select max(salary)
from Employee);

select max(salary)
from Employee
where Salary<((select max(salary)
from Employee
where Salary<(select max(salary)
from Employee)))


select *
from Employee
where salary = (select max(salary)
from Employee
where Salary<(select max(salary)
from Employee));

----------Top 1 Approach -----------------

select * 
from  Employee
order by salary desc 

select top 2 salary 
from Employee
order by salary desc

select top 1 salary 
from (select top 4 salary 
from Employee
order by salary desc) result 
order by Salary;




select Salary, rank () over (order by salary desc) Rank, dense_rank () over (order by salary desc) Dense_Rank
from Employee


----------Dense Rank Approach -------------


SELECT EmployeeNo,Empname,Salary
,DENSE_RANK() over (ORDER BY Salary DESC) AS Ranking 
FROM Employee;

-----We cannot write the query like below to get 2nd highest salary, it will throw error becuase Ranking is not a coloumn in table
SELECT EmployeeNo,Empname,Salary
,DENSE_RANK() over (ORDER BY Salary DESC) AS Ranking 
FROM Employee
WHERE RANKING = 2;

select * 
from (SELECT EmployeeNo,Empname,Salary
			,DENSE_RANK() over (ORDER BY Salary DESC) AS Ranking 
		FROM Employee) E 
where E.RANKING=2

select * 
from (SELECT EmployeeNo,Empname,Salary
			,DENSE_RANK() over (ORDER BY Salary DESC) AS Ranking 
		FROM Employee) E 
where E.RANKING=3

