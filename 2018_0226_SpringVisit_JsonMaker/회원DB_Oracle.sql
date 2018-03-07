--회원일련번호 관리객체
create sequence seq_member_idx

--회원테이블
create table member
(
	idx int,						--회원일련번호
	name varchar2(100) not null,	--회원명
	id   varchar2(100) not null,	--아이디
	pwd  varchar2(100) not null,	--비밀번호
	address varchar2(500) not null,	--주소
	zipcode varchar2(10) not null,	--우편번호
	ip	 varchar2(100) not null,	--IP
	regdate date					--가입일자
)

--기본키
alter table member 
      add constraint pk_member_idx primary key(idx)
      
--unique
alter table member
      add constraint uk_member_id unique(id)
      
--sample data
insert into member values(
                  seq_member_idx.nextVal,
                  '일길동',
                  'one',
                  '1234',
                  '서울시 구로구 구로3동',
                  '12345',
                  '127.0.0.1',
                  sysdate
                  );
insert into member values(
                  seq_member_idx.nextVal,
                  '이길동',
                  'two',
                  '1234',
                  '서울시 구로구 구로3동',
                  '12345',
                  '127.0.0.1',
                  sysdate
                  );  

select * from member                  

commit      
      





