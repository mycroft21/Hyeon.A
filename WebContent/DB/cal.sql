create user hyeona identified by oracle;

alter user hyeona account unlock;

grant connect, resource to hyeona;

grant create session to hyeona;



update parkdb set carnum=?, intime=?, outtime=? where parknum=?;

update parkdb set outtime=? where parknum=?;
