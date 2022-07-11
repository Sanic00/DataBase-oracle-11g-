
select * from dept;


--컬럼 이름을 명시해서 특정 컬럼만 보기
-- ex) dept 테이블에서 부서번호와 부서명만 출력 
select deptno, dname from dept;

select * from emp;

/* emp 테이블에서 사원이름과 급여와 입사일만을 출력하는 쿼리문을 작성하시오 */
select ename, sal, hiredate from emp; 

-- 별칭 : 컬럼을 기술한 바로 뒤에 as 라고 쓴 후 별칭(별명, 닉네임)을 기술 (일시적) 
-- 별칭에는 공백문자, 특수문자($, _(underbar),#)등 문자를 표현하고 싶거나 대소문자를 구별하고 싶을때  
-- ""(double quotes)을 사용하여 기술한다.
-- as 생략하고 ""를 사용하여 별칭을 기술하는 것이 가능하다.

select ename as "사원이름", sal as "급여", hiredate as "입사일" from emp;
select ename  "사원이름", sal  "급여", hiredate "입사일" from emp;

select deptno "DepartmenetNo", dname "DepartmentName" from dept;

-- DISTINCT : 중복된 데이터를  한번만 출력할때 사용함.

select job from emp;
select distinct job from emp;
select distinct deptno from emp;

-- where : 조건 과 비교연산자 
-- select column from table where 조건문;
-- 비교연산자 : =, >, <, >=, <=,(<>(같지않다), !=(같지않다), ^=(같지않다)) 
select empno, ename, sal from emp where sal >= 3000;
-- ex) 급여가 3000이상 받는 사원을 대상으로 사원번호, 사원이름, 급여를 출력하시오.

--문제 1번 사원테이블에서 부서 번호가 10인 사원에 대하여 모든 정보를 출력해라.
select * from emp  where  deptno = 10;


--문제 2번 : 사원테이블에서 급여가 2000미만인 사원에 대하여  사원번호, 이름 , 급여를 출력해라.
select empno, ename, sal from emp where sal <2000;

/*
문자 데이터 조회
- 문자 데이터는 반드시 싱글쿼터 안에 표시하고, 대소문자를 구분한다.
*/
select ename from emp;
select * from emp where ename = 'SCOTT'; --대문자면 대문자로 소문자면 소문자로 대소문자 구분 확실하게 해야됨

--문제 3번 : 사원이름이 MILLER 인 사원의 번호와 이름, 직급을 출력하시오.
select empno, ename , job  from emp where ename = 'MILLER';

/*
날짜 데이터 조회
- 날짜 데이터는 반드시 싱글쿼터 안에 표시하고, 년/월/일 형식으로 기술한다.
*/
--문제 4번 : 입사일이 85년 이후인 사람을 정보를 출력하시오.
select ename, hiredate from emp where hiredate >= '1985/01/01';

/*
논리 연산자 
AND  : 두가지 조건이 모두 만족을 해야만 검색 할 수 있음
OR   : 두가지 조건중 한가지만 만족하더라도 검색 할 수 있음 
NOT  : 조건에 만족하지 못하는 것만 검색 할 수 있음
BETWEEN AND : 특정 범위 내에 속하는 데이터를 검색 하고자 할 때 사용함
IN : 동일한 컬럼이 여러개 값중 하나인지 알아보고자 할 때 사용함
*/

-- 부서 번호가 10번이고, 직급이 MANAGER인 사원의 정보를 출력하시오.
SELECT * FROM EMP WHERE DEPTNO=10 AND JOB = 'MANAGER';

--급여가 1000에서 3000 사이인 사원들을 정보를 출력하시오.
SELECT * FROM EMP WHERE SAL >=1000 AND SAL <= 3000;
SELECT * FROM EMP WHERE SAL BETWEEN 1000 AND 3000;

-- 부서번호가 10번 이거나 직급이 MANAGER인 사원의 정보를 출력하시오.
SELECT * FROM EMP WHERE DEPTNO = 10 OR JOB ='MANAGER';

--사원 번호가 7844이거나 7654 이거나 7521인 사우너을 정보를 출력하시오.
select * from emp where empno = 7844 or empno = 7654 or empno = 7521;
select * from emp where empno in(7844,7654,7521);

/*
LIKE 연산자
- 검색 하고자 하는 값을 정확히 모를 경우 와일드 카드(2가지종류가 있다)와 함께 사용하여
    원하는 내용을 검색하는 연산자
와일드 카드
% : 문자가 없거나, 하나이상의 문자가 어떤 값이 오든 상관 없음  -> 여러개 일때 사용
_ : 하나의 문자가 어떤 값이 오든 상관없음 ->한개 일때만 
*/

-- 사원의 이름이 K로 시작하는 사원을 검색하여 정보를 출력 하시오.
select ename from emp where ename like 'K%';
-- %는 몇개의 문자 오든 상관없다.
select ename from emp where ename like 'M%';

-- 이름중에 K를 포함한 사원을 정보를 출력
select ename from emp where ename like '%K%'; 

-- 이름의 두번째 글자가 A인 사원을 출력
select ename from emp where ename like '_A%';

-- 이름중에 A를 포함한 사원을 정보를 출력
select ename from emp where ename like '%A%';

-- 이름중에 A를 포함하지 않는 사원을 정보를 출력
select ename from emp where ename  not like '%A%';

-- 커미션이 NULL인 사람만 찾아라
select comm from emp;
select comm from emp where comm is null; --NULL은 값이기 때문에 '' 를 사용하지 않는다.
-- NULL 이 저장되어 있는 경우에는 = 연산자는 사용 할 수 없다.

/*
 NULL을 위한 연산자
 오라클에서는 컬럼에 NULL값이 저장되는 것을 허용함
 NULL은 미확정, 알 수 없는 값을 의미함
 0도 빈공간도 아닌 어떤 값이 존재하기는 하지만, 어떤 값인지 알아 낼 수 없는 것을 의미함.
 NULL  은 연산, 할당, 비교가 불가능하다.

is null 과 is not null (두가지가 있다)
 - 특정 컬럼 값인지는 비교할 경우에는 비교연산자(=)을 사용하지 않고 is null 연산자를 사용함
 - null 값이 아닌지를 알아보려고 할 때는 비교연산자(<>)를 사용하지 않고  is not null 연산자를 사용함
 
  is null : null 이면 만족
  is not null : null 이 아니면 만족
*/

select 100 + null from dual;
--커미션을 받지 않는 사원
select ename, comm from emp where comm is null;
-- 커미션을 받는 사원 
select ename, comm from emp where comm is not null;

--자신의 직속상관이 없는 사원의 이름과 직급과 직속 상관의 사원 번호를 출력하시오.

select * from emp;
select ename, job from emp where mgr is null;

/*
정렬을 위한 order by 절

order by 절은 로우(행)를 정렬 하는데 사용함
쿼리문 맨뒤에 기술 하며 정렬의 기준이 되는 컬럼  이름 또는 select 절에서 명시된 별칭을 사용함

  기준         오름차순(asc)                내림차순(desc)
- 숫자        작은 값 부터 정렬               큰 값 부터 정렬
- 문자        사전 순서로 정렬                사전반대 순서로 정렬   
- 날짜        빠른 날짜 순서대로              늦은 날짜 순서로   
- NULL       가장 마지막에 나옴              가장 먼저 나옴

 영문자인 경우 소문자를 가장 큰 값으로, null값은 모든 값 중 가장 작은 값으로 인식함
*/

-- 사원번호를 기준으로 오름차순 정렬 하시오 오름차순(asc)는 생략이 가능하다! 
select * from emp order by empno asc;
select * from emp order by empno ;
--사원번호를 기준으로 내림차순 정렬 하시오. 내림차순(desc)는 생략 불가능함
select empno from emp order by empno desc;

-- 문제] 사원의 사원번호, 이름, 급여를 급여가 높은 순으로 출력하시오.
select empno, ename, sal from emp order by sal desc;

-- 문제] 입사일이 가장 최근인 사원 순으로 사원 번호, 이름, 입사일을 출력하시오.
select empno, ename, hiredate from emp order by hiredate desc;

/*
sql                                     sqlplus
국제 표준 DB언어                          오라클에서만 사용하는 명령
DB의 데이터를 조작 할 수 있음               DB의 데이터를 조작 할 수 없다.
모든 명령어의 끝은 세미콜론으로 끝남          모든 명령어는 엔터키에 의해 끝남(;으로 가능함)
약어를 사용 할 수 없음                     약어 사용 가능
*/
select * from emp where deptno = 10;


/*
단일행 함수 
- 행마다 함수가 적용되어 결과를 반영하는 함수
단일행 함수의 종류 
1. 문자 함수 : 문자 열을 다른 형태로 변환하여 나타냄
2. 숫자 함수 : 숫자 값을 다른 형태로 변환하여 나타냄
3. 날짜 함수 : 날짜 값을 다른 형태로 변환하여 나타냄
4. 변환 함수 : 문자, 숫자, 날짜 값을 서로 다른 타입으로 변환하여 나타냄
5. 일반 함수 : 기타함수 

그룹 함수
- 하나 이상의 행을 그룹으로 묶어 연산하여 하나의 결과로 나타냄
그룹 함수의 종류
1. SUM : 그룹의 누적 합계를 구한다.
2. AVG : 그룹의 평균을 구함
3. COUNT : 그룹의 총 개 수를 구함
4. MAX : 그룹의 최대값을 구함 
5. MIN : 그룹의 최소값을 구함
6. STDDEV(standard xx) : 그룹의 표준편차를 구함
7. VARIANCE : 그룹의 분산을 구함
*/

/*
문자 함수 : 문자열을 다른 형태로 변환하여 나타냄 
        문자형의 값을 조작하여 변환된 문자 값을 반환함
        
        LOWER : 소문자로 변환
        UPPER : 대문자로 변환
        INITCAP : 첫글자만 대문자로 변환
        CONCAT : 문자의 값을 연결
        SUBSTR : 문자를 잘라서 추출 
        SUBSTRB : 문자를 잘라서 추출
        LENGTH : 문자의 길이를 반환 
        LENGHTHB : 문자의 길이를 반환
        INSTR : 특정문자의 위치 값을 반환  
        INSTRB : 특정 문자의 위치 값을 반환
        LPAD,RPAD : 입력받은 문자열과 기호를 정렬하여 특정 문자열의 길이를 반환 함
        TRIM : 잘라내고 남은 문자를 표시함 
        CONVERT : 문자 셋을 변환함
        CHR : ASCII코드 값으로 변환
        ASCII : ASCII 코드 값을 문자로 변환
        REPLACE : 문자열에서 특정 문자를 변경함
*/
SELECT 'DataBase' , LOWER ('DataBase') from dual;
select ename, LOWER(ename) from emp;

SELECT 'DataBase' , UPPER ('DataBase') from dual;

--직급이 manager인 사원을 검색하시오 

select empno, ename, job from emp where LOWER(job) = 'manager';

-- 첫 글자만 대문자로 변환
select INITCAP('DATA BASE PROGRAMING') from dual; 

-- 사원 테이블의 10번 부서 소속의 사원의이름의 첫 글자만 대문자로 변환하시오

select empno, INITCAP(ename), deptno from emp where deptno = 10;;


-- 'Smith' 란 이름의 갖은 사원의 사번, 이름, 급여와 커미션을 출력하시오.

select empno, ename, sal, comm from emp where initcap(ename) = 'Smith';

-- CONCAT : 두 문자를 연결

select concat('Data', 'Base') from dual;


-- LENGTH : 문자의 길이를 반환 
 --LENGHTHB : 문자의 길이를 반환
select length('DataBase'), length('데이터베이스') from dual;
select lengthb('DataBase'),lengthb('데이터베이스') from dual;

-- 문] 10번 부서 소속 사원들의 이름의 길이를 구하여 출력하시오.
select deptno, empno, ename, length(ename) from emp  where deptno =10;

--문1] 직원 중 이름이 4글자인 직원의 이름을 소문자로 출력하시오. 
select empno, lower(ename) from emp where length(ename) = 4;

/*
    INSTR : 특정문자의 위치 값을 반환  
    INSTRB : 특정 문자의 위치 값을 반환
*/
-- 얘는 자바 인덱스랑 다르게 0부터 시작이 아닌 1부터 시작
select instr('DataBase', 'a') from dual;
--in = index str= start 임
select instr('DataBase', 'a',3 ,2) from dual; -- 숫자가 의미하는건 시작위치 설정

select instr('데이터베이스', '이', 3) from dual;

select instrb('데이터베이스', '이',3, 2) from dual; 

-- SUBSTR : 문자를 잘라서 추출 -> (문자열 일부만 추출하는 함수)
-- SUBSTRB : 문자를 잘라서 추출 

select substr('DataBase', 1, 3) from dual; --숫자1이 시작위치 3이 찾을 갯수
--select substr('대상 문자열', 시작위치, 추출할 개수)
select substr('DataBase', -4, 3) from dual; 

-- 사원 테이블에서 20번 부서 사원들 중 입사년도를 추출하시오.
select ename, hiredate, substr(hiredate, 1,2) from emp where deptno = 20;

-- 부서번호가 20번 87년도에 입사한 사원의 정보를 출력하시오.
select * from emp;
select ename, substr(hiredate,1,2) from emp where deptno = 20 and substr(hiredate, 1,2) = 87 ; 

select substr('데이터베이스', 3, 4) from dual;
select substrb('데이터베이스', 3, 4) from dual;

-- L = LEFT , R=RIGHT
-- LPAD,RPAD : 입력받은 문자열과 기호를 정렬하여 특정 문자열의 길이를 반환함
select LPAD('DataBase', 20 , '@') from dual; --문자가 남는 특정공간에 지정한 문자를 채울수있다. L은 왼쪽부터 채워지고 R은 오른쪽으로 채워짐
select RPAD('data', 10, '!') from dual;

select ename from emp where ename='SMITH';

select ename, trim('S'  from ename), trim('H' from ename) from emp where ename = 'SMITH';

select ename, Ltrim('aaaaOracle 11', 'a'), Rtrim('Orcale 11 aaaaa', 'a') from emp where ename = 'SMITH';

select ename, Ltrim('       Oracle 11'        ), Rtrim('Orcale 11       ', '') from emp where ename = 'SMITH';

--BOTH : 양쪽 공백제거 trim을 기본값은 both

-- 숫자 함수 : 숫자형 데이터를 조작하여 변환된 숫자 값

/*
 abs(절댓값) , cos(코사인) , exp(자연로그), floor, log, power(2에3승), sign(사인함수), sin(사인),  tan(tangent)
 round(반올림함수), trunc(잘라내는 버림), mod(%나머지 연산자) 
*/
select abs(-15) from dual; 

select cos(90) from dual;
select sin(90) from dual;
select tan(1) from dual;

select floor(34.5678) from dual; -- 소숫점이하 다 버려버림

select trunc(34.5678, 2) from dual;  -- 뒤에 소숫점 숫자 몇개 자를건지
select trunc(34.5678, -1) from dual;  --결과 30이 나옴 why? 소숫점을 기준으로 해서 + 면오른쪽 - 왼쪽으로 이동한다.

--특정 자리에서 순서를 반올림하는 함수(round)
--round(대상, 표시할 자리수)
select round(34.5678) from dual; -- 반올림 
select round(34.5678, 2) from dual; -- 반올림 

select
round(35.12 , 1),   -- 소수점 이하 2번째 자리에서 반올림 들어감
round(21.125 , 2),    -- 소수점 이하 3번째 자리에서 반올림 들어감
round(47.51),         --  소수점 이하 0번째 자리에서 반올림 들어감
round(834.12 , -1),    -- 두번째 인자값이 음수이면 일의 자리에서 반올림 (-1은 일의 단위에서 반올림이 들어감) 
round(653.54, -2)       -- 십의 자리에서 반올림 함 
from dual;


select power(3, 2) from dual;
select mod(34, 2) from dual;
select mod(34, 5) from dual;

문제1] 사번이 짝수인 사원들의 사원번호, 이름, 직급을 출력하시오
select * from emp;
select empno, ename, job from emp where mod(empno, 2) = 0;  

-- 날짜 함수 : 날짜 값을 다른 형태로 변환하여 나타냄
/*
- sysdate(현재 시스템 날짜), months_between(두날짜 사이에 몇개월인지), add_months(개월수를 더할때), next_day(다음날짜)
, last_day(월에 마지막 날짜), round(특정한 기준을 잡아서 반올림 함), trubc(특정한 날짜를 버림)
*/
select sysdate from dual;   --현재 날짜
select sysdate-1 from dual;  -- 현재의 날짜를 기준으로 어제 
select sysdate +1 from dual; --현재의 날짜를 기준으로 내일
 
문] 부서번호가 10인 사원을 대상으로 입사한 날로부터 오늘까지 며칠이 지났는가
select ename, hiredate, sysdate - hiredate from emp;
select ename, hiredate, months_between(sysdate , hiredate) from emp  where deptno = 10;


--입사일로 부터 3개월이 지난 날짜를 알아볼때 
select hiredate ,add_months(hiredate, 3) from emp;
select hiredate ,add_months(hiredate, 12) from emp;

--1. 일요일 2.월요일 3.화요일 4.수요일.........
select sysdate, next_day(sysdate, 4) from dual;
select sysdate, next_day(sysdate, '수요일') from dual; 
select sysdate, next_day(sysdate, '수') from dual;
select sysdate, next_day(sysdate, 'wednesday') from dual;

ALTER SESSION SET NLS_LANGUAGE = AMERICAN; -- 영어일때 
select sysdate, next_day(sysdate, 'wednesday') from dual;
ALTER SESSION SET NLS_LANGUAGE = KOREAN; -- 한글일때

--LAST_DAY : 해당 달의 마지막 날짜를 반환함
select sysdate, last_day(sysdate) from dual;

--trunc : 날짜도 잘라냄 
select hiredate from emp where deptno = 10;
select hiredate, trunc(hiredate, 'MONTH') from emp where deptno = 10;

--ROUND : 함수에 형식(format) 모델을 지정하면 숫자 이외의 날짜에 대해서도 반올림을 적용 할 수 있다.
--round(date, 'MONTH');
select hiredate, round(hiredate, 'month') from emp where deptno = 10; 

/*
날짜 round 기준점
년 : 7월 1 부터 반올림 들어감
월 : 16일을 기준으로 반올림
일 : 한 주가 시작되는 날짜
시간: 분을 기준으로 반올림
*/

/*
변환함수 : 자료형을 변환 시키고자 할 때 사용하는 함수
1. TO_CHAR : 날짜형 또는 숫자형을 문자형으로 변환하고자 할 때
2. TO_DATE : 문자형을 날짜형으로 변환 하고자 할때 
3. TO_NUMBER : 문자형을 숫자형으로 변환 하고자 할때
*/

-- TO_CHAR (날짜 데이터, '출력형식')

--출력형식 종류 
--YYYY : 년 도 표시 (4자리)
--YY : 년 도 표시 (2자리)
--MM : 월을 숫자로 표시 
--MON : 월을 알파벳으로 표시 
-- DD : 일을 표시
-- DAY : 요일 표시
-- DY : 요일을 약어로 표시 ex)월요일 -> 월

select hiredate, TO_CHAR(hiredate, 'YYYY/MM/DD day')from emp where deptno = 20;
select sysdate, to_char(sysdate, 'yyyy-mm-dd dy') from dual;
select sysdate, TO_CHAR(hiredate, 'YYYY/Mon/Dd day')from emp where deptno = 20;

/*
-- 시간 출력 형식의 종류

AM 또는 PM : 오전, 오후 시간 표시 
A.M 또는 P.M : 오전, 오후 시간 표시 
HH 또는 HH12 : 시간(1 ~ 12) 
HH24 : 24시간 으로 표시 ( 0 ~ 23)
MI :  분
SS :  초
*/
select to_char(sysdate, 'yyyy/mm/dd, hh24:mi:ss') from dual;
select to_char(sysdate, 'yyyy/mm/dd, hh12:mi:ss') from dual;

/*
 to_char : 숫자형을 문자형으로 변환 
 
 숫자 출력 형식
    0  --> 자릿수를 나타내며 자릿수가 맞지 않을 경우 0으로 채운다. 
    9  --> 자릿수를 나타내며 맞지 않아도 경우 0으로 채운다.
    L  --> 각 지역별 통화 기호를 앞에 표시한다. $,￦ 
    .  --> 소수점
    ,  --> 천 단위 자리 구분 ex)1,000
    
 
    
 숫자                 형식                  결과
 
 12345.67           999,999,999           12,345.67  
 12345.67           999999                12345  
 12345.67           $999,999,999          $12,345,67
 12345.67           L999,999,999          ￦12,345,67
 12345.67           S999,999,999          +12,345,67
*/
select ename, sal from emp where deptno=10; 
select ename, sal, to_char(sal,'L999,999') from emp where deptno=10;
select ename, sal, to_char(sal,'$999,999') from emp where deptno=10;

-- 올해 며칠이 지났는지 날짜를 계산하여 출력하시오. 
select sysdate - '2022/01/01' from dual; -- 오류발생함
select trunc(sysdate-TO_DATE('2022/01/01','YYYY/MM/DD')) from dual;
select sysdate-TO_DATE('2022/01/01','YYYY/MM/DD') from dual;

/*
    일반함수(기타 함수)
    NVL : 첫번째 인자로 받은 값이 NULL과 같으면 두 번째 인자 값으로 변경
    DECODE : 첫번째 인자로 받은 값을 조건에 맞춰  변경 (if 조건문과 유사함)
    CASE : 조건에 맞는 문장을 수행함(switch 문과 유사함)
*/
--NVL : NULL 값을 다른 값으로 변환하는 함수
--      NULL을 0 또는 다른 값으로 변환하기 위해서 사용하는 함수
select ename, sal, comm, job from emp order by job; -- order by 하고 생략하면 자동 오름차순 내림차순으로 생략 불가능 

--유일 하게 상관이 없는 사원이 있는 이 사람이 CEO다.
--mgr 의 NULL값을 CEO로 변환하여 출력하시오.
select ename, mgr from emp;
-- 1.숫자 데이터를 문자열로 변환 2.Null값을 ceo로 변경한다.
select ename , NVL(to_char(mgr,'9999'),'CEO') from emp;


-- 연봉을 계산하기 위해서 급여에 12를 곱한 수 커미션을 더 해보면 어떻게 될까?
select ename, sal, sal*12, sal*12+comm job from emp order by job;
select ename, sal, sal*12, sal*12+NVL(comm,0) job from emp order by job;

select deptno from emp; 
select distinct(deptno) from emp;
select deptno, dname from dept;
select * from emp;

/*
-- 조건에 맞는 문을 선택하기 위한 함수 
-- SWICH CASE 문과 같이 여러가지 경우에 대해서 선택 할 수 있는 함수 
-- DECODE(표현식, 조건1, 결과1,
                 조건2, 결과2,
                 조건3, 결과3
                 기본결과 n)
*/
select deptno, decode(deptno, 10, 'ACCOUNTING',
                              20, 'RESERARCH',
                              30, 'SALES',
                              40, 'OPPERATIONS') AS DNAME from emp;

/*
 CASE : 조건에 따라 서로 다른 처리가 가능한 함수 
        CASE 표현식 WHEN 조건1 THEN 결과1,
             표현식 WHEN 조건2 THEN 결과2,
             표현식 WHEN 조건3 THEN 결과3,          
             ELSE  결과 n
        END
*/
select deptno, 
            CASE WHEN deptno = 10 THEN 'ACCOUNTING'
                 WHEN deptno = 20 THEN 'RESERARCH'
                 WHEN deptno = 30 THEN 'SALES'          
                 WHEN deptno = 40 THEN 'OPPERATIONS'     
                 end 
                 dname from emp;
                 
-- 문 직급에 따라 보너스를 지급 하기 위해 직급이 'MANAGER'인 사원은 15% 인상하고 
-- 직급이 'CLERK'인 사원은 5% 인상하도록 처리하시오. (DECODE,CASE 함수 사용)
select * from emp;

select ename, job, DECODE(job, 'MANAGER', sal*1.15,
                               'CLERK', sal*1.05, sal) AS "UP SAL" from emp;                 
    
select ename, sal, 
                case WHEN job = 'MANAGER' then sal*1.15
                     when job = 'CLERK' then sal*1.05
                     else sal
                     end as "UP SAL" from emp;
                     

select * from emp;
select sum(sal) from emp;
select avg(sal) from emp;
select trunc(sal) from emp;
select round(sal) from emp;
select MAX(sal), MIN(sal) from emp;
select count(comm) from emp;
select count(*), count(comm) from emp; 
select count(comm) from emp where deptno =10;
select count(distinct(job)) from emp;

/*
GROUP BY 절
    특정 컬럼 값을 기준으로 테이블을 그룹별로 나누기 위해서 
    형식 : select 컬럼명, 그룹 함수 from 테이블명 where 조건식 group by 컬럼명 
    group by 컬러명 그룹의 조건을 주고 싶으면 HAVING 절이 사용한다.
*/
-- 사원들을 부서번호로 기준으로 3개 
select deptno, sum(sal), avg(sal), max(sal), min(sal) from emp  group by deptno ; 
select deptno, trunc(avg(sal)) from emp group by deptno Having avg(sal) >= 2000;
select deptno, max(sal), min(sal) from emp group by deptno Having max(sal) >= 2900;

select * from tab;
show user;

-- ddl(data definition language) dml(data manipulation language) dcl(data contorl language)
/*
새로운 테이블을 만들때
crate table 테이블명( 
 컬럼명 데이터 자료형,
 컬럼명 데이터 자료형, 
 컬럼명 데이터 자료형,
 );
 데이터 자료형
 char : 고정길이 문자 데이터 최소 크기 1 ~ 2000byte까지 커버 가능
 varchar2 : 가변길이 문자 데이터 실제입력 된 문자열을 길이만큼 저장함  최소크기는 1 ~ 4000byte까지 커버 가능
 number : 숫자형 데이터 저장 최대 40자리 까지 저장 할 수 있다. 소수점이나 부호는 길이에 포함 시키지 않는다.
 number(w) : 지정한 자리까지 수치로 최대 38까지 가능함  
 number(w, d): w = 전체 자리수 d = 소수점 이하 자릿수 이며 소수점은 자릿수에 포함되지 않는다. 
 date : 날짜 데이터를 저장 (기원전, 기원후 )
 long : 가변길이 문자형 데이터 타입, 최대크기 : 2Gbyte
 lob : 2Gbyte 까지의 가변길이 바이너리 데이터를 저장시킴( 바이너리데이터: 이미지 파일, 실행파일 여러가지문서 파일)
 rowid : 데이터베이스에 저장되어 있지 않으며 데이터베이스 데이터도 아니다. 
*/

select * from emp;

select ROWID from emp where rownum <=5;

/*
테이블명과 컬럼명을 부여하기(grant) 위한 규칙
 - 반드시 문자로 시작해야한다.
 - 크기는 1 ~ 30자 까지 가능하다.
 - A ~ z 까지의 대소문자, 0 ~ 9까지의 숫자, 특수문자 _ , $, # 만 가능함
 - 공백을 허용 하지 않음
 - 예약어나 테이블명 중복 불가
*/

create table emp01 (
empno number(4),
ename varchar2(20),
sal number(7, 2)
);

desc emp01;

-- 테이블을 만들떄는 ddl  데이터를 넣을때는 DML
select * from emp01;
insert into emp01(empno, ename, sal) -- 컬럼명을 생략할수 있따 
            values(1111, 'gildonghong',5000);

insert into  emp01 values(2222, 'ceo',7000); -- values(값의 위치가 서로 바뀌면 안된다.)
       
select * from emp02;

-- copy문 쓰지않고 복사 하기 
create table emp02 as
select * from emp;
desc emp02;

select * from dept;

/*
alter table로 테이블 구조 변경
    - table에서 컬럼의 추가, 삭제, 변경(자료형, 길이)할때 사용한다. 
    - ADD COLUM 절을 사용하여 새로운 컬럼 추가
    - MODIFY COLUM 절을 사용하여 기존 컬럼을 수정한다.
    - DROP COLUM 절을 사용하여 기존 컬럼을 삭제한다.
*/
desc emp01;

-- alter table 테이블명 add(colum명 데이터타입);
alter table emp01 add(job varchar2(9));

/*
-- alter table 테이블명 add(colum명 데이터타입);


-- alter table 테이블명 modify(colum명 데이터타입);
    -해당 컬럼에 자료가 없는 경우
    1.컬럼의 데이터 타입을 변경 할 수 있다. 
    2.컬럼의 크기를 변경 할 수 있다.
    
    -해당 컬럼에 자료가 있는 경우
    1.크기를 늘릴 수는 있지만 현재 가지고 있는 데이터 크기보다 작은 크기로 변경 할 수 없다.
    
-- alter table 테이블명 drop column 컬럼명;
        
*/

--job의 데이터 타입의 크기를 30으로 변경 
alter table emp01 modify(job varchar2(30));
desc emp01;

--job을 삭제 해라
alter table emp01 drop column job;

/*
    DROP TABLE 테이블명
    drop table 명령문은 기존 테이블을 삭제한다.
    테이블을 삭제하면 테이블에 저장되어 있는 데이터도 함께 삭제된다.
    제거된 데이터는 복구할 수 없다. (신중에 신중을 가하라)     
*/
drop table emp01;

select * from tab; --tab table의 줄임말

-- 휴지통 구조 보는법
desc recyclebin; 

-- 휴지통 검색
select * from recyclebin;

-- 휴지통을 비우고 싶다 하면 
purge recyclebin;

-- 삭제된 테이블 복원
-- flashback table  휴지통    to before drop; 


-- 테이블 이름 변경 rename문
-- 형식 : rename 기존 테이블명 to 새로운 테이블명
rename emp02 to emp03;

select * from emp03;

-- 테이블안에 모든데이터를 삭제하겠다 delete
delete from emp03;
rollback; -- 복구

/*
--테이블의 모든 행을 제거
TRUNCATE 롤백이 안됨
TRUNCATE 실행되지 않을때 가 있다 테이블이 2개 이상 연결되있을때(참조되고있을때)
TRUNCATE table emp03;
*/

TRUNCATE table emp03;
--------------------------------위 까지 한게 DDL(데이타 정의어)--------------------------------------------------------------------------


----------------------------------------------START DML(데이터 조작어) -----------------------------------------------------------------

