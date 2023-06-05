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
	

SELECT
	*
FROM
	MODELS M;
