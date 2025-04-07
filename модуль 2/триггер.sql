-- триггер у меня почему-то перестал срабатывать, но он работал правда, правда

use HotelDemo; -- используем бд для создания триггера

delimiter $$ -- устанавливаем разделитель

create trigger CheckRooms -- создаем триггер
before insert on borrowing -- перед заполнением таблицы бронирования
for each row -- для каждой строки

begin -- открываем тело триггера

declare roomCount int; -- объявляем переменную для количества комнат

select count(*)  -- делаем выборку количества комнат
into roomCount -- присваиваем значение переменной
from borrowing
where roomId = new.roomId -- new.поле используется при вставке или обновлении
-- указываем условие, при котором триггер будет выполняться
and departureDate is not null -- дата выезда не должна быть пустой
and not ( -- и новые даты не должны:
new.departureDate <= entryDate or -- новая дата выезда не должна быть меньше уже даты в уже существующей записи
new.entryDate >= departureDate  -- новая дата въезда не должна быть больше уже существующей записи 
);

if roomCount > 0 then -- если количество таких комнат больше 0, то
signal sqlstate '45000' -- выводим ошибку
set message_text = 'Номер уже забронирован!'; -- и сообщение для ошибки
end if; -- конец условия
end $$ -- конец триггера

delimiter ; -- возвращаем разделитель

INSERT INTO borrowing (roomerId, roomId, categoryId, entryDate, departureDate) VALUES
( 5, 101, 1, '2025-02-14', '2025-03-02'); -- проверка
