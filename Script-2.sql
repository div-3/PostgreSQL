--СОЗДАНИЕ БД САЛОНОВ ПРОДАЖ АВТОМОБИЛЕЙ
--------------------------------------------------------------------------------------------------------------
-- DROP AND CREATE
---------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS Manufacturers;

CREATE TABLE Manufacturers (
  id INTEGER NOT NULL,
  name VARCHAR(55) NOT NULL,
  country_id INTEGER NOT NULL,
  capitalization INTEGER NOT NULL,
  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS Countries;

CREATE TABLE Countries (
  id INTEGER NULL,
  name VARCHAR(55) NOT NULL,
  region_id INTEGER NOT NULL,
  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS Regions;

CREATE TABLE Regions (
  id INTEGER NOT NULL,
  name VARCHAR(50) NOT NULL,
  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS Models;

CREATE TABLE Models (
  id INTEGER NOT NULL,
  manufacturer_id INTEGER NOT NULL,
  name VARCHAR(50) NOT NULL,
  price_id INTEGER NOT NULL,
  inStock BOOLEAN NOT NULL,
  seller_id INTEGER NOT NULL,
  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS Prices;

CREATE TABLE Prices (
  id INTEGER NOT NULL,
  value INTEGER NOT NULL,
  max_discount INTEGER NOT NULL,
  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS Sellers;

CREATE TABLE Sellers (
  id INTEGER NOT NULL DEFAULT NULL,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  office_id INTEGER NOT NULL,
  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS Quantity;

CREATE TABLE Quantity (
  model_id INTEGER NOT NULL,
  count INTEGER NOT NULL,
  PRIMARY KEY (model_id)
);

DROP TABLE IF EXISTS Offices;

CREATE TABLE Offices (
  id INTEGER NOT NULL,
  name VARCHAR(50) NOT NULL,
  PRIMARY KEY (id)
);
---------------------------------------------------------------------------------------------------------------
-- INSERT
---------------------------------------------------------------------------------------------------------------

INSERT
	INTO
	Offices(id,
	name)
VALUES (1,
'Dacota');

INSERT
	INTO
	Offices(id,
	name)
VALUES (2,
'Laconia');

INSERT
	INTO
	Offices(id,
	name)
VALUES (3,
'Zeeland');

INSERT
	INTO
	Offices(id,
	name)
VALUES (4,
'Cyprus');

INSERT
	INTO
	Offices(id,
	name)
VALUES (5,
'Virginia');

INSERT
	INTO
	Offices(id,
	name)
VALUES (6,
'Olympus');

INSERT
	INTO
	Sellers(id,
	first_name,
	last_name,
	office_id)
VALUES (1,
'Ognyana',
'Herbert',
5);

INSERT
	INTO
	Sellers(id,
	first_name,
	last_name,
	office_id)
VALUES (2,
'Menno',
'Kennedy',
3);

INSERT
	INTO
	Sellers(id,
	first_name,
	last_name,
	office_id)
VALUES (3,
'Delilah',
'Chapman',
4);

INSERT
	INTO
	Sellers(id,
	first_name,
	last_name,
	office_id)
VALUES (4,
'Purushottam',
'Watts',
5);

INSERT
	INTO
	Sellers(id,
	first_name,
	last_name,
	office_id)
VALUES (5,
'Frieda',
'Hammond',
6);

INSERT
	INTO
	Sellers(id,
	first_name,
	last_name,
	office_id)
VALUES (6,
'Magdalena',
'Moore',
1);

INSERT
	INTO
	Sellers(id,
	first_name,
	last_name,
	office_id)
VALUES (7,
'Allan',
'Larson',
2);

INSERT
	INTO
	Sellers(id,
	first_name,
	last_name,
	office_id)
VALUES (8,
'Devin',
'Holland',
3);

INSERT
	INTO
	Sellers(id,
	first_name,
	last_name,
	office_id)
VALUES (9,
'Carina',
'Hopkins',
6);

INSERT
	INTO
	Sellers(id,
	first_name,
	last_name,
	office_id)
VALUES (10,
'Maria',
'Cooper',
2);

INSERT
	INTO
	Sellers(id,
	first_name,
	last_name,
	office_id)
VALUES (11,
'Hugo',
'Simpson',
3);

INSERT
	INTO
	Sellers(id,
	first_name,
	last_name,
	office_id)
VALUES (12,
'Jaki',
'Alvarado',
2);

INSERT
	INTO
	Sellers(id,
	first_name,
	last_name,
	office_id)
VALUES (13,
'Katrin',
'Dawson',
3);

INSERT
	INTO
	Sellers(id,
	first_name,
	last_name,
	office_id)
VALUES (14,
'Fedora',
'Mcgee',
2);

INSERT
	INTO
	Sellers(id,
	first_name,
	last_name,
	office_id)
VALUES (15,
'Branwen',
'Holt',
4);

INSERT
	INTO
	Sellers(id,
	first_name,
	last_name,
	office_id)
VALUES (16,
'Sandra',
'Khan',
5);

INSERT
	INTO
	Sellers(id,
	first_name,
	last_name,
	office_id)
VALUES (17,
'Dell',
'Dennis',
5);

INSERT
	INTO
	Regions(id,
	name)
VALUES (1,
'EU');

INSERT
	INTO
	Regions(id,
	name)
VALUES (2,
'Asia');

INSERT
	INTO
	Regions(id,
	name)
VALUES (3,
'Africa');

INSERT
	INTO
	Regions(id,
	name)
VALUES (4,
'South America');

INSERT
	INTO
	Regions(id,
	name)
VALUES (5,
'Latin America');

INSERT
	INTO
	Countries(id,
	name,
	region_id)
VALUES (1,
'Germany',
1);

INSERT
	INTO
	Countries(id,
	name,
	region_id)
VALUES (2,
'USA',
4);

INSERT
	INTO
	Countries(id,
	name,
	region_id)
VALUES (3,
'Canada',
4);

INSERT
	INTO
	Countries(id,
	name,
	region_id)
VALUES (4,
'Ghana',
3);

INSERT
	INTO
	Countries(id,
	name,
	region_id)
VALUES (5,
'Russia',
1);

INSERT
	INTO
	Countries(id,
	name,
	region_id)
VALUES (6,
'Romania',
1);

INSERT
	INTO
	Countries(id,
	name,
	region_id)
VALUES (7,
'Japan',
2);

INSERT
	INTO
	Countries(id,
	name,
	region_id)
VALUES (8,
'South Korea',
2);

INSERT
	INTO
	Countries(id,
	name,
	region_id)
VALUES (9,
'UK',
1);

INSERT
	INTO
	Countries(id,
	name,
	region_id)
VALUES (10,
'France',
1);

INSERT
	INTO
	Countries(id,
	name,
	region_id)
VALUES (11,
'Mexico',
4);

INSERT
	INTO
	Countries(id,
	name,
	region_id)
VALUES (12,
'China',
2);

INSERT
	INTO
	Manufacturers(id,
	name,
	country_id,
	capitalization)
VALUES (1,
'Horch',
1,
33339467);

INSERT
	INTO
	Manufacturers(id,
	name,
	country_id,
	capitalization)
VALUES (2,
'KAA',
8,
48111676);

INSERT
	INTO
	Manufacturers(id,
	name,
	country_id,
	capitalization)
VALUES (3,
'Hynda',
7,
35111196);

INSERT
	INTO
	Manufacturers(id,
	name,
	country_id,
	capitalization)
VALUES (4,
'LIAZ',
5,
29718086);

INSERT
	INTO
	Manufacturers(id,
	name,
	country_id,
	capitalization)
VALUES (5,
'Dacay',
6,
5976250);

INSERT
	INTO
	Manufacturers(id,
	name,
	country_id,
	capitalization)
VALUES (6,
'WHY',
12,
35121080);

INSERT
	INTO
	Manufacturers(id,
	name,
	country_id,
	capitalization)
VALUES (7,
'BMZ',
1,
38980887);

INSERT
	INTO
	Manufacturers(id,
	name,
	country_id,
	capitalization)
VALUES (8,
'Reno',
10,
22123432);

INSERT
	INTO
	Manufacturers(id,
	name,
	country_id,
	capitalization)
VALUES (9,
'Dallas',
2,
38887434);

INSERT
	INTO
	Manufacturers(id,
	name,
	country_id,
	capitalization)
VALUES (10,
'Malibu',
2,
10021065);

INSERT
	INTO
	Manufacturers(id,
	name,
	country_id,
	capitalization)
VALUES (11,
'River',
9,
13038026);

INSERT
	INTO
	Manufacturers(id,
	name,
	country_id,
	capitalization)
VALUES (12,
'SUUB',
9,
13011026);

INSERT
	INTO
	Prices(id,
	value,
	max_discount)
VALUES (1,
1279176,
7);

INSERT
	INTO
	Prices(id,
	value,
	max_discount)
VALUES (2,
1026650,
13);

INSERT
	INTO
	Prices(id,
	value,
	max_discount)
VALUES (3,
1757684,
14);

INSERT
	INTO
	Prices(id,
	value,
	max_discount)
VALUES (4,
415604,
14);

INSERT
	INTO
	Prices(id,
	value,
	max_discount)
VALUES (5,
1644652,
18);

INSERT
	INTO
	Prices(id,
	value,
	max_discount)
VALUES (6,
1951763,
14);

INSERT
	INTO
	Prices(id,
	value,
	max_discount)
VALUES (7,
1288965,
8);

INSERT
	INTO
	Prices(id,
	value,
	max_discount)
VALUES (8,
1403676,
9);

INSERT
	INTO
	Prices(id,
	value,
	max_discount)
VALUES (9,
1780194,
14);

INSERT
	INTO
	Prices(id,
	value,
	max_discount)
VALUES (10,
1090644,
8);

INSERT
	INTO
	Prices(id,
	value,
	max_discount)
VALUES (11,
370084,
11);

INSERT
	INTO
	Prices(id,
	value,
	max_discount)
VALUES (12,
689693,
10);

INSERT
	INTO
	Prices(id,
	value,
	max_discount)
VALUES (13,
983657,
13);

INSERT
	INTO
	Prices(id,
	value,
	max_discount)
VALUES (14,
1674057,
10);

INSERT
	INTO
	Prices(id,
	value,
	max_discount)
VALUES (15,
694892,
18);

INSERT
	INTO
	Prices(id,
	value,
	max_discount)
VALUES (16,
647349,
11);

INSERT
	INTO
	Prices(id,
	value,
	max_discount)
VALUES (17,
496044,
13);

INSERT
	INTO
	Prices(id,
	value,
	max_discount)
VALUES (18,
1022253,
16);

INSERT
	INTO
	Prices(id,
	value,
	max_discount)
VALUES (19,
762304,
16);

INSERT
	INTO
	Prices(id,
	value,
	max_discount)
VALUES (20,
1122970,
16);

INSERT
	INTO
	Prices(id,
	value,
	max_discount)
VALUES (21,
1133123,
8);

INSERT
	INTO
	Prices(id,
	value,
	max_discount)
VALUES (22,
1700464,
19);

INSERT
	INTO
	Prices(id,
	value,
	max_discount)
VALUES (23,
1150105,
17);

INSERT
	INTO
	Prices(id,
	value,
	max_discount)
VALUES (24,
765064,
10);

INSERT
	INTO
	Prices(id,
	value,
	max_discount)
VALUES (25,
1743943,
9);

INSERT
	INTO
	Prices(id,
	value,
	max_discount)
VALUES (26,
1081368,
5);

INSERT
	INTO
	Prices(id,
	value,
	max_discount)
VALUES (27,
858832,
5);

INSERT
	INTO
	Prices(id,
	value,
	max_discount)
VALUES (28,
1946424,
16);

INSERT
	INTO
	Prices(id,
	value,
	max_discount)
VALUES (29,
363626,
6);

INSERT
	INTO
	Prices(id,
	value,
	max_discount)
VALUES (30,
1184333,
5);

INSERT
	INTO
	Prices(id,
	value,
	max_discount)
VALUES (31,
720802,
19);

INSERT
	INTO
	Prices(id,
	value,
	max_discount)
VALUES (32,
1836747,
20);

INSERT
	INTO
	Prices(id,
	value,
	max_discount)
VALUES (33,
570832,
9);

INSERT
	INTO
	Prices(id,
	value,
	max_discount)
VALUES (34,
563031,
12);

INSERT
	INTO
	Prices(id,
	value,
	max_discount)
VALUES (35,
817969,
17);

INSERT
	INTO
	Prices(id,
	value,
	max_discount)
VALUES (36,
1849164,
8);

INSERT
	INTO
	Prices(id,
	value,
	max_discount)
VALUES (37,
607191,
15);

INSERT
	INTO
	Prices(id,
	value,
	max_discount)
VALUES (38,
1724727,
13);

INSERT
	INTO
	Prices(id,
	value,
	max_discount)
VALUES (39,
577621,
20);

INSERT
	INTO
	Prices(id,
	value,
	max_discount)
VALUES (40,
1346515,
17);

INSERT
	INTO
	Prices(id,
	value,
	max_discount)
VALUES (41,
639175,
5);

INSERT
	INTO
	Prices(id,
	value,
	max_discount)
VALUES (42,
1504618,
6);

INSERT
	INTO
	Prices(id,
	value,
	max_discount)
VALUES (43,
990468,
10);

INSERT
	INTO
	Prices(id,
	value,
	max_discount)
VALUES (44,
1600710,
10);

INSERT
	INTO
	Prices(id,
	value,
	max_discount)
VALUES (45,
714899,
7);

INSERT
	INTO
	Prices(id,
	value,
	max_discount)
VALUES (46,
1740976,
10);

INSERT
	INTO
	Prices(id,
	value,
	max_discount)
VALUES (47,
1482835,
10);

INSERT
	INTO
	Prices(id,
	value,
	max_discount)
VALUES (48,
846759,
19);

INSERT
	INTO
	Prices(id,
	value,
	max_discount)
VALUES (49,
940842,
8);

INSERT
	INTO
	Prices(id,
	value,
	max_discount)
VALUES (50,
1501729,
14);

INSERT
	INTO
	Prices(id,
	value,
	max_discount)
VALUES (51,
1342821,
13);

INSERT
	INTO
	Prices(id,
	value,
	max_discount)
VALUES (52,
1877505,
18);

INSERT
	INTO
	Prices(id,
	value,
	max_discount)
VALUES (53,
653731,
5);

INSERT
	INTO
	Prices(id,
	value,
	max_discount)
VALUES (54,
1448844,
7);

INSERT
	INTO
	Prices(id,
	value,
	max_discount)
VALUES (55,
1326479,
9);

INSERT
	INTO
	Prices(id,
	value,
	max_discount)
VALUES (56,
1053933,
13);

INSERT
	INTO
	Prices(id,
	value,
	max_discount)
VALUES (57,
1649843,
15);

INSERT
	INTO
	Prices(id,
	value,
	max_discount)
VALUES (58,
1584972,
6);

INSERT
	INTO
	Prices(id,
	value,
	max_discount)
VALUES (59,
1532491,
13);

INSERT
	INTO
	Prices(id,
	value,
	max_discount)
VALUES (60,
1328990,
11);

INSERT
	INTO
	Prices(id,
	value,
	max_discount)
VALUES (61,
1456648,
7);

INSERT
	INTO
	Prices(id,
	value,
	max_discount)
VALUES (62,
1567111,
7);

INSERT
	INTO
	Prices(id,
	value,
	max_discount)
VALUES (63,
434461,
16);

INSERT
	INTO
	Prices(id,
	value,
	max_discount)
VALUES (64,
1153802,
10);

INSERT
	INTO
	Prices(id,
	value,
	max_discount)
VALUES (65,
1564355,
16);

INSERT
	INTO
	Quantity(model_id,
	count)
VALUES (1,
0);

INSERT
	INTO
	Quantity(model_id,
	count)
VALUES (2,
5);

INSERT
	INTO
	Quantity(model_id,
	count)
VALUES (3,
8);

INSERT
	INTO
	Quantity(model_id,
	count)
VALUES (4,
5);

INSERT
	INTO
	Quantity(model_id,
	count)
VALUES (5,
0);

INSERT
	INTO
	Quantity(model_id,
	count)
VALUES (6,
0);

INSERT
	INTO
	Quantity(model_id,
	count)
VALUES (7,
1);

INSERT
	INTO
	Quantity(model_id,
	count)
VALUES (8,
2);

INSERT
	INTO
	Quantity(model_id,
	count)
VALUES (9,
6);

INSERT
	INTO
	Quantity(model_id,
	count)
VALUES (10,
8);

INSERT
	INTO
	Quantity(model_id,
	count)
VALUES (11,
7);

INSERT
	INTO
	Quantity(model_id,
	count)
VALUES (12,
5);

INSERT
	INTO
	Quantity(model_id,
	count)
VALUES (13,
4);

INSERT
	INTO
	Quantity(model_id,
	count)
VALUES (14,
3);

INSERT
	INTO
	Quantity(model_id,
	count)
VALUES (15,
10);

INSERT
	INTO
	Quantity(model_id,
	count)
VALUES (16,
10);

INSERT
	INTO
	Quantity(model_id,
	count)
VALUES (17,
2);

INSERT
	INTO
	Quantity(model_id,
	count)
VALUES (18,
1);

INSERT
	INTO
	Quantity(model_id,
	count)
VALUES (19,
7);

INSERT
	INTO
	Quantity(model_id,
	count)
VALUES (20,
5);

INSERT
	INTO
	Quantity(model_id,
	count)
VALUES (21,
5);

INSERT
	INTO
	Quantity(model_id,
	count)
VALUES (22,
6);

INSERT
	INTO
	Quantity(model_id,
	count)
VALUES (23,
9);

INSERT
	INTO
	Quantity(model_id,
	count)
VALUES (24,
0);

INSERT
	INTO
	Quantity(model_id,
	count)
VALUES (25,
7);

INSERT
	INTO
	Quantity(model_id,
	count)
VALUES (26,
5);

INSERT
	INTO
	Quantity(model_id,
	count)
VALUES (27,
1);

INSERT
	INTO
	Quantity(model_id,
	count)
VALUES (28,
6);

INSERT
	INTO
	Quantity(model_id,
	count)
VALUES (29,
6);

INSERT
	INTO
	Quantity(model_id,
	count)
VALUES (30,
5);

INSERT
	INTO
	Quantity(model_id,
	count)
VALUES (31,
9);

INSERT
	INTO
	Quantity(model_id,
	count)
VALUES (32,
0);

INSERT
	INTO
	Quantity(model_id,
	count)
VALUES (33,
1);

INSERT
	INTO
	Quantity(model_id,
	count)
VALUES (34,
2);

INSERT
	INTO
	Quantity(model_id,
	count)
VALUES (35,
1);

INSERT
	INTO
	Quantity(model_id,
	count)
VALUES (36,
2);

INSERT
	INTO
	Quantity(model_id,
	count)
VALUES (37,
8);

INSERT
	INTO
	Quantity(model_id,
	count)
VALUES (38,
1);

INSERT
	INTO
	Quantity(model_id,
	count)
VALUES (39,
6);

INSERT
	INTO
	Quantity(model_id,
	count)
VALUES (40,
3);

INSERT
	INTO
	Quantity(model_id,
	count)
VALUES (41,
4);

INSERT
	INTO
	Quantity(model_id,
	count)
VALUES (42,
2);

INSERT
	INTO
	Quantity(model_id,
	count)
VALUES (43,
0);

INSERT
	INTO
	Quantity(model_id,
	count)
VALUES (44,
5);

INSERT
	INTO
	Quantity(model_id,
	count)
VALUES (45,
10);

INSERT
	INTO
	Quantity(model_id,
	count)
VALUES (46,
3);

INSERT
	INTO
	Quantity(model_id,
	count)
VALUES (47,
4);

INSERT
	INTO
	Quantity(model_id,
	count)
VALUES (48,
4);

INSERT
	INTO
	Quantity(model_id,
	count)
VALUES (49,
5);

INSERT
	INTO
	Quantity(model_id,
	count)
VALUES (50,
9);

INSERT
	INTO
	Quantity(model_id,
	count)
VALUES (51,
10);

INSERT
	INTO
	Quantity(model_id,
	count)
VALUES (52,
10);

INSERT
	INTO
	Quantity(model_id,
	count)
VALUES (53,
8);

INSERT
	INTO
	Quantity(model_id,
	count)
VALUES (54,
4);

INSERT
	INTO
	Quantity(model_id,
	count)
VALUES (55,
1);

INSERT
	INTO
	Quantity(model_id,
	count)
VALUES (56,
8);

INSERT
	INTO
	Quantity(model_id,
	count)
VALUES (57,
10);

INSERT
	INTO
	Quantity(model_id,
	count)
VALUES (58,
7);

INSERT
	INTO
	Quantity(model_id,
	count)
VALUES (59,
3);

INSERT
	INTO
	Quantity(model_id,
	count)
VALUES (60,
7);

INSERT
	INTO
	Quantity(model_id,
	count)
VALUES (61,
4);

INSERT
	INTO
	Quantity(model_id,
	count)
VALUES (62,
2);

INSERT
	INTO
	Models(id,
	manufacturer_id,
	name,
	price_id,
	inStock,
	seller_id)
VALUES (1,
2,
'Aksona',
4,
TRUE,
6);

INSERT
	INTO
	Models(id,
	manufacturer_id,
	name,
	price_id,
	inStock,
	seller_id)
VALUES (2,
2,
'Aksona',
5,
FALSE,
11);

INSERT
	INTO
	Models(id,
	manufacturer_id,
	name,
	price_id,
	inStock,
	seller_id)
VALUES (3,
11,
'Sakura',
55,
FALSE,
14);

INSERT
	INTO
	Models(id,
	manufacturer_id,
	name,
	price_id,
	inStock,
	seller_id)
VALUES (4,
2,
'Aksona',
6,
TRUE,
12);

INSERT
	INTO
	Models(id,
	manufacturer_id,
	name,
	price_id,
	inStock,
	seller_id)
VALUES (5,
6,
'Edger',
34,
TRUE,
6);

INSERT
	INTO
	Models(id,
	manufacturer_id,
	name,
	price_id,
	inStock,
	seller_id)
VALUES (6,
1,
'J1',
1,
TRUE,
12);

INSERT
	INTO
	Models(id,
	manufacturer_id,
	name,
	price_id,
	inStock,
	seller_id)
VALUES (7,
4,
'Regina',
15,
TRUE,
11);

INSERT
	INTO
	Models(id,
	manufacturer_id,
	name,
	price_id,
	inStock,
	seller_id)
VALUES (8,
8,
'Space',
41,
TRUE,
11);

INSERT
	INTO
	Models(id,
	manufacturer_id,
	name,
	price_id,
	inStock,
	seller_id)
VALUES (9,
3,
'K1',
11,
TRUE,
9);

INSERT
	INTO
	Models(id,
	manufacturer_id,
	name,
	price_id,
	inStock,
	seller_id)
VALUES (10,
5,
'Kryo',
23,
TRUE,
15);

INSERT
	INTO
	Models(id,
	manufacturer_id,
	name,
	price_id,
	inStock,
	seller_id)
VALUES (11,
5,
'Kryo',
24,
TRUE,
7);

INSERT
	INTO
	Models(id,
	manufacturer_id,
	name,
	price_id,
	inStock,
	seller_id)
VALUES (12,
5,
'Kryo',
25,
FALSE,
15);

INSERT
	INTO
	Models(id,
	manufacturer_id,
	name,
	price_id,
	inStock,
	seller_id)
VALUES (13,
4,
'Regina',
16,
FALSE,
14);

INSERT
	INTO
	Models(id,
	manufacturer_id,
	name,
	price_id,
	inStock,
	seller_id)
VALUES (14,
5,
'Kryo SX',
26,
TRUE,
10);

INSERT
	INTO
	Models(id,
	manufacturer_id,
	name,
	price_id,
	inStock,
	seller_id)
VALUES (15,
6,
'Edger',
35,
TRUE,
8);

INSERT
	INTO
	Models(id,
	manufacturer_id,
	name,
	price_id,
	inStock,
	seller_id)
VALUES (16,
2,
'Aksona XL',
7,
TRUE,
6);

INSERT
	INTO
	Models(id,
	manufacturer_id,
	name,
	price_id,
	inStock,
	seller_id)
VALUES (17,
10,
'Kagawa',
51,
TRUE,
8);

INSERT
	INTO
	Models(id,
	manufacturer_id,
	name,
	price_id,
	inStock,
	seller_id)
VALUES (18,
9,
'B2',
46,
FALSE,
7);

INSERT
	INTO
	Models(id,
	manufacturer_id,
	name,
	price_id,
	inStock,
	seller_id)
VALUES (19,
12,
'Bolta',
59,
TRUE,
3);

INSERT
	INTO
	Models(id,
	manufacturer_id,
	name,
	price_id,
	inStock,
	seller_id)
VALUES (20,
3,
'K2',
12,
TRUE,
7);

INSERT
	INTO
	Models(id,
	manufacturer_id,
	name,
	price_id,
	inStock,
	seller_id)
VALUES (21,
9,
'B4',
47,
TRUE,
13);

INSERT
	INTO
	Models(id,
	manufacturer_id,
	name,
	price_id,
	inStock,
	seller_id)
VALUES (22,
11,
'Sakura',
56,
FALSE,
1);

INSERT
	INTO
	Models(id,
	manufacturer_id,
	name,
	price_id,
	inStock,
	seller_id)
VALUES (23,
8,
'Space',
42,
FALSE,
5);

INSERT
	INTO
	Models(id,
	manufacturer_id,
	name,
	price_id,
	inStock,
	seller_id)
VALUES (24,
7,
'Granty',
38,
TRUE,
11);

INSERT
	INTO
	Models(id,
	manufacturer_id,
	name,
	price_id,
	inStock,
	seller_id)
VALUES (25,
5,
'Kryo',
27,
TRUE,
4);

INSERT
	INTO
	Models(id,
	manufacturer_id,
	name,
	price_id,
	inStock,
	seller_id)
VALUES (26,
2,
'Aksona XL',
8,
FALSE,
11);

INSERT
	INTO
	Models(id,
	manufacturer_id,
	name,
	price_id,
	inStock,
	seller_id)
VALUES (27,
12,
'Bolta SV',
60,
TRUE,
6);

INSERT
	INTO
	Models(id,
	manufacturer_id,
	name,
	price_id,
	inStock,
	seller_id)
VALUES (28,
8,
'Space',
43,
TRUE,
9);

INSERT
	INTO
	Models(id,
	manufacturer_id,
	name,
	price_id,
	inStock,
	seller_id)
VALUES (29,
12,
'Bolta',
61,
TRUE,
10);

INSERT
	INTO
	Models(id,
	manufacturer_id,
	name,
	price_id,
	inStock,
	seller_id)
VALUES (30,
8,
'Space',
44,
TRUE,
14);

INSERT
	INTO
	Models(id,
	manufacturer_id,
	name,
	price_id,
	inStock,
	seller_id)
VALUES (31,
5,
'Kryo SX',
28,
TRUE,
12);

INSERT
	INTO
	Models(id,
	manufacturer_id,
	name,
	price_id,
	inStock,
	seller_id)
VALUES (32,
3,
'K3',
13,
TRUE,
6);

INSERT
	INTO
	Models(id,
	manufacturer_id,
	name,
	price_id,
	inStock,
	seller_id)
VALUES (33,
4,
'Regina',
17,
FALSE,
7);

INSERT
	INTO
	Models(id,
	manufacturer_id,
	name,
	price_id,
	inStock,
	seller_id)
VALUES (34,
7,
'Jewel',
39,
FALSE,
15);

INSERT
	INTO
	Models(id,
	manufacturer_id,
	name,
	price_id,
	inStock,
	seller_id)
VALUES (35,
4,
'Regina',
18,
TRUE,
17);

INSERT
	INTO
	Models(id,
	manufacturer_id,
	name,
	price_id,
	inStock,
	seller_id)
VALUES (36,
4,
'Regina',
19,
TRUE,
10);

INSERT
	INTO
	Models(id,
	manufacturer_id,
	name,
	price_id,
	inStock,
	seller_id)
VALUES (37,
9,
'B6',
48,
TRUE,
13);

INSERT
	INTO
	Models(id,
	manufacturer_id,
	name,
	price_id,
	inStock,
	seller_id)
VALUES (38,
6,
'Edger',
36,
TRUE,
2);

INSERT
	INTO
	Models(id,
	manufacturer_id,
	name,
	price_id,
	inStock,
	seller_id)
VALUES (39,
1,
'J1',
2,
TRUE,
5);

INSERT
	INTO
	Models(id,
	manufacturer_id,
	name,
	price_id,
	inStock,
	seller_id)
VALUES (40,
10,
'Kagawa',
52,
TRUE,
17);

INSERT
	INTO
	Models(id,
	manufacturer_id,
	name,
	price_id,
	inStock,
	seller_id)
VALUES (41,
5,
'Kryo',
29,
FALSE,
14);

INSERT
	INTO
	Models(id,
	manufacturer_id,
	name,
	price_id,
	inStock,
	seller_id)
VALUES (42,
9,
'B8',
49,
TRUE,
14);

INSERT
	INTO
	Models(id,
	manufacturer_id,
	name,
	price_id,
	inStock,
	seller_id)
VALUES (43,
5,
'Kryo',
30,
TRUE,
5);

INSERT
	INTO
	Models(id,
	manufacturer_id,
	name,
	price_id,
	inStock,
	seller_id)
VALUES (44,
7,
'Jewel',
40,
FALSE,
9);

INSERT
	INTO
	Models(id,
	manufacturer_id,
	name,
	price_id,
	inStock,
	seller_id)
VALUES (45,
9,
'B6',
50,
TRUE,
4);

INSERT
	INTO
	Models(id,
	manufacturer_id,
	name,
	price_id,
	inStock,
	seller_id)
VALUES (46,
3,
'K3',
14,
TRUE,
2);

INSERT
	INTO
	Models(id,
	manufacturer_id,
	name,
	price_id,
	inStock,
	seller_id)
VALUES (47,
5,
'Kryo',
31,
TRUE,
5);

INSERT
	INTO
	Models(id,
	manufacturer_id,
	name,
	price_id,
	inStock,
	seller_id)
VALUES (48,
4,
'Regina CL',
20,
TRUE,
12);

INSERT
	INTO
	Models(id,
	manufacturer_id,
	name,
	price_id,
	inStock,
	seller_id)
VALUES (49,
4,
'Regina CL',
21,
TRUE,
3);

INSERT
	INTO
	Models(id,
	manufacturer_id,
	name,
	price_id,
	inStock,
	seller_id)
VALUES (50,
8,
'Space v2',
45,
FALSE,
1);

INSERT
	INTO
	Models(id,
	manufacturer_id,
	name,
	price_id,
	inStock,
	seller_id)
VALUES (51,
1,
'J2',
3,
TRUE,
2);

INSERT
	INTO
	Models(id,
	manufacturer_id,
	name,
	price_id,
	inStock,
	seller_id)
VALUES (52,
10,
'Kagawa',
53,
TRUE,
16);

INSERT
	INTO
	Models(id,
	manufacturer_id,
	name,
	price_id,
	inStock,
	seller_id)
VALUES (53,
10,
'Kagawa',
54,
TRUE,
4);

INSERT
	INTO
	Models(id,
	manufacturer_id,
	name,
	price_id,
	inStock,
	seller_id)
VALUES (54,
11,
'Sakura',
57,
TRUE,
12);

INSERT
	INTO
	Models(id,
	manufacturer_id,
	name,
	price_id,
	inStock,
	seller_id)
VALUES (55,
5,
'Kryo SX',
32,
TRUE,
4);

INSERT
	INTO
	Models(id,
	manufacturer_id,
	name,
	price_id,
	inStock,
	seller_id)
VALUES (56,
2,
'Aksona XL',
9,
FALSE,
8);

INSERT
	INTO
	Models(id,
	manufacturer_id,
	name,
	price_id,
	inStock,
	seller_id)
VALUES (57,
11,
'Sakura',
58,
FALSE,
3);

INSERT
	INTO
	Models(id,
	manufacturer_id,
	name,
	price_id,
	inStock,
	seller_id)
VALUES (58,
5,
'Kryo SX',
33,
TRUE,
3);

INSERT
	INTO
	Models(id,
	manufacturer_id,
	name,
	price_id,
	inStock,
	seller_id)
VALUES (59,
6,
'Edger',
37,
TRUE,
7);

INSERT
	INTO
	Models(id,
	manufacturer_id,
	name,
	price_id,
	inStock,
	seller_id)
VALUES (60,
4,
'Regina CL',
22,
TRUE,
4);

INSERT
	INTO
	Models(id,
	manufacturer_id,
	name,
	price_id,
	inStock,
	seller_id)
VALUES (61,
2,
'Aksona XL',
10,
TRUE,
1);

INSERT
	INTO
	Models(id,
	manufacturer_id,
	name,
	price_id,
	inStock,
	seller_id)
VALUES (62,
12,
'Bolta SV',
62,
TRUE,
16);
---------------------------------------------------------------------------------------------------------------
-- ALTER
---------------------------------------------------------------------------------------------------------------

ALTER TABLE Manufacturers ADD FOREIGN KEY (country_id) REFERENCES Countries (id);

ALTER TABLE Countries ADD FOREIGN KEY (region_id) REFERENCES Regions (id);

ALTER TABLE Models ADD FOREIGN KEY (id) REFERENCES Quantity (model_id);

ALTER TABLE Models ADD FOREIGN KEY (manufacturer_id) REFERENCES Manufacturers (id);

ALTER TABLE Models ADD FOREIGN KEY (price_id) REFERENCES Prices (id);

ALTER TABLE Models ADD FOREIGN KEY (seller_id) REFERENCES Sellers (id);

ALTER TABLE Sellers ADD FOREIGN KEY (office_id) REFERENCES Offices (id);

SELECT
	SUM (M.CAPITALIZATION) AS SUMMA,
	C."name" AS Country
FROM
	MANUFACTURERS M
JOIN COUNTRIES C ON
	M.ID = C.ID
GROUP BY
	C."name"
ORDER BY
	SUMMA DESC
LIMIT 1;