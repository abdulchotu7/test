create view v1 as select row_number() over(order by score desc ) as rownumber, * from mydataset;
create view v2 as select row_number() over(order by score asc ) as rownumber, * from mydataset;