--ȸ���Ϸù�ȣ ������ü

--ȸ�����̺�
use ycm111;
create table member
(
	idx int AUTO_INCREMENT PRIMARY KEY,
	name varchar(100) not null,	
	id   varchar(100) not null unique,
	pwd  varchar(100) not null,	
	address varchar(500) not null,
	zipcode varchar(10) not null,
	ip	 varchar(100) not null,	
	regdate datetime			
);


      
--sample data
use ycm111;
insert into member(name,id,pwd,address,zipcode,ip,regdate) values(
                  '�ϱ浿',
                  'one',
                  '1234',
                  '����� ���α� ����3��',
                  '12345',
                  '127.0.0.1',
                  now()
                  );
insert into member(name,id,pwd,address,zipcode,ip,regdate) values(
                  '�̱浿',
                  'two',
                  '1234',
                  '����� ���α� ����3��',
                  '12345',
                  '127.0.0.1',
                  now()
                  );  

use ycm111;
select * from member;                  

use ycm111;
commit;      
      





