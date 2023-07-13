-- creacion y seleccion schema --
Create schema Pacheco_Records;

use Pacheco_records;

-- Creacion de tablas -- 
create table Paises
(
PAIS_ID	INT	,
PAIS_NOM	VARCHAR	(50),
PRIMARY KEY(PAIS_ID));

create table Localidad
(
LOC_ID	INT	,
LOC_NOM	VARCHAR	(50),
LOC_PAIS	INT	,
PRIMARY KEY(LOC_ID),
FOREIGN KEY(LOC_PAIS) REFERENCES Paises (PAIS_ID)
);

create table Generos
(
GEN_ID	INT,	
GEN_NOM	VARCHAR	(50),
PRIMARY KEY(GEN_ID)
);

create table Artist
(ART_ID	INT	,
ART_NOM	VARCHAR	(200),
ART_NAC	INT	,
ART_GEN	INT	,
ART_CONT_VAL	INT	,
PRIMARY KEY(ART_ID),
FOREIGN KEY(ART_NAC) REFERENCES Paises (PAIS_ID),
FOREIGN KEY(ART_GEN) REFERENCES Generos (GEN_ID)
);

Create table Producto_class
(
PRD_ID	INT,	
PRD_NOM	VARCHAR	(50),
PRIMARY KEY(PRD_ID)
);

create table Merch
(MERCH_ID	VARCHAR(50)	,
MERCH_CLASS	INT	,
MERCH_ART	INT	,
MERCH_DESC	VARCHAR	(200),
MERCH_FH_LAN	DATE	,
MERCH_VAL	INT	,
PRIMARY KEY(MERCH_ID),
FOREIGN KEY(MERCH_CLASS) REFERENCES Producto_class (PRD_ID),
FOREIGN KEY(MERCH_ART) REFERENCES Artist (ART_ID)
);


Create table Event_class
(
CLASS_EVNT_ID	INT	,
CLASS_EVNT_NOMBRE	VARCHAR	(200),
PRIMARY KEY(CLASS_EVNT_ID)
);

create table Event_promo
(
EVNT_ID	INT,
EVNT_TIP	INT,
EVNT_LOC	INT,
EVNT_NAC	INT,
EVNT_REC	INT,
EVNT_ART	INT,
EVNT_FH_EVNT	DATE,
EVNT_VALUE	INT,
PRIMARY KEY(EVNT_ID),
FOREIGN KEY(EVNT_LOC) REFERENCES Localidad (LOC_ID),
FOREIGN KEY(EVNT_NAC) REFERENCES Paises (PAIS_ID),
FOREIGN KEY(EVNT_ART) REFERENCES Artist(ART_ID),
FOREIGN KEY(EVNT_TIP) REFERENCES Event_class(CLASS_EVNT_ID)
);

create table Concerts
(
REC_ID	INT,
REC_LOC	INT,
REC_PAIS	INT,
REC_ART	INT,
REC_NOM_GIR	VARCHAR (50),
REC_FH	DATE,
REC_ART_SOP	INT,
REC_RECAUDATION	INT,
REC_ASSIST	INT,
PRIMARY KEY(REC_ID),
FOREIGN KEY(REC_LOC) REFERENCES Localidad (LOC_ID),
FOREIGN KEY(REC_PAIS) REFERENCES Paises (PAIS_ID),
FOREIGN KEY(REC_ART) REFERENCES Artist(ART_ID),
FOREIGN KEY(REC_ART_SOP) REFERENCES Artist(ART_ID)
);

Create table Item_CLASS
(
FORMAT_ID	INT	,
FORMAT_NOM	VARCHAR	(200),
PRIMARY KEY (FORMAT_ID)
);

create table Catalogo
(
CAT_ID	VARCHAR(50)	,
CAT_NOM	VARCHAR(200),
CAT_CLASS	INT	,
CAT_ART	INT	,
CAT_FH	DATE,	
CAT_VALOR	INT,
PRIMARY KEY(CAT_ID),
FOREIGN KEY(CAT_CLASS) REFERENCES Item_CLASS (FORMAT_ID),
FOREIGN KEY(CAT_ART) REFERENCES Artist(ART_ID)
);

create table Ventas_Merch
(
ID_SKU	INT,
ID_MERCH VARCHAR(50),
FH_VTA	date,
PRIMARY KEY(ID_SKU),
FOREIGN KEY(ID_MERCH) REFERENCES Merch(MERCH_ID)
);


-- Insercion datos , formateados en excel , subidos por insercion manual --  


INSERT INTO Generos
VALUES(1,'ROCK&ROLL'),(2,'FUNK'),(3,'JAZZ'),(4,'REAGGE'),(5,'HARDROCK'),(6,'POP'),(7,'SOUL'),(8,'PUNKROCK'),(9,'GRUNGE'),(10,'RAP');

INSERT INTO Paises
VALUES(1,'INGLATERRA'),(2,'USA'),(3,'JAMAICA'),(4,'IRLANDA'),(5,'ITALIA'),(6,'AUSTRALIA'),(7,'MEXICO'),(8,'ARGENTINA'),(9,'BRASIL'),(10,'PERU'),(11,'CHILE');

INSERT INTO localidad
VALUES(1,'D.F',7),(2,'BUENOSAIRES',8),(3,'CORDOBA',8),(4,'ROSARIO',8),(5,'DALLAS',2),(6,'LOSANGELES',2),(7,'NEWYORK',2),(8,'LONDRES',1),(9,'MANCHESTER',1),(10,'MILAN',5),(11,'ROMA',5),(12,'SANPABLO',9),(13,'RIODEJANEIRO',9),(14,'LIMA',10),(15,'SANTIAGO',11);

INSERT INTO Artist
VALUES(1,'TheBeatles',1,1,10671895),(2,'BobDylan',2,1,9701723),(3,'ElvisPresley',2,1,8819748),(4,'TheRollingStones',1,1,8017953),(5,'ChuckBerry',2,1,7289048),(6,'JimiHendrix',2,1,6626407),(7,'JamesBrown',2,2,6024006),(8,'LittleRichard',2,1,5476369),(9,'ArethaFranklin',2,2,4978518),(10,'RayCharles',2,3,4525925),(11,'BobMarley',3,4,4114477),(12,'BeachBoys',2,1,3740434),(13,'BuddyHolly',2,1,3400394),(14,'LedZeppelin',1,5,3091268),(15,'StevieWonder',2,6,2810243),(16,'SamCooke',2,7,2554766),(17,'MuddyWaters',2,1,2322515),(18,'MarvinGaye',2,7,2111377),(19,'VelvetUnderground',2,1,1919434),(20,'BoDiddley',2,7,1744940),(21,'OtisRedding',2,7,1586309),(22,'U2',4,1,1442099),(23,'BruceSpringsteen',2,1,1310999),(24,'JerryLeeLewis',2,1,1191817),(25,'FatsDomino',2,1,1083470),(26,'TheRamones',2,8,984973),(27,'Prince',2,6,895430),(28,'TheClash',1,8,814027),(29,'TheWho',1,1,740024),(30,'Nirvana',2,9,672749),(31,'JohnnyCash',2,1,611590),(32,'SmokeyRobinson&TheMiracles',2,7,555991),(33,'EverlyBrothers',2,7,505447),(34,'NeilYoung',2,1,459497),(35,'MichaelJackson',2,6,417724),(36,'Madonna',5,6,379749),(37,'RoyOrbison',2,1,345227),(38,'JohnLennon',1,1,313842),(39,'DavidBowie',1,6,285311),(40,'Simon&Garfunkel',2,6,259374),(41,'TheDoors',2,1,235794),(42,'AC/DC',6,5,214358),(43,'Radiohead',2,6,194871),(44,'HankWilliams',2,7,177156),(45,'TheEagles',2,1,161051),(46,'TheShirelles',2,1,146410),(47,'BeastieBoys',2,10,133100),(48,'TheStooges',2,7,121000),(49,'TheFourTops',2,1,110000),(50,'CarlosSantana',7,1,100000);

INSERT INTO item_class
VALUES(1,'Digital'),(2,'Cd'),(3,'Vinyl'),(4,'BoxSet');

INSERT INTO Catalogo
VALUES
(	'1CAT'	,	'	TheBeatles-GreatestHits	'	,	1	,	1	,	'2026-12-20'	,	5	)	,
(	'2CAT'	,	'	BobDylan-LiveForever	'	,	2	,	2	,	'2025-12-20'	,	10	)	,
(	'3CAT'	,	'	ElvisPresley-TheBestoftheBest	'	,	3	,	3	,	'2024-12-20'	,	30	)	,
(	'4CAT'	,	'	TheRollingStones-BestRecords	'	,	4	,	4	,	'2023-12-21'	,	100	)	,
(	'5CAT'	,	'	ChuckBerry-AllTheHits	'	,	1	,	5	,	'2022-12-21'	,	5	)	,
(	'6CAT'	,	'	JimiHendrix-LiveInNY	'	,	2	,	6	,	'2021-12-21'	,	10	)	,
(	'7CAT'	,	'	JamesBrown-LiveInWembley	'	,	3	,	7	,	'2020-12-21'	,	30	)	,
(	'8CAT'	,	'	LittleRichard-GreatestHits	'	,	4	,	8	,	'2019-12-22'	,	100	)	,
(	'9CAT'	,	'	ArethaFranklin-LiveForever	'	,	1	,	9	,	'2018-12-22'	,	5	)	,
(	'10CAT'	,	'	RayCharles-TheBestoftheBest	'	,	2	,	10	,	'2017-12-22'	,	10	)	,
(	'11CAT'	,	'	BobMarley-BestRecords	'	,	3	,	11	,	'2016-12-22'	,	30	)	,
(	'12CAT'	,	'	BeachBoys-AllTheHits	'	,	4	,	12	,	'2015-12-23'	,	100	)	,
(	'13CAT'	,	'	BuddyHolly-LiveInNY	'	,	1	,	13	,	'2014-12-23'	,	5	)	,
(	'14CAT'	,	'	LedZeppelin-LiveInWembley	'	,	2	,	14	,	'2013-12-23'	,	10	)	,
(	'15CAT'	,	'	StevieWonder-GreatestHits	'	,	3	,	15	,	'2012-12-23'	,	30	)	,
(	'16CAT'	,	'	SamCooke-LiveForever	'	,	4	,	16	,	'2011-12-24'	,	100	)	,
(	'17CAT'	,	'	MuddyWaters-TheBestoftheBest	'	,	1	,	17	,	'2010-12-24'	,	5	)	,
(	'18CAT'	,	'	MarvinGaye-BestRecords	'	,	2	,	18	,	'2009-12-24'	,	10	)	,
(	'19CAT'	,	'	VelvetUnderground-AllTheHits	'	,	3	,	19	,	'2008-12-24'	,	30	)	,
(	'20CAT'	,	'	BoDiddley-LiveInNY	'	,	4	,	20	,	'2007-12-25'	,	100	)	;


INSERT INTO Producto_Class
VALUES
(	1	,	'	Remera	'	)	,
(	2	,	'	Llavero	'	)	,
(	3	,	'	Buzo	'	)	,
(	4	,	'	Vaso	'	)	,
(	5	,	'	Poster	'	)	,
(	6	,	'	Gorra	'	)	,
(	7	,	'	Stickers	'	)	,
(	8	,	'	Figura	'	)	,
(	9	,	'	Campera	'	)	,
(	10	,	'	Medias	'	)	;

INSERT INTO merch
VALUES
(	'1MERCH'	,	1	,	1	,	'	Remera-TheBeatles	'	,	'2022-01-01'	,	30	)	,
(	'2MERCH'	,	2	,	10	,	'	Llavero-RayCharles	'	,	'2022-01-02'	,	3	)	,
(	'3MERCH'	,	3	,	20	,	'	Buzo-BoDiddley	'	,	'2022-01-03'	,	50	)	,
(	'4MERCH'	,	4	,	2	,	'	Vaso-BobDylan	'	,	'2022-01-04'	,	5	)	,
(	'5MERCH'	,	5	,	11	,	'	Poster-BobMarley	'	,	'2022-01-05'	,	5	)	,
(	'6MERCH'	,	6	,	21	,	'	Gorra-OtisRedding	'	,	'2022-01-06'	,	10	)	,
(	'7MERCH'	,	7	,	1	,	'	Stickers-TheBeatles	'	,	'2022-01-07'	,	2	)	,
(	'8MERCH'	,	8	,	10	,	'	Figura-RayCharles	'	,	'2022-01-08'	,	100	)	,
(	'9MERCH'	,	9	,	20	,	'	Campera-BoDiddley	'	,	'2022-01-09'	,	80	)	,
(	'10MERCH'	,	10	,	2	,	'	Medias-BobDylan	'	,	'2022-01-10'	,	5	)	,
(	'11MERCH'	,	1	,	11	,	'	Remera-BobMarley	'	,	'2022-01-11'	,	30	)	,
(	'12MERCH'	,	2	,	21	,	'	Llavero-OtisRedding	'	,	'2022-01-12'	,	3	)	,
(	'13MERCH'	,	3	,	3	,	'	Buzo-ElvisPresley	'	,	'2022-01-13'	,	50	)	,
(	'14MERCH'	,	4	,	12	,	'	Vaso-BeachBoys	'	,	'2022-01-14'	,	5	)	,
(	'15MERCH'	,	5	,	22	,	'	Poster-U2	'	,	'2022-01-15'	,	5	)	,
(	'16MERCH'	,	6	,	4	,	'	Gorra-TheRollingStones	'	,	'2022-01-16'	,	10	)	,
(	'17MERCH'	,	7	,	13	,	'	Stickers-BuddyHolly	'	,	'2022-01-17'	,	2	)	,
(	'18MERCH'	,	8	,	23	,	'	Figura-BruceSpringsteen	'	,	'2022-01-18'	,	100	)	,
(	'19MERCH'	,	9	,	5	,	'	Campera-ChuckBerry	'	,	'2022-01-19'	,	80	)	,
(	'20MERCH'	,	10	,	14	,	'	Medias-LedZeppelin	'	,	'2022-01-20'	,	5	)	;



INSERT INTO concerts
VALUES
(	1	,	1	,	7	,	33	,	'	LastTour	'	,	'2023-05-01'	,	32	,	5500000	,	100000	)	,
(	2	,	2	,	8	,	34	,	'	FinalTour	'	,	'2023-05-02'	,	33	,	4950000	,	90000	)	,
(	3	,	3	,	8	,	35	,	'	EndTour	'	,	'2023-05-03'	,	34	,	4455000	,	81000	)	,
(	4	,	4	,	8	,	36	,	'	WorldTour	'	,	'2023-05-04'	,	35	,	4009500	,	72900	)	,
(	5	,	5	,	2	,	37	,	'	LastTour	'	,	'2023-05-05'	,	36	,	3608550	,	65610	)	,
(	6	,	6	,	2	,	38	,	'	FinalTour	'	,	'2023-05-06'	,	37	,	3247695	,	59049	)	,
(	7	,	7	,	2	,	39	,	'	EndTour	'	,	'2023-05-07'	,	38	,	2922925	,	53144	)	,
(	8	,	8	,	1	,	40	,	'	WorldTour	'	,	'2023-05-08'	,	39	,	2630632	,	47829	)	,
(	9	,	9	,	1	,	41	,	'	LastTour	'	,	'2023-05-09'	,	40	,	2367569	,	43046	)	,
(	10	,	10	,	5	,	42	,	'	FinalTour	'	,	'2023-05-10'	,	41	,	2130812	,	38742	)	,
(	11	,	11	,	5	,	43	,	'	EndTour	'	,	'2023-05-11'	,	42	,	1917731	,	34867	)	,
(	12	,	1	,	7	,	44	,	'	WorldTour	'	,	'2023-05-12'	,	43	,	1725958	,	31381	)	,
(	13	,	2	,	8	,	45	,	'	LastTour	'	,	'2023-05-13'	,	44	,	1553362	,	28242	)	,
(	14	,	3	,	8	,	46	,	'	FinalTour	'	,	'2023-05-14'	,	45	,	1398026	,	25418	)	,
(	15	,	4	,	8	,	47	,	'	EndTour	'	,	'2023-05-15'	,	46	,	1258223	,	22876	)	,
(	16	,	5	,	2	,	48	,	'	WorldTour	'	,	'2023-05-16'	,	47	,	1132401	,	20589	)	,
(	17	,	6	,	2	,	49	,	'	LastTour	'	,	'2023-05-17'	,	48	,	1019161	,	18530	)	,
(	18	,	7	,	2	,	50	,	'	FinalTour	'	,	'2023-05-18'	,	49	,	917244	,	16677	)	,
(	19	,	8	,	1	,	18	,	'	EndTour	'	,	'2023-05-19'	,	17	,	825520	,	15009	)	,
(	20	,	9	,	1	,	19	,	'	WorldTour	'	,	'2023-05-20'	,	18	,	742968	,	13508	)	,
(	21	,	10	,	5	,	20	,	'	LastTour	'	,	'2023-05-21'	,	19	,	668671	,	12157	)	,
(	22	,	11	,	5	,	21	,	'	FinalTour	'	,	'2023-05-22'	,	20	,	601804	,	10941	)	,
(	23	,	1	,	7	,	1	,	'	EndTour	'	,	'2023-05-23'	,	45	,	541623	,	9847	)	,
(	24	,	2	,	8	,	2	,	'	WorldTour	'	,	'2023-05-24'	,	1	,	487461	,	8862	)	,
(	25	,	3	,	8	,	3	,	'	LastTour	'	,	'2023-05-25'	,	2	,	438715	,	7976	)	,
(	26	,	4	,	8	,	4	,	'	FinalTour	'	,	'2023-05-26'	,	3	,	394843	,	7178	)	,
(	27	,	5	,	2	,	5	,	'	EndTour	'	,	'2023-05-27'	,	4	,	355359	,	6461	)	,
(	28	,	6	,	2	,	6	,	'	WorldTour	'	,	'2023-05-28'	,	5	,	319823	,	5814	)	,
(	29	,	7	,	2	,	28	,	'	LastTour	'	,	'2023-05-29'	,	27	,	287841	,	5233	)	,
(	30	,	8	,	1	,	29	,	'	FinalTour	'	,	'2023-05-30'	,	28	,	259057	,	4710	)	;

INSERT INTO event_class
VALUES
(	1	,	'	Presentacion_Album	'	)	,
(	2	,	'	Presentacion_Gira	'	)	,
(	3	,	'	Conferencia_Prensa	'	)	,
(	4	,	'	Firma_Discos	'	)	,
(	5	,	'	Firma_Autografos	'	)	,
(	6	,	'	Conferencia_Prensa_Concierto	'	)	;

INSERT INTO event_promo
VALUES
(	1	,	1	,	1	,	7	,	0	,	1	,	'2023-04-01'	,	10000	)	,
(	2	,	2	,	2	,	8	,	0	,	2	,	'2023-04-02'	,	12000	)	,
(	3	,	3	,	3	,	8	,	0	,	3	,	'2023-04-03'	,	14000	)	,
(	4	,	4	,	4	,	8	,	0	,	4	,	'2023-04-04'	,	16000	)	,
(	5	,	5	,	5	,	2	,	0	,	3	,	'2023-04-05'	,	18000	)	,
(	6	,	6	,	6	,	2	,	0	,	4	,	'2023-04-06'	,	20000	)	,
(	7	,	1	,	7	,	2	,	0	,	5	,	'2023-04-07'	,	22000	)	,
(	8	,	2	,	8	,	1	,	0	,	6	,	'2023-04-08'	,	24000	)	,
(	9	,	3	,	9	,	1	,	0	,	5	,	'2023-04-09'	,	26000	)	,
(	10	,	4	,	10	,	5	,	0	,	6	,	'2023-04-10'	,	28000	)	,
(	11	,	5	,	11	,	5	,	0	,	7	,	'2023-04-11'	,	30000	)	,
(	12	,	6	,	12	,	9	,	0	,	8	,	'2023-04-12'	,	32000	)	,
(	13	,	1	,	13	,	9	,	0	,	7	,	'2023-04-13'	,	34000	)	,
(	14	,	2	,	14	,	10	,	0	,	8	,	'2023-04-14'	,	36000	)	,
(	15	,	3	,	15	,	11	,	0	,	9	,	'2023-04-15'	,	38000	)	,
(	16	,	4	,	1	,	7	,	0	,	10	,	'2023-04-16'	,	40000	)	,
(	17	,	5	,	2	,	8	,	0	,	9	,	'2023-04-17'	,	42000	)	,
(	18	,	6	,	3	,	8	,	0	,	10	,	'2023-04-18'	,	44000	)	,
(	19	,	1	,	4	,	8	,	0	,	11	,	'2023-04-19'	,	46000	)	,
(	20	,	2	,	5	,	2	,	0	,	12	,	'2023-04-20'	,	48000	)	,
(	21	,	3	,	6	,	2	,	0	,	11	,	'2023-04-21'	,	50000	)	,
(	22	,	4	,	7	,	2	,	0	,	12	,	'2023-04-22'	,	52000	)	,
(	23	,	5	,	8	,	1	,	0	,	13	,	'2023-04-23'	,	54000	)	,
(	24	,	6	,	9	,	1	,	0	,	14	,	'2023-04-24'	,	56000	)	,
(	25	,	1	,	10	,	5	,	0	,	13	,	'2023-04-25'	,	58000	)	,
(	26	,	2	,	11	,	5	,	0	,	14	,	'2023-04-26'	,	60000	)	,
(	27	,	3	,	12	,	9	,	0	,	15	,	'2023-04-27'	,	62000	)	,
(	28	,	4	,	13	,	9	,	0	,	16	,	'2023-04-28'	,	64000	)	,
(	29	,	5	,	14	,	10	,	0	,	15	,	'2023-04-29'	,	66000	)	,
(	30	,	6	,	15	,	11	,	0	,	16	,	'2023-04-30'	,	68000	)	,
(	31	,	1	,	3	,	8	,	0	,	17	,	'2023-05-01'	,	70000	)	,
(	32	,	2	,	4	,	8	,	0	,	18	,	'2023-05-02'	,	72000	)	,
(	33	,	3	,	5	,	2	,	0	,	17	,	'2023-05-03'	,	74000	)	,
(	34	,	4	,	6	,	2	,	0	,	18	,	'2023-05-04'	,	76000	)	,
(	35	,	5	,	7	,	2	,	0	,	19	,	'2023-05-05'	,	78000	)	,
(	36	,	6	,	8	,	1	,	0	,	20	,	'2023-05-06'	,	80000	)	,
(	37	,	1	,	9	,	1	,	0	,	19	,	'2023-05-07'	,	82000	)	,
(	38	,	2	,	10	,	5	,	0	,	20	,	'2023-05-08'	,	84000	)	,
(	39	,	3	,	11	,	5	,	0	,	21	,	'2023-05-09'	,	86000	)	,
(	40	,	4	,	12	,	9	,	0	,	22	,	'2023-05-10'	,	88000	)	,
(	41	,	5	,	13	,	9	,	0	,	21	,	'2023-05-11'	,	90000	)	,
(	42	,	6	,	14	,	10	,	0	,	22	,	'2023-05-12'	,	92000	)	,
(	43	,	1	,	12	,	9	,	0	,	23	,	'2023-05-13'	,	94000	)	,
(	44	,	2	,	13	,	9	,	0	,	24	,	'2023-05-14'	,	96000	)	,
(	45	,	3	,	1	,	7	,	0	,	23	,	'2023-05-15'	,	98000	)	,
(	46	,	4	,	2	,	8	,	0	,	24	,	'2023-05-16'	,	100000	)	,
(	47	,	5	,	3	,	8	,	0	,	25	,	'2023-05-17'	,	102000	)	,
(	48	,	6	,	4	,	8	,	0	,	26	,	'2023-05-18'	,	104000	)	,
(	49	,	1	,	5	,	2	,	0	,	25	,	'2023-05-19'	,	106000	)	,
(	50	,	2	,	6	,	2	,	0	,	26	,	'2023-05-20'	,	108000	)	,
(	51	,	3	,	7	,	2	,	0	,	27	,	'2023-05-21'	,	110000	)	,
(	52	,	4	,	8	,	1	,	0	,	28	,	'2023-05-22'	,	112000	)	,
(	53	,	5	,	9	,	1	,	0	,	27	,	'2023-05-23'	,	114000	)	,
(	54	,	6	,	10	,	5	,	0	,	28	,	'2023-05-24'	,	116000	)	,
(	55	,	1	,	11	,	5	,	0	,	29	,	'2023-05-25'	,	118000	)	,
(	56	,	2	,	12	,	9	,	0	,	30	,	'2023-05-26'	,	120000	)	,
(	57	,	3	,	5	,	2	,	0	,	29	,	'2023-05-27'	,	122000	)	,
(	58	,	4	,	6	,	2	,	0	,	30	,	'2023-05-28'	,	124000	)	,
(	59	,	5	,	7	,	2	,	0	,	31	,	'2023-05-29'	,	126000	)	,
(	60	,	6	,	8	,	1	,	0	,	32	,	'2023-05-30'	,	128000	)	;

INSERT INTO Ventas_Merch
VALUES

(	1	,	'1MERCH'	,	'2020-01-01'),
(	2	,	'2MERCH'	,	'2020-01-04')	,
(	3	,	'3MERCH'	,	'2020-01-07')	,
(	4	,	'4MERCH'	,	'2020-01-10')	,
(	5	,	'5MERCH'	,	'2020-01-13')	,
(	6	,	'6MERCH'	,	'2020-01-16')	,
(	7	,	'7MERCH'	,	'2020-01-19')	,
(	8	,	'8MERCH'	,	'2020-01-22')	,
(	9	,	'9MERCH'	,	'2020-01-25')	,
(	10	,	'10MERCH'	,	'2020-01-28')	,
(	11	,	'11MERCH'	,	'2020-01-31')	,
(	12	,	'12MERCH'	,	'2020-02-03')	,
(	13	,	'13MERCH'	,	'2020-02-06')	,
(	14	,	'14MERCH'	,	'2020-02-09')	,
(	15	,	'15MERCH'	,	'2020-02-12')	,
(	16	,	'16MERCH'	,	'2020-02-15')	,
(	17	,	'17MERCH'	,	'2020-02-18')	,
(	18	,	'18MERCH'	,	'2020-02-21')	,
(	19	,	'19MERCH'	,	'2020-02-24')	,
(	20	,	'20MERCH'	,	'2020-02-27')	,
(	21	,	'19MERCH'	,	'2020-03-01')	,
(	22	,	'19MERCH'	,	'2020-03-04')	,
(	23	,	'19MERCH'	,	'2020-03-07')	,
(	24	,	'12MERCH'	,	'2020-03-10')	,
(	25	,	'12MERCH'	,	'2020-03-13')	,
(	26	,	'12MERCH'	,	'2020-03-16')	,
(	27	,	'5MERCH'	,	'2020-03-19')	,
(	28	,	'6MERCH'	,	'2020-03-22')	,
(	29	,	'12MERCH'	,	'2020-03-25')	,
(	30	,	'12MERCH'	,	'2020-03-28')	,
(	31	,	'5MERCH'	,	'2020-03-31')	,
(	32	,	'6MERCH'	,	'2020-04-03')	,
(	33	,	'12MERCH'	,	'2020-04-06')	,
(	34	,	'13MERCH'	,	'2020-04-09')	,
(	35	,	'6MERCH'	,	'2020-04-12')	,
(	36	,	'16MERCH'	,	'2020-04-15') ;

-- Vista que muestra los artistas con contratos superior al 1M de dolares--

CREATE VIEW Artistas_contratos_altos as
(select * FROM artist where (ART_CONT_VAL > 1000000)) ;

-- Vista que muestra los artistas con la descripcion de su nacionalidad--

CREATE VIEW Artistas_descripcion_Pais as
(select ART_ID,ART_NOM,PAIS_NOM FROM artist A join paises P on (a.ART_NAC=p.PAIS_ID));

-- Vista que muestra los artistas con la descripcion de su nacionalidad y su genero --

CREATE VIEW Artistas_descripcion_Pais_generos as
(select ART_ID,ART_NOM,PAIS_NOM,GEN_NOM FROM artist A join paises P on (a.ART_NAC=p.PAIS_ID) join generos G on (a.ART_GEN=G.GEN_ID));

-- Vista que muestra solamente los artistas que tienen algun recital registrado --

CREATE VIEW Artistas_con_recitales_registrados AS 
(select REC_ID,REC_NOM_GIR,ART_NOM FROM concerts C left join artist A on (C.REC_ART=a.ART_ID));

-- Vista que muestra solamente los artistas que tienen remeras dentro de su merch--

CREATE VIEW artistas_con_merch_remeras AS 
(select MERCH_DESC,ART_NOM FROM Merch M Left join producto_class P on (M.MERCH_CLASS=P.PRD_ID) LEFT JOIN artist A on (M.MERCH_ART=A.ART_ID) where(P.PRD_ID=1));

-- Funcion creada para poder convertir los valores de los productos que comercializa la discografica a pesos Argentinos-- 
DELIMITER $$
CREATE FUNCTION `Valor_ARS` (PrecioUSS INT) RETURNS INT DETERMINISTIC
BEGIN
RETURN PrecioUSS*490;
END;
$$

-- SELECT MERCH_ID,MERCH_CLASS,MERCH_ART,MERCH_DESC,MERCH_VAL,Valor_ARS(MERCH_VAL) AS MERCH_VAL_ARS FROM merch;--

-- Funcion creada para poder categorizar a los artistas segun su convocatoria de recitales-- 

DELIMITER $$
CREATE FUNCTION `Categoria_convocatoria` (Asistentes INT) RETURNS VARCHAR(20) DETERMINISTIC
BEGIN
CASE 
WHEN Asistentes >=100000 THEN 
RETURN 'Megaestadios';
WHEN Asistentes >=50000 and  Asistentes<100000 THEN 
RETURN 'Estadios';
WHEN Asistentes <50000 THEN 
RETURN 'Microestadios';
END CASE;
END;
$$

-- SELECT REC_ART,ART_NOM,REC_ASSIST AS ASISTENTES ,Categoria_convocatoria(REC_ASSIST) as CATEGORIA_CONVOCATORIA FROM concerts C left join artist A on (C.REC_ART=a.ART_ID)--

 -- Procedimiento que lo que hace es traerme los artistas segun el pais que defino como parametro -- 
 
DELIMITER $$
CREATE PROCEDURE `Artista Segun Paises` (IN Paises1 varchar(20))
BEGIN
SELECT ART_ID,ART_NOM,PAIS_NOM FROM artist A left join paises P on (A.ART_NAC=P.PAIS_ID) 
WHERE PAIS_NOM = Paises1;
END $$

-- CALL `Artista Segun Paises`('Jamaica') -- 

 -- Procedimiento que lo que hace es traerme la cantidad de distintos productos que tiene cada artista -- 
 
DELIMITER $$
CREATE PROCEDURE `Artistas_SKU` (IN Id_Art INT , OUT Productos_distintos INT)
BEGIN
SELECT COUNT(MERCH_ID)  
FROM merch
WHERE  Id_Art = MERCH_ART ;
END $$

 -- CALL `Artistas_SKU`(1,@p) --  
 
-- Trigger para pegar en una tabla de soporte los artistas que se agregan posterior a la plantilla inicial -- 
CREATE TABLE Artistas_Nuevos
(ART_ID_BK_UP INT,
ART_NOM_BK_UP VARCHAR	(200),
ART_NAC_BK_UP	INT	,
ART_GEN_BK_UP	INT	,
ART_CONT_VAL_BK_UP	INT	,
PRIMARY KEY(ART_ID_BK_UP)
)

DELIMITER $$

CREATE TRIGGER Base_Historica_Artistas 
AFTER INSERT ON artist
FOR EACH ROW
BEGIN 
   INSERT INTO Artistas_Nuevos (ART_ID_BK_UP,
ART_NOM_BK_UP ,
ART_NAC_BK_UP,
ART_GEN_BK_UP,
ART_CONT_VAL_BK_UP)
   VALUES (NEW.ART_ID, NEW.ART_NOM, NEW.ART_NAC,NEW.ART_GEN,NEW.ART_CONT_VAL);
END; $$

INSERT INTO Artist (ART_ID,ART_NOM,ART_NAC,ART_GEN,ART_CONT_VAL)
VALUES(51,'Elmatounpoliciamotorizado',8,1,10695);

SELECT * FROM Artistas_Nuevos;

-- Este Trigger aplica a una situacion de crisis en la cual la Discografica no esta dispuesta a negociar contratos mayores a lo existente , en cambio si ajustara en caso de aceptar una reduccion del mismo --


DELIMITER $$
CREATE TRIGGER Negociacion_Artista
BEFORE UPDATE ON Artist
FOR EACH ROW
BEGIN
  IF NEW.ART_CONT_VAL> OLD.ART_CONT_VAL
    THEN
      SET NEW.ART_CONT_VAL = OLD.ART_CONT_VAL;
  END IF ;
END; $$

-- Fin Trigger 2  --

-- Creacion Usuarios -- 
-- Usuario que puede leer todas las tablas de mi esquema  --
-- create user Menganito@pachecorecords identified by '123456'; grant select on pacheco_records.* to Menganito@pachecorecords; --

-- Usuario que puede leer , insertar y modificar todas las tablas de mi esquema -- 
-- create user Fulanito@pachecorecords identified by '789123'; grant select,insert,update on pacheco_records.* to Fulanito@pachecorecords; --

-- Fin Creacion usuarios -- 

-- TCL Tabla 1 Artist

-- START TRANSACTION; DELETE FROM artist WHERE ART_ID=51;  ROLLBACK COMMIT --

-- INSERT INTO Artist (ART_ID,ART_NOM,ART_NAC,ART_GEN,ART_CONT_VAL) VALUES(51,'Elmatounpoliciamotorizado',8,1,10695); --

-- TCL Tabla 2 Generos--

START TRANSACTION;

INSERT INTO generos VALUES (11,'HEAVYMETAL');
INSERT INTO generos VALUES (12,'TECNO');
INSERT INTO generos VALUES (13,'TRAP');
INSERT INTO generos VALUES (14,'NEWVAWE');
SAVEPOINT Primera_carga;
INSERT INTO generos VALUES (15,'INDUSTRIAL');
INSERT INTO generos VALUES (16,'HOUSE');
INSERT INTO generos VALUES (17,'SKA');
INSERT INTO generos VALUES (18,'FOLKLORE');
SAVEPOINT Segunda_carga;
COMMIT
-- RELEASE Primera_carga --
-- Fin Proyecto --