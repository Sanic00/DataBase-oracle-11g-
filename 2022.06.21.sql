
select * from dept;


--�÷� �̸��� ����ؼ� Ư�� �÷��� ����
-- ex) dept ���̺��� �μ���ȣ�� �μ��� ��� 
select deptno, dname from dept;

select * from emp;

/* emp ���̺��� ����̸��� �޿��� �Ի��ϸ��� ����ϴ� �������� �ۼ��Ͻÿ� */
select ename, sal, hiredate from emp; 

-- ��Ī : �÷��� ����� �ٷ� �ڿ� as ��� �� �� ��Ī(����, �г���)�� ��� (�Ͻ���) 
-- ��Ī���� ���鹮��, Ư������($, _(underbar),#)�� ���ڸ� ǥ���ϰ� �Ͱų� ��ҹ��ڸ� �����ϰ� ������  
-- ""(double quotes)�� ����Ͽ� ����Ѵ�.
-- as �����ϰ� ""�� ����Ͽ� ��Ī�� ����ϴ� ���� �����ϴ�.

select ename as "����̸�", sal as "�޿�", hiredate as "�Ի���" from emp;
select ename  "����̸�", sal  "�޿�", hiredate "�Ի���" from emp;

select deptno "DepartmenetNo", dname "DepartmentName" from dept;

-- DISTINCT : �ߺ��� �����͸�  �ѹ��� ����Ҷ� �����.

select job from emp;
select distinct job from emp;
select distinct deptno from emp;

-- where : ���� �� �񱳿����� 
-- select column from table where ���ǹ�;
-- �񱳿����� : =, >, <, >=, <=,(<>(�����ʴ�), !=(�����ʴ�), ^=(�����ʴ�)) 
select empno, ename, sal from emp where sal >= 3000;
-- ex) �޿��� 3000�̻� �޴� ����� ������� �����ȣ, ����̸�, �޿��� ����Ͻÿ�.

--���� 1�� ������̺��� �μ� ��ȣ�� 10�� ����� ���Ͽ� ��� ������ ����ض�.
select * from emp  where  deptno = 10;


--���� 2�� : ������̺��� �޿��� 2000�̸��� ����� ���Ͽ�  �����ȣ, �̸� , �޿��� ����ض�.
select empno, ename, sal from emp where sal <2000;

/*
���� ������ ��ȸ
- ���� �����ʹ� �ݵ�� �̱����� �ȿ� ǥ���ϰ�, ��ҹ��ڸ� �����Ѵ�.
*/
select ename from emp;
select * from emp where ename = 'SCOTT'; --�빮�ڸ� �빮�ڷ� �ҹ��ڸ� �ҹ��ڷ� ��ҹ��� ���� Ȯ���ϰ� �ؾߵ�

--���� 3�� : ����̸��� MILLER �� ����� ��ȣ�� �̸�, ������ ����Ͻÿ�.
select empno, ename , job  from emp where ename = 'MILLER';

/*
��¥ ������ ��ȸ
- ��¥ �����ʹ� �ݵ�� �̱����� �ȿ� ǥ���ϰ�, ��/��/�� �������� ����Ѵ�.
*/
--���� 4�� : �Ի����� 85�� ������ ����� ������ ����Ͻÿ�.
select ename, hiredate from emp where hiredate >= '1985/01/01';

/*
�� ������ 
AND  : �ΰ��� ������ ��� ������ �ؾ߸� �˻� �� �� ����
OR   : �ΰ��� ������ �Ѱ����� �����ϴ��� �˻� �� �� ���� 
NOT  : ���ǿ� �������� ���ϴ� �͸� �˻� �� �� ����
BETWEEN AND : Ư�� ���� ���� ���ϴ� �����͸� �˻� �ϰ��� �� �� �����
IN : ������ �÷��� ������ ���� �ϳ����� �˾ƺ����� �� �� �����
*/

-- �μ� ��ȣ�� 10���̰�, ������ MANAGER�� ����� ������ ����Ͻÿ�.
SELECT * FROM EMP WHERE DEPTNO=10 AND JOB = 'MANAGER';

--�޿��� 1000���� 3000 ������ ������� ������ ����Ͻÿ�.
SELECT * FROM EMP WHERE SAL >=1000 AND SAL <= 3000;
SELECT * FROM EMP WHERE SAL BETWEEN 1000 AND 3000;

-- �μ���ȣ�� 10�� �̰ų� ������ MANAGER�� ����� ������ ����Ͻÿ�.
SELECT * FROM EMP WHERE DEPTNO = 10 OR JOB ='MANAGER';

--��� ��ȣ�� 7844�̰ų� 7654 �̰ų� 7521�� ������ ������ ����Ͻÿ�.
select * from emp where empno = 7844 or empno = 7654 or empno = 7521;
select * from emp where empno in(7844,7654,7521);

/*
LIKE ������
- �˻� �ϰ��� �ϴ� ���� ��Ȯ�� �� ��� ���ϵ� ī��(2���������� �ִ�)�� �Բ� ����Ͽ�
    ���ϴ� ������ �˻��ϴ� ������
���ϵ� ī��
% : ���ڰ� ���ų�, �ϳ��̻��� ���ڰ� � ���� ���� ��� ����  -> ������ �϶� ���
_ : �ϳ��� ���ڰ� � ���� ���� ������� ->�Ѱ� �϶��� 
*/

-- ����� �̸��� K�� �����ϴ� ����� �˻��Ͽ� ������ ��� �Ͻÿ�.
select ename from emp where ename like 'K%';
-- %�� ��� ���� ���� �������.
select ename from emp where ename like 'M%';

-- �̸��߿� K�� ������ ����� ������ ���
select ename from emp where ename like '%K%'; 

-- �̸��� �ι�° ���ڰ� A�� ����� ���
select ename from emp where ename like '_A%';

-- �̸��߿� A�� ������ ����� ������ ���
select ename from emp where ename like '%A%';

-- �̸��߿� A�� �������� �ʴ� ����� ������ ���
select ename from emp where ename  not like '%A%';

-- Ŀ�̼��� NULL�� ����� ã�ƶ�
select comm from emp;
select comm from emp where comm is null; --NULL�� ���̱� ������ '' �� ������� �ʴ´�.
-- NULL �� ����Ǿ� �ִ� ��쿡�� = �����ڴ� ��� �� �� ����.

/*
 NULL�� ���� ������
 ����Ŭ������ �÷��� NULL���� ����Ǵ� ���� �����
 NULL�� ��Ȯ��, �� �� ���� ���� �ǹ���
 0�� ������� �ƴ� � ���� �����ϱ�� ������, � ������ �˾� �� �� ���� ���� �ǹ���.
 NULL  �� ����, �Ҵ�, �񱳰� �Ұ����ϴ�.

is null �� is not null (�ΰ����� �ִ�)
 - Ư�� �÷� �������� ���� ��쿡�� �񱳿�����(=)�� ������� �ʰ� is null �����ڸ� �����
 - null ���� �ƴ����� �˾ƺ����� �� ���� �񱳿�����(<>)�� ������� �ʰ�  is not null �����ڸ� �����
 
  is null : null �̸� ����
  is not null : null �� �ƴϸ� ����
*/

select 100 + null from dual;
--Ŀ�̼��� ���� �ʴ� ���
select ename, comm from emp where comm is null;
-- Ŀ�̼��� �޴� ��� 
select ename, comm from emp where comm is not null;

--�ڽ��� ���ӻ���� ���� ����� �̸��� ���ް� ���� ����� ��� ��ȣ�� ����Ͻÿ�.

select * from emp;
select ename, job from emp where mgr is null;

/*
������ ���� order by ��

order by ���� �ο�(��)�� ���� �ϴµ� �����
������ �ǵڿ� ��� �ϸ� ������ ������ �Ǵ� �÷�  �̸� �Ǵ� select ������ ��õ� ��Ī�� �����

  ����         ��������(asc)                ��������(desc)
- ����        ���� �� ���� ����               ū �� ���� ����
- ����        ���� ������ ����                �����ݴ� ������ ����   
- ��¥        ���� ��¥ �������              ���� ��¥ ������   
- NULL       ���� �������� ����              ���� ���� ����

 �������� ��� �ҹ��ڸ� ���� ū ������, null���� ��� �� �� ���� ���� ������ �ν���
*/

-- �����ȣ�� �������� �������� ���� �Ͻÿ� ��������(asc)�� ������ �����ϴ�! 
select * from emp order by empno asc;
select * from emp order by empno ;
--�����ȣ�� �������� �������� ���� �Ͻÿ�. ��������(desc)�� ���� �Ұ�����
select empno from emp order by empno desc;

-- ����] ����� �����ȣ, �̸�, �޿��� �޿��� ���� ������ ����Ͻÿ�.
select empno, ename, sal from emp order by sal desc;

-- ����] �Ի����� ���� �ֱ��� ��� ������ ��� ��ȣ, �̸�, �Ի����� ����Ͻÿ�.
select empno, ename, hiredate from emp order by hiredate desc;

/*
sql                                     sqlplus
���� ǥ�� DB���                          ����Ŭ������ ����ϴ� ���
DB�� �����͸� ���� �� �� ����               DB�� �����͸� ���� �� �� ����.
��� ��ɾ��� ���� �����ݷ����� ����          ��� ��ɾ�� ����Ű�� ���� ����(;���� ������)
�� ��� �� �� ����                     ��� ��� ����
*/
select * from emp where deptno = 10;


/*
������ �Լ� 
- �ึ�� �Լ��� ����Ǿ� ����� �ݿ��ϴ� �Լ�
������ �Լ��� ���� 
1. ���� �Լ� : ���� ���� �ٸ� ���·� ��ȯ�Ͽ� ��Ÿ��
2. ���� �Լ� : ���� ���� �ٸ� ���·� ��ȯ�Ͽ� ��Ÿ��
3. ��¥ �Լ� : ��¥ ���� �ٸ� ���·� ��ȯ�Ͽ� ��Ÿ��
4. ��ȯ �Լ� : ����, ����, ��¥ ���� ���� �ٸ� Ÿ������ ��ȯ�Ͽ� ��Ÿ��
5. �Ϲ� �Լ� : ��Ÿ�Լ� 

�׷� �Լ�
- �ϳ� �̻��� ���� �׷����� ���� �����Ͽ� �ϳ��� ����� ��Ÿ��
�׷� �Լ��� ����
1. SUM : �׷��� ���� �հ踦 ���Ѵ�.
2. AVG : �׷��� ����� ����
3. COUNT : �׷��� �� �� ���� ����
4. MAX : �׷��� �ִ밪�� ���� 
5. MIN : �׷��� �ּҰ��� ����
6. STDDEV(standard xx) : �׷��� ǥ�������� ����
7. VARIANCE : �׷��� �л��� ����
*/

/*
���� �Լ� : ���ڿ��� �ٸ� ���·� ��ȯ�Ͽ� ��Ÿ�� 
        �������� ���� �����Ͽ� ��ȯ�� ���� ���� ��ȯ��
        
        LOWER : �ҹ��ڷ� ��ȯ
        UPPER : �빮�ڷ� ��ȯ
        INITCAP : ù���ڸ� �빮�ڷ� ��ȯ
        CONCAT : ������ ���� ����
        SUBSTR : ���ڸ� �߶� ���� 
        SUBSTRB : ���ڸ� �߶� ����
        LENGTH : ������ ���̸� ��ȯ 
        LENGHTHB : ������ ���̸� ��ȯ
        INSTR : Ư�������� ��ġ ���� ��ȯ  
        INSTRB : Ư�� ������ ��ġ ���� ��ȯ
        LPAD,RPAD : �Է¹��� ���ڿ��� ��ȣ�� �����Ͽ� Ư�� ���ڿ��� ���̸� ��ȯ ��
        TRIM : �߶󳻰� ���� ���ڸ� ǥ���� 
        CONVERT : ���� ���� ��ȯ��
        CHR : ASCII�ڵ� ������ ��ȯ
        ASCII : ASCII �ڵ� ���� ���ڷ� ��ȯ
        REPLACE : ���ڿ����� Ư�� ���ڸ� ������
*/
SELECT 'DataBase' , LOWER ('DataBase') from dual;
select ename, LOWER(ename) from emp;

SELECT 'DataBase' , UPPER ('DataBase') from dual;

--������ manager�� ����� �˻��Ͻÿ� 

select empno, ename, job from emp where LOWER(job) = 'manager';

-- ù ���ڸ� �빮�ڷ� ��ȯ
select INITCAP('DATA BASE PROGRAMING') from dual; 

-- ��� ���̺��� 10�� �μ� �Ҽ��� ������̸��� ù ���ڸ� �빮�ڷ� ��ȯ�Ͻÿ�

select empno, INITCAP(ename), deptno from emp where deptno = 10;;


-- 'Smith' �� �̸��� ���� ����� ���, �̸�, �޿��� Ŀ�̼��� ����Ͻÿ�.

select empno, ename, sal, comm from emp where initcap(ename) = 'Smith';

-- CONCAT : �� ���ڸ� ����

select concat('Data', 'Base') from dual;


-- LENGTH : ������ ���̸� ��ȯ 
 --LENGHTHB : ������ ���̸� ��ȯ
select length('DataBase'), length('�����ͺ��̽�') from dual;
select lengthb('DataBase'),lengthb('�����ͺ��̽�') from dual;

-- ��] 10�� �μ� �Ҽ� ������� �̸��� ���̸� ���Ͽ� ����Ͻÿ�.
select deptno, empno, ename, length(ename) from emp  where deptno =10;

--��1] ���� �� �̸��� 4������ ������ �̸��� �ҹ��ڷ� ����Ͻÿ�. 
select empno, lower(ename) from emp where length(ename) = 4;

/*
    INSTR : Ư�������� ��ġ ���� ��ȯ  
    INSTRB : Ư�� ������ ��ġ ���� ��ȯ
*/
-- ��� �ڹ� �ε����� �ٸ��� 0���� ������ �ƴ� 1���� ����
select instr('DataBase', 'a') from dual;
--in = index str= start ��
select instr('DataBase', 'a',3 ,2) from dual; -- ���ڰ� �ǹ��ϴ°� ������ġ ����

select instr('�����ͺ��̽�', '��', 3) from dual;

select instrb('�����ͺ��̽�', '��',3, 2) from dual; 

-- SUBSTR : ���ڸ� �߶� ���� -> (���ڿ� �Ϻθ� �����ϴ� �Լ�)
-- SUBSTRB : ���ڸ� �߶� ���� 

select substr('DataBase', 1, 3) from dual; --����1�� ������ġ 3�� ã�� ����
--select substr('��� ���ڿ�', ������ġ, ������ ����)
select substr('DataBase', -4, 3) from dual; 

-- ��� ���̺��� 20�� �μ� ����� �� �Ի�⵵�� �����Ͻÿ�.
select ename, hiredate, substr(hiredate, 1,2) from emp where deptno = 20;

-- �μ���ȣ�� 20�� 87�⵵�� �Ի��� ����� ������ ����Ͻÿ�.
select * from emp;
select ename, substr(hiredate,1,2) from emp where deptno = 20 and substr(hiredate, 1,2) = 87 ; 

select substr('�����ͺ��̽�', 3, 4) from dual;
select substrb('�����ͺ��̽�', 3, 4) from dual;

-- L = LEFT , R=RIGHT
-- LPAD,RPAD : �Է¹��� ���ڿ��� ��ȣ�� �����Ͽ� Ư�� ���ڿ��� ���̸� ��ȯ��
select LPAD('DataBase', 20 , '@') from dual; --���ڰ� ���� Ư�������� ������ ���ڸ� ä����ִ�. L�� ���ʺ��� ä������ R�� ���������� ä����
select RPAD('data', 10, '!') from dual;

select ename from emp where ename='SMITH';

select ename, trim('S'  from ename), trim('H' from ename) from emp where ename = 'SMITH';

select ename, Ltrim('aaaaOracle 11', 'a'), Rtrim('Orcale 11 aaaaa', 'a') from emp where ename = 'SMITH';

select ename, Ltrim('       Oracle 11'        ), Rtrim('Orcale 11       ', '') from emp where ename = 'SMITH';

--BOTH : ���� �������� trim�� �⺻���� both

-- ���� �Լ� : ������ �����͸� �����Ͽ� ��ȯ�� ���� ��

/*
 abs(����) , cos(�ڻ���) , exp(�ڿ��α�), floor, log, power(2��3��), sign(�����Լ�), sin(����),  tan(tangent)
 round(�ݿø��Լ�), trunc(�߶󳻴� ����), mod(%������ ������) 
*/
select abs(-15) from dual; 

select cos(90) from dual;
select sin(90) from dual;
select tan(1) from dual;

select floor(34.5678) from dual; -- �Ҽ������� �� ��������

select trunc(34.5678, 2) from dual;  -- �ڿ� �Ҽ��� ���� � �ڸ�����
select trunc(34.5678, -1) from dual;  --��� 30�� ���� why? �Ҽ����� �������� �ؼ� + ������� - �������� �̵��Ѵ�.

--Ư�� �ڸ����� ������ �ݿø��ϴ� �Լ�(round)
--round(���, ǥ���� �ڸ���)
select round(34.5678) from dual; -- �ݿø� 
select round(34.5678, 2) from dual; -- �ݿø� 

select
round(35.12 , 1),   -- �Ҽ��� ���� 2��° �ڸ����� �ݿø� ��
round(21.125 , 2),    -- �Ҽ��� ���� 3��° �ڸ����� �ݿø� ��
round(47.51),         --  �Ҽ��� ���� 0��° �ڸ����� �ݿø� ��
round(834.12 , -1),    -- �ι�° ���ڰ��� �����̸� ���� �ڸ����� �ݿø� (-1�� ���� �������� �ݿø��� ��) 
round(653.54, -2)       -- ���� �ڸ����� �ݿø� �� 
from dual;


select power(3, 2) from dual;
select mod(34, 2) from dual;
select mod(34, 5) from dual;

����1] ����� ¦���� ������� �����ȣ, �̸�, ������ ����Ͻÿ�
select * from emp;
select empno, ename, job from emp where mod(empno, 2) = 0;  

-- ��¥ �Լ� : ��¥ ���� �ٸ� ���·� ��ȯ�Ͽ� ��Ÿ��
/*
- sysdate(���� �ý��� ��¥), months_between(�γ�¥ ���̿� �������), add_months(�������� ���Ҷ�), next_day(������¥)
, last_day(���� ������ ��¥), round(Ư���� ������ ��Ƽ� �ݿø� ��), trubc(Ư���� ��¥�� ����)
*/
select sysdate from dual;   --���� ��¥
select sysdate-1 from dual;  -- ������ ��¥�� �������� ���� 
select sysdate +1 from dual; --������ ��¥�� �������� ����
 
��] �μ���ȣ�� 10�� ����� ������� �Ի��� ���κ��� ���ñ��� ��ĥ�� �����°�
select ename, hiredate, sysdate - hiredate from emp;
select ename, hiredate, months_between(sysdate , hiredate) from emp  where deptno = 10;


--�Ի��Ϸ� ���� 3������ ���� ��¥�� �˾ƺ��� 
select hiredate ,add_months(hiredate, 3) from emp;
select hiredate ,add_months(hiredate, 12) from emp;

--1. �Ͽ��� 2.������ 3.ȭ���� 4.������.........
select sysdate, next_day(sysdate, 4) from dual;
select sysdate, next_day(sysdate, '������') from dual; 
select sysdate, next_day(sysdate, '��') from dual;
select sysdate, next_day(sysdate, 'wednesday') from dual;

ALTER SESSION SET NLS_LANGUAGE = AMERICAN; -- �����϶� 
select sysdate, next_day(sysdate, 'wednesday') from dual;
ALTER SESSION SET NLS_LANGUAGE = KOREAN; -- �ѱ��϶�

--LAST_DAY : �ش� ���� ������ ��¥�� ��ȯ��
select sysdate, last_day(sysdate) from dual;

--trunc : ��¥�� �߶� 
select hiredate from emp where deptno = 10;
select hiredate, trunc(hiredate, 'MONTH') from emp where deptno = 10;

--ROUND : �Լ��� ����(format) ���� �����ϸ� ���� �̿��� ��¥�� ���ؼ��� �ݿø��� ���� �� �� �ִ�.
--round(date, 'MONTH');
select hiredate, round(hiredate, 'month') from emp where deptno = 10; 

/*
��¥ round ������
�� : 7�� 1 ���� �ݿø� ��
�� : 16���� �������� �ݿø�
�� : �� �ְ� ���۵Ǵ� ��¥
�ð�: ���� �������� �ݿø�
*/

/*
��ȯ�Լ� : �ڷ����� ��ȯ ��Ű���� �� �� ����ϴ� �Լ�
1. TO_CHAR : ��¥�� �Ǵ� �������� ���������� ��ȯ�ϰ��� �� ��
2. TO_DATE : �������� ��¥������ ��ȯ �ϰ��� �Ҷ� 
3. TO_NUMBER : �������� ���������� ��ȯ �ϰ��� �Ҷ�
*/

-- TO_CHAR (��¥ ������, '�������')

--������� ���� 
--YYYY : �� �� ǥ�� (4�ڸ�)
--YY : �� �� ǥ�� (2�ڸ�)
--MM : ���� ���ڷ� ǥ�� 
--MON : ���� ���ĺ����� ǥ�� 
-- DD : ���� ǥ��
-- DAY : ���� ǥ��
-- DY : ������ ���� ǥ�� ex)������ -> ��

select hiredate, TO_CHAR(hiredate, 'YYYY/MM/DD day')from emp where deptno = 20;
select sysdate, to_char(sysdate, 'yyyy-mm-dd dy') from dual;
select sysdate, TO_CHAR(hiredate, 'YYYY/Mon/Dd day')from emp where deptno = 20;

/*
-- �ð� ��� ������ ����

AM �Ǵ� PM : ����, ���� �ð� ǥ�� 
A.M �Ǵ� P.M : ����, ���� �ð� ǥ�� 
HH �Ǵ� HH12 : �ð�(1 ~ 12) 
HH24 : 24�ð� ���� ǥ�� ( 0 ~ 23)
MI :  ��
SS :  ��
*/
select to_char(sysdate, 'yyyy/mm/dd, hh24:mi:ss') from dual;
select to_char(sysdate, 'yyyy/mm/dd, hh12:mi:ss') from dual;

/*
 to_char : �������� ���������� ��ȯ 
 
 ���� ��� ����
    0  --> �ڸ����� ��Ÿ���� �ڸ����� ���� ���� ��� 0���� ä���. 
    9  --> �ڸ����� ��Ÿ���� ���� �ʾƵ� ��� 0���� ä���.
    L  --> �� ������ ��ȭ ��ȣ�� �տ� ǥ���Ѵ�. $,�� 
    .  --> �Ҽ���
    ,  --> õ ���� �ڸ� ���� ex)1,000
    
 
    
 ����                 ����                  ���
 
 12345.67           999,999,999           12,345.67  
 12345.67           999999                12345  
 12345.67           $999,999,999          $12,345,67
 12345.67           L999,999,999          ��12,345,67
 12345.67           S999,999,999          +12,345,67
*/
select ename, sal from emp where deptno=10; 
select ename, sal, to_char(sal,'L999,999') from emp where deptno=10;
select ename, sal, to_char(sal,'$999,999') from emp where deptno=10;

-- ���� ��ĥ�� �������� ��¥�� ����Ͽ� ����Ͻÿ�. 
select sysdate - '2022/01/01' from dual; -- �����߻���
select trunc(sysdate-TO_DATE('2022/01/01','YYYY/MM/DD')) from dual;
select sysdate-TO_DATE('2022/01/01','YYYY/MM/DD') from dual;

/*
    �Ϲ��Լ�(��Ÿ �Լ�)
    NVL : ù��° ���ڷ� ���� ���� NULL�� ������ �� ��° ���� ������ ����
    DECODE : ù��° ���ڷ� ���� ���� ���ǿ� ����  ���� (if ���ǹ��� ������)
    CASE : ���ǿ� �´� ������ ������(switch ���� ������)
*/
--NVL : NULL ���� �ٸ� ������ ��ȯ�ϴ� �Լ�
--      NULL�� 0 �Ǵ� �ٸ� ������ ��ȯ�ϱ� ���ؼ� ����ϴ� �Լ�
select ename, sal, comm, job from emp order by job; -- order by �ϰ� �����ϸ� �ڵ� �������� ������������ ���� �Ұ��� 

--���� �ϰ� ����� ���� ����� �ִ� �� ����� CEO��.
--mgr �� NULL���� CEO�� ��ȯ�Ͽ� ����Ͻÿ�.
select ename, mgr from emp;
-- 1.���� �����͸� ���ڿ��� ��ȯ 2.Null���� ceo�� �����Ѵ�.
select ename , NVL(to_char(mgr,'9999'),'CEO') from emp;


-- ������ ����ϱ� ���ؼ� �޿��� 12�� ���� �� Ŀ�̼��� �� �غ��� ��� �ɱ�?
select ename, sal, sal*12, sal*12+comm job from emp order by job;
select ename, sal, sal*12, sal*12+NVL(comm,0) job from emp order by job;

select deptno from emp; 
select distinct(deptno) from emp;
select deptno, dname from dept;
select * from emp;

/*
-- ���ǿ� �´� ���� �����ϱ� ���� �Լ� 
-- SWICH CASE ���� ���� �������� ��쿡 ���ؼ� ���� �� �� �ִ� �Լ� 
-- DECODE(ǥ����, ����1, ���1,
                 ����2, ���2,
                 ����3, ���3
                 �⺻��� n)
*/
select deptno, decode(deptno, 10, 'ACCOUNTING',
                              20, 'RESERARCH',
                              30, 'SALES',
                              40, 'OPPERATIONS') AS DNAME from emp;

/*
 CASE : ���ǿ� ���� ���� �ٸ� ó���� ������ �Լ� 
        CASE ǥ���� WHEN ����1 THEN ���1,
             ǥ���� WHEN ����2 THEN ���2,
             ǥ���� WHEN ����3 THEN ���3,          
             ELSE  ��� n
        END
*/
select deptno, 
            CASE WHEN deptno = 10 THEN 'ACCOUNTING'
                 WHEN deptno = 20 THEN 'RESERARCH'
                 WHEN deptno = 30 THEN 'SALES'          
                 WHEN deptno = 40 THEN 'OPPERATIONS'     
                 end 
                 dname from emp;
                 
-- �� ���޿� ���� ���ʽ��� ���� �ϱ� ���� ������ 'MANAGER'�� ����� 15% �λ��ϰ� 
-- ������ 'CLERK'�� ����� 5% �λ��ϵ��� ó���Ͻÿ�. (DECODE,CASE �Լ� ���)
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
GROUP BY ��
    Ư�� �÷� ���� �������� ���̺��� �׷캰�� ������ ���ؼ� 
    ���� : select �÷���, �׷� �Լ� from ���̺�� where ���ǽ� group by �÷��� 
    group by �÷��� �׷��� ������ �ְ� ������ HAVING ���� ����Ѵ�.
*/
-- ������� �μ���ȣ�� �������� 3�� 
select deptno, sum(sal), avg(sal), max(sal), min(sal) from emp  group by deptno ; 
select deptno, trunc(avg(sal)) from emp group by deptno Having avg(sal) >= 2000;
select deptno, max(sal), min(sal) from emp group by deptno Having max(sal) >= 2900;

select * from tab;
show user;

-- ddl(data definition language) dml(data manipulation language) dcl(data contorl language)
/*
���ο� ���̺��� ���鶧
crate table ���̺��( 
 �÷��� ������ �ڷ���,
 �÷��� ������ �ڷ���, 
 �÷��� ������ �ڷ���,
 );
 ������ �ڷ���
 char : �������� ���� ������ �ּ� ũ�� 1 ~ 2000byte���� Ŀ�� ����
 varchar2 : �������� ���� ������ �����Է� �� ���ڿ��� ���̸�ŭ ������  �ּ�ũ��� 1 ~ 4000byte���� Ŀ�� ����
 number : ������ ������ ���� �ִ� 40�ڸ� ���� ���� �� �� �ִ�. �Ҽ����̳� ��ȣ�� ���̿� ���� ��Ű�� �ʴ´�.
 number(w) : ������ �ڸ����� ��ġ�� �ִ� 38���� ������  
 number(w, d): w = ��ü �ڸ��� d = �Ҽ��� ���� �ڸ��� �̸� �Ҽ����� �ڸ����� ���Ե��� �ʴ´�. 
 date : ��¥ �����͸� ���� (�����, ����� )
 long : �������� ������ ������ Ÿ��, �ִ�ũ�� : 2Gbyte
 lob : 2Gbyte ������ �������� ���̳ʸ� �����͸� �����Ŵ( ���̳ʸ�������: �̹��� ����, �������� ������������ ����)
 rowid : �����ͺ��̽��� ����Ǿ� ���� ������ �����ͺ��̽� �����͵� �ƴϴ�. 
*/

select * from emp;

select ROWID from emp where rownum <=5;

/*
���̺��� �÷����� �ο��ϱ�(grant) ���� ��Ģ
 - �ݵ�� ���ڷ� �����ؾ��Ѵ�.
 - ũ��� 1 ~ 30�� ���� �����ϴ�.
 - A ~ z ������ ��ҹ���, 0 ~ 9������ ����, Ư������ _ , $, # �� ������
 - ������ ��� ���� ����
 - ���� ���̺�� �ߺ� �Ұ�
*/

create table emp01 (
empno number(4),
ename varchar2(20),
sal number(7, 2)
);

desc emp01;

-- ���̺��� ���鋚�� ddl  �����͸� �������� DML
select * from emp01;
insert into emp01(empno, ename, sal) -- �÷����� �����Ҽ� �ֵ� 
            values(1111, 'gildonghong',5000);

insert into  emp01 values(2222, 'ceo',7000); -- values(���� ��ġ�� ���� �ٲ�� �ȵȴ�.)
       
select * from emp02;

-- copy�� �����ʰ� ���� �ϱ� 
create table emp02 as
select * from emp;
desc emp02;

select * from dept;

/*
alter table�� ���̺� ���� ����
    - table���� �÷��� �߰�, ����, ����(�ڷ���, ����)�Ҷ� ����Ѵ�. 
    - ADD COLUM ���� ����Ͽ� ���ο� �÷� �߰�
    - MODIFY COLUM ���� ����Ͽ� ���� �÷��� �����Ѵ�.
    - DROP COLUM ���� ����Ͽ� ���� �÷��� �����Ѵ�.
*/
desc emp01;

-- alter table ���̺�� add(colum�� ������Ÿ��);
alter table emp01 add(job varchar2(9));

/*
-- alter table ���̺�� add(colum�� ������Ÿ��);


-- alter table ���̺�� modify(colum�� ������Ÿ��);
    -�ش� �÷��� �ڷᰡ ���� ���
    1.�÷��� ������ Ÿ���� ���� �� �� �ִ�. 
    2.�÷��� ũ�⸦ ���� �� �� �ִ�.
    
    -�ش� �÷��� �ڷᰡ �ִ� ���
    1.ũ�⸦ �ø� ���� ������ ���� ������ �ִ� ������ ũ�⺸�� ���� ũ��� ���� �� �� ����.
    
-- alter table ���̺�� drop column �÷���;
        
*/

--job�� ������ Ÿ���� ũ�⸦ 30���� ���� 
alter table emp01 modify(job varchar2(30));
desc emp01;

--job�� ���� �ض�
alter table emp01 drop column job;

/*
    DROP TABLE ���̺��
    drop table ��ɹ��� ���� ���̺��� �����Ѵ�.
    ���̺��� �����ϸ� ���̺� ����Ǿ� �ִ� �����͵� �Բ� �����ȴ�.
    ���ŵ� �����ʹ� ������ �� ����. (���߿� ������ ���϶�)     
*/
drop table emp01;

select * from tab; --tab table�� ���Ӹ�

-- ������ ���� ���¹�
desc recyclebin; 

-- ������ �˻�
select * from recyclebin;

-- �������� ���� �ʹ� �ϸ� 
purge recyclebin;

-- ������ ���̺� ����
-- flashback table  ������    to before drop; 


-- ���̺� �̸� ���� rename��
-- ���� : rename ���� ���̺�� to ���ο� ���̺��
rename emp02 to emp03;

select * from emp03;

-- ���̺�ȿ� ��絥���͸� �����ϰڴ� delete
delete from emp03;
rollback; -- ����

/*
--���̺��� ��� ���� ����
TRUNCATE �ѹ��� �ȵ�
TRUNCATE ������� ������ �� �ִ� ���̺��� 2�� �̻� �����������(�����ǰ�������)
TRUNCATE table emp03;
*/

TRUNCATE table emp03;
--------------------------------�� ���� �Ѱ� DDL(����Ÿ ���Ǿ�)--------------------------------------------------------------------------


----------------------------------------------START DML(������ ���۾�) -----------------------------------------------------------------

