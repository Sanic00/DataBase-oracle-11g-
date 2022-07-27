select * from tab;

create table visit (
no NUMBER(5) not null,
writer VARCHAR2(20) not null,
memo VARCHAR2(4000) not  null,
regdate date not null,
CONSTRAINT visit_pk PRIMARY KEY(no)
);

create SEQUENCE visit_seq
START WITH 1
increment by 1
nomaxvalue
nocache
nocycle;

commit;

desc visit;

select * from visit;
