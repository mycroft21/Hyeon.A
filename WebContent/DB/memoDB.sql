create table memoDB(memoNum number primary key, subject varchar2(50), 
	content varchar2(2000), memoTime date, pass varchar(20));

CREATE SEQUENCE mNumbers  
        START WITH 1   
        INCREMENT BY 1 

insert into memoDB (memoNum, subject, content, memotime) values (mNumbers.nextval, 'ù�޸�', '�׽�Ʈ�մϴ�.', sysdate)

select * from memoDB