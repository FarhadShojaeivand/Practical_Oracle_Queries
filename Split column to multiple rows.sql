create table tbl_test
(id number(3,0) ,
col2 VARCHAR2(100))

---

insert into tbl_test
values(1 , 'A,B,C')
insert into tbl_test
values (2 , 'P,Q,R,S,T')			
insert into tbl_test
values (3 , 'M,N')

---
  
select * from tbl_test

---
  
select tbl_test.id , 
case when a.ll = 1
						then substr(col2 , 1 , instr(col2 , ',' , 1 ,  a.ll) -1 )
						else substr(col2 , instr(col2 , ',' , 1 , a.ll -1) +1 , 
													case when instr(col2 , ',' , 1 , a.ll) - instr(col2 , ',' , 1 , a.ll - 1) -1 > 0
																then instr(col2 , ',' , 1 , a.ll) - instr(col2 , ',' , 1 , a.ll - 1) -1 
													      else length(col2)
												  end 
												)
END col2_new
from tbl_test , 
(select level ll from dual 
 connect by level <= ( 
				select max(length(col2) - length(replace(col2 , ',' , '')) + 1 )
				from tbl_test )
)  a
where length(col2) - length(replace(col2 , ',' , '')) + 1 >= a.ll 
order by id , a.ll
				 
