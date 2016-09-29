create table memoDB(memoNum number primary key,
					subject varchar2(100), 
			 		content varchar2(2000),
					memoTime date,
					pass varchar2(20));

create SEQUENCE mNumbers  
       START WITH 1   
       INCREMENT BY 1
       nocache;

select * from (select * from (select rowNum r, memoNum, subject, content, memotime, pass from memoDB order by r desc) where subject like '%냠%') where r>=1 and r<=5;
       
insert into memoDB (memoNum, subject, content, memotime, pass) values (mNumbers.nextval, '메모', '테스트합니다.', sysdate, 'oracle');

select * from memoDB;

select * from 
	(select rowNum r, memoNum, subject, content, memotime, pass from memoDB order by r desc)
		where r>=7 and r<=12;

drop table memoDB;

drop sequence mNumbers;

delete from memoDB where memoNum=2;

select * from memoDB where memonum between 1 and 5;

insert into memoDB (memoNum, subject, content, memotime, pass) values(mNumbers.nextval,1,2,sysdate,3);

select memonum, subject, content, memotime,pass,rownum r from (select memonum, subject, content, memotime,pass,rownum r from memoDB order by memonum desc ) where r between 1 and 6;
