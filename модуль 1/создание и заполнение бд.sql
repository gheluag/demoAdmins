create database BD;
use BD;

create table Users(
idUser int primary key auto_increment,
username varchar(255) not null,
passw varchar(255) not null
);


INSERT INTO Users (username, passw)
SELECT user, authentication_string
FROM mysql.user
WHERE user IN ('user1', 'user2', 'user3', 'user4', 'user5', 'user6', 'user7', 'user8', 'user9', 'user10');

select * from Users; -- как расшифровать пароли я так и не поняла (mysql автоматом хэширует их при создании пользователя)

-- резервные копии (выполняются в cmd)

-- mysqldump -uroot -p BD > "путь..BD_backup.sql"

-- если оставить -p, то следующей строчкой нужно будет ввести пароль

-- если указать -pпароль, то выйдет предупреждение, что не стоит пароль в открытом виде держать

## -u это пользователь
## -p это пароль

-- восстановление (тоже cmd)

-- mysql -uroot -p BD < "путь...BD_backup.sql"

-- та же самая история с -p