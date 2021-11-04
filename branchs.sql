BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "branchs" (
	"id"	INTEGER NOT NULL UNIQUE,
	"address"	TEXT,
	"director's full name"	INTEGER UNIQUE,
	"director's telephone"	INTEGER UNIQUE,
	PRIMARY KEY("id" AUTOINCREMENT)
);
INSERT INTO "branchs" VALUES (1,'г. Колпино Октябрьская улица д. 47','Панков Василий Дмитриевич',79627011087);
COMMIT;
