use mysql;


delimiter $$

create procedure GenerateDB()
begin
	declare i int default 1;
declare command text;

while i <= 10 do

set @command = concat('create database DB', i, ';');


prepare srmr from @command;
execute stmt;
deallocate prepare stmt;

set i = i + 1;

end while;


end$$

delimiter ;



call GenerateDB();


delimiter $$

create procedure GrantUsers()  -- назначение прав:
begin
	declare i int default 1;
declare command text;

while i <= 10 do

set @command = concat('granr all privileges on DB', i, '.* to ''user', i, '''@''localhost'';'); -- установить все привелегии на бд (* - все таблицы) пользователю на сервере (в нашем случае localhost) 


prepare srmr from @command;
execute stmt;
deallocate prepare stmt;

set i = i + 1;

end while;


end$$

delimiter ;

call GrantUsers();



														
