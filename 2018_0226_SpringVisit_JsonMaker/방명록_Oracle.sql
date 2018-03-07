
--�Ϸù�ȣ ������ü
create sequence seq_visit_idx

--���� ���̺�
create table visit
(
	idx int,							--�Ϸù�ȣ
	name    varchar2(100)  	not null,	--�ۼ���
	content varchar2(2000) 	not null, 	--����
	pwd		varchar2(100)  	not null,	--��й�ȣ
	ip		varchar2(100)	not null,	--IP
	regdate date						--�ۼ��Ͻ� 
)

--primary key ����
alter table visit
  add constraint pk_visit_idx primary key(idx)
  
  
--sample data
insert into visit values( seq_visit_idx.nextVal,
                           '�ϱ浿',
                           '���� 1���̴�~~~',
                           '1234',
                           '127.0.0.1',
                           sysdate
                          ); 

insert into visit values( seq_visit_idx.nextVal,
                           '�ϱ浿',
                           '�ƽ��� 2���̴�~~~',
                           '1234',
                           '127.0.0.1',
                           sysdate
                          );                          
                          
select * from visit order by idx desc;   

commit
  
  


