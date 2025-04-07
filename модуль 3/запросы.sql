use HotelDemo;


-- Выведите список клиентов с указанием суммы к оплате, с учетом проживания и всех используемых дополнительных услуг

select concat(firstname, ' ', lastname) as 'клиент', price as 'сумма к оплате' -- ??? я это задание поняла так
from paymentReport
join roomers on roomerId = idRoomer;



select r.numRoom, categoryName, statusName, stageNum  -- запрос для проверки статуса номера (2 задание)
from rooms r
join roomStatus on statusId = idStatus
join roomCategory on categoryId = idCategory
join stage on stageId = idStage
where statusName like '%уборке%';


update rooms 
set statusId = (select idStatus from roomStatus where statusName = 'Чистый') 
where statusId = (select idStatus from roomStatus where statusName = 'Назначен к уборке');


