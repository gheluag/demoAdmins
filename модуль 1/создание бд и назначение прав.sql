create database if not exists BD1;
create database if not exists BD2;
create database if not exists BD3;
create database if not exists BD4;
create database if not exists BD5;
create database if not exists BD6;
create database if not exists BD7;
create database if not exists BD8;
create database if not exists BD9;
create database if not exists BD10;

grant all privileges on DB1.* to 'user1'@'localhost'; -- назначение прав:
														-- установить все привелегии на бд (* - все таблицы) пользователю на сервере (в нашем случае localhost) 
grant all privileges on DB2.* to 'user2'@'localhost';
grant all privileges on DB3.* to 'user3'@'localhost';
grant all privileges on DB4.* to 'user4'@'localhost';
grant all privileges on DB5.* to 'user5'@'localhost';
grant all privileges on DB6.* to 'user6'@'localhost';
grant all privileges on DB7.* to 'user7'@'localhost';
grant all privileges on DB8.* to 'user8'@'localhost';
grant all privileges on DB9.* to 'user9'@'localhost';
grant all privileges on DB10.* to 'user10'@'localhost';