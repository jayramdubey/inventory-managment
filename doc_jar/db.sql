CREATE TABLE  "LOGIN_PRASAD" 
   ( "ID" NUMBER, 
	"USER_ID" VARCHAR2(20) NOT NULL ENABLE, 
	"USER_PASSWORD" VARCHAR2(20) NOT NULL ENABLE, 
	"USER_NAME" VARCHAR2(50) NOT NULL ENABLE, 
	"USER_TYPE" VARCHAR2(20), 
	 CONSTRAINT "LOGIN_PRASAD_PK" PRIMARY KEY ("ID") ENABLE, 
	 CONSTRAINT "LOGIN_PRASAD_UK1" UNIQUE ("USER_ID") ENABLE
   )
/


insert into LOGIN_PRASAD
(ID, USER_ID,USER_PASSWORD,USER_NAME,USER_TYPE)
values(1,'u1',123,'sur','admin');


insert into LOGIN_PRASAD
(ID, USER_ID,USER_PASSWORD,USER_NAME,USER_TYPE)
values(2,'u2',123,'tam','manager');


insert into LOGIN_PRASAD
(ID, USER_ID,USER_PASSWORD,USER_NAME,USER_TYPE)
values(3,'u3',123,'uttam','admin');

commit;

CREATE TABLE  "PRASAD_BAG" 
   (	"ID" NUMBER, 
	"BAG_NAME" VARCHAR2(22) NOT NULL ENABLE, 
	"BRAND_NAME" VARCHAR2(22) NOT NULL ENABLE, 
	"MODEL_NO" VARCHAR2(22) NOT NULL ENABLE, 
	"PRICE" NUMBER, 
	"BAG_TYPE" VARCHAR2(22), 
	"BAG_SIZE" VARCHAR2(10), 
	 CONSTRAINT "PRASAD_BAG_PK" PRIMARY KEY ("ID") ENABLE, 
	 CONSTRAINT "PRASAD_BAG_UK1" UNIQUE ("MODEL_NO") ENABLE
   );
 
	INSERT INTO PRASAD_BAG
   (ID,BAG_NAME,BRAND_NAME,MODEL_NO,PRICE,BAG_TYPE,BAG_SIZE)
   VALUES(1,'AMERICON_TUR','AMRCN','A123',200,'MEN','800');


   
   CREATE TABLE  "ITEM_UNIT_TYPE" 
   (	"ID" NUMBER, 
	"UNIT_TYPE" VARCHAR2(15), 
	 CONSTRAINT "ITEM_UNIT_TYPE_PK" PRIMARY KEY ("ID") ENABLE
   )
/

INSERT INTO ITEM_UNIT_TYPE(ID,UNIT_TYPE)VALUES(1,'KG');
INSERT INTO ITEM_UNIT_TYPE(ID,UNIT_TYPE)VALUES(2,'METER');
INSERT INTO ITEM_UNIT_TYPE(ID,UNIT_TYPE)VALUES(3,'UNIT');
INSERT INTO ITEM_UNIT_TYPE(ID,UNIT_TYPE)VALUES(4,'INCH');

CREATE TABLE  "BAG_REQUIRED_RAW_ITEM" 
   (	"ID" NUMBER, 
	"ITEM_NAME" VARCHAR2(50), 
	"ITEM_UNIT_TYPE_ID" NUMBER, 
	 CONSTRAINT "BAG_REQUIRED_RAW_ITEM_PK" PRIMARY KEY ("ID") ENABLE, 
	 CONSTRAINT "BAG_REQUIRED_RAW_ITEM_UK1" UNIQUE ("ITEM_NAME") ENABLE, 
	 CONSTRAINT "BAG_REQUIRED_RAW_ITEM_FK" FOREIGN KEY ("ITEM_UNIT_TYPE_ID")
	  REFERENCES  "ITEM_UNIT_TYPE" ("ID") ENABLE
   )
/


INSERT INTO BAG_REQUIRED_RAW_ITEM( ID, ITEM_NAME, ITEM_UNIT_TYPE_ID)VALUES(1,'cloth',2);
INSERT INTO BAG_REQUIRED_RAW_ITEM( ID, ITEM_NAME, ITEM_UNIT_TYPE_ID)VALUES(2,'spange',2);
INSERT INTO BAG_REQUIRED_RAW_ITEM( ID, ITEM_NAME, ITEM_UNIT_TYPE_ID)VALUES(3,'chain',2);
INSERT INTO BAG_REQUIRED_RAW_ITEM( ID, ITEM_NAME, ITEM_UNIT_TYPE_ID)VALUES(4,'runner',3);
INSERT INTO BAG_REQUIRED_RAW_ITEM( ID, ITEM_NAME, ITEM_UNIT_TYPE_ID)VALUES(5,'stikers',3);
INSERT INTO BAG_REQUIRED_RAW_ITEM( ID, ITEM_NAME, ITEM_UNIT_TYPE_ID)VALUES(6,'bottlenet',4);
INSERT INTO BAG_REQUIRED_RAW_ITEM( ID, ITEM_NAME, ITEM_UNIT_TYPE_ID)VALUES(7,'plastic wrapper',1);

commit;


CREATE TABLE  "BAGS_TYPE_CAUTATION" 
   (	"ID" NUMBER, 
	    "BAG_TYPE" VARCHAR2(30), 
	  "DESCRIPTION" VARCHAR2(100), 
	 CONSTRAINT "BAGS_TYPE_CAUTATION_PK" PRIMARY KEY ("ID") ENABLE, 
	 CONSTRAINT "BAGS_TYPE_CAUTATION_UK1" UNIQUE ("BAG_TYPE") ENABLE
   )

   
   
 INSERT INTO BAGS_TYPE_CAUTATION(ID,BAG_TYPE,DESCRIPTION)
 VALUES(1,'collegebag','use in bag');

 INSERT INTO BAGS_TYPE_CAUTATION(ID,BAG_TYPE,DESCRIPTION)
 VALUES(2,'schoolbag','use in bag');

 INSERT INTO BAGS_TYPE_CAUTATION(ID,BAG_TYPE,DESCRIPTION)
 VALUES(3,'traveling','use for travel');
 
 INSERT INTO BAGS_TYPE_CAUTATION(ID,BAG_TYPE,DESCRIPTION)
 VALUES(4,'ladies purse','use for women luxery');
 
 
 INSERT INTO BAGS_TYPE_CAUTATION(ID,BAG_TYPE,DESCRIPTION)
 VALUES(5,'Thaily','use for marketing');

commit;


CREATE TABLE  "BAG_TYPE_REQUIRED_ITEM" 
   ("ID" NUMBER, 
	"BAG_TYPE_ID" NUMBER, 
	"BAG_REQUIRED_ITEM_ID" NUMBER, 
	"TOTAL_UNIT" NUMBER, 
	 CONSTRAINT "BAG_TYPE_REQUIRED_ITEM_PK" PRIMARY KEY ("ID") ENABLE, 
	 CONSTRAINT "BAG_TYPE_REQUIRED_ITEM_FK" FOREIGN KEY ("BAG_TYPE_ID")
	  REFERENCES  "BAGS_TYPE_CAUTATION" ("ID") ENABLE, 
	 CONSTRAINT "BAG_TYPE_REQUIRED_ITEM_FK2" FOREIGN KEY ("BAG_REQUIRED_ITEM_ID")
	  REFERENCES  "BAG_REQUIRED_RAW_ITEM" ("ID") ENABLE
   );



INSERT INTO BAG_TYPE_REQUIRED_ITEM 
(ID,BAG_TYPE_ID,BAG_REQUIRED_ITEM_ID,TOTAL_UNIT)
VALUES(1,1,1,2);

INSERT INTO BAG_TYPE_REQUIRED_ITEM 
(ID,BAG_TYPE_ID,BAG_REQUIRED_ITEM_ID,TOTAL_UNIT)
VALUES(2,1,2,1);


INSERT INTO BAG_TYPE_REQUIRED_ITEM 
(ID,BAG_TYPE_ID,BAG_REQUIRED_ITEM_ID,TOTAL_UNIT)
VALUES(3,1,3,1);

INSERT INTO BAG_TYPE_REQUIRED_ITEM 
(ID,BAG_TYPE_ID,BAG_REQUIRED_ITEM_ID,TOTAL_UNIT)
VALUES(4,1,4,5);


INSERT INTO BAG_TYPE_REQUIRED_ITEM 
(ID,BAG_TYPE_ID,BAG_REQUIRED_ITEM_ID,TOTAL_UNIT)
VALUES(5,1,5,2);


INSERT INTO BAG_TYPE_REQUIRED_ITEM 
(ID,BAG_TYPE_ID,BAG_REQUIRED_ITEM_ID,TOTAL_UNIT)
VALUES(6,1,6,5);

commit;




select * from BAGS_TYPE_CAUTATION;
select * from BAGS_TYPE_CAUTATION where upper(BAG_TYPE) like '%I%';
select * from BAGS_TYPE_CAUTATION where lower(BAG_TYPE) like '%i%';

select * from BAGS_TYPE_CAUTATION where id=1;

select id from BAGS_TYPE_CAUTATION where BAG_TYPE='collegebag';
select * from BAGS_TYPE_CAUTATION where BAG_TYPE='collegebag';




select id from BAGS_TYPE_CAUTATION where BAG_TYPE='collegebag';


select BAG_REQUIRED_ITEM_ID from BAG_TYPE_REQUIRED_ITEM where BAG_TYPE_ID=(select id from BAGS_TYPE_CAUTATION where BAG_TYPE='collegebag');
   





CREATE TABLE  "RAW_STOCK" 
   (	"ID" NUMBER, 
	"BAG_REQUIRED_ROW_ITEM_ID" NUMBER NOT NULL ENABLE, 
	"TOTAL__UNIT" NUMBER NOT NULL ENABLE, 
	"PRICE_PER_UNIT" NUMBER(10,2) NOT NULL ENABLE, 
	 CONSTRAINT "RAW_STOCK_PK" PRIMARY KEY ("ID") ENABLE, 
	 CONSTRAINT "RAW_STOCK_FK" FOREIGN KEY ("BAG_REQUIRED_ROW_ITEM_ID")
	  REFERENCES  "BAG_REQUIRED_RAW_ITEM" ("ID") ENABLE
   )
/

