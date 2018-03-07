
--방명록 테이블
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
                           '일길동',
                           '내가 1등이닷~~~',
                           '1234',
                           '127.0.0.1',
                           now()
                          ); 

use mydb;
select * from visit order by idx desc;   

commit
  
  


