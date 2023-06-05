--Создание таблиц

create table car(
id VARCHAR(9) primary key,
model VARCHAR(50),
owner VARCHAR(100))

create table services(
id INT primary key,
car_id VARCHAR(9),
work_id INT,
deadline DATE,
worker_id INT)

create table works(
id INT primary key,
work VARCHAR(100),
description VARCHAR(300),
price FLOAT)

create table workers(
id INT primary key,
phone CHAR(10),
adress VARCHAR(100),
full_name VARCHAR(100))

--Создание отношений (ограничений)

alter table services 
	add constraint car_id_fkey
		foreign key (car_id) references car(id)
		
--ошибочное ограничение		
alter table services 
	add constraint work_id_fkey		--ошибочное ограничение
		foreign key (worker_id) references works(id),
	add constraint worker_id_fkey
		foreign key (worker_id) references workers(id)
		
--удаление ошибочного ограничения		
alter table services 
	drop constraint work_id_fkey 		

alter table services 
	add constraint work_id_fkey 
		foreign key (work_id) references works(id)
		

--Заполнение данными
		
insert into CAR ("id", "model", "owner") values ('Х111ХХ138', 'mitsubishi Lancer', 'Иванов И.И.');
insert into CAR ("id", "model", "owner") values ('М222ММ38', 'ВАЗ 2109', 'Петров П.Н.');
insert into CAR ("id", "model", "owner") values ('Т333ТТ38', 'Chevrolet Lanos', 'Сидоров С.С.');

insert into workers ("id", "phone", "adress", "full_name") values ('1', '9241011010', 'Иркутск, ул. Карла Маркса, д. 5, кв. 38', 'Терентьев С.Н.');
insert into workers ("id", "phone", "adress", "full_name") values ('2', '9525966578', 'Иркутск, ул. Ленина, д. 2, кв. 5', 'Смирнов П.В.');
insert into workers ("id", "phone", "adress", "full_name") values ('3', '9025419782', 'Иркутск, ул. Горького, д. 15, кв. 96', 'Агафонов О.В.');

INSERT INTO works ("id", "work", "description", "price") values ('1', 'Замена масла 1', 'Замена масла аппаратная', '1200.0');
INSERT INTO works ("id", "work", "description", "price") values ('2', 'Замена масла 2', 'Замена масла', '800.0');
INSERT INTO works ("id", "work", "description", "price") values ('3', 'Развал/схождение седан', 'Развал/схождение седан R меньше 17', '2000.0');
INSERT INTO works ("id", "work", "description", "price") values ('4', 'Развал/схождение седан', 'Развал/схождение седан R больше или равно 17', '2500.0');
INSERT INTO works ("id", "work", "description", "price") values ('5', 'ТО', 'Замена масла, замена фильтров, проверка уровня жидкостей, проверка подвески', '5000.0');

INSERT INTO services ("id", "car_id", "work_id", "deadline", "worker_id") values ('1', 'Х111ХХ138', '3', '2023-05-31', '1'); 
INSERT INTO services ("id", "car_id", "work_id", "deadline", "worker_id") values ('2', 'М222ММ38', '5', '2023-06-15', '2'); 
INSERT INTO services ("id", "car_id", "work_id", "deadline", "worker_id") values ('3', 'Т333ТТ38', '4', '2023-05-15', '3'); 
INSERT INTO services ("id", "car_id", "work_id", "deadline", "worker_id") values ('4', 'Х111ХХ138', '1', '2023-06-10', '1'); 

select * FROM car;

select * FROM workers;

select * FROM works;

select * FROM services;

