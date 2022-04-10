# mysql-repl
使用docker-compose快速接建立mysql 主从复制并启动


# 部署前提条件
安装好docker,docker-compose,git <br>
下载程序
```
git clone https://github.com/zhoujunhe/mysql-repl.git
```

# 安装命令启动命令
```
chmod a+x install.sh
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
主服务器实例名为 查看实例repl1,端口为3306 <br>
主服务器实例名为 查看实例repl2,端口为3307 <br>
mysql 的root 密码在```docker-compose.yml```文件中```MYSQL_ROOT_PASSWORD``` 定义 <br>
mysql的my.cnf 文件在 repl1或者repl2目录下面<br>

# 连接到数据库命令

* 连接到主库上
```
mysql -h 127.0.0.1 -P 3306 -p
```

* 连接到备库上
```
mysql -h 127.0.0.1 -P 3307 -p
```
