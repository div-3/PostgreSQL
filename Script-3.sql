SELECT
	*
FROM
	models
	--Найти страну с максимальной капитализацией всех её производителей
SELECT
	C."name" AS "COUNTRY",
	SUM(M.CAPITALIZATION)
FROM
	countries C
JOIN MANUFACTURERS M ON
	C.ID = M.COUNTRY_ID
GROUP BY
	"COUNTRY"
ORDER BY
	SUM(M.CAPITALIZATION) DESC
LIMIT 1;

--Вывести всю доступную информацию о моделе: имя производителя, имя модели,
--цена, остаток, страна производства
SELECT
	MANUF."name" AS "Производитель",
	M."name" AS "Модель",
	P.VALUE AS "Цена",
	Q.COUNT AS "Остаток",
	C."name" AS "Страна"
FROM
	MODELS M
JOIN MANUFACTURERS MANUF ON
	M.MANUFACTURER_ID = MANUF.ID
JOIN PRICES P ON
	M.PRICE_ID = P.ID
JOIN QUANTITY Q ON
	M.ID = Q.MODEL_ID
JOIN COUNTRIES C ON
	MANUF.COUNTRY_ID = C.ID;
	
	--Вывести все автомобили и их продавцов, которыми занимаются сотрудники офиса ‘Laconia’
SELECT
	M."name" AS "Модель",
	S.FIRST_NAME AS "Имя",
	S.LAST_NAME AS "Фамилия",
	O."name" AS "Офис"
FROM
	MODELS M
JOIN SELLERS S ON
	S.id = M.seller_id
JOIN OFFICES O ON
	O.id = S.office_id
WHERE
	O.name = 'Laconia';
	
	--Найти марку с наибольшим количеством автомобилей в системе
SELECT
	M."name" AS "Производитель",
	SUM(Q.COUNT)
FROM
	MANUFACTURERS M
JOIN MODELS ON
	M.ID = MODELS.MANUFACTURER_ID
JOIN QUANTITY Q ON
	MODELS.ID = Q.MODEL_ID
GROUP BY
	M."name"
ORDER BY
	SUM(Q.COUNT) DESC
LIMIT 1;

--Найти все модели, что может купить потребитель
--Мой вариант
SELECT
	M."name" AS "Модель",
	Q.COUNT AS "Количество"
FROM
	MODELS M
JOIN QUANTITY Q ON
	Q.MODEL_ID = M.ID
WHERE
	Q.COUNT > 0
ORDER BY
	Q.COUNT DESC;

--Вариант из методички
SELECT
	M."name",
	M.INSTOCK
FROM
	MODELS M
WHERE
	M.INSTOCK = TRUE;
	
	--Вывести среднее значение цены всех доступных к продаже автомобилей
SELECT
	AVG(P.VALUE) AS "Средняя цена доступных"
FROM
	MODELS M
JOIN PRICES P ON
	M.PRICE_ID = P.ID
WHERE
	M.INSTOCK = TRUE;
	
	--Вывести общую стоимость всех автомобилей марки ‘Horch’
SELECT
	SUM(P.VALUE) AS "Общая стоимость ам марки ‘Horch’"
FROM
	MODELS M
JOIN PRICES P ON
	M.PRICE_ID = P.ID
JOIN MANUFACTURERS M2 ON
	M.MANUFACTURER_ID = M2.ID
WHERE
	M2."name" = 'Horch';
	
	--Вывести все уникальные модели производителя ‘KAA’ и среднюю цену на них
SELECT
	M."name",
	M2."name",
	AVG(P.VALUE)
FROM
	MODELS M
JOIN MANUFACTURERS M2 ON
	M.MANUFACTURER_ID = M2.ID
JOIN PRICES P ON
	M.PRICE_ID = P.ID
WHERE
	M2."name" = 'KAA'
GROUP BY
	M."name",
	M2."name";
	
	--Вывести все автомобили в наличии, произведенные в регионе ‘Asia’
SELECT
	M."name" AS "Модель",
	M.INSTOCK AS "Наличие",
	R."name" AS "Регион"
FROM
	MODELS M
JOIN MANUFACTURERS M2 ON
	M.MANUFACTURER_ID = M2.ID
JOIN COUNTRIES C ON
	M2.COUNTRY_ID = C.ID
JOIN REGIONS R ON
	C.REGION_ID = R.ID
WHERE
	M.INSTOCK = TRUE
	AND R."name" = 'Asia';
	
	--Вывести все модели, которые продаёт самый востребованный продавец
SELECT
	M."name" AS "Модель",
	S.FIRST_NAME AS "Имя",
	S.LAST_NAME AS "Фамилия"
FROM
	MODELS M
JOIN SELLERS S ON
	M.SELLER_ID = S.ID
WHERE
	M.SELLER_ID =	
	(
	SELECT
		SEL.seller_id
	FROM
		(
		SELECT
			COUNT(M.SELLER_ID) AS "Количество продаж",
			M.SELLER_ID,
			S.FIRST_NAME,
			S.LAST_NAME
		FROM
			MODELS M
		JOIN SELLERS S ON
			M.SELLER_ID = S.ID
		GROUP BY
			M.SELLER_ID,
			S.FIRST_NAME,
			S.LAST_NAME
		ORDER BY
			"Количество продаж" DESC,
			M.SELLER_ID
		LIMIT 1
		) AS SEL
	);
	
--________________________________________________________________________
--ПРОЦЕДУРЫ, ФУНКЦИИ, ТРИГГЕРЫ, КЛЮЧИ
--________________________________________________________________________ 

--ПРОЦЕДУРА
CREATE OR REPLACE PROCEDURE upPrice(price_id int, new_value int, new_max_discount int)
LANGUAGE plpgsql
AS $$
BEGIN 
	UPDATE prices
	SET 
		value = new_value,
		max_discount = new_max_discount
	WHERE prices.id = price_id;
END;
$$


SELECT * FROM PRICES P WHERE id = 2;
SELECT * FROM PRICES P WHERE id = 3;

--Запуск процедуры
CALL upPrice(2, 1000000, 5);
CALL upPrice(3, 1002000, 2);


--ФУНКЦИЯ
CREATE OR REPLACE FUNCTION modelCountByManufacturer(manuf_id int)
RETURNS int
LANGUAGE plpgsql
AS $$ 
DECLARE models_count int;
BEGIN
	SELECT COUNT(DISTINCT  models."name")
	FROM models
	INTO models_count 
	WHERE models.MANUFACTURER_ID = manuf_id;
	RETURN models_count;
END;
$$ 


--Запуск функции
SELECT modelCountByManufacturer(4);
SELECT modelCountByManufacturer(6);



--Триггеры (часто используют для логгирования, соблюдения связанности таблиц, даже если для них не 
-- установлены явные связи)

--1. Если будет логгироваться, то надо убедиться, что таблица для логов существует.
CREATE TABLE price_changes_log (
id int,
old_price int,
new_price int,
date_of_change DATE)

--2. Создаём функцию логгирования при изменении цены.
CREATE OR REPLACE FUNCTION log_prices_ghanges()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$ 
BEGIN 
	IF NEW.value <> OLD.value THEN 
		INSERT INTO price_changes_log (id, old_price, new_price, date_of_change)
		VALUES (OLD.id, OLD.value, NEW.value, now());
	END IF;

	RETURN NEW;
END;
$$ 

--3. Создаём сам триггер
CREATE TRIGGER price_changes_log 
	BEFORE UPDATE 
	ON prices 
	FOR EACH ROW 
	EXECUTE PROCEDURE log_prices_ghanges();

--Проврка логгирования
UPDATE PRICES 	
 SET value = 1000000	--попало в лог
 WHERE id = 3;

UPDATE PRICES 
 SET value = 1000005	--попало в лог
 WHERE id = 4;

UPDATE PRICES 
 SET value = 1644652	--не попало в лог, т.к. значение цены не поменялось
 WHERE id = 5;

UPDATE PRICES 
 SET max_discount = 3	--не попало в лог, т.к. значение цены не поменялось
 WHERE id = 5;


--ИНДЕКСЫ
CREATE UNIQUE INDEX name_idx ON models (id);	--Уникальный индекс только для столбцов с уникальными значениями
CREATE INDEX name2_idx ON models (name);		--Неуникальный индекс для любых

SELECT * FROM MODELS M;
