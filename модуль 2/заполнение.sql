use HotelDemo;

INSERT INTO roomCategory (categoryName) VALUES
('Одноместный стандарт'),
('Одноместный эконом'),
('Стандарт двухместный с 2 раздельными кроватями'),
('Эконом двухместный с 2 раздельными кроватями'),
('3-местный бюджет'),
('Бизнес с 1 или 2 кроватями'),
('Двухкомнатный двухместный стандарт с 1 или 2 кроватями'),
('Студия'),
('Люкс с 2 двуспальными кроватями');

INSERT INTO stage (stageNum) VALUES
('1 этаж'),
('2 этаж'),
('3 этаж');


INSERT INTO roomStatus (statusName) VALUES
('Занят'),
('Чистый'),
('Грязный'),
('Назначен к уборке');


INSERT INTO rooms (numRoom, categoryId, statusId, stageId) VALUES
(101, 1, 1, 1),
(102, 1, 2, 1),
(103, 2, 1, 1),
(104, 3, 2, 1),
(105, 4, 1, 1),
(201, 5, 2, 2),
(202, 6, 1, 2),
(203, 7, 4, 2),
(204, 8, 2, 2),
(205, 9, 4, 2),
(301, 1, 2, 3),
(302, 2, 2, 3),
(303, 3, 4, 3),
(304, 4, 2, 3),
(305, 5, 2, 3);


INSERT INTO roomers (lastname, firstname, middlename) VALUES
('Шевченко', 'Ольга', 'Викторовна'),
('Мазалова', 'Ирина', 'Львовна'),
('Бунин', 'Эдуард', 'Михайлович'),
('Мазалова', 'Ольга', 'Николаевна'),
('Филь', 'Марина', 'Федоровна');


INSERT INTO maids (lastname, firstname, middlename) VALUES
('Батурина', 'Ольга', 'Николаевна'),
('Иванова', 'Нина', 'Юрьевна'),
('Толчеева', 'Екатерина', 'Васильевна'),
('Покрышкина', 'Наталья', 'Юрьевна'),
('Тюренкова', 'Наталья', 'Сергеевна');

INSERT INTO roomClean (stageId, maidId, cleanDate) VALUES
(1, 1, '2025-03-01'),  
(2, 2, '2025-03-01'), 
(3, 3, '2025-03-01'), 
(1, 4, '2025-03-02'), 
(2, 5, '2025-03-02');  


INSERT INTO borrowing (idBorrowing, roomerId, roomId, categoryId, entryDate, departureDate) VALUES
(001, 1, 101, 1, '2025-02-14', '2025-03-02'),
(002, 2, 103, 1, '2025-02-28', NULL),
(003, 3, 105, 4, '2025-02-27', '2025-04-22'),
(004, 4, 202, 6, '2025-02-24', '2025-03-17'),
(005, 5, 304, 9, '2025-02-28', '2025-03-15');


INSERT INTO paymentStatus (statusName) VALUES
('Оплачено полностью'),
('Оплачено частично'),
('Не оплачено'),
('Возвращено'),
('Ожидает подтверждения');


INSERT INTO paymentReport (roomerId, categoryId, entryDate, departureDate, price, paid, paymentStatus, borrowingId) VALUES
(1, 1, '2025-02-14', '2025-03-02', 47500.00, NULL, 3, 1),    
(2, 1, '2025-02-28', NULL, 7560.00, 7560.00, 1, 2),             
(3, 4, '2025-02-27', '2025-04-22', 162000.00, 162000.00, 1, 3), 
(4, 6, '2025-02-24', '2025-03-17', 76000.00, 76000.00, 1, 4),   
(5, 9, '2025-02-28', '2025-03-15', 67500.00, NULL, 3, 5);
  