select * from emp;
--테이블 조회

--테이블을 검색하는 명령 
select * from tab;

--테이블 구조 확인 명령
DESC emp;

/*
오라클 자료형 

1.숫자형 데이터 
NUMBER(크기지정) : 기본 크기는 4byte

2.날짜형 데이터
DATE : 년, 월 , 일, 시, 분, 초, 요일

3.문자형 데이터 -> 
VARCHAR2(크기지정) : 크기를 지정 가능/ 가변으로 활용 -> 필요 할 때만 공간을 만들어 쓸수있다. 
CHAR(크기지정)  : 배열 같음 크기를 정하면 변경 할 수 없다.

*/
select * from table; -- 테이블의 약자는 
-- select : 데이터베이스 내에 있는 데이터를 조회하기 위한 명령이다.
--  * : 모든 컬럼(열)을 의 미함
-- 특정 컬럼(이름,번호)  empno,  ename
select empno, enmaer, sal from emp;

-- from : 테이블 지정할 때 from 다음에는 테이블명을 기입함

select * from dept;
select * from emp;
--emp 테이블에서 사원명(ename)과 급여(sal)와 입사일(hiredte)을 출력하는 쿼리문을 작성하시오. 

select ename, sal, hiredate from emp;

-- 산술 연산자 : +, -, *, /

select ename, sal* 12 from emp;
select ename, sal, sal*12 from emp;

-- Null 도 데이터 값이다.
-- Null의 의미
/*
 1. 0도 아니고 
 2. 빈 공간도 아니고 (비어있다는게 아님)
 3. 미확정 값을 의미함
 4. 어떤 값인지 알 수 없지만 어떤 값이 존재하고 있다.
 5. ? 혹은 ∞(무한)의  의미도 있음
 6. 연산, 할당, 비교가 불가능하다.
*/

100 + ?

select 100 + ? from dual;

Desc dual;
/*
dual 테이블
- 한 행으로 결과를 출력하기 위한 테이블
  DUMMY : 컬럼에는 한개의 문자만을 저장할 수 있는 x라는 값을 가진 
  단 하나의 행만을 저장함 (모조칼럼이다)
*/

select * from dept;
select 24 *60* 60 from dual;  --산술식에서 가장 자주사용하는게 dual 테이블이다. 다른 테이블은 여러행으로 나온다. 

select * from dual;

desc dual;
desc dept;

