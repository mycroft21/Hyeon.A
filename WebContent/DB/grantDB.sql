create user hyeona identified by oracle;

alter user hyeona account unlock;

grant connect, resource to hyeona;

grant create session to hyeona;