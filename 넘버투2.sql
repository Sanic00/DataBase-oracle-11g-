--2022-06-28 ������ ��� 
create user javauser identified by java;
grant connect, RESOURCE to javauser;
revoke connect, resource from javauser;
select * from tab;
-- ���࿡�� �並 ���� �� �ִ� ������ �ش�.
grant create view to scott;

--2022-06-29
create tablespace scott_data datafile 'c:\ora\scott_data.dbf'size 10m;

--��� ����
create user backupuser identified by backup1234 default tablespace scott_data;
-- ���� �شٿ�
grant connect,resource to backupuser;
--Grant��(��) �����߽��ϴ�.
commit;
-- �ݿ����ַ��� 

-- ����� ������ cmd���� �̷������.


----�̷��� �� �Ϸ��ϸ� cmd�� ���� sqlpuls ����ڸ� / ��й�ȣ �Է� -> exit ������ �Ǵ��� Ȯ��
--- cd\ -> exp scott/tiger file = c:\ora\scott_data.dmp log = c:\ora\scott_data.log
----imp �Է��� -> ����ڸ� ��й�ȣ �Է� -> import �Ҳ��� ��� yes���� -> �׸��� c:\ora\scott_data.dmp -> ���� ũ�⸦ �Է��϶� �� 
--- �ּ�ġ 8192�� �Է��� -> ����Ʈ ���� ���� ǥ�� no ->  ���� ���� ���� no -> ���Ѻο� ����Ʈ yes -> ���̺� ������ ����Ʈ yes �Է�
--- �ͽ���Ʈ ���� ��ü ����Ʈ yes -> sqlplus backupser/ backup1234 -> select * from tab; <- �̰� ���� ������ �ٽ��Ѵ��� 

------------------------------2022-06-30---------------------------------------------
/*
���̺� �����ϴ°���
cd\ -> sqlplus scott/tiger -> create table test(
                            id number(2) primary key,
                            name varchar2(10) not null,
                            regdate date default sysdate
                            ); - ���̺� ������
     insert into test (id,name) values(1,'ȫ�浿'); -> ���̺� �ȿ� ����1
     insert into test (id,name) values(2,'�����'); -> ���̺� �ȿ� ����2
     select * from test; -> ������ Ȯ�� 
     ������� exit ������
     
     cd\ -> exp scott/tiger tables=test file=c:\ora\scott_test.dmp log=c:\ora\scott_test_exp.log �ϰ�
     imp -> backupuser ġ�� backup1234 -> �����͸�����Ʈ no -> ����Ʈ ���� c:\ora\scott_test.dmp -> ����ũ�� 8192
     ����Ʈ ���� ���� ǥ�� no -> ��ü����� ���� �������� ���� no -> ���Ѻο� yes -> ���̺� ������ ����Ʈ yes -> �ͽ���Ʈ ���� ��ü ����Ʈ yes 
     sqlplus backupuser/backup1234 
     select * from tab; Ȯ���غ���
     
*/



