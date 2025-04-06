use HotelDemo;


select r.numRoom, categoryName, statusName, stageNum 
from rooms r
join roomStatus on statusId = idStatus
join roomCategory on categoryId = idCategory
join stage on stageId = idStage



update rooms 
set statusId = (select idStatus from roomStatus where statusName = 'Чистый') 
where statusId = (select idStatus from roomStatus where statusName = 'Назначен к уборке');


