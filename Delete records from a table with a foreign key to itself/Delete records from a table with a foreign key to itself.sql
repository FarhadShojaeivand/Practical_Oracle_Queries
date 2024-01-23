--
create table tbl1(
id number(10,0) primary key ,
parent_id number(10,0) ,
foreign key(parent_id) references tbl1(id))

--
insert into tbl1
values(1 , null),
      (2 , 1),
      (3 , 2)
--
/* If we use this code, the foreign key will be violated
delete from tbl1
where id = 1
*/
--
-- solution:
delete from tbl1
where id in (
with hirarchical_tbl (id) as (
        select id 
        from tbl1
        where id = 1
          union all
        select t.id from tbl1 t
        join hirarchical_tbl h on t.parent_id = h.id 
                              ) 
        select id from hirarchical_tbl
              )
