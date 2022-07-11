create table employee (
no number PRIMARY key, 
name varchar2(20) not null,
jobgrade varchar2(10),
department number, 
email varchar2(30)
);

commit;

create sequence employee_seq
START WITH 1
increment by 1
nocycle;
desc employee_seq;

commit;

