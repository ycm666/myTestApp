
--���� ���̺�
use mydb;
CREATE TABLE visit
(
	idx INT AUTO_INCREMENT PRIMARY KEY,				
	NAME    VARCHAR(100)  	NOT NULL,	
	content VARCHAR(2000) 	NOT NULL, 	
	pwd		VARCHAR(100)  	NOT NULL,
	ip		VARCHAR(100)	NOT NULL,
	regdate DATETIME			
);

 
  
--sample data
use mydb;
insert into visit(name,content,pwd,ip,regdate) values(
                           '�ϱ浿',
                           '���� 1���̴�~~~',
                           '1234',
                           '127.0.0.1',
                           now()
                          ); 

use mydb;
select * from visit order by idx desc;   

commit
  
  


