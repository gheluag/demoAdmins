use HotelDemo; -- используем бд для создания триггера


delimiter $$

create trigger CheckRoomsAvalibility
before insert on borrowing
for each row

begin

declare room_status varchar(50);

select statusName into room_status
from rooms
join roomStatus on statusId = idStatus
where rooms.numRoom = new.roomId;

if room_status != 'Чистый' then
 SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Номер недоступен для бронирования';
END IF;

end$$

delimiter ;

INSERT INTO borrowing (roomerId, roomId, categoryId, entryDate, departureDate) VALUES
(1, 101, 1, '2025-02-14', '2025-03-02');