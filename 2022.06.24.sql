    ----------------------------------------------START DML(������ ���۾�) -----------------------------------------------------------------
    /*
    ���ο� ���� �߰��ϴ� INSERT INTO   (C)
    �������� �����ϴ� UPDATE SET       (U)
    ���� �����ϴ� DELETE              (D)��� �Ѵ�
    ���� ��ȸ �Ҷ� SELECT             (R)
                            �� 4���� CRUD ��� �Ѵ�
    */
    
    /*
    ���ο� ���� �߰��ϴ� INSERT INTO (C)
    
        Ư���� �÷����� �����͸� �Է��ϴ� ���
        INSERT INTO ���̺��(�÷���1, �÷���2) VALUES(��1 , ��2)
        
        ��� �÷��� �����͸� �Է��ϴ� ���
        INSERT INTO ���̺�� VALUES(��1 , ��2)
        ������� ã�ư���. 
    */
    
    create table dept01(
    deptno number(2), 
    dname varchar2(14),
    loc varchar2(13)
    );
    
    -- �μ���ȣ : 10 , �μ��� : ACCOUNTING , ���� : NEW YORK�� �߰��Ͻÿ�.
    INSERT INTO dept01(deptno, dname, loc) VALUES ( 10, 'ACCOUNTING', 'NEW YORK');
    INSERT INTO dept01 VALUES ( 20, 'RESARCH', 'DALLAS');
    INSERT INTO dept01 (deptno, dname) values (30, 'SALES');
    
    INSERT INTO dept01(deptno) VALUES (null);
    INSERT INTO dept(deptno) VALUES (null);
    
    desc dept01;
    desc dept; -- not null
    select * from dept01;
    /*
    not null 
    �÷��� ���� NULL�� �� ���ٴ� �������� �Դϴ�(�ݵ�� NULL�� �ƴ� ���� ������ �մϴ�).
    �÷� �����θ� ���ǰ� �����ϸ� NOT NULL�� �⺻������ ������ �� �ֽ��ϴ�. 
    ���̺� ���� INSERT�� ��� DEFAULT�� ������ ���� �����ϰ�� �⺻���� NOT NULL�� �÷��� �ݵ�� �÷��� ����ϰ� ���� �����ؾ� �մϴ�.
    */
    
    INSERT INTO dept02(deptno) VALUES (null);
    desc dept02;
    create table dept02 as select * from dept;
    select * from dept02;
    
    create table emp04 (
    deptno number(2) not null,
    dname varchar2(14), 
    loc varchar2(13)
    );
    desc emp04;
    
    select * from emp04;
    
    insert into emp04 values(10, null, null);
    insert into emp04 values(20, '' , ''); -- '' �̰͵� NULL�� �ν��� ���� ��������ϱ�
    
    select * from tab;
    
    drop table emp04;
    
    
    
    create table emp01 as select * from emp; 
    
    /*
        �������� �����ϴ� UPDATE SET (U)
        ����
        UPDATE ���̺�� SET �÷���1 = ��1, �÷���2=��2 where ���ǽ�
        
        � ���� �����͸� �����ϴ��� where ����  �̿��Ͽ� ������ �����մϴ�
        where ���� ������� ������ ���̺� �ִ� ��� ���� �����ȴ�.
    
    */
        -- ��� ����� �μ���ȣ�� 30���� �ٲ�� 
    update emp01 set deptno=30;
    rollback;
    --��� ����� �޿��� 10% �λ�
    update emp01 set sal = sal * 1.1;
    
    --��� ����� �Ի����� ���÷� �ٲ���� 
    update emp01 set hiredate = sysdate;
    
    -- 1987�⿡ �Ի��� ����� �Ի����� ���÷� ����
    select * from emp01 where substr(hiredate,1,2) ='87';
    update emp01 set hiredate = sysdate where substr(hiredate, 1,2) = '87';
    select * from emp01;
    rollback;
    
    -- �÷� �ΰ��� �Ѳ����� �ٲٰ� �ʹ�.
    -- SCOTT ����� �μ���ȣ�� 10, ������ �Ŵ����� ���� ���Ѷ�.
    select deptno, job from emp01 where ename ='SCOTT';
    update emp01 set deptno = 10, job = 'MANAGER' where ename = 'SCOTT';
    
    /*
     DELETE
     ���̺� Ư�� ���� �����Ҷ�
     ������
     DELETE FROM ���̺�� where ����
    */
    select * from tab;
    create table dept01 as select * from dept01;
    delete from dept01 where deptno = 30;
    rollback;
    
    ----------------------------------------------------END DML(������ ���۾�)--------------------------------------------------------------------------
    
    
    /*
    Ʈ�����(Transaction)
        - �����ͺ��̽����� �����͸� ó���ϴ� �ϳ��� ������ �۾������� �ǹ���
        - Ʈ������� ����ϴ� ���� : �������� �ϰ����� �����Ѵ�.
                                 ���������� �����͸� ���� ��Ų��.
        insert, update, delete ��ɿ����� Ʈ������� Ȱ���Ѵ�.
        
        commit �� rollback 
        
        commit 
        - ��� �۾��� ���������� ó�� �ϰڴٰ� Ȯ���ϴ� ��ɾ�
         Ʈ����� ó�� ������ �����ͺ��̽��� ��� �ݿ���(����� ������ ��� ���� ����)
        
        rollback
        - �۾� �� ������ �߻��Ǿ Ʈ����� ó�� �������� �߻��� ���� ������ ����ϴ� ��� 
          ������ ó���� ���۵Ǳ� ���� ���·� �ǵ���
          
          ���������� Ŀ�� ��� ���ĺ��� ���ο� Ŀ�� ����� ���� �ϴ� �������� �����
          ��� DML��ɵ���  �ǹ��� 
    */
    create table dept01 as select * from dept;
    select * from dept01;
    
    delete from dept01;
    rollback;
    
    delete from dept01 where deptno = 20;
    commit;
    rollback; --Ŀ���� �ǰ� ���� rollback�ϸ� ������ �ȵ� �׷��� Ŀ���� �����ϰ� �ض�!
    
    /*
        savepoint   
        -���� Ʈ������� �۰� ���� �� �� �ִ�. 
         ����� savepoint�� rollback to savepoint ���� ����Ͽ� ǥ���� �� ���� 
         rollback �� �� ����
         
         ����
         
         Ư����ġ�� �����Ҷ� �ϴ� ����
         savepoint table�� 
         
         ������ ���� Ư����ġ�� �ǵ��ư��� ����
         rollback to label_name;
    */
    drop table dept01;
    
    create table dept01 as select * from dept;
    
    select * from dept01;
    
    --�μ���ȣ 40�� ����
    delete from dept01 where deptno = 40;
    commit;
    delete from dept01 where deptno = 30;
    savepoint C1;
    delete from dept01 where deptno = 20;
    savepoint C2;
    delete from dept01 where deptno = 10;
    savepoint C1;
    
    rollback to C2;
    rollback to C1;
    rollback; -- commit ���������� �� ���� ��
    
    -- pk�� �����̸Ӹ�Ű�� �����̴�
    select * from user_cons_columns where table_name = 'EMP';
    select * from user_cons_columns where table_name = 'DEPT';
--------------------------------------------2022-06-27---------------------------------------------------------------------------------------
/*

���Ἲ ������� 
 -�����͸� �߰�, ����, �����ϴ� �������� ���Ἲ�� ���� �� �� �ֵ��� ����� �ִ� ���� �ǹ��� 
 -���Ἲ : �����ͺ��̽� ���� �������� Ȯ������ �����ϴ� ���� �ǹ��ϰ�(����� �����ͺ��̽��� �߸��� �����Ͱ� ���ٴ� ���� �ǹ��մϴ�) 
 -���� ���� : �ٶ������� ���� �����Ͱ� ����Ǵ� ���� �����ϱ� ����
 
 ���Ἲ ���� ���� 
    NOT NULL : NULL�� ������� �ʴ´�.
    UNIQUE : �ߺ��� ���� ������� �ʴ´�.
    *PRIMARY KEY : NOT NULL + UNIQUE ������ ������ ���¸� �ǹ��� *
    *FOREIGN KEY : ���� �Ǵ� ���̺��� �÷����� ���� �����ϸ� ����*
    CHECK  : ���� ������ ������ ���� ������ ������ �����Ͽ� ������ ������ �����
*/

select * from tab;
drop table EMP01;

create table EMP01(
empno number(4),
ename varchar2(10),
job varchar2(9),
deptno number(4)
);

insert into emp01 values(null, null, 'salesman', 30);
select * from emp01;
-- not null ���������� �ش� �÷��� null ���� �߰��ϰų� null������ �����ϴ� �����ϴ� ���� ����
-- ���������� �÷���� �ڷ����� ����� �Ŀ� �̾ not null�� ����ϸ� ��

create table EMP02(
empno number(4) not null,
ename varchar2(10) not null,
job varchar2(9),
deptno number(4)
);
insert into emp02 values(null, null, 'salesman', 30);

-- UNIQUE : �ߺ��� ���� ������� �ʴ´�. �׻� ������ ���� ������ ��

create table EMP03(
empno number(4) unique,
ename varchar2(10) not null,
job varchar2(9),
deptno number(4)
);

insert into emp03 values(7499,'ALLEN','salesman', 30);
insert into emp03 values(null,'ALLEN','salesman', 30);
insert into emp03 values(null,'JONES','salesman', 20);
select * from emp03;

/*
 unique : null ���� ���ܷ� ������, ���� null ���� ������ �Էµ��� �ʰ� ���� �Ϸ��� 
        ex) ���̺� ������ enpno number(4) unique not null ó�� �� ���� ���������� 
        ����ؾ���
*/
desc user_tables;

show user;


/*
���� ���� Ȯ�� �ϱ� 
    ���������� ���� �޽����� ���� ��Ȯ�� ������ �˱� ���� ����Ŭ���� ������ �ִ� user_constarints ������ ��ųʸ�
    
    user_constaints ������ ��ųʸ�
    - ���������� ������ ���ؼ� ���� �÷����� �����Ǿ� ������
      �������Ǹ�, ���� ��������, ���������� ���� ���̺��� �˾� ��
*/
select constraint_name, constraint_type, table_name from user_constraints where table_name ='EMP03';

/*
constraint_type�� P, R , U, C 4������ ����
    P : PRIMARY KEY
    R : FOREIGN KEY
    U : UNIQUE
    C : CHECK NOT NULL
*/

/*
    PRIMARY KEY ���� ����
     - �ĺ� ����� ���� �÷��� �����ϸ鼭�� NULL ���� ������� �ʴ´�.
     - ��, UNIQUE �� NOT NULL ���� ���� ��θ� ���� ���� �⺻Ű(PRIMARY KEY) ����������
*/
create table EMP04(
empno number(4) PRIMARY KEY,
ename varchar2(10) not null,
job varchar2(9),
deptno number(4)
);

INSERT INTO EMP04 VALUES(7499, 'ALLEN', 'SALESMAN', 30);
INSERT INTO EMP04 VALUES(NULL, 'JONES', 'MANAGER', 20); -- PRIMARY KEY�� NULL���� ������ ����
select constraint_name, constraint_type, table_name from user_constraints where table_name ='EMP04';
-- �μ����̺� -- �Ҽ� -- ������̺�  �μ����̺��� ��(�θ�) ������̺��� ��(�ڽ�)�̴�.

SELECT * FROM EMP04; 

insert into emp04 values(7566,'JONES','salesman', 50);
DELETE FROM EMP04 WHERE DEPTNO = 20;

create table EMP05(
empno number(4) PRIMARY KEY,
ename varchar2(10) not null,
job varchar2(9),
deptno number(4)
);
drop table emp05;
desc dept;

create table dept01 (
deptno number(2) primary key,
dname varchar2(14),
loc varchar2 (13)
);

insert into dept01 values(10, 'ACCOUTINI', 'NEW YORK');
insert into dept01 values(20, 'RESEARCH', 'DALLAS');
insert into dept01 values(30, 'SALES', 'CHICAGO');
insert into dept01 values(40, 'OPTIONS', 'BOTSON');
select * from dept01;

--dept01 ���̺�� emp05 ���̺��� �����Ų��
create table EMP05(
empno number(4) PRIMARY KEY,
ename varchar2(10) not null,
job varchar2(9),
deptno number(4) references dept01(deptno) 
);
select constraint_name, constraint_type, table_name ,search_condition from user_constraints where table_name ='EMP05';
select * from emp05;
insert into emp05 values(7499, 'ALLEN', 'SALESMAN', 30);
insert into emp05 values(7566, 'JONES', 'MANAGER', 50); --�θ�Ű�� 40������ �ۿ� ��� 50���� ������ ���� �� 
drop table dept01; --�θ����̺��� �����ϸ� �ڽ����̺��� ������ ��ġ�⋚���� ������ ���.

/*
    check ���� ����
    -�ԷµǴ� ���� üũ�Ͽ� ������ �� �̿��� ���� ������ ���� �޼����� �Բ� ����� ������� ���ϰ� �ϴ� ���� �ǹ���
*/
    
/*
    emp06 ������̺� GENDER(����) �÷��� �߰��ϵ� 
    GENDER �÷����� 'M' OR 'F'�� �� ���� ���� �� �� �ִ� CHECK ���� ���� ����
*/  
create table emp06(
empno number(4) primary key,
ename varchar2(10) not null,
gender varchar2(1) check(gender in('M', 'F'))
);
insert into emp06 values(7566, 'JONES', 'A'); -- a�� �ƴ� M or F �� ���� ����
insert into emp06 values(7566, 'JONES', 'M'); 
select constraint_name, constraint_type, table_name ,search_condition from user_constraints where table_name ='EMP06';

/*
    ���� ���Ǹ� �����ϱ�
    - ����ڰ� �ǹ��ְ� ���� ���Ǹ��� ����Ͽ� ���� ���Ǹ����� � ���������� ���� �ߴ��� �� �� �ְ� �ϴ� ���
        ������� : column_name data_type CONSTRAINt constraint_name constraint_type;
    
    ���� ���� �� ��� ��Ģ
        ���̺��_ �÷���_�������� ����
    
    �⺻Ű ���� ���Ǹ��� EMP06_EMPNO_PK(PRIMARY KEY)�� ������
        EMP06_EMPNO_PK
*/  
drop table emp05;

create table emp05 (
empno number(4) CONSTRAINT emp05_empno_pk primary key,  
ename varchar2(10) constraint emp05_ename_nn not null,
job varchar2(9) constraint emp05_job_uk unique,
deptno number(4) constraint emp05_deptno_fk references dept01(deptno)
);
select constraint_name, constraint_type, table_name ,search_condition, r_constraint_name from user_constraints where table_name ='EMP05';

insert into emp05 values(7499,'ALLEN', 'SALESMAN',30);
insert into emp05 values(7499,null, 'SALESMAN',50); --������ �ȵȴ� ������ ���� ���̺��� �����Ҷ� ���������� �޷��ֱ� �����̴�.
insert into emp05 values(7499,'ALLEN', 'SALESMAN',50);
insert into emp05 values(7500,'ALEEN', 'SALESMAN',50); --job�� ����ũ�� �ɸ��� ����ũ�� �ߺ� x 

/*
���̺� ���� ������� �������� �����ϱ� (������� �������� �ϴ¹���� �ٸ��ٰ���) 

    - ����Ű�� �⺻Ű�� ������ ��� 
        ����Ű ���·� ���� ������ ������ ��쿡�� �÷� ���� �������δ� �Ұ����ϰ� �ݵ�� ���̺� ���� ����� ����� 
    
    - ALTER TABLE�� ���� ������ �߰��� ��� 
        ���̺��� ���ǰ� �Ϸ�Ǿ �̹� ���̺��� ������ ���� �� �Ŀ� ���߿� ���̺�
        ���� ������ �߰��ϰ��� �Ҷ� ���̺� ���� ������� ���� ������ ������
        
    ����
    create table ���̺��(
    �÷���1 ������ Ÿ��1,
    �÷���2 ������ Ÿ��2,
    �÷���3 ������ Ÿ��3,
    .....
    
    CONSTRAINT constraint_name constraint_type(column_name)
    );
*/

-- ���̺� ������ ���������� �����ϴ� ���
select * from tab;
drop table emp04;

create table emp04 (
empno number(4),
ename varchar2(10) not null,
job varchar2(9),
deptno number(4), 
primary key(empno), 
unique(job),
foreign key(deptno) references dept01(deptno)
);

drop table emp03;
-- ���̺� �������� �÷��� ���� ���Ǹ��� ��������� �������� ��� constraint Ű���带 �����
create table emp03(
empno number(4), 
ename varchar2(10) constraint emp03_ename_nn not null,
job varchar2(9),
deptno number(4),
constraint emp03_empno_pk primary key(empno),
constraint emp03_job_uk unique(job),
constraint emp03_deptno_fk foreign key(deptno) references dept01(deptno)
);
--���� ���� Ȯ���ϱ�
select constraint_name, constraint_type, table_name ,search_condition, r_constraint_name from user_constraints where table_name ='EMP03';
select constraint_name, constraint_type, table_name ,search_condition, r_constraint_name from user_constraints where table_name ='EMP04';

-----------------------------------end  �������� �������------------------------------------------------------------------------------------

--------------------------------------start ���� ���� ����-----------------------------------------------------------------------------------

-- 1. ���� ���� �߰��ϱ� 
    -- ���̺� ������ ���� �Ŀ� ���� ������ �߰��ϱ� ���ؼ� alter table�� �߰���
    -- ����
    -- alter table ���̺��
    -- add constraint constraint_name constraint_type(column_name);
drop table emp01;
create table emp01(
empno number(4),
ename varchar2(10),
job varchar2(9),
deptno number(4) 
);
select constraint_name, constraint_type, table_name ,search_condition, r_constraint_name from user_constraints where table_name ='EMP01';

-- emp01 ���̺��� empno �÷��� �⺻Ű �����ϰ�, deptno �÷��� �ܷ�Ű ����
alter table emp01
add primary key(empno);

alter table emp01
add constraint emp01_deptno_fk foreign key(deptno) references dept01(deptno);

/*
-- 2. ���� ���� �����ϱ�
     - ���� ������ �����ϱ� ���ؼ��� drop constraint ������ ���� �ϰ����ϴ� ���� ���Ǹ��� �����
     alter table ���̺��
     drop constraint ���� ���Ǹ�;
*/
insert into emp05 values(7499, 'ALLEN', 'MASTER', 50);

alter table emp05
drop constraint EMP05_EMPNO_PK;

alter table emp05
drop constraint EMP05_DEPTNO_FK;

/*
-- 3. ���� ������ ��Ȱ��ȭ cascade; 
    - ���� ������ ��Ȱ��ȭ�� ������ ���� ������ ��� ������� �ʰ� �ϴ� ����
    
    disable : ���� ������ �Ͻ� ��Ȱ��ȭ  
    enable : ��Ȱ��ȭ�� ���������� �����Ͽ� �ٽ� Ȱ��ȭ�c
*/
select * from dept01;
insert into dept01 values(10, 'ACCOUTINING', 'NEW YORK');
delete from dept01 where deptno=40;

drop table emp01;
create table emp01(
empno number(4) constraint emp01_empno_pk primary key,
ename varchar2(10) constraint emp01_ename_nn not null,
job varchar2(9),
deptno number(4) constraint emp01_deptno_fk references dept01(deptno)
);
select constraint_name, constraint_type, table_name ,search_condition, r_constraint_name from user_constraints where table_name ='EMP01';

insert into emp01 values(7499, 'ALLEN', 'SALESMAN', 10);
insert into emp01 values(7369, 'SMITH', 'CLERK', 20);

delete from dept01 where deptno = 10;
/*
-- ���� ���� Ȱ��ȭ�� ��Ȱ��ȭ 
  - ���� ������ �����Ǹ� �׻� �� ��Ģ�� ���� ������ ���Ἲ�� ���� ��
    ����Ŭ������ ���������� �� Ȱ�� ��Ŵ���μ� ���� ������ �������� �ʰ� ����� ��� ���� �� �� ������ 
    ��Ȱ��ȭ�� ���������� ���ϴ� �۾��� �� �� �ٽ� Ȱ��ȭ ���·� ����� �־����
  
  �� Ȱ��ȭ
    alter table ���̺��  
    disable constraint �������Ǹ�;
    
Ȱ��ȭ
  alter table ���̺��
  enable constraint �������Ǹ�;
*/

--��Ȱ��ȭ
 alter table EMP01
 disable constraint EMP01_DEPTNO_FK;
 -- ����Ȯ�� status
 select constraint_name, constraint_type, table_name ,search_condition, r_constraint_name, status from user_constraints where table_name ='EMP01';
 
 delete from dept01 where deptno =10;
 rollback;

-- Ȱ��ȭ
-- �ڽ����̺� 
 alter table EMP01
 enable constraint EMP01_DEPTNO_FK;
 
 /*
 cascade 
    -cascade �ɼ��� �θ����̺�(dept01) �� �ڽ����̺�(emp01) ���� ���� ������ �Ǿ� ������ 
     �θ� ���̺��� ���� ������ ��Ȱ��ȭ ȭ�� �̸� �����ϰ� �ִ� �ڽ����̺��� ���� ���Ǳ��� 
     ���� ��Ȱ��ȭ �����ִ� �ɼ��̴�.
 */
 
 alter table dept01
 disable primary key cascade;   --�θ� ���̺� �������� ��Ȱ��ȭ �Ҷ� �ڽ� ���̺� ���������̶� �ٸ����ؾߵ� 
select constraint_name, constraint_type, table_name ,search_condition, r_constraint_name, status 
from user_constraints where table_name in ('dept01', 'emp01');
 
 alter table dept01
 drop primary key; -- ���� ��
 
 alter table dept01
 drop primary key cascade; -- �⺻Ű ���������� ������ �����ϰ� ��� ���߰� �� ���� �ִ�.
 
 /*
    cascade �ɼ��� �����Ͽ� Ű��Ű ���� ������ �����ϸ� �̸� �����ϴ� �ܷ�Ű ���� ���ǵ� ���������� �����Ѵ�.
*/

alter table dept01
drop primary key cascade;

select * from dept;
select * from emp;

-- �ΰ��� ���� �� 
select * from emp, dept where emp.deptno = dept.deptno;
select * from emp e, dept d where e.deptno = d.deptno; -- �̷��� �ص� ��


-----------------------------------------join(����)----------------------------------------------
/*
    ���� : �Ѱ� �̻��� ���̺��� �����͸� ��ȸ�ϱ� ���ؼ� ���Ǵ� �� 
    
    4����
    Equi join :  ������ �÷��� �������� ����
    NonEqui join : ������ �÷��� ���� �ٸ� ������ ����Ͽ� ����
    Outer join : ���� ���ǿ� �������� �ʴ� �൵ ��Ÿ��
    Self Join : �� ���̺� ������ ����
*/
--------------------------------------2022-06-28-------------------------------------------------------------------------------------------------
select ename, dname from emp, dept where emp,deptno = dept.deptno;
select ename, dname from emp e, dept d where emp,deptno = dept.deptno;

-- Equi join :  ������ �÷��� �������� ���� (���帹�� ���̴� ���� 80%�̻�)
-- �� ���̺��� ���������� �����ϴ� �÷��� ���� ��ġ�Ǵ� ���� �����Ͽ� ����� �����ϴ� ����
select ename, dname from emp e, dept d where emp,deptno = dept.deptno;

-- NonEqui join : ������ �÷��� ���� �ٸ� ������ ����Ͽ� ����
-- ������ ���̺� ���̿� �÷��� ���� ���������� ��ġ���� ������ ����ϴ� ����

select * from salgrade;
select * from emp;

select e.ename, e.sal, s.grade  from emp e, salgrade s where e.sal between s.losal and s.hisal;
select e.ename, e.sal, s.grade  from emp e, salgrade s where e.sal >= s.losal and e.sal <= s.hisal;

-- Outer join : ���� ���ǿ� �������� �ʴ� �൵ ��Ÿ��
--              ���� ���� ���ǿ� �������� ���� ��� �� ���� ����� ��Ÿ���� �ʰԵ� 
--              �� �� ���� ���ǿ� �������� �ʴ� ��鵵 ��Ÿ���� ���� Outer join�� �����

select e.ename , d.deptno , d.dname from emp e, dept d where e.deptno= d.deptno order by d.deptno;
select e.ename , d.deptno , d.dname from emp e, dept d where e.deptno(+)= d.deptno order by d.deptno;
/*
     �μ� ���̺��� 40�� �μ��� �����Ѵ�.
     ������, ���ΰ���� ���ԵǸ� 10 ~ 30 �� �μ���ȣ�� ��µǰ� 40���� ��µ��� �ʴ´�.
     �̴� ��� ���̺��� �μ���ȣ���� 40���� �������� �ʱ� �����̴�. 
     
     �μ����̺��� 40�� �μ��� ������ ������̺� �μ���ȣ�� ������, 40�� �μ��� ��� �ǵ��� �Ϸ��� Outer join�� ����ϸ� �ذ��
     Outer join�� ����Ϸ��� ��ȣ�� ����Ͽ� ���� ���ǿ��� ������ ������ �÷� �� �ڿ� ��ġ�ϰ� �ϸ� �� 

     ��, ������̺� �μ���ȣ 40���� ���� ������ e.deptno(+) +(��ȣ)�� �����̸� ��
*/


/*
-- Self Join : �� ���̺� ������ ����
    self join �̶� �� �״�� �ڱ� �ڽŰ� ������ �δ� ���� �ǹ���
    from �� ������ ������ ���̺���� 2�� ����ϰ� where ������ ���� ������ �־���ϴµ�
    �̶� ���� �ٸ� ���̺��� ��ó��  �ν� �� �� �ֵ��� �ϱ� ���ؼ� ��Ī�� ����Ѵ�.
    emp e, emp p 
*/

select ename, mgr from emp;

-- emp ���̺� ��Ī�� ����Ͽ� �ϳ��� ���̺��� �ΰ����� ���̺��� ��ó�� ����Ϸ��� 
-- work(������̺�), MANAGER(�Ŵ��� ���̺�)�� ��Ī�� �ο��Ѵ�.

select work.ename , MANAGER.ename from emp WORK,  emp MANAGER where WORK.MGR = MANAGER.empno;

/*
��] ����� �̸��� ���� �Ŵ��� �̸��� ����ϴ� �������� �ۼ��Ͻÿ�. 
    FORD�� �Ŵ����� JONES�̴�. 
*/
select work.ename || '�� �Ŵ�����' || MANAGER.ename || '�̴�' from emp WORK, emp MANAGER where WORK.MGR = MANAGER.empno;

/*
 ���� ���� 

 ���� ������ �ϳ��� select ������ �� �ȿ� ���� �� �� �ϳ��� select �����̴�.
 ex) select * from emp where sal > (select * from dept) select �ȿ� select�� �ֳ�
 �׷��⿡ ���� ������ �����ϰ� �ִ� �������� ��������, ���Ե� �� �ϳ��� ������ ���� ���� ��� �Ѵ�.
 
 ���������� ������ ������ ��������, ������ ���������� ���� 
 ���������� �̿��ؼ� ���̺� ������ ������
 ���� �������� �̿��ؼ� ���̺� �����͸� �߰�, ����, ���� �� �� ���� 
*/
-- ex)����� �̸��� scott�� ����� � �μ� �Ҽ����� �Ҽ� �μ����� �˾Ƴ����� ���� ����ؼ�
--    �ذ� ������, ������ �ƴ� ���������� �̿��ؼ��� �ذ��� �����ϴ�.
--    ���� scott�� �μ����� �˾Ƽ� �μ���ȣ�� �˾� ���� �Ѵ�.
select deptno from emp where ename = 'SCOTT';
select dname from dept where deptno = 20;

--      �갡 ����                             -- ���� 
select dname from dept where deptno = (select deptno from emp where ename = 'SCOTT');
-- ���������� �񱳿������� �����ʿ� ��� �ؾ��ϰ� �ݵ�� ��ȣ()�� �ѷ� �ξ� �Ѵ�.
-- ���������� ���� ������ ���� �Ǳ� ���� �ѹ��� ������ 

/*
    �� ���� ���� ���� 
    - �� ���� ���������� ���� select �������� ���� ���� �ϳ��� �ุ�� ��ȯ ������, 
       ������ �񱳿�����(=, >, >= , <= , < , <>)�� �����
    
    ������ ���� ���� 
    - ���� �������� ��ȯ �Ǵ� ����� �ϳ� �̻��� ���϶�  ����ϴ� ���� �����̴�.
    
      ���� �� ������
      IN  : ���� ������ �� ���� ('=' �����ڷ� ���� ���)�� ���� ������ ��� �߿����� �ϳ��� ��ġ�ϸ� �� 
      ANY, SOME :  ���� ������ �� ������ ���� ������ �˻� ����� �ϳ� �̻��� ��ġ�ϸ� ��
      ALL : ���� ������ �� ������ ���� ������ �˻� ����� ��� ���� ��ġ�ϸ� �� 
      EXIST : ���� ������ �� ������ ���� ������ ��� �߿��� �����ϴ� ���� �ϳ��� �����ϸ� �� --in �����ڶ� �Ȱ���
*/
    --������ ���� ���� 
    --ex) SMITH �� ���� �μ����� �ٹ��ϴ� ����� ������ ����Ͻÿ�.(���������� �ۼ� : ������)
    select deptno from emp where ename = 'SMITH';
    select * from emp where deptno = 20; 
    
    select * from emp where deptno=(select deptno from emp where ename = 'SMITH');
    
    -- ��� ���̺��� ��� �޿����� �� ���� �޿��� �޴� ����� �˻��Ͽ� ����Ͻÿ�.
    -- �޿��� ����� ���� ���Ѵ�.
    select avg(sal) from emp;
    select ename, sal from emp where sal >(select avg(sal) from emp);
    
    -- IN ������
    -- ����� 2�� �̻� �������� �������� ���������� ��� �� ��쿡�� ������ �����ڿ� �Բ� ����ؾ���
    
    -- �޿��� 3000 �̻�޴� ����� �Ҽ� �� �μ��� ������ �μ����� �ٹ��ϴ� ����� ����Ͻÿ�.
    
    select deptno from emp where sal >= 3000;
    select distinct(deptno) from emp where sal >= 3000;   -- �ߺ�����
    select ename, sal, deptno from emp;
    
    select ename, sal, deptno from emp where deptno in(select distinct(deptno) from emp where sal >= 3000); 
    
/*
 ANY
    - ���� ������ �� ������ ���� ������ �˻� ����� �ϳ� �̻� ��ġ�ϸ� ���̴�. 
      ã���� ������ ���� ���� �� ��, �ּҰ� ���� ũ�� ���̵�
      
      ������ any �� ã���� ���� ���ؼ� �ϳ��� ũ�� ���� �ȴ�.
*/    
   -- �μ� ��ȣ�� 30���� ������� �޿� �� ���� ���� ��(950) ���� ���� �޿��� �޴�
   -- ����� �̸�, �޿��� ����Ͻÿ�.
   select ename, sal from emp where sal >= 950;
   select sal from emp where deptno = 30; 

     select ename, sal from emp where sal >= (select sal from emp where deptno = 30); --�������̶� ����?
     select ename, sal from emp where sal >= ANY(select sal from emp where deptno = 30);
    
  -- ALL  : ���� ������ �� ������ ���� ������ �˻� ����� ��� ���� ��ġ�ϸ� ��   
    -- ex) 30�� �Ҽӻ���� �߿��� �޿��� ���� ���� ���� ������� �� ���� �޿��� �޴� 
    --    ����� �̸�, �޿��� ����Ͻÿ�.
    
    select ename, sal from emp where sal > 2850;
    select sal from emp where deptno = 30;
    select ename, sal from emp where sal > ALL(select sal from emp where deptno = 30); --���������� ������ ��ȣ�� ���´�. 
    
    -- ���������� �̿��ؼ� ���̺� �ۼ� 
    create table emp07 as select * from emp; -- �̰� emp ���̺� �ִ°� �״�� ���� ������ ���°� 
    create table emp07 as select * from emp where 1=0; -- ���̺� ������ ���� �ϴ°��� 
    select * from emp07; -- Ȯ�� �غ��� �����ʹ� �ȵ��� �ְ� ������ ��������� 
    
     create table emp08 as select empno, ename from emp where 1=0; -- ���� ���� ���� ������ ���� ����
     select * from emp08;
     
     create table dept02 as select * from dept where 1=0;
     select * from dept02;
     
     --���������� ������ �߰� 
     insert into dept02 select * from dept; -- dept�ȿ� �ִ� ����� dept02�� �߰� 
     select * from dept02;
     drop table dept02;
     -- ���� ������ �̿��ؼ� ������ ���� 
     -- 10�� �μ��� �������� 40�� �μ��� ���������� �����Ͻÿ�.(�÷��� 1���� ���)
                                --  ���� ���������� ���� 
     update dept02 set loc = (select loc from dept02 where deptno = 40) where deptno = 10;
     /*
        �÷��� 2�� �̻��� ���
        �������� ���� �� ���� 
        1. update ���̺�� 
        set �÷���1 = (��������), �÷���2 = (��������) where ����
        
        2. update ���̺�� 
        set (�÷���1, �÷���2) = (��������1, ��������2) where ����

     */
     -- ex) 20�� �μ��� �μ���� �������� 30�� �μ��� �μ���� ���������� �����Ͻÿ�
     -- ù��° ���
     update dept02 set dname =(select dname from dept02 where deptno = 30), 
     loc = (select loc from dept02 where deptno = 30) where deptno = 20;
     
     -- �ι�° ���
     update dept02 set (dname, loc) = (select dname, loc dept02 from deptno = 30) where deptno = 20;
     rollback;
     select * from dept02;
     
     --���� ������ �̿��� ������ ����
    select * from tab;
    drop tabal emp01;
    creattable emp01 as select * from emp01;
    
    select deptno from dept where  dname = 'SALES';
    delete from emp01 where deptno = (select deptno from dept where dname = 'SALES');
    rollback;
    
    -- ��1] ������ 'SALESMAN' �� ����� �޴� �޿����� �ּ� �޿����� ���� �޴� ������� �̸���  �޿��� ����ϵ�
    --      �μ���ȣ�� 20���� ��� ���ܽ�Ű�� ����Ͻÿ�. 
    select min(sal) from emp where job = 'SALESMAN'; -- 1250 ���� ���� �޾ƾߵ�(�ּұ޿��˾ƺ�������)
    select ename, sal from emp where deptno !=20; 
   
    select ename, sal from emp where deptno !=20 and sal > (select min(sal) from emp where job = 'SALESMAN'); 
    
    -- ����� ����
    -- create user ������ identified by ��й�ȣ 
    reate user javauser identified by java; -- ���⼱ �ȴ�
    --�ѹ��� �ý��� �������� ���� grant�� revoke�� �ְų� �P��� ��

---------------------------------------------------��(VIEW)-----------------------------------------------------------------------------------------
/*
    ���� ����
    ��(VIEW)�� ���ٶ� �ǹ̸� ���� �ִ� ���� ������ ���� �� �� �ֵ��� ���� ���̺� 
    ����� �����͸� �並 ���ؼ� �� �� �ֵ��� �Ѵ�.
    
    �並 ���� ���� ���̺��̶�� �θ��µ� �̴� ���̺�� ���� �����ϰ� ���Ǳ� �����̴�. 
    
    ��� �������� ������ ���̺�� �޸� ������ ���� ������ ����.
    ��� ���� �������� �����ϰ� �ִ� ��ü��� ǥ�� �� �� �ִ�. 
*/
 select * from tab;

 create view view_emp10
 as
 select empno, ename, sal, deptno from emp01 where deptno = 10; -- �׳� �����ϸ� ������ �����ڷκ���  ������ �޾ƾ����� �並 ���� �� �� �ִ�.
 
 ----------------------------------------------------------------------2022-06-29---------------------------------------------------------------------
 /*
 ���� ��� ����
  �������� ���̺� ������ �����ϱ� ���� ���ȴ�.
  ������ ���Ǹ� ���� ����� ���ؼ� ����Ѵ�.
  
  ���� Ư¡
    ��� ���̺� ���� ������ ������ ���̺��� ������ �κи� ���� �� �ִ� ���� ���̺��̴�.
    ��� ���� �ڷḦ ������ ������, �並 ���� ���̺��� ���� �� �� �ִ�.
    �ϳ��� ���̺� ���� ������ ������ ����.
  
  ���� ������ ��ȸ
   �並 �����ϱ� ���ؼ��� ���̺� ������ ���� DDL(create, select)�� ����Ѵ�.
   
  �⺻ ���̺�
  �信 ���� ���������� �����ؼ� ����ϴ� ���������� �����͸� �����ϰ� �ִ�
  �������� ���̺��� �ǹ��� 
*/
 select * from view_emp10;
 
 /*
 �� ����
  - ��� ���̺� ó�� �ϳ��� ��ü�μ� ���̺� �����Ҷ��� �����ϰ� create view ������� �����Ѵ�.
  
   �� ���� ����
  create [or replace] [force]  [noforce] view view_name
    [ (alias, alias, .....) ] 
    as subquery
    [with check option]
    [with read only];
    �ش� �並 ���ؼ��� select��  �����ϸ� insert/update/delete�� ��� �� �� ����.
    
     or replace view 
     - ���ο� �並 ���� �� ���� �Ӹ� �ƴ϶� ������ �䰡 �����ϴ��� �������� �ʰ�
       ���ο� ������ ��� ���� �� �� �ִ�. 
       
    force 
    - ���� ���̺��� ���� ���ο� ������� �並 ������
    
    whith check option
    - �ش� �並 ���ؼ� �� �� �ִ� ���� �������� update or insert �� �����ϴ�.
    
    ���� ���� ����
     - ����ڰ� �信 ���ؼ� ���Ǹ� �ϸ� user_views ���� �信 ���� ���Ǹ� ��ȸ��
     - �⺻���̺� ���� ���� ������ ����
     - �信 ���� ���Ǹ� �⺻ ���̺� ���� ���Ƿ� �����Ѵ�.
     - �⺻���̺� ���� ���Ǹ� ���� �����͸� �˻���
     - �˻����� ����� ���
     
     ���� ����
     - �⺻ ���̺��� ���� ���� �ܼ� �� �Ǵ� ���� ��� ������.
     
     �ܼ� ��                                           ���� �� 
- �ϳ��� ���̺�� ����                               - �������� ���̺�� ����
- �׷��Լ��� ����� �Ұ���                            - �׷� �Լ��� ����� ����
- DISTINCT(�ߺ�����)����� �Ұ���                     - DISTINCT(�ߺ�����)����� ����
- DML(insert/ update/ delete)��밡��               - DML(insert/ update/ delete)����� �Ұ���
 */   
insert into view_emp10 values(8000, 'ANGEL', 7000, 10);
-- �ܼ� �信���� DML��ɹ� ó�� ����� �並 ���� �Ҷ� ����� �⺻ ���̺��� ������ ��ģ��.
select * from view_emp10;
select * from emp01; 

-- �ܼ� ���� �÷��� ��Ī �ο� 
-- �����ȣ, �����, �޿� , �μ���ȣ�� ������ �並 �ۼ��ϵ�
-- �⺻ ���̺��� emp01�� �ϰ� �÷����� �ѱ۷� �ۼ��Ͻÿ�.
desc view_emp10;

create or replace 
view view_emp10(�����ȣ, �����, �޿�, �μ���ȣ)
as
select empno, ename, sal, deptno from emp01;
    
select * from view_emp10 where deptno = 10; --������ �ѱ۷� �ٲپ��� ������ ������ �� 
select * from view_emp10 where �μ���ȣ = 10;
/*
 ���� ���� : �÷��� ��Ī�� ����ؼ� �並 �����ϸ� view_emp10�� �÷� �̸��� ��Ī����
            ������ ������ �ݿ��ǰ�, �⺻���̺��� �÷� �̸����� ���� ������ ��ġ�� ���ϱ� �����̴�.
*/

-- �׷��Լ��� ����� �ܼ� ��
-- �μ��� �޿� �Ѿװ� ����� ���ϴ� �۾��� ���� �Ѵٸ� �̸� ��� ������ ���Ҵٰ� ����ϸ� ���ϴ�.
create view view_sal
as
select deptno, sum(sal) as "SalSum", avg(sal) as "SalAvg"  -- emp01 ���̺� sum �� avg �÷��� ���⶧���� �������
from emp01
group by deptno;

select * from view_sal;

/*
    �信 ���õ� ������ ��ųʸ�
    - ������ ��ųʸ� USER_VIEWS�� ����ڰ� ������ ��� �信 ���� ���ǰ� ����Ǿ� ����
      ���� �̸��� ���� VIEW_NAME�̶� �÷��� �並 �ۼ��Ҷ� ����� subquery�� ����Ǿ� �ִ�
      TEXT �÷��� ����
      
      �˻� : select view_name, text from user_views;

-- �� ����
    - ��� ������ ���� ���� ���̺��̱� ������ �並 �����Ѵٴ� ����
      user_views ������ ��ųʸ��� ����Ǿ� �ִ� ���� ���Ǹ� �����ϴ� ����
*/
    select view_name, text from user_views;
   -- ������ drop  �����ʹ� delete �����Ҷ� 
   drop view view_sal;
   
create or replace -- �Ʊ�� �ѱ۷� ������ �̹����� �÷����� ����� �ٲ����
view view_emp10
as
select empno, ename, sal, comm ,deptno from emp01 where deptno = 10;

select * from view_emp10;
select * from tab;

-- �⺻ ���̺� ���� �並 �����ϱ� ���� FORCE �ɼ�
-- �⺻ ���̺��� �������� �ʴ��� �並 ������
create FORCE view view_notable
as 
select empno, ename, deptno from emp09
where deptno = 10;

drop view view_notable;

create or replace FORCE view view_notable
as 
select empno, ename, deptno from emp09
where deptno = 10;

drop view view_notable;
select * from view_notable;
select * from emp02;

/*
 whith check option
    -- �並 ������ �������� ������ �÷� ���� �������� ���ϵ���  �ϴ� ���� �ǹ���
*/
create or replace view view_chk20
as 
select empno, ename, sal, comm, deptno from emp01
where deptno = 20 with check option;

select * from view_chk20;

-- �޿��� 5000 �̻��� ����� 10�� �μ��� �̵��ϴ� �������� �ۼ�

update  view_chk20 set deptno = 10 where sal >= 5000;
-- ���� : �μ���ȣ�� with check option�� �����Ͽ����Ƿ� �� �並 ���ؼ��� �μ���ȣ�� ���� �� �� ����.

/*
- with read only : �並 ���ؼ��� �⺻ ���̺��� � �÷� ���ؼ��� ������
                  ������ �� ������ �ϴ� ���� �ǹ���
                  
 with check option �� whit read only�� ������ 
 
  with check option�� ���ǿ� ����� �÷��� ���� �������� ���ϰ� �ϴ°��̰�,
  whit read only �� �⺻ ���̺��� ��θ� �������� ���ϰ� �ϴ°��� �ǹ���
*/

create or replace view  view_read30
as
select empno, ename, sal, comm, deptno
from emp01
where deptno = 30 with read only;

select * from view_read30;
update view_read30 set comm = 1000; -- ������ �б� ���� �信���� DML �۾��� �ȵ�

/*
 �� Ȱ���ϱ� 
 
 ����߿��� �Ի����� ���� ��� 5��(TOP-5)���� ��� ���ǹ��� �ۼ��Ͻÿ�.
  ROWNUM �÷��� �̿�
   -ROWNUM �÷��� ����Ŭ���� ���������� �ο��Ǵ� insert ���� ���� �Է��� ������ ���� 
           1�� �����Ǹ鼭 ���� ������
*/

 create or replace view view_hire
 as
 select empno, ename, hiredate from emp01
 order by hiredate; -- ���������� �������� desc ���������� �����Ұ���
select rownum ,empno, ename, hiredate from view_hire; --rownum�� �־ ���� �ű� 
select rownum ,empno, ename, hiredate from view_hire where rownum <=5; -- 5������ 

/*
  ������    (ȸ������, �Խ���  �Ҷ� ���� ����Ѵ� ��)
    - primary key�� ������ �÷��� �Ϸù�ȣ�� �ڵ����� �ο� �ޱ� ���� 
      �������� ����Ѵ�.
    
    ������ ����
    - �������� ����(unique)�� ���� �������ִ� ����Ŭ ��ü�̴�.
    - �������� �����ϸ� �⺻ Ű �� ���� ���������� �����ϴ� �÷��� �ڵ������� ���� �� �� �ְ� �Ѵ�.
    
    ������ ���� ����
    create sequence ��������
    1.start with n 
    2.increament by n 
    3.maxvalue n | nomaxvalue                | = �Ǵ�
    4.minvalue n | nominvalue
    5.cycle | nocycle
    6.cache n  | nocache 
    ��ȣ�� ������� �϶�� ? ���� �ۼ��Ҷ��� ��ȣ �������� 
    
     1. start with n
      - �������� ���� ���� ������. n�� 1�� �����ϸ� 1���� ���������� ������ ��ȣ�� �����Ѵ�.
      
     2.increament by n
     - �������� ���� ���� �ǹ���. n�� 2�� �ϸ� 2�� ������
       ������ 1�� ������ �� �ϸ� 1,3,5,7,9 �̷��� ���� �� 
    
     3.maxvalue n | nomaxvalue 
     - �������� ���� �� �� �ִ� �ִ밪�� ����. nomaxvalue�� ���Ѵ븦 �ǹ���(���� ��)
     
     4.minvalue n | nominvalue
     - �������� �ּҰ��� �ǹ��ϸ� �⺻���� 1��. nominvalue�� ���ѼҸ� �ǹ���( ���̳ʽ��� ��� ������)
      
     5.cycle | nocycle
     - ������ ������ ���� �ִ밪���� ������ �Ϸ� �Ǹ� �ٽ� �ּҰ����� ����������
       �����ϵ��� cycle�� ������. noncycle�� �ִ밪�� �Ѿ�� ������ �߻���
     
     6.cache n  | nocache 
      - ����Ŭ ������ �̸� �����ϰ� �޸𸮿� ������ ���� ���� ����Ʈ ���� 2��
      
      ������ ������ ���� �ɼ��� �� �ʼ��� ���� �ʿ���� ���� ���� ���� 
      
*/
-- ���� ���� 1�̰� 1�� �����ϰ�, �ִ밪�� 100000 �� �Ǵ� ������ emp_seq ����  
create sequence emp_seq  -- ��ȣ������ ����
start with 1
increment by 1
maxvalue 100000;

drop table emp01;

create table emp01
as select empno, ename  , hiredate from emp where 1=0; 

select * from emp01;

insert into emp01 values(emp_seq.nextval, 'JULIA', sysdate); --nextval ��ȣ�� �ڵ����� �Ҵ� 
-- ���� ������ ���� ��ȯ�� 
select emp_seq.currval from dual;

-- ���� �������� �������� ��ȯ
select emp_seq.currval from dual;

/*
nextval, currval �� ��� �� �� �ִ� �� 
 -���������� �ƴ� select��
 -insert ���� select ��
 -insert �� values ��
 -update �� set��
 
nextval, currval �� ��� �� �� ���� ���
 -view�� select ��
 -distinct Ű���尡 �ִ� select ��
 -group by, having, order by ���� �ִ� select ��
 -select, delete, update�� ��������
 -create table, alter table ����� �⺻��
*/

select * from tab;

drop table dept01;

create table dept01
as 
select * from dept where 1=0; 
select * from dept01;

-- ������ �ۼ�: 10���� 10�� �����ϸ鼭 �ִ� 30������ ���� ���� ������ ���� DEPT_SEQ
create sequence dept_seq
start with 10
increment by 10
maxvalue 30;

insert into dept01 values(dept_seq.nextval, 'ACCOUNTING', 'NEW YORK');
insert into dept01 values(dept_seq.nextval, 'RESEARCH', 'DALLAS');
insert into dept01 values(dept_seq.nextval, 'SALES', 'CHICAGO');
insert into dept01 values(dept_seq.nextval, 'OPEARTIONS', 'CHICAGO');
/*
 �������� ���� ������ ��ųʸ� USER_SEQUENCES
 ������ �������� ������ Ȯ���ϱ� ���� ������ ��ųʸ��� USER_SEQUENCES�� �ִ�.
*/
select sequence_name, min_value, max_value, increment_by, cycle_flag from user_sequences;

/*
������ ����
    - ������ ���� �����Ϸ��� alter sequence �� ���
    alter sequence ������ �� 
    start with n
    increment by n
    maxvalue n | nomaxvalue
    minvalue n | nominvalue
    cycle | nocycle
    cache n nocache;
*/
alter sequence dept_seq
maxvalue 10000;
-- �ִ񰪸� �ø�!
select sequence_name,min_value, max_value, increment_by,cycle_flag from user_sequences;
-- �������� ���� : �������� ���� �Ϸ��� drop sequence ���������� �����
-- drop sequence ������ �� 
drop sequence dept_seq;
drop sequence emp_seq;
select * from dept01; -- �����ص� ���� ��ġ�� ���� ���� ����

------------------------------------------------------------end DDL, DML, DCL --------------------------------------------------------------------

------------------------------------������ ���̽� ��� �� ���� ----------------------------------------------------------------------------------------
/*
 ����Ŭ���� ����ϴ� ���� �Ϲ����� ���
 Export, import�� ����� 
 
 �����ͺ��̽� ���
 1) ��� 
    �����ͺ��̽� ���
ex) exp(export�� ����) ����/ ��й�ȣ file = ���ϸ�.dmp log = log���ϸ�.log
    ���� ����� �����ϸ� ���ϸ�.dmp ���ϰ�  ���ϸ�.log  ������ ����

 2) ����
 ex) imp (import�� ����) ���� / ��й�ȣ file = ������ ���ϸ�.dmp log = �α����ϸ�.log
     *���ǻ���* 
     �������� imp�� �����ϰ� ������ ������ �ǰ� ������ �뿡 dmp ������ ���� ������ �ٽ� �����.

  
  ���
    exp scott/tiger file = c:\ora\scott_data.dmp  log = c:\ora\scott_data.log
        
  ����
    c:\ora\scott_data.dmp 
*/
  
  show user;

create table department(
deptno number(3) not null,
dname varchar2(30) not null,
colleage number(3) not null,
loc varchar2(15) not null,
constraint department_pk primary key(deptno)
);
commit; -- ��Ŭ������ �����Ҷ� Ŀ���� ������ �ؾߵ�

select * from department;  -- ��Ŭ������ ���� �߰� �ؼ� ����� Ȯ���غ��� �����ֳ� 

-----------------------------------------------------2022-07-01-------------------------------------------------------------------------------
--department ���̺�� professor �� �����Ų��. 
--department deptno�� �ܷ�Ű�� �����ؼ� ���� 
select * from department;


create table professor ( 
profno number(5) not null, --��Ŭ���� jdbcEx05Ŭ���� ����  ù���� ? 
name varchar2(10) not null, -- �ι��� ? 
ename varchar2(20) not null, -- ����° ?
position varchar2(20) not null, --�׹�° ? 
sal number(4) not null, 
hiredate date not null, -- sysdate 
age number(3) not null,
deptno number(3) not null,
constraint professor_pk primary key(profno)
);

alter table professor add constraint pprofessor_fk foreign key(deptno) -- �ܷ�Ű ����  
references department (deptno); 
commit;

select * from professor;
select * from department;