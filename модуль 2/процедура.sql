use HotelDemo;


delimiter $$

create procedure ADR(
in startDate date,
in endDate date )
begin

declare totalPrice decimal(10,2);
declare totalNights int;

select sum(price)
into totalPrice
from paymentReport
where entryDate >= startDate
and departureDate <= endDate
and departureDate is not null;

select sum(datediff(departureDate, entryDate))
into totalNights
from paymentreport
where entryDate >= startDate
and departureDate <= endDate
and departureDate is not null;

select totalPrice as 'Итоговая выручка', totalNights as 'Всего ночей',
case when totalNights > 0 then round(totalPrice / totalNights, 2)
else null
end as ADR;

end $$

delimiter ;


call ADR('2025-02-14','2025-04-22');