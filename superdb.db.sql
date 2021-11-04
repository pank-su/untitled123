BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "dishes" (
	"name"	TEXT NOT NULL UNIQUE,
	"weight"	INTEGER,
	"ingredients"	TEXT,
	"photo"	TEXT,
	"price"	INTEGER
);
CREATE TABLE IF NOT EXISTS "orders" (
	"id"	INTEGER NOT NULL UNIQUE,
	"order list"	TEXT,
	"cost"	INTEGER,
	"type"	TEXT,
	"delivery address"	TEXT,
	"pickup address"	TEXT,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "branchs" (
	"id"	INTEGER NOT NULL UNIQUE,
	"address"	TEXT,
	"director's full name"	INTEGER UNIQUE,
	"director's telephone"	INTEGER UNIQUE,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "positions" (
	"id"	INTEGER NOT NULL UNIQUE,
	"name"	TEXT,
	"mode"	TEXT,
	"working hours/week"	INTEGER,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "clients" (
	"id"	INTEGER NOT NULL UNIQUE,
	"login"	TEXT,
	"telephone"	TEXT,
	"email"	TEXT,
	"order now"	INTEGER,
	"history orders"	TEXT,
	FOREIGN KEY("order now") REFERENCES "orders"("id"),
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "employees" (
	"id"	INTEGER NOT NULL,
	"full name"	INTEGER,
	"date of birth"	TEXT,
	"experience"	INTEGER,
	"telephone"	TEXT,
	"position"	INTEGER,
	"branch"	INTEGER,
	FOREIGN KEY("branch") REFERENCES "branchs"("id"),
	FOREIGN KEY("position") REFERENCES "positions"("id"),
	PRIMARY KEY("id" AUTOINCREMENT)
);
INSERT INTO "dishes" VALUES ('Суши ЧУКА',130,'Салат ЧУКА, рис, кунжут, водоросли нори.','https://www.tokyo-city.ru/goods/sushi_chuka_615ca649671c7.jpg',209);
INSERT INTO "dishes" VALUES ('Суши САКИ',140,'Лосось, рис','https://www.tokyo-city.ru/goods/sushi_sake_615ca393af444.jpg',239);
INSERT INTO "dishes" VALUES ('Суши, запечённые под сырным соусом лосось',150,'Лосось, рис, водоросли нори, соусы унаги и сырный.','https://www.tokyo-city.ru/goods/sushi_baked_615ca7e258793.jpg',299);
INSERT INTO "dishes" VALUES ('САКЕ МАКИ','120/20','Лосось, рис, водоросли нори.','https://www.tokyo-city.ru/goods/roll_sakemaki.jpg',229);
INSERT INTO "dishes" VALUES ('НЕЖНАЯ КАЛИФОРНИЯ',260,'Снежный краб, огурец, рис, водоросли нори, авокадо, сливочный сыр, масаго.','https://www.tokyo-city.ru/goods/roll_california_6165c5bca7980.jpg',249);
INSERT INTO "dishes" VALUES ('Ролл Сливочный Угорь','284/23','Угорь, сливочный сыр, рис, огурец, водоросли нори, сливочный соус, соусы унаги и сладкий чили, кунжут.','https://www.tokyo-city.ru/goods/roll_creamyugor_6165e8f56e4ff.jpg',449);
INSERT INTO "dishes" VALUES ('Запечённый ролл с крабом и сыром моцарелла','350/23','Снежный краб, лосось, сыр моцарелла, омлет тамаго, икра масаго, рис, водоросли нори, сливочный сыр, огурец, майонез.','https://www.tokyo-city.ru/goods/roll_mozarella_6165f0d805918.jpg',360);
INSERT INTO "dishes" VALUES ('Кривые суши',500,'Ацитон, гайки, болты, активированный фотошоп, перец(много), свежая вода.','images/logo.png',777);
INSERT INTO "branchs" VALUES (1,'г. Колпино Октябрьская улица д. 47','Панков Василий Дмитриевич',79627011087);
INSERT INTO "positions" VALUES (1,'Директор','День',40);
INSERT INTO "positions" VALUES (2,'Курьер','Свободный',28);
INSERT INTO "positions" VALUES (3,'Повар','День',16);
INSERT INTO "positions" VALUES (4,'Сисадмин','Свободный',18);
INSERT INTO "positions" VALUES (5,'Повар','Вечер',24);
INSERT INTO "positions" VALUES (6,'Охранник','День',40);
INSERT INTO "positions" VALUES (7,'Охранник','Ночь',40);
INSERT INTO "positions" VALUES (8,'Курьер','Свободный',30);
INSERT INTO "clients" VALUES (1,'admin','123','frostkslo1@yandex.ru',NULL,'');
INSERT INTO "employees" VALUES (1,'Панков Василий Дмитриевич','06.11.2003',2,'+79627012087',1,1);
INSERT INTO "employees" VALUES (2,'Гайкин Кирилл Денисович','18.09.2003',4,'+79228903451',4,1);
INSERT INTO "employees" VALUES (3,'Белоцирковский Игнат Викторович ','30.01.2004',1,'+79279076452',3,1);
INSERT INTO "employees" VALUES (4,'Панков Владимир Васильевич','20.10.2009',0,'+79099837650',5,1);
INSERT INTO "employees" VALUES (5,'Куреличев Михаил Александрович','17.05.2002',2,'+79567234892',2,1);
INSERT INTO "employees" VALUES (6,'Гомуйло Сергей Владимирович','13.12.2005',8,'+76747456496',7,1);
INSERT INTO "employees" VALUES (7,'Швец Анастасия Васильевна','18.02.2005',4,'+73343242321',3,1);
COMMIT;
