alter user 'root'@'%' IDENTIFIED WITH mysql_native_password BY '00#Abc#123';
create user 'repl'@'%' IDENTIFIED WITH mysql_native_password BY '00#Abc#123';
GRANT REPLICATION SLAVE ON *.* TO 'repl'@'%'; 
INSTALL PLUGIN rpl_semi_sync_master SONAME 'semisync_master.so';
INSTALL PLUGIN rpl_semi_sync_slave SONAME 'semisync_slave.so';
SET PERSIST rpl_semi_sync_master_enabled = 1;
-- SET PERSIST rpl_semi_sync_slave_enabled = 1;

SET PERSIST enforce_gtid_consistency = on;
SET GLOBAL GTID_MODE = OFF_PERMISSIVE;
SET GLOBAL GTID_MODE = ON_PERMISSIVE;
SET PERSIST GTID_MODE = on;
