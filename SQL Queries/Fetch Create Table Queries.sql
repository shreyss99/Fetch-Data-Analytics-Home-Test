
-- users table
CREATE TABLE public.users
(
	CREATED_DATE timestamp,
	BIRTH_DATE timestamp,
	GENDER varchar(30) CHECK(GENDER in ('female','male','transgender','prefer_not_to_say')),
	LAST_REWARDS_LOGIN timestamp,
	STATE varchar(2),
	SIGN_UP_PLATFORM varchar(10) CHECK(SIGN_UP_PLATFORM in ('ios','andrioid','unknown')),
	SIGN_UP_SOURCE varchar(10) CHECK(SIGN_UP_SOURCE in ('Google','Apple','Facebook','Email')),
	ID varchar(24),
	PRIMARY KEY (ID)
)

SELECT * FROM users;


-- receipts table
CREATE TABLE public.receipts
(
	ID varchar(50),
	STORE_NAME varchar(50000),
	PURCHASE_DATE timestamp,
	PURCHASE_TIME varchar(15),
	DATE_SCANNED timestamp,
	TOTAL_SPENT decimal(10,2),
	REWARDS_RECEIPT_STATUS varchar(15) CHECK(REWARDS_RECEIPT_STATUS in ('FINISHED','SUBMITTED','FLAGGED','PENDING','REJECTED')),
	USER_ID varchar(24),
	USER_VIEWED boolean,
	PURCHASED_ITEM_COUNT integer,
	CREATE_DATE timestamp,
	PENDING_DATE timestamp,
	MODIFY_DATE timestamp,
	FLAGGED_DATE timestamp,
	PROCESSED_DATE timestamp,
	FINISHED_DATE timestamp,
	REJECTED_DATE timestamp,
	NEEDS_FETCH_REVIEW boolean,
	DIGITAL_RECEIPT boolean,
	DELETED boolean,
	NON_POINT_EARNING_RECEIPT boolean,
	PRIMARY KEY (ID),
	FOREIGN KEY (USER_ID) REFERENCES users(ID)
)

SELECT * FROM receipts;


-- receipt_items
CREATE TABLE public.receipt_items
(
	REWARDS_RECEIPT_ID varchar(50),
	ITEM_INDEX integer,
	REWARDS_RECEIPT_ITEM_ID varchar(50),
	DESCRIPTION varchar(50000),
	BARCODE varchar(50),
	BRAND_CODE varchar(50000),
	QUANTITY_PURCHASED decimal(10,2),
	TOTAL_FINAL_PRICE decimal(10,2),
	POINTS_EARNED decimal(10,2),
	REWARDS_GROUP varchar(50000),
	ORIGINAL_RECEIPT_ITEM_TEXT varchar(50000),
	MODIFY_DATE timestamp,
	PRIMARY KEY (REWARDS_RECEIPT_ITEM_ID),
	FOREIGN KEY (REWARDS_RECEIPT_ID) REFERENCES receipts(ID)
)

SELECT * FROM receipt_items;


-- barnds table
CREATE TABLE public.brands
(
	ID varchar(50),
	BARCODE varchar(50),
	BRAND_CODE varchar(50000),
	CPG_ID varchar(50),
	CATEGORY varchar(50000),
	CATEGORY_CODE varchar(50000),
	NAME varchar(50000),
	ROMANCE_TEXT varchar(50000),
	RELATED_BRAND_IDS varchar(50000),
	PRIMARY KEY (ID)
)

SELECT * FROM brands;