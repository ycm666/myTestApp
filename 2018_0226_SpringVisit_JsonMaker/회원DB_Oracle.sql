--ȸ���Ϸù�ȣ ������ü
create sequence seq_member_idx

--ȸ�����̺�
create table member
(
	idx int,						--ȸ���Ϸù�ȣ
	name varchar2(100) not null,	--ȸ����
	id   varchar2(100) not null,	--���̵�
	pwd  varchar2(100) not null,	--��й�ȣ
	address varchar2(500) not null,	--�ּ�
	zipcode varchar2(10) not null,	--�����ȣ
	ip	 varchar2(100) not null,	--IP
	regdate date					--��������
)

--�⺻Ű
alter table member 
      add constraint pk_member_idx primary key(idx)
      
--unique
alter table member
      add constraint uk_member_id unique(id)
      
--sample data
insert into member values(
                  seq_member_idx.nextVal,
                  '�ϱ浿',
                  'one',
                  '1234',
                  '����� ���α� ����3��',
                  '12345',
                  '127.0.0.1',
                  sysdate
                  );
insert into member values(
                  seq_member_idx.nextVal,
                  '�̱浿',
                  'two',
                  '1234',
                  '����� ���α� ����3��',
                  '12345',
                  '127.0.0.1',
                  sysdate
                  );  

select * from member                  

commit      
      





