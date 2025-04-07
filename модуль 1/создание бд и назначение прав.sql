use mysql; -- используем бд для создания процедуры


-- я не знаю как будет у вас все организовано, поэтому перед созданием процедуры обязательно пропишите ее удаление:

-- drop procedure if exists <название процедуры>;

delimiter $$ -- устанавливаем разделитель 

create procedure GenerateDB() -- процедура для создания бд
begin
	declare i int default 1; -- объявляем переменные. счетчик для создания 10 бд
	declare command text; -- строка для команды

while i <= 10 do -- цикл для генерации бд

set @command = concat('create database DB', i, ';'); -- собираем команду


prepare stmt from @command; -- подготовка команды (stmt - переменная)
execute stmt; -- выполнение команды
deallocate prepare stmt; -- освобождение ресурсов

set i = i + 1; -- увеличиваем шаг

end while; -- конец цикла

end$$ -- конец процедуры

delimiter ; -- возращаем изначальный разделитель



call GenerateDB(); -- вызываем процедуру


delimiter $$ -- устанавливаем разделитель 

create procedure GrantUsers()  -- процедура для назначения прав
begin
	declare i int default 1; -- объявляем переменные. счетчик для 10 пользователей
	declare command text; -- строка для команды
	
while i <= 10 do -- цикл для перебора пользователей

set @command = concat('grant all privileges on DB', i, '.* to ''user', i, '''@''localhost'';'); -- установить все привелегии на бд (* - все таблицы) пользователю на сервере (в нашем случае localhost) 


prepare stmt from @command; -- подготовка команды (stmt - переменная)
execute stmt; -- выполнение команды
deallocate prepare stmt; -- освобождение ресурсов

set i = i + 1; -- увеличиваем шаг

end while; -- конец цикла


end$$ -- конец процедуры

delimiter ; -- возращаем изначальный разделитель

call GrantUsers(); -- вызываем процедуру




show grants for 'user1'@'localhost'; -- просмотр прав определенного пользователя

show databases; -- посмотреть БДшки







delimiter $$

create procedure DelDB() -- удаление бд (на всякий случай, если что-то пойдет не так)
begin
	declare i int default 1;
	declare command text;

while i <= 10 do

set @command = concat('drop database bd', i, ';');

prepare stmt from @command;
execute stmt;
deallocate prepare stmt;

set i = i + 1;

end while;

end$$

delimiter ;


call DelDB();



drop procedure RevokeUsers;
drop procedure DropUsers;

DELIMITER $$

CREATE PROCEDURE RevokeUsers() -- удаление прав (на всякий случай, если что-то пойдет не так)
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE uname VARCHAR(100);

    WHILE i <= 10 DO
        SET uname = CONCAT('user', i);
        SET @sql = CONCAT('REVOKE ALL PRIVILEGES, GRANT OPTION FROM `', uname, '`@''localhost''');

        PREPARE stmt FROM @sql;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;

        SET i = i + 1;
    END WHILE;
END$$

DELIMITER ;


DELIMITER $$

CREATE PROCEDURE DropUsers() -- удаление пользователей (на всякий случай, если что-то пойдет не так)
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE uname VARCHAR(100);

    WHILE i <= 10 DO
        SET uname = CONCAT('user', i);
        SET @sql = CONCAT('DROP USER IF EXISTS `', uname, '`@''localhost''');

        PREPARE stmt FROM @sql;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;

        SET i = i + 1;
    END WHILE;
END$$

DELIMITER ;


														
CALL RevokeUsers();
CALL DropUsers();

select user from mysql.user -- это для проверки
