# mysql-repl
使用docker-compose快速接建立mysql 主从复制并启动


# 部署前提条件
安装好docker,docker-compose,git <br>
下载程序
```
git clone https://github.com/zhoujunhe/mysql-repl.git
```

# 安装启动命令
程序运行install.sh安装后自动启动
```
cd mysql-repl
chmod a+x install.sh
./install.sh
```
查看数据库是否启动程序
```
docker ps
```
查看数据库日志信息
```
docker logs -f repl    #查看实例repl1
docker logs -f rep2    #查看实例repl2
```

# 说明
主服务器实例名为 查看实例repl1,端口为3316 <br>
主服务器实例名为 查看实例repl2,端口为3317 <br>
mysql 的root 密码在```docker-compose.yml```文件中```MYSQL_ROOT_PASSWORD``` 定义 <br>
mysql的my.cnf 文件在 repl1或者repl2目录下面<br>

# 连接到数据库命令

* 连接到主库上
```
mysql -h 127.0.0.1 -P 3316 -p
```

* 连接到备库上
```
mysql -h 127.0.0.1 -P 3317 -p
```

* 连接到备库查看同步状态

```
MySQL [(none)]> show slave status \G
*************************** 1. row ***************************
               Slave_IO_State: Waiting for master to send event
                  Master_Host: repl1
                  Master_User: repl
                  Master_Port: 3306
                Connect_Retry: 60
              Master_Log_File: binlog.000005
          Read_Master_Log_Pos: 156
               Relay_Log_File: 35687e447c63-relay-bin.000003
                Relay_Log_Pos: 365
        Relay_Master_Log_File: binlog.000005
             Slave_IO_Running: Yes
            Slave_SQL_Running: Yes
              Replicate_Do_DB: 
          Replicate_Ignore_DB: 
           Replicate_Do_Table: 
       Replicate_Ignore_Table: 
      Replicate_Wild_Do_Table: 
  Replicate_Wild_Ignore_Table: 
                   Last_Errno: 0
                   Last_Error: 
                 Skip_Counter: 0
          Exec_Master_Log_Pos: 156
              Relay_Log_Space: 581
              Until_Condition: None
               Until_Log_File: 
                Until_Log_Pos: 0
           Master_SSL_Allowed: No
           Master_SSL_CA_File: 
           Master_SSL_CA_Path: 
              Master_SSL_Cert: 
            Master_SSL_Cipher: 
               Master_SSL_Key: 
        Seconds_Behind_Master: 0
Master_SSL_Verify_Server_Cert: No
                Last_IO_Errno: 0
                Last_IO_Error: 
               Last_SQL_Errno: 0
               Last_SQL_Error: 
  Replicate_Ignore_Server_Ids: 
             Master_Server_Id: 1
                  Master_UUID: 716cf557-b8bf-11ec-9333-0242ac170002
             Master_Info_File: mysql.slave_master_info
                    SQL_Delay: 0
          SQL_Remaining_Delay: NULL
      Slave_SQL_Running_State: Slave has read all relay log; waiting for more updates
           Master_Retry_Count: 86400
                  Master_Bind: 
      Last_IO_Error_Timestamp: 
     Last_SQL_Error_Timestamp: 
               Master_SSL_Crl: 
           Master_SSL_Crlpath: 
           Retrieved_Gtid_Set: 
            Executed_Gtid_Set: 
                Auto_Position: 1
         Replicate_Rewrite_DB: 
                 Channel_Name: 
           Master_TLS_Version: 
       Master_public_key_path: 
        Get_master_public_key: 0
            Network_Namespace: 
1 row in set, 1 warning (0.00 sec)
```