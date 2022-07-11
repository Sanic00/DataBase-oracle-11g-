--2022-06-28 관리자 모드 
create user javauser identified by java;
grant connect, RESOURCE to javauser;
revoke connect, resource from javauser;
select * from tab;
-- 스콧에게 뷰를 만들 수 있는 권한을 준다.
grant create view to scott;

--2022-06-29
create tablespace scott_data datafile 'c:\ora\scott_data.dbf'size 10m;

--백업 유저
create user backupuser identified by backup1234 default tablespace scott_data;
-- 권한 준다요
grant connect,resource to backupuser;
--Grant을(를) 성공했습니다.
commit;
-- 반영해주려구 

-- 백업과 복원은 cmd에서 이루어진다.


----이렇게 다 완료하면 cmd로 들어가서 sqlpuls 사용자명 / 비밀번호 입력 -> exit 접속이 되는지 확인
--- cd\ -> exp scott/tiger file = c:\ora\scott_data.dmp log = c:\ora\scott_data.log
----imp 입력후 -> 사용자명 비밀번호 입력 -> import 할껀지 물어봄 yes선택 -> 그리고 c:\ora\scott_data.dmp -> 버퍼 크기를 입력하라 뜸 
--- 최소치 8192를 입력후 -> 임포트 파일 내용 표시 no ->  생송 오류 무시 no -> 권한부여 임포트 yes -> 테이블 데이터 임포트 yes 입력
--- 익스포트 파일 전체 임포트 yes -> sqlplus backupser/ backup1234 -> select * from tab; <- 이거 내일 오전에 다시한다함 

------------------------------2022-06-30---------------------------------------------
/*
테이블만 복사하는거임
cd\ -> sqlplus scott/tiger -> create table test(
                            id number(2) primary key,
                            name varchar2(10) not null,
                            regdate date default sysdate
                            ); - 테이블 생성후
     insert into test (id,name) values(1,'홍길동'); -> 테이블 안에 넣음1
     insert into test (id,name) values(2,'신재우'); -> 테이블 안에 넣음2
     select * from test; -> 들어갔는지 확인 
     만들고나서 exit 나간다
     
     cd\ -> exp scott/tiger tables=test file=c:\ora\scott_test.dmp log=c:\ora\scott_test_exp.log 하고
     imp -> backupuser 치고 backup1234 -> 데이터만임포트 no -> 임포트 파일 c:\ora\scott_test.dmp -> 버퍼크기 8192
     임포트 파일 내용 표시 no -> 객체존재로 인해 생성오류 무시 no -> 권한부여 yes -> 테이블 데이터 임포트 yes -> 익스포트 파일 전체 임포트 yes 
     sqlplus backupuser/backup1234 
     select * from tab; 확인해본다
     
*/



