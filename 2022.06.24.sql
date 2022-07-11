    ----------------------------------------------START DML(데이터 조작어) -----------------------------------------------------------------
    /*
    새로운 행을 추가하는 INSERT INTO   (C)
    기존행을 수정하는 UPDATE SET       (U)
    행을 삭제하는 DELETE              (D)라고 한다
    행을 조회 할때 SELECT             (R)
                            이 4개를 CRUD 라고 한다
    */
    
    /*
    새로운 행을 추가하는 INSERT INTO (C)
    
        특정한 컬럼에만 데이터를 입력하는 경우
        INSERT INTO 테이블명(컬럼명1, 컬럼명2) VALUES(값1 , 값2)
        
        모든 컬럼에 데이터를 입력하는 경우
        INSERT INTO 테이블명 VALUES(값1 , 값2)
        순서대로 찾아간다. 
    */
    
    create table dept01(
    deptno number(2), 
    dname varchar2(14),
    loc varchar2(13)
    );
    
    -- 부서번호 : 10 , 부서명 : ACCOUNTING , 지역 : NEW YORK를 추가하시오.
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
    컬럼의 값이 NULL일 수 없다는 제약조건 입니다(반드시 NULL이 아닌 값을 가져야 합니다).
    컬럼 레벨로만 정의가 가능하며 NOT NULL도 기본값으로 지정할 수 있습니다. 
    테이블에 값을 INSERT할 경우 DEFAULT로 정의한 경우는 제외하고는 기본값이 NOT NULL인 컬럼은 반드시 컬럼을 기술하고 값도 지정해야 합니다.
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
    insert into emp04 values(20, '' , ''); -- '' 이것도 NULL로 인식함 이유 비어있으니깐
    
    select * from tab;
    
    drop table emp04;
    
    
    
    create table emp01 as select * from emp; 
    
    /*
        기존행을 수정하는 UPDATE SET (U)
        형식
        UPDATE 테이블명 SET 컬럼명1 = 값1, 컬럼명2=값2 where 조건식
        
        어떤 행의 데이터를 수정하는지 where 절을  이용하여 조건을 지정합니다
        where 절을 사용하지 않으면 테이블에 있는 모든 행이 수정된다.
    
    */
        -- 모든 사원을 부서번호를 30으로 바꿔라 
    update emp01 set deptno=30;
    rollback;
    --모든 사원의 급여를 10% 인상
    update emp01 set sal = sal * 1.1;
    
    --모든 사원의 입사일을 오늘로 바꿔봐라 
    update emp01 set hiredate = sysdate;
    
    -- 1987년에 입사한 사원의 입사일을 오늘로 수정
    select * from emp01 where substr(hiredate,1,2) ='87';
    update emp01 set hiredate = sysdate where substr(hiredate, 1,2) = '87';
    select * from emp01;
    rollback;
    
    -- 컬럼 두개를 한꺼번에 바꾸고 싶다.
    -- SCOTT 사원의 부서번호를 10, 직급은 매니저로 진급 시켜라.
    select deptno, job from emp01 where ename ='SCOTT';
    update emp01 set deptno = 10, job = 'MANAGER' where ename = 'SCOTT';
    
    /*
     DELETE
     테이블에 특정 행을 삭제할때
     형식은
     DELETE FROM 테이블명 where 조건
    */
    select * from tab;
    create table dept01 as select * from dept01;
    delete from dept01 where deptno = 30;
    rollback;
    
    ----------------------------------------------------END DML(데이터 조작어)--------------------------------------------------------------------------
    
    
    /*
    트랜잭션(Transaction)
        - 데이터베이스에서 데이터를 처리하는 하나의 논리적인 작업단위를 의미함
        - 트랜잭션을 사용하는 이유 : 데이터의 일관성을 유지한다.
                                 안정적으로 데이터를 복구 시킨다.
        insert, update, delete 명령에서만 트랜잭션을 활용한다.
        
        commit 과 rollback 
        
        commit 
        - 모든 작업을 정상적으로 처리 하겠다고 확정하는 명령어
         트랜잭션 처리 과정을 데이터베이스에 모두 반영함(변경된 내용을 모두 영구 저장)
        
        rollback
        - 작업 중 문제가 발생되어서 트랙잭션 처리 과정에서 발생한 변경 사항을 취소하는 명령 
          데이터 처리가 시작되기 이전 상태로 되돌림
          
          마지막으로 커밋 명령 이후부터 새로운 커밋 명령을 실행 하는 시점까지 수행된
          모든 DML명령들을  의미함 
    */
    create table dept01 as select * from dept;
    select * from dept01;
    
    delete from dept01;
    rollback;
    
    delete from dept01 where deptno = 20;
    commit;
    rollback; --커밋이 되고 나서 rollback하면 실행이 안됨 그래서 커밋을 신중하게 해라!
    
    /*
        savepoint   
        -현재 트랜잭션을 작게 분할 할 수 있다. 
         저장된 savepoint는 rollback to savepoint 문을 사용하여 표시한 곳 까지 
         rollback 할 수 있음
         
         형식
         
         특정위치를 지정할때 하는 형식
         savepoint table명 
         
         지정해 놓은 특정위치로 되돌아가는 형식
         rollback to label_name;
    */
    drop table dept01;
    
    create table dept01 as select * from dept;
    
    select * from dept01;
    
    --부서번호 40번 삭제
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
    rollback; -- commit 이전까지는 다 복구 됨
    
    -- pk는 프라이머리키의 약자이다
    select * from user_cons_columns where table_name = 'EMP';
    select * from user_cons_columns where table_name = 'DEPT';
--------------------------------------------2022-06-27---------------------------------------------------------------------------------------
/*

무결성 재약조건 
 -데이터를 추가, 수정, 삭제하는 과정에서 무결성을 유지 할 수 있도록 재약을 주는 것을 의미함 
 -무결성 : 데이터베이스 내에 데이터의 확정성을 유지하는 것을 의미하고(저장된 데이터베이스에 잘못된 데이터가 없다는 것을 의미합니다) 
 -제약 조건 : 바람직하지 않은 데이터가 저장되는 것을 방지하기 위함
 
 무결성 제약 조건 
    NOT NULL : NULL을 허용하지 않는다.
    UNIQUE : 중복된 값을 허용하지 않는다.
    *PRIMARY KEY : NOT NULL + UNIQUE 조건을 결합한 형태를 의미함 *
    *FOREIGN KEY : 참조 되는 테이블을 컬럼값의 값이 존재하면 허용됨*
    CHECK  : 저장 가능한 데이터 값의 범위나 조건을 지정하여 설정한 값만을 허용함
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
-- not null 제약조건은 해당 컬럼에 null 값을 추가하거나 null값으로 변경하는 변경하는 것을 막음
-- 제약조건은 컬럼명과 자료형을 기술한 후에 이어서 not null을 기술하면 됨

create table EMP02(
empno number(4) not null,
ename varchar2(10) not null,
job varchar2(9),
deptno number(4)
);
insert into emp02 values(null, null, 'salesman', 30);

-- UNIQUE : 중복된 값을 허용하지 않는다. 항상 유일한 값을 갖도록 함

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
 unique : null 값을 예외로 간주함, 만약 null 값도 마저도 입력되지 않게 제한 하려면 
        ex) 테이블 생성시 enpno number(4) unique not null 처럼 두 가지 제약조건을 
        기술해야함
*/
desc user_tables;

show user;


/*
제약 조건 확인 하기 
    제약조건의 여러 메시지에 대한 정확한 원인을 알기 위해 오라클에서 제공해 주는 user_constarints 데이터 딕셔너리
    
    user_constaints 데이터 딕셔너리
    - 제약조건의 정보를 위해서 많은 컬럼으로 구성되어 있지만
      제약조건명, 제약 조건유형, 제약조건이 속한 테이블만을 알아 봄
*/
select constraint_name, constraint_type, table_name from user_constraints where table_name ='EMP03';

/*
constraint_type은 P, R , U, C 4가지가 있음
    P : PRIMARY KEY
    R : FOREIGN KEY
    U : UNIQUE
    C : CHECK NOT NULL
*/

/*
    PRIMARY KEY 제약 조건
     - 식별 기능을 갖는 컬럼은 유일하면서도 NULL 값을 허용하지 않는다.
     - 즉, UNIQUE 와 NOT NULL 제약 조건 모두를 갖는 것이 기본키(PRIMARY KEY) 제약조건임
*/
create table EMP04(
empno number(4) PRIMARY KEY,
ename varchar2(10) not null,
job varchar2(9),
deptno number(4)
);

INSERT INTO EMP04 VALUES(7499, 'ALLEN', 'SALESMAN', 30);
INSERT INTO EMP04 VALUES(NULL, 'JONES', 'MANAGER', 20); -- PRIMARY KEY라서 NULL값이 들어갈수가 없음
select constraint_name, constraint_type, table_name from user_constraints where table_name ='EMP04';
-- 부서테이블 -- 소속 -- 사원테이블  부서테이블이 주(부모) 사원테이블이 종(자식)이다.

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

--dept01 테이블과 emp05 테이블을 연결시킨다
create table EMP05(
empno number(4) PRIMARY KEY,
ename varchar2(10) not null,
job varchar2(9),
deptno number(4) references dept01(deptno) 
);
select constraint_name, constraint_type, table_name ,search_condition from user_constraints where table_name ='EMP05';
select * from emp05;
insert into emp05 values(7499, 'ALLEN', 'SALESMAN', 30);
insert into emp05 values(7566, 'JONES', 'MANAGER', 50); --부모키는 40번까지 밖에 없어서 50번을 넣으면 오류 뜸 
drop table dept01; --부모테이블을 삭제하면 자식테이블에도 영향을 미치기떄문에 오류가 뜬다.

/*
    check 제약 조건
    -입력되는 값을 체크하여 설정된 값 이외의 값이 들어오면 오류 메세지와 함께 명령이 수행되지 못하게 하는 것을 의미함
*/
    
/*
    emp06 사원테이블에 GENDER(성별) 컬럼을 추가하되 
    GENDER 컬럼에는 'M' OR 'F'의 두 값만 저장 할 수 있는 CHECK 제약 조건 설정
*/  
create table emp06(
empno number(4) primary key,
ename varchar2(10) not null,
gender varchar2(1) check(gender in('M', 'F'))
);
insert into emp06 values(7566, 'JONES', 'A'); -- a가 아닌 M or F 만 들어갈수 있음
insert into emp06 values(7566, 'JONES', 'M'); 
select constraint_name, constraint_type, table_name ,search_condition from user_constraints where table_name ='EMP06';

/*
    제약 조건명 지정하기
    - 사용자가 의미있게 제약 조건명을 명시하여 제약 조건명만으로 어떤 제약조건을 위배 했는지 알 수 있게 하는 방법
        지정방법 : column_name data_type CONSTRAINt constraint_name constraint_type;
    
    제약 조건 명 명명 규칙
        테이블명_ 컬럼명_제약조건 유형
    
    기본키 제약 조건명을 EMP06_EMPNO_PK(PRIMARY KEY)로 지정함
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
insert into emp05 values(7499,null, 'SALESMAN',50); --삽입이 안된다 이유는 위에 테이블을 생성할때 제약조건이 달려있기 때문이다.
insert into emp05 values(7499,'ALLEN', 'SALESMAN',50);
insert into emp05 values(7500,'ALEEN', 'SALESMAN',50); --job에 유니크에 걸린다 유니크는 중복 x 

/*
테이블 레벨 방식으로 제약조건 지정하기 (기업마다 제약조건 하는방법이 다르다고함) 

    - 복합키로 기본키를 지정할 경우 
        복합키 형태로 제약 조건을 지정할 경우에는 컬럼 레벨 형식으로는 불가능하고 반드시 테이블 레벨 방식을 사용함 
    
    - ALTER TABLE로 제약 조건을 추가할 경우 
        테이블의 정의가 완료되어서 이미 테이블의 구조가 결정 된 후에 나중에 테이블에
        제약 조건을 추가하고자 할때 테이블 레벨 방식으로 제약 조건을 지정함
        
    형식
    create table 테이블명(
    컬럼명1 데이터 타입1,
    컬럼명2 데이터 타입2,
    컬럼명3 데이터 타입3,
    .....
    
    CONSTRAINT constraint_name constraint_type(column_name)
    );
*/

-- 테이블 레벨로 제약조건을 지정하는 방식
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
-- 테이블 레벨에서 컬럼의 제약 조건명을 명시적으로 지정해줄 경우 constraint 키워드를 사용함
create table emp03(
empno number(4), 
ename varchar2(10) constraint emp03_ename_nn not null,
job varchar2(9),
deptno number(4),
constraint emp03_empno_pk primary key(empno),
constraint emp03_job_uk unique(job),
constraint emp03_deptno_fk foreign key(deptno) references dept01(deptno)
);
--제약 조건 확인하기
select constraint_name, constraint_type, table_name ,search_condition, r_constraint_name from user_constraints where table_name ='EMP03';
select constraint_name, constraint_type, table_name ,search_condition, r_constraint_name from user_constraints where table_name ='EMP04';

-----------------------------------end  제약조건 지정방식------------------------------------------------------------------------------------

--------------------------------------start 제약 조건 변경-----------------------------------------------------------------------------------

-- 1. 제약 조건 추가하기 
    -- 테이블 생성이 끝난 후에 제약 조건을 추가하기 위해서 alter table로 추가함
    -- 형식
    -- alter table 테이블명
    -- add constraint constraint_name constraint_type(column_name);
drop table emp01;
create table emp01(
empno number(4),
ename varchar2(10),
job varchar2(9),
deptno number(4) 
);
select constraint_name, constraint_type, table_name ,search_condition, r_constraint_name from user_constraints where table_name ='EMP01';

-- emp01 테이블의 empno 컬럼에 기본키 설정하고, deptno 컬럼에 외래키 설정
alter table emp01
add primary key(empno);

alter table emp01
add constraint emp01_deptno_fk foreign key(deptno) references dept01(deptno);

/*
-- 2. 제약 조건 제거하기
     - 제약 조건을 제거하기 위해서는 drop constraint 다음에 제거 하고자하는 제약 조건명을 명시함
     alter table 테이블명
     drop constraint 제약 조건명;
*/
insert into emp05 values(7499, 'ALLEN', 'MASTER', 50);

alter table emp05
drop constraint EMP05_EMPNO_PK;

alter table emp05
drop constraint EMP05_DEPTNO_FK;

/*
-- 3. 제약 조건의 비활성화 cascade; 
    - 제약 조건의 비활성화란 설정된 제약 조건을 잠시 사용하지 않게 하는 것임
    
    disable : 제약 조건의 일시 비활성화  
    enable : 비활성화된 제약조건의 해제하여 다시 활성화홤
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
-- 제약 조건 활성화의 비활성화 
  - 제약 조건이 설정되면 항상 그 규칙에 따라 데이터 무결성이 보장 됨
    오라클에서는 제약조건을 비 활성 시킴으로서 제약 조건을 삭제하지 않고도 사용을 잠시 보류 할 수 있으며 
    비활성화된 제약조건은 원하는 작업을 한 후 다시 활성화 상태로 만들어 주어야함
  
  비 활성화
    alter table 테이블명  
    disable constraint 제약조건명;
    
활성화
  alter table 테이블명
  enable constraint 제약조건명;
*/

--비활성화
 alter table EMP01
 disable constraint EMP01_DEPTNO_FK;
 -- 상태확인 status
 select constraint_name, constraint_type, table_name ,search_condition, r_constraint_name, status from user_constraints where table_name ='EMP01';
 
 delete from dept01 where deptno =10;
 rollback;

-- 활성화
-- 자식테이블 
 alter table EMP01
 enable constraint EMP01_DEPTNO_FK;
 
 /*
 cascade 
    -cascade 옵션은 부모테이블(dept01) 과 자식테이블(emp01) 간의 참조 설정이 되어 있을때 
     부모 테이블의 제약 조건을 비활성화 화면 이를 참조하고 있는 자식테이블의 제약 조건까지 
     같이 비활성화 시켜주는 옵션이다.
 */
 
 alter table dept01
 disable primary key cascade;   --부모 테이블 제약조건 비활성화 할때 자식 테이블 제약조건이랑 다르게해야됨 
select constraint_name, constraint_type, table_name ,search_condition, r_constraint_name, status 
from user_constraints where table_name in ('dept01', 'emp01');
 
 alter table dept01
 drop primary key; -- 오류 뜸
 
 alter table dept01
 drop primary key cascade; -- 기본키 제약조건을 삭제도 가능하고 잠시 멈추게 할 수도 있다.
 
 /*
    cascade 옵션을 지정하여 키본키 제약 조건을 삭제하면 이를 참조하는 외래키 제약 조건도 연속적으로 삭제한다.
*/

alter table dept01
drop primary key cascade;

select * from dept;
select * from emp;

-- 두개를 연결 함 
select * from emp, dept where emp.deptno = dept.deptno;
select * from emp e, dept d where e.deptno = d.deptno; -- 이렇게 해도 됨


-----------------------------------------join(조인)----------------------------------------------
/*
    조인 : 한개 이상의 테이블에서 데이터를 조회하기 위해서 사용되는 것 
    
    4종류
    Equi join :  동일한 컬럼을 기준으로 조인
    NonEqui join : 동일한 컬럼이 없이 다른 조건을 사용하여 조인
    Outer join : 조인 조건에 만족하지 않는 행도 나타냄
    Self Join : 한 테이블 내에서 조인
*/
--------------------------------------2022-06-28-------------------------------------------------------------------------------------------------
select ename, dname from emp, dept where emp,deptno = dept.deptno;
select ename, dname from emp e, dept d where emp,deptno = dept.deptno;

-- Equi join :  동일한 컬럼을 기준으로 조인 (가장많이 쓰이는 조인 80%이상)
-- 두 테이블에서 공통적으로 존재하는 컬럼의 값이 일치되는 행을 연결하여 결과를 생성하는 조인
select ename, dname from emp e, dept d where emp,deptno = dept.deptno;

-- NonEqui join : 동일한 컬럼이 없이 다른 조건을 사용하여 조인
-- 조인할 테이블 사이에 컬럼의 값이 직접적으로 일치하지 않을시 사용하는 조인

select * from salgrade;
select * from emp;

select e.ename, e.sal, s.grade  from emp e, salgrade s where e.sal between s.losal and s.hisal;
select e.ename, e.sal, s.grade  from emp e, salgrade s where e.sal >= s.losal and e.sal <= s.hisal;

-- Outer join : 조인 조건에 만족하지 않는 행도 나타냄
--              행이 조인 조건에 만족하지 않을 경우 그 행은 결과에 나타나지 않게됨 
--              이 때 조인 조건에 만족하지 않는 행들도 나타내기 위해 Outer join을 사용함

select e.ename , d.deptno , d.dname from emp e, dept d where e.deptno= d.deptno order by d.deptno;
select e.ename , d.deptno , d.dname from emp e, dept d where e.deptno(+)= d.deptno order by d.deptno;
/*
     부서 테이블에는 40번 부서가 존재한다.
     하지만, 조인결과를 보게되면 10 ~ 30 번 부서번호만 출력되고 40번은 출력되지 않는다.
     이는 사원 테이블의 부서번호에는 40번이 존재하지 않기 때문이다. 
     
     부서테이블의 40번 부서와 조인할 사원테이블 부서번호가 없지만, 40번 부서도 출력 되도록 하려면 Outer join을 사용하면 해결됨
     Outer join을 사용하려면 기호를 사용하여 조인 조건에서 정보가 부족한 컬럼 명 뒤에 취치하게 하면 됨 

     즉, 사원테이블에 부서번호 40번이 없기 때문에 e.deptno(+) +(기호)를 덧붙이면 됨
*/


/*
-- Self Join : 한 테이블 내에서 조인
    self join 이란 말 그대로 자기 자신과 조인을 맺는 것을 의미함
    from 절 다음에 동일한 테이블명을 2번 기술하고 where 절에도 조인 조건을 주어야하는데
    이때 서로 다른 테이블인 것처럼  인식 할 수 있도록 하기 위해서 별칭을 사용한다.
    emp e, emp p 
*/

select ename, mgr from emp;

-- emp 테이블에 별칭을 사용하여 하나의 테이블을 두개로의 테이블인 것처럼 사용하려면 
-- work(사원테이블), MANAGER(매니저 테이블)로 별칭을 부여한다.

select work.ename , MANAGER.ename from emp WORK,  emp MANAGER where WORK.MGR = MANAGER.empno;

/*
문] 사원의 이름과 그의 매니저 이름을 출력하는 쿼리문을 작성하시오. 
    FORD의 매니저는 JONES이다. 
*/
select work.ename || '의 매니저는' || MANAGER.ename || '이다' from emp WORK, emp MANAGER where WORK.MGR = MANAGER.empno;

/*
 서브 쿼리 

 서브 쿼리는 하나의 select 문장의 절 안에 포함 된 또 하나의 select 문장이다.
 ex) select * from emp where sal > (select * from dept) select 안에 select가 있넹
 그렇기에 서브 쿼리를 포함하고 있는 쿼리문을 메인쿼리, 포함된 또 하나의 쿼리를 서브 쿼리 라고 한다.
 
 서브쿼리의 종류는 단일행 서브쿼리, 다중행 서브쿼리가 있음 
 서브쿼리를 이용해서 테이블 생성도 가능함
 서브 쿼리문을 이용해서 테이블에 데이터를 추가, 수정, 삭제 할 수 있음 
*/
-- ex)사원의 이름이 scott인 사원이 어떤 부서 소속인지 소속 부서명을 알아내려면 조인 사용해서
--    해결 했지만, 조인이 아닌 서브쿼리를 이용해서도 해결이 가능하다.
--    먼저 scott의 부서명을 알아서 부서번호를 알아 내야 한다.
select deptno from emp where ename = 'SCOTT';
select dname from dept where deptno = 20;

--      얘가 메인                             -- 서브 
select dname from dept where deptno = (select deptno from emp where ename = 'SCOTT');
-- 서브쿼리는 비교연산자의 오른쪽에 기술 해야하고 반드시 괄호()로 둘러 싸야 한다.
-- 서브쿼리는 메인 쿼리가 실행 되기 전에 한번만 실행함 

/*
    단 일행 서브 쿼리 
    - 단 일행 서브쿼리는 내부 select 문장으로 부터 오직 하나의 행만을 반환 받으며, 
       단일행 비교연산자(=, >, >= , <= , < , <>)를 사용함
    
    다중행 서브 쿼리 
    - 서브 쿼리에서 반환 되는 결과가 하나 이상의 행일때  사용하는 서브 쿼리이다.
    
      다중 행 연산자
      IN  : 메인 쿼리의 비교 조건 ('=' 연산자로 비교할 경우)이 서브 쿼리의 결과 중에서도 하나라도 일치하면 참 
      ANY, SOME :  메인 쿼리의 비교 조건이 서브 쿼리의 검색 결과와 하나 이상이 일치하면 참
      ALL : 메인 쿼리의 비교 조건이 서브 쿼리의 검색 결과와 모든 값이 일치하면 참 
      EXIST : 메인 쿼리의 비교 조건이 서브 쿼리의 결과 중에서 만족하는 값이 하나라도 존재하면 참 --in 연산자랑 똑같음
*/
    --단일행 서브 쿼리 
    --ex) SMITH 와 같은 부서에서 근무하는 사원의 정보를 출력하시오.(서브쿼리로 작성 : 단일행)
    select deptno from emp where ename = 'SMITH';
    select * from emp where deptno = 20; 
    
    select * from emp where deptno=(select deptno from emp where ename = 'SMITH');
    
    -- 사원 테이블에서 평균 급여보다 더 많은 급여를 받는 사원을 검색하여 출력하시오.
    -- 급여에 평균을 먼저 구한다.
    select avg(sal) from emp;
    select ename, sal from emp where sal >(select avg(sal) from emp);
    
    -- IN 연산자
    -- 결과가 2개 이상 구해지는 쿼리문을 서브쿼리로 기술 할 경우에는 다중행 연산자와 함께 사용해야함
    
    -- 급여를 3000 이상받는 사원이 소속 된 부서와 동일한 부서에서 근무하는 사원을 출력하시오.
    
    select deptno from emp where sal >= 3000;
    select distinct(deptno) from emp where sal >= 3000;   -- 중복제거
    select ename, sal, deptno from emp;
    
    select ename, sal, deptno from emp where deptno in(select distinct(deptno) from emp where sal >= 3000); 
    
/*
 ANY
    - 메인 쿼리의 비교 조건이 서브 쿼리의 검색 결과와 하나 이상만 일치하면 참이다. 
      찾아진 값에서 가장 작은 값 즉, 최소값 보다 크면 참이됨
      
      연산자 any 는 찾아진 값에 대해서 하나라도 크면 참이 된다.
*/    
   -- 부서 번호가 30번인 사원들의 급여 중 가장 작은 값(950) 보다 많은 급여를 받는
   -- 사원의 이름, 급여를 출격하시오.
   select ename, sal from emp where sal >= 950;
   select sal from emp where deptno = 30; 

     select ename, sal from emp where sal >= (select sal from emp where deptno = 30); --단일행이라 오류?
     select ename, sal from emp where sal >= ANY(select sal from emp where deptno = 30);
    
  -- ALL  : 메인 쿼리의 비교 조건이 서브 쿼리의 검색 결과와 모든 값이 일치하면 참   
    -- ex) 30번 소속사원들 중에서 급여를 가장 많이 받은 사원보다 더 많은 급여를 받는 
    --    사원을 이름, 급여를 출력하시오.
    
    select ename, sal from emp where sal > 2850;
    select sal from emp where deptno = 30;
    select ename, sal from emp where sal > ALL(select sal from emp where deptno = 30); --서브쿼리는 무적권 괄호로 묶는다. 
    
    -- 서브쿼리를 이용해서 테이블 작성 
    create table emp07 as select * from emp; -- 이건 emp 테이블에 있는걸 그대로 전부 복사해 오는거 
    create table emp07 as select * from emp where 1=0; -- 테이블 구조만 복사 하는거임 
    select * from emp07; -- 확인 해보면 데이터는 안들어가져 있고 구조만 복사되있음 
    
     create table emp08 as select empno, ename from emp where 1=0; -- 내가 쓰고 싶은 구조만 따로 생성
     select * from emp08;
     
     create table dept02 as select * from dept where 1=0;
     select * from dept02;
     
     --서브쿼리로 데이터 추가 
     insert into dept02 select * from dept; -- dept안에 있는 놈들을 dept02로 추가 
     select * from dept02;
     drop table dept02;
     -- 서브 쿼리를 이용해서 데이터 수정 
     -- 10번 부서의 지역명을 40번 부서의 지역명으로 변경하시오.(컬럼이 1개인 경우)
                                --  여긴 서브쿼리의 조건 
     update dept02 set loc = (select loc from dept02 where deptno = 40) where deptno = 10;
     /*
        컬럼이 2개 이상인 경우
        서브쿼리 형식 두 가지 
        1. update 테이블명 
        set 컬럼명1 = (서브쿼리), 컬럼명2 = (서브쿼리) where 조건
        
        2. update 테이블명 
        set (컬럼명1, 컬럼명2) = (서브쿼리1, 서브쿼리2) where 조건

     */
     -- ex) 20번 부서의 부서명과 지역명을 30번 부서의 부서명과 지역명으로 변경하시오
     -- 첫번째 방법
     update dept02 set dname =(select dname from dept02 where deptno = 30), 
     loc = (select loc from dept02 where deptno = 30) where deptno = 20;
     
     -- 두번째 방법
     update dept02 set (dname, loc) = (select dname, loc dept02 from deptno = 30) where deptno = 20;
     rollback;
     select * from dept02;
     
     --서브 쿼리를 이용한 데이터 삭제
    select * from tab;
    drop tabal emp01;
    creattable emp01 as select * from emp01;
    
    select deptno from dept where  dname = 'SALES';
    delete from emp01 where deptno = (select deptno from dept where dname = 'SALES');
    rollback;
    
    -- 문1] 직급이 'SALESMAN' 인 사원이 받는 급여들의 최소 급여보다 많이 받는 사원들의 이름과  급여를 출력하되
    --      부서번호가 20번인 사원 제외시키고 출력하시오. 
    select min(sal) from emp where job = 'SALESMAN'; -- 1250 보다 많이 받아야됨(최소급여알아보기위해)
    select ename, sal from emp where deptno !=20; 
   
    select ename, sal from emp where deptno !=20 and sal > (select min(sal) from emp where job = 'SALESMAN'); 
    
    -- 사용자 생성
    -- create user 유저명 identified by 비밀번호 
    reate user javauser identified by java; -- 여기선 안댐
    --넘버투 시스템 계정에서 권한 grant와 revoke로 주거나 뻇어야 됨

---------------------------------------------------뷰(VIEW)-----------------------------------------------------------------------------------------
/*
    뷰의 개념
    뷰(VIEW)란 보다란 의미를 갖고 있는 점을 감안해 보면 알 수 있듯이 실제 테이블에 
    저장된 데이터를 뷰를 통해서 볼 수 있도록 한다.
    
    뷰를 흔히 가상 테이블이라고 부르는데 이는 테이블과 거의 동일하게 사용되기 때문이다. 
    
    뷰는 물리적인 구조인 테이블과 달리 데이터 저장 공간이 없다.
    뷰는 단지 쿼리문을 저장하고 있는 객체라고 표현 할 수 있다. 
*/
 select * from tab;

 create view view_emp10
 as
 select empno, ename, sal, deptno from emp01 where deptno = 10; -- 그냥 실행하면 오류남 관리자로부터  권한을 받아야지만 뷰를 생성 할 수 있다.
 
 ----------------------------------------------------------------------2022-06-29---------------------------------------------------------------------
 /*
 뷰의 사용 목적
  직접적인 테이블 접근을 제한하기 위해 사용된다.
  복잡한 질의를 쉽게 만들기 위해서 사용한다.
  
  뷰의 특징
    뷰는 테이블에 대한 제한을 가지고 테이블의 일정한 부분만 보일 수 있는 가상 테이블이다.
    뷰는 실제 자료를 갖지는 않지만, 뷰를 통해 테이블을 관리 할 수 있다.
    하나의 테이블에 뷰의 개수는 제한이 없다.
  
  뷰의 생성과 조회
   뷰를 생성하기 위해서는 테이블 생성과 같이 DDL(create, select)을 사용한다.
   
  기본 테이블
  뷰에 의해 제한적으로 접근해서 사용하는 실질적으로 데이터를 저장하고 있는
  물리적인 테이블을 의미함 
*/
 select * from view_emp10;
 
 /*
 뷰 생성
  - 뷰는 테이블 처럼 하나의 개체로서 테이블 생성할때와 유사하게 create view 명령으로 생성한다.
  
   뷰 생성 형식
  create [or replace] [force]  [noforce] view view_name
    [ (alias, alias, .....) ] 
    as subquery
    [with check option]
    [with read only];
    해당 뷰를 통해서는 select만  가능하며 insert/update/delete를 사용 할 수 없다.
    
     or replace view 
     - 새로운 뷰를 만들 수 있을 뿐만 아니라 기존에 뷰가 존재하더라도 삭제하지 않고
       새로운 구조의 뷰로 변경 할 수 있다. 
       
    force 
    - 기존 테이블의 존재 여부에 상관없이 뷰를 생성함
    
    whith check option
    - 해당 뷰를 통해서 볼 수 있는 범위 내에서만 update or insert 만 가능하다.
    
    뷰의 동작 원리
     - 사용자가 뷰에 대해서 질의를 하면 user_views 에서 뷰에 대한 정의를 조회함
     - 기본테이블에 대한 접근 권한을 살핌
     - 뷰에 대한 질의를 기본 테이블에 대한 질의로 변경한다.
     - 기본테이블에 대한 질의를 통해 데이터를 검색함
     - 검색도니 결과를 출력
     
     뷰의 종류
     - 기본 테이블의 수에 따라 단순 뷰 또는 복합 뷰로 나뉜다.
     
     단순 뷰                                           복합 뷰 
- 하나의 테이블로 생성                               - 여러개의 테이블로 생성
- 그룹함수의 사용이 불가능                            - 그룹 함수의 사용이 가능
- DISTINCT(중복제거)사용이 불가능                     - DISTINCT(중복제거)사용이 가능
- DML(insert/ update/ delete)사용가능               - DML(insert/ update/ delete)사용이 불가능
 */   
insert into view_emp10 values(8000, 'ANGEL', 7000, 10);
-- 단순 뷰에서는 DML명령문 처리 결과는 뷰를 정의 할때 사용한 기본 테이블에도 영향을 미친다.
select * from view_emp10;
select * from emp01; 

-- 단순 뷰의 컬럼에 별칭 부여 
-- 사원번호, 사원명, 급여 , 부서번호로 구성된 뷰를 작성하되
-- 기본 테이블은 emp01로 하고 컬럼명은 한글로 작성하시오.
desc view_emp10;

create or replace 
view view_emp10(사원번호, 사원명, 급여, 부서번호)
as
select empno, ename, sal, deptno from emp01;
    
select * from view_emp10 where deptno = 10; --위에서 한글로 바꾸었기 때문에 오류가 남 
select * from view_emp10 where 부서번호 = 10;
/*
 오류 이유 : 컬럼을 별칭을 사용해서 뷰를 생성하면 view_emp10의 컬럼 이름만 별칭으로
            데이터 구조에 반영되고, 기본테이블의 컬럼 이름에는 전혀 영향을 미치지 못하기 때문이다.
*/

-- 그룹함수를 사용한 단순 뷰
-- 부서별 급여 총액과 평균을 구하는 작업을 자주 한다면 이를 뷰로 생성해 놓았다가 사용하면 편리하다.
create view view_sal
as
select deptno, sum(sal) as "SalSum", avg(sal) as "SalAvg"  -- emp01 테이블에 sum 과 avg 컬럼이 없기때문에 만들어줌
from emp01
group by deptno;

select * from view_sal;

/*
    뷰에 관련된 데이터 딕셔너리
    - 데이터 딕셔너리 USER_VIEWS에 사용자가 생성한 모든 뷰에 대한 정의가 저장되어 있음
      뷰의 이름을 위한 VIEW_NAME이란 컬럼과 뷰를 작성할때 기술한 subquery가 저장되어 있는
      TEXT 컬럼이 있음
      
      검색 : select view_name, text from user_views;

-- 뷰 삭제
    - 뷰는 실제가 없는 가상 테이블이기 때문에 뷰를 삭제한다는 것은
      user_views 데이터 딕셔너리에 저장되어 있는 뷰의 정의를 삭제하는 것임
*/
    select view_name, text from user_views;
   -- 구조는 drop  데이터는 delete 삭제할때 
   drop view view_sal;
   
create or replace -- 아까는 한글로 했지만 이번에는 컬럼명을 영어로 바꿔봐라
view view_emp10
as
select empno, ename, sal, comm ,deptno from emp01 where deptno = 10;

select * from view_emp10;
select * from tab;

-- 기본 테이블 없이 뷰를 생성하기 위한 FORCE 옵션
-- 기본 테이블이 존재하지 않더라도 뷰를 생성함
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
    -- 뷰를 생성시 조건으로 지정한 컬럼 값을 변경하지 못하도록  하는 것을 의미함
*/
create or replace view view_chk20
as 
select empno, ename, sal, comm, deptno from emp01
where deptno = 20 with check option;

select * from view_chk20;

-- 급여가 5000 이상인 사원을 10번 부서로 이동하는 쿼리문을 작성

update  view_chk20 set deptno = 10 where sal >= 5000;
-- 이유 : 부서번호에 with check option을 지정하였으므로 이 뷰를 통해서는 부서번호를 변경 할 수 없다.

/*
- with read only : 뷰를 통해서는 기본 테이블의 어떤 컬럼 대해서도 내용을
                  변경할 수 없도록 하는 것을 의미함
                  
 with check option 과 whit read only의 차이점 
 
  with check option은 조건에 사용한 컬럼의 값을 수정하지 못하게 하는것이고,
  whit read only 는 기본 테이블의 모두를 수정하지 못하게 하는것을 의미함
*/

create or replace view  view_read30
as
select empno, ename, sal, comm, deptno
from emp01
where deptno = 30 with read only;

select * from view_read30;
update view_read30 set comm = 1000; -- 오류남 읽기 전용 뷰에서는 DML 작업이 안됨

/*
 뷰 활용하기 
 
 사원중에서 입사일이 빠른 사람 5명(TOP-5)만을 얻는 질의문을 작성하시오.
  ROWNUM 컬럼을 이용
   -ROWNUM 컬럼은 오라클에서 내부적으로 부여되는 insert 문에 의해 입력한 순서에 따라 
           1씩 증가되면서 값이 지정됨
*/

 create or replace view view_hire
 as
 select empno, ename, hiredate from emp01
 order by hiredate; -- 오름차순은 생략가능 desc 내림차순은 생략불가능
select rownum ,empno, ename, hiredate from view_hire; --rownum을 넣어서 순위 매김 
select rownum ,empno, ename, hiredate from view_hire where rownum <=5; -- 5위까지 

/*
  시퀀스    (회원관리, 게시판  할때 많이 사용한다 함)
    - primary key로 지정된 컬럼에 일련번호를 자동으로 부여 받기 위해 
      시퀀스를 사용한다.
    
    시퀀스 생성
    - 시퀀스는 유일(unique)한 값을 생성해주는 오라클 객체이다.
    - 시퀀스를 생성하면 기본 키 와 같이 순차적으로 증가하는 컬럼에 자동적으로 생성 할 수 있게 한다.
    
    시퀀스 생성 형식
    create sequence 시퀀스명
    1.start with n 
    2.increament by n 
    3.maxvalue n | nomaxvalue                | = 또는
    4.minvalue n | nominvalue
    5.cycle | nocycle
    6.cache n  | nocache 
    번호는 순서대로 하라고 ? 실제 작성할때는 번호 쓰지마라 
    
     1. start with n
      - 시퀀스의 시작 값을 지정함. n을 1로 지정하면 1부터 순차적으로 시퀀스 번호가 증가한다.
      
     2.increament by n
     - 시퀀스의 증가 값을 의미함. n을 2로 하면 2씩 증가함
       시작은 1로 증가는 로 하면 1,3,5,7,9 이렇게 증가 함 
    
     3.maxvalue n | nomaxvalue 
     - 시퀀스가 증가 할 수 있는 최대값을 말함. nomaxvalue는 무한대를 의미함(끝을 모름)
     
     4.minvalue n | nominvalue
     - 시퀀스의 최소값을 의미하며 기본값은 1임. nominvalue는 무한소를 의미함( 마이너스로 계속 내려감)
      
     5.cycle | nocycle
     - 지정된 시퀀스 값이 최대값까지 증가가 완료 되면 다시 최소값으로 시작퀀스를
       시작하도록 cycle로 지정함. noncycle은 최대값을 넘어서면 오류가 발생함
     
     6.cache n  | nocache 
      - 오라클 서버가 미리 지정하고 메모리에 유지할 값의 수로 디폴트 값은 2임
      
      시퀀스 생성시 위에 옵션을 다 필수로 적을 필요없는 없다 생략 가능 
      
*/
-- 시작 값이 1이고 1씩 증가하고, 최대값이 100000 이 되는 시퀀스 emp_seq 생성  
create sequence emp_seq  -- 괄호같은거 없다
start with 1
increment by 1
maxvalue 100000;

drop table emp01;

create table emp01
as select empno, ename  , hiredate from emp where 1=0; 

select * from emp01;

insert into emp01 values(emp_seq.nextval, 'JULIA', sysdate); --nextval 번호를 자동으로 할당 
-- 현재 시퀀스 값을 반환함 
select emp_seq.currval from dual;

-- 현재 시퀀스의 다음값을 반환
select emp_seq.currval from dual;

/*
nextval, currval 을 사용 할 수 있는 우 
 -서브쿼리가 아닌 select문
 -insert 문의 select 절
 -insert 문 values 절
 -update 문 set절
 
nextval, currval 을 사용 할 수 없는 경우
 -view의 select 절
 -distinct 키워드가 있는 select 절
 -group by, having, order by 절이 있는 select 절
 -select, delete, update의 서브쿼리
 -create table, alter table 명령의 기본값
*/

select * from tab;

drop table dept01;

create table dept01
as 
select * from dept where 1=0; 
select * from dept01;

-- 시퀀스 작성: 10부터 10씩 증가하면서 최대 30까지의 값을 갖는 시퀀스 생성 DEPT_SEQ
create sequence dept_seq
start with 10
increment by 10
maxvalue 30;

insert into dept01 values(dept_seq.nextval, 'ACCOUNTING', 'NEW YORK');
insert into dept01 values(dept_seq.nextval, 'RESEARCH', 'DALLAS');
insert into dept01 values(dept_seq.nextval, 'SALES', 'CHICAGO');
insert into dept01 values(dept_seq.nextval, 'OPEARTIONS', 'CHICAGO');
/*
 시퀀스에 대한 데이터 딕셔너리 USER_SEQUENCES
 생성된 시퀀스의 정보를 확인하기 위한 데이터 딕셔너리로 USER_SEQUENCES가 있다.
*/
select sequence_name, min_value, max_value, increment_by, cycle_flag from user_sequences;

/*
시퀀스 수정
    - 시퀀스 값을 변경하려면 alter sequence 문 사용
    alter sequence 시퀀스 명 
    start with n
    increment by n
    maxvalue n | nomaxvalue
    minvalue n | nominvalue
    cycle | nocycle
    cache n nocache;
*/
alter sequence dept_seq
maxvalue 10000;
-- 최댓값만 늘림!
select sequence_name,min_value, max_value, increment_by,cycle_flag from user_sequences;
-- 시퀀스의 삭제 : 시퀀스를 삭제 하려면 drop sequence 시퀀스명을 사용함
-- drop sequence 시퀀스 명 
drop sequence dept_seq;
drop sequence emp_seq;
select * from dept01; -- 삭제해도 현재 미치는 값에 영향 없따

------------------------------------------------------------end DDL, DML, DCL --------------------------------------------------------------------

------------------------------------데이터 베이스 백업 및 복원 ----------------------------------------------------------------------------------------
/*
 오라클에서 백업하는 가장 일반적인 방법
 Export, import를 사용함 
 
 데이터베이스 백업
 1) 백업 
    데이터베이스 백업
ex) exp(export의 약자) 유저/ 비밀번호 file = 파일명.dmp log = log파일명.log
    위의 명령의 실행하면 파일명.dmp 파일과  파일명.log  파일이 생김

 2) 복원
 ex) imp (import의 약자) 유저 / 비밀번호 file = 복원할 파일명.dmp log = 로그파일명.log
     *주의사항* 
     복원에는 imp를 실행하고 절차에 따르면 되고 마지막 쯤에 dmp 파일을 만든 유저를 다시 물어본다.

  
  백업
    exp scott/tiger file = c:\ora\scott_data.dmp  log = c:\ora\scott_data.log
        
  복원
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
commit; -- 이클립스랑 연결할때 커밋을 무조건 해야됨

select * from department;  -- 이클립스로 행을 추가 해서 결과를 확인해보니 들어가져있네 

-----------------------------------------------------2022-07-01-------------------------------------------------------------------------------
--department 테이블과 professor 을 연결시킨다. 
--department deptno를 외래키로 참조해서 연결 
select * from department;


create table professor ( 
profno number(5) not null, --이클립스 jdbcEx05클래스 에서  첫번쨰 ? 
name varchar2(10) not null, -- 두번재 ? 
ename varchar2(20) not null, -- 세번째 ?
position varchar2(20) not null, --네번째 ? 
sal number(4) not null, 
hiredate date not null, -- sysdate 
age number(3) not null,
deptno number(3) not null,
constraint professor_pk primary key(profno)
);

alter table professor add constraint pprofessor_fk foreign key(deptno) -- 외래키 설정  
references department (deptno); 
commit;

select * from professor;
select * from department;