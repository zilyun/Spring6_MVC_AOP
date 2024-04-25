conn system/1234
create user boot2 indentified by tiger
grant resource, connect, dba to boot2;
conn boot2/tiger

drop table member cascade constraints purge;
-- 1. index.jsp에서 시작합니다.
-- 2. 관리자 계정 admin, 비번 1234를 만듭니다.
-- 3. 사용자 계정을 3개 만듭니다.

create table member(
	id		 	varchar2(12),
	password 	varchar2(10),
	name	 	varchar2(15),
	age		 	number(2),
	gender	 	varchar2(3),  -- 남, 여
	email	 	varchar2(30), -- hta@hta.com
	memberfile 	varchar2(50),
	PRIMARY KEY(id)
);

-- memberfile은 회원 정보 수정시 적용합니다. 



