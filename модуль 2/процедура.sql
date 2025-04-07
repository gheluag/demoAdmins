use HotelDemo; -- используем нашу бд для создания процедуры


delimiter $$ -- устанавливаем разделитель

create procedure ADR( -- входные параметры: начальная дата и конечная дата
in startDate date,
in endDate date )
begin

declare totalPrice decimal(10,2); -- переменные общей стоимости и количества ночей
declare totalNights int;

select sum(price) -- делаем выборку, складывая стоимость 
into totalPrice -- присваиваем значение выборки
from paymentReport -- из какой таблицы
where entryDate >= startDate -- условия: дата въезда должна быть больше или равна дате начала нашей выборки
and departureDate <= endDate -- дата выезда должна быть меньше или равна дате конца выборки
and departureDate is not null; -- дата выезда не должна быть пустой

select sum(datediff(departureDate, entryDate)) -- смотрим разницу дней даты въезда и выезда, суммируя ее
into totalNights -- присваиваем переменной
from paymentreport -- все из той же таблицы
where entryDate >= startDate -- те же самые условия
and departureDate <= endDate
and departureDate is not null;

select totalPrice as 'Итоговая выручка', totalNights as 'Всего ночей', -- делаем выборку наших переменных и присваиваем им псевдонимы для вывода
case when totalNights > 0 then round(totalPrice / totalNights, 2) -- проверяем условие: если количество ночей больше нуля, то производим действия, указанные в задании:
																	-- "данный показатель равен отношению суммы продаж к числу ночей"

else null -- иначе ничего не выводим

end as ADR; -- выводим вычеслененое значение под псевдонимом

end $$ -- конец процедуры

delimiter ; -- возвращаем изначальный разделитель


call ADR('2025-02-14','2025-04-22'); -- вызываем процедуру, указывая параметры

-- !!ПОМНИТЕ, ЧТО ФОРМАТ ДАТЫ В MYSQL: YYYY-MM-DD (ГОД-МЕСЯЦ-ДЕНЬ)!!