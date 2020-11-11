use PRACTICE_5;
 
CREATE TABLE People
(
    id   INTEGER IDENTITY NOT NULL,
    Name VARCHAR(100) NOT NULL,
    fk   INTEGER NULL
PRIMARY KEY (id)
) ;
 
CREATE TABLE Colors
(
    id   INTEGER NOT NULL,
    FavoriteColor VARCHAR(100) NOT NULL
) ;
 
INSERT INTO Colors (id, FavoriteColor) VALUES
    (1, 'red'),
    (2, 'green'),
    (3, 'blue');
 
INSERT INTO People (Name, fk) VALUES
    ('Steve', 1),
    ('Aaron', 3),
    ('Mary', NULL);


SELECT *, NTILE(4) over(order by name asc) as Groups
FROM People p
CROSS JOIN Colors c

SELECT *
FROM People p
FULL OUTER JOIN Colors c
ON p.fk=c.id;


with
colors as
(
select 1 id, 'red' color from dual union
select 2, 'green' from dual union
select 3, 'blue' from dual
)
, people as
(
select 'Steve' name, 1 fk from dual union
select 'Aaron', 3 from dual union
select 'Mary', NULL from dual
)
—
select *
from colors
outer full join people on 1=1