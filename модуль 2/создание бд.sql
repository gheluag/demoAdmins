drop database if exists HotelDemo;
create database if not exists HotelDemo;

use HotelDemo;

create table roomCategory(
idCategory int primary key auto_increment,
categoryName varchar(255) not null
);

create table stage(
idStage int primary key auto_increment,
stageNum varchar(255) not null
);

create table roomStatus(
idStatus int primary key auto_increment,
statusName varchar(255) not null
);

create table rooms(
numRoom int primary key,
categoryId int not null,
statusId int not null,
stageId int not null,
foreign key (categoryId) references roomCategory (idCategory),
foreign key (statusId) references roomStatus (idStatus),
foreign key (stageId) references stage (idStage)
);

create table roomers(
idRoomer int primary key auto_increment,
lastname varchar(255) not null,
firstname varchar(255) not null,
middlename varchar(255)
);

create table maids(
idMaid int primary key auto_increment,
lastname varchar(255) not null,
firstname varchar(255) not null,
middlename varchar(255)
);

create table roomClean(
idroomClean int primary key auto_increment,
stageId int not null,
maidId int not null,
cleanDate date,
foreign key (stageId) references stage (idStage),
foreign key (maidId) references maids (idMaid)
);

create table paymentStatus(
idPaymentStatus int primary key auto_increment,
statusName varchar(255)
);

create table borrowing(
idBorrowing int primary key auto_increment,
roomerId int not null,
roomId int not null,
categoryId int not null,
entryDate date not null,
departureDate date,
foreign key(roomerId) references roomers(idRoomer),
foreign key (categoryId) references roomCategory (idCategory),
foreign key (roomId) references rooms (numRoom)
);

create table paymentReport(
idPayment int primary key auto_increment,
roomerId int not null,
categoryId int not null,
entryDate date not null,
departureDate date,
price decimal(10,2) not null,
paid decimal(10,2),
paymentStatus int,
borrowingId int not null,
foreign key(roomerId) references roomers(idRoomer),
foreign key (categoryId) references roomCategory (idCategory),
foreign key (paymentStatus) references paymentStatus (idPaymentStatus),
foreign key(borrowingId) references borrowing (idBorrowing)

);


