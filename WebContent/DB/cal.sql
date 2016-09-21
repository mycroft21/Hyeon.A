create user hyeona identified by oracle;

alter user hyeona account unlock;

grant connect, resource to hyeona;

grant create session to hyeona;

insert into caldb values("6","100","2016-09-21","2016-09-21",200);

insert into calDB(parkNum, carNum, inTime, outTime, pay) values('6','100','2016-09-21','2016-09-21',200);

update parkdb set carnum=?, intime=?, outtime=? where parknum=?;

update parkdb set outtime=? where parknum=?;
