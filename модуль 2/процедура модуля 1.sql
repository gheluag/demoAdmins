drop database if exists BD;
create database if not exists BD;
use BD;

delimiter $$

create procedure CreateUsers()
begin
declare i int default 1;
declare j int;
declare chars varchar(62) default 'abcdefghijklmnopqrstuvwxyz1234567890';
declare passw varchar(20);

create table if not exists Users(
idUser int primary key auto_increment,
username varchar(50) not null,
password_encrypt varbinary(255) not null
);

while i <= 10 do
set passw = '';
set @uName = concat('user', i);
set @dbName = concat('bd', i);

set j = 1;
while j <= 5 do

set passw = concat(passw, substring(chars, floor(1 + rand() * 62) + 1, 1));

set j = j + 1;

end while;

set @command = concat("create database if not exists ", @dbName, ";");

prepare stmt from @command;
execute stmt;
deallocate prepare stmt;

set @command = concat("create user if not exists '", @uName, "'@'localhost' identified by '", passw, "';");

prepare stmt from @command;
execute stmt;
deallocate prepare stmt;

set @command = concat("grant all privileges on ", @dbName, ".* to '", @uName, "'@'localhost' ;");

prepare stmt from @command;
execute stmt;
deallocate prepare stmt;

set @command = concat("insert into Users (username, password_encrypt) values ('", @uName, "', aes_encrypt('", passw,"', 'secretKey')) ;");

prepare stmt from @command;
execute stmt;
deallocate prepare stmt;

set i = i+1;

end while;

end$$

delimiter ;

call CreateUsers();


select username, cast(aes_decrypt(password_encrypt, 'secretKey') as char) as 'decrypt_passw'
from Users;
