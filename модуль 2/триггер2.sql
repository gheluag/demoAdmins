use HotelDemo;

delimiter $$

create trigger CheckRooms
before insert on borrowing
for each row

begin

declare roomCount int;

select count(*)
into roomCount
from borrowing
where roomId = new.roomId
and departureDate is not null
and not (
new.departureDate <= entryDate or
new.entryDate >= departureDate
);

if roomCount > 0 then
signal sqlstate '45000'
set message_text = 'Номер уже забронирован!';
end if;
end $$

delimiter ;

INSERT INTO borrowing (roomerId, roomId, categoryId, entryDate, departureDate) VALUES
( 5, 101, 1, '2025-02-14', '2025-03-02');