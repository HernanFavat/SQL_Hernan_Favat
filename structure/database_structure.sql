# SQL_Coderhouse_projecto_HernanFavat

CREATE DATABASE pipeline_management;
USE pipeline_management;

CREATE TABLE dim_users (
    userid INT NOT NULL AUTO_INCREMENT,
    u__email VARCHAR(255),
    first_name VARCHAR(50) DEFAULT 'User_Name',
    last_name VARCHAR(50) DEFAULT 'User_LastName',
    u__createddate DATE DEFAULT (CURDATE()),
    isactive BOOLEAN NOT NULL DEFAULT TRUE,
    u__type VARCHAR(50),
    PRIMARY KEY (userid)
);


CREATE TABLE facts_account (
    accountid INT NOT NULL AUTO_INCREMENT,
    a__name VARCHAR(255) DEFAULT 'NAME',
    a__number VARCHAR(50) DEFAULT '5324534_NB',
    a__country VARCHAR(50) DEFAULT 'Uruguay',
    primary_contactid INT NOT NULL,
    a__createddate DATE DEFAULT (CURDATE()),
    PRIMARY KEY (accountid),
    FOREIGN KEY (primary_contactid) REFERENCES dim_users(userid)
);


CREATE TABLE facts_opportunities (
    opportunityid INT NOT NULL AUTO_INCREMENT,
    accountid INT,
    ownerid INT,
    o__name VARCHAR(150) DEFAULT 'Opportunity_name',
    o__statusname VARCHAR(50) DEFAULT 'Stages',
    o__closeddate DATE DEFAULT (CURDATE()),
    o__createddate DATE DEFAULT (CURDATE()),
    o_amount DECIMAL(10,2) DEFAULT 650000,
    productid INT, -- Remove NOT NULL constraint
    currencycode VARCHAR(10) DEFAULT 'USD',
    PRIMARY KEY (opportunityid),
    FOREIGN KEY (ownerid) REFERENCES dim_users(userid),
    FOREIGN KEY (accountid) REFERENCES facts_account(accountid)
);

CREATE TABLE facts_products (
    productid INT NOT NULL AUTO_INCREMENT,
    product__code VARCHAR(50),
    product__name VARCHAR(50),
    product__type VARCHAR(50),
    serial__number VARCHAR(150) DEFAULT 'JFSADFA_5345_4267',
    product__price DECIMAL(10,2) DEFAULT 450,
    currencycode VARCHAR(10) DEFAULT 'USD',
    opportunityid INT NOT NULL,
    PRIMARY KEY (productid),
    FOREIGN KEY (opportunityid) REFERENCES facts_opportunities(opportunityid)
);


CREATE TABLE dim_currency (
    currency_code VARCHAR(10) NOT NULL,
    currency_name VARCHAR(100) DEFAULT 'Unknown',
    currency_rate DECIMAL(12, 5), 
    c__createddate DATE DEFAULT (CURDATE()),
    PRIMARY KEY (currency_code)
);


-- Establezco nuevas FK para currency codes
ALTER TABLE facts_opportunities
ADD CONSTRAINT fk_opportunity_currency
FOREIGN KEY (currencycode)
REFERENCES dim_currency(currency_code);


ALTER TABLE facts_products
ADD CONSTRAINT fk_product_currency
FOREIGN KEY (currencycode)
REFERENCES dim_currency(currency_code);