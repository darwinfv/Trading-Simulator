USE tradingsim;
CREATE TABLE Users (
    email VARCHAR(50) PRIMARY KEY NOT NULL UNIQUE,
    pass VARCHAR(32) NOT NULL,
    usd FLOAT(20,2) DEFAULT 1000.00,
	eur FLOAT(20,2) DEFAULT 0.00,
    jpy FLOAT(20,2) DEFAULT 0.00,
    gbp FLOAT(20,2) DEFAULT 0.00,
    aud FLOAT(20,2) DEFAULT 0.00,
    cad FLOAT(20,2) DEFAULT 0.00,
    chf FLOAT(20,2) DEFAULT 0.00,
    cny FLOAT(20,2) DEFAULT 0.00,
    sek FLOAT(20,2) DEFAULT 0.00,
    mxn FLOAT(20,2) DEFAULT 0.00,
    nzd FLOAT(20,2) DEFAULT 0.00,
    sgd FLOAT(20,2) DEFAULT 0.00,
    hkd FLOAT(20,2) DEFAULT 0.00,
    nok FLOAT(20,2) DEFAULT 0.00,
    krw FLOAT(20,2) DEFAULT 0.00,
    try FLOAT(20,2) DEFAULT 0.00,
    rub FLOAT(20,2) DEFAULT 0.00,
    inr FLOAT(20,2) DEFAULT 0.00,
    brl FLOAT(20,2) DEFAULT 0.00,
    zar FLOAT(20,2) DEFAULT 0.00,
    dkk FLOAT(20,2) DEFAULT 0.00,
    pln FLOAT(20,2) DEFAULT 0.00,
    twd FLOAT(20,2) DEFAULT 0.00,
    thb FLOAT(20,2) DEFAULT 0.00,
    myr FLOAT(20,2) DEFAULT 0.00
);
INSERT INTO Users(email, pass) VALUES("darwinfvaz@gmail.com", "something");
INSERT INTO Users(email, pass) VALUES("hitenrathod98@gmail.com", "something");
INSERT INTO Users(email, pass) VALUES("sinha33@purdue.edu", "something");
SELECT * FROM Users;
CREATE TABLE EUR (
    number NUMERIC PRIMARY KEY UNIQUE NOT NULL,
    total FLOAT(30,2) DEFAULT 300000000.00,
    funds FLOAT(30,2) DEFAULT 300000000.00,
    value FLOAT(10,2) NOT NULL,
    diff FLOAT(10,2) NOT NULL,
    percent FLOAT(5,2) NOT NULL
);
INSERT INTO EUR(number, value, diff, percent) VALUES(1, 1, 0, 0);
SELECT * FROM EUR WHERE NUMBER = (SELECT MIN(NUMBER) FROM EUR);
SELECT * FROM EUR;
DELETE FROM EUR WHERE NUMBER = (SELECT MIN(NUMBER) FROM EUR);
DELETE FROM EUR ORDER BY number LIMIT 1;

CREATE TABLE JPY (
    number NUMERIC PRIMARY KEY UNIQUE NOT NULL,
    total FLOAT(30,2) DEFAULT 300000000.00,
    funds FLOAT(30,2) DEFAULT 300000000.00,
    value FLOAT(10,2) NOT NULL,
    diff FLOAT(10,2) NOT NULL,
    percent FLOAT(5,2) NOT NULL
);
INSERT INTO JPY(number, value, diff, percent) VALUES(1, 1, 0, 0);
CREATE TABLE GBP (
    number NUMERIC PRIMARY KEY UNIQUE NOT NULL,
    total FLOAT(30,2) DEFAULT 300000000.00,
    funds FLOAT(30,2) DEFAULT 300000000.00,
    value FLOAT(10,2) NOT NULL,
    diff FLOAT(10,2) NOT NULL,
    percent FLOAT(5,2) NOT NULL
);
INSERT INTO GBP(number, value, diff, percent) VALUES(1, 1, 0, 0);
CREATE TABLE AUD (
    number NUMERIC PRIMARY KEY UNIQUE NOT NULL,
    total FLOAT(30,2) DEFAULT 300000000.00,
    funds FLOAT(30,2) DEFAULT 300000000.00,
    value FLOAT(10,2) NOT NULL,
    diff FLOAT(10,2) NOT NULL,
    percent FLOAT(5,2) NOT NULL
);
INSERT INTO AUD(number, value, diff, percent) VALUES(1, 1, 0, 0);
CREATE TABLE CAD (
    number NUMERIC PRIMARY KEY UNIQUE NOT NULL,
    total FLOAT(30,2) DEFAULT 300000000.00,
    funds FLOAT(30,2) DEFAULT 300000000.00,
    value FLOAT(10,2) NOT NULL,
    diff FLOAT(10,2) NOT NULL,
    percent FLOAT(5,2) NOT NULL
);
INSERT INTO CAD(number, value, diff, percent) VALUES(1, 1, 0, 0);
CREATE TABLE CHF (
    number NUMERIC PRIMARY KEY UNIQUE NOT NULL,
    total FLOAT(30,2) DEFAULT 300000000.00,
    funds FLOAT(30,2) DEFAULT 300000000.00,
    value FLOAT(10,2) NOT NULL,
    diff FLOAT(10,2) NOT NULL,
    percent FLOAT(5,2) NOT NULL
);
INSERT INTO CHF(number, value, diff, percent) VALUES(1, 1, 0, 0);
CREATE TABLE CNY (
    number NUMERIC PRIMARY KEY UNIQUE NOT NULL,
    total FLOAT(30,2) DEFAULT 300000000.00,
    funds FLOAT(30,2) DEFAULT 300000000.00,
    value FLOAT(10,2) NOT NULL,
    diff FLOAT(10,2) NOT NULL,
    percent FLOAT(5,2) NOT NULL
);
INSERT INTO CNY(number, value, diff, percent) VALUES(1, 1, 0, 0);
CREATE TABLE SEK(
    number NUMERIC PRIMARY KEY UNIQUE NOT NULL,
    total FLOAT(30,2) DEFAULT 300000000.00,
    funds FLOAT(30,2) DEFAULT 300000000.00,
    value FLOAT(10,2) NOT NULL,
    diff FLOAT(10,2) NOT NULL,
    percent FLOAT(5,2) NOT NULL
);
INSERT INTO SEK(number, value, diff, percent) VALUES(1, 1, 0, 0);
CREATE TABLE MXN (
    number NUMERIC PRIMARY KEY UNIQUE NOT NULL,
    total FLOAT(30,2) DEFAULT 300000000.00,
    funds FLOAT(30,2) DEFAULT 300000000.00,
    value FLOAT(10,2) NOT NULL,
    diff FLOAT(10,2) NOT NULL,
    percent FLOAT(5,2) NOT NULL
);
INSERT INTO MXN(number, value, diff, percent) VALUES(1, 1, 0, 0);
CREATE TABLE NZD (
    number NUMERIC PRIMARY KEY UNIQUE NOT NULL,
    total FLOAT(30,2) DEFAULT 300000000.00,
    funds FLOAT(30,2) DEFAULT 300000000.00,
    value FLOAT(10,2) NOT NULL,
    diff FLOAT(10,2) NOT NULL,
    percent FLOAT(5,2) NOT NULL
);
INSERT INTO NZD(number, value, diff, percent) VALUES(1, 1, 0, 0);
CREATE TABLE SGD (
    number NUMERIC PRIMARY KEY UNIQUE NOT NULL,
    total FLOAT(30,2) DEFAULT 300000000.00,
    funds FLOAT(30,2) DEFAULT 300000000.00,
    value FLOAT(10,2) NOT NULL,
    diff FLOAT(10,2) NOT NULL,
    percent FLOAT(5,2) NOT NULL
);
INSERT INTO SGD(number, value, diff, percent) VALUES(1, 1, 0, 0);
CREATE TABLE HKD (
    number NUMERIC PRIMARY KEY UNIQUE NOT NULL,
    total FLOAT(30,2) DEFAULT 300000000.00,
    funds FLOAT(30,2) DEFAULT 300000000.00,
    value FLOAT(10,2) NOT NULL,
    diff FLOAT(10,2) NOT NULL,
    percent FLOAT(5,2) NOT NULL
);
INSERT INTO HKD(number, value, diff, percent) VALUES(1, 1, 0, 0);
CREATE TABLE NOK (
    number NUMERIC PRIMARY KEY UNIQUE NOT NULL,
    total FLOAT(30,2) DEFAULT 300000000.00,
    funds FLOAT(30,2) DEFAULT 300000000.00,
    value FLOAT(10,2) NOT NULL,
    diff FLOAT(10,2) NOT NULL,
    percent FLOAT(5,2) NOT NULL
);
INSERT INTO NOK(number, value, diff, percent) VALUES(1, 1, 0, 0);
CREATE TABLE KRW (
    number NUMERIC PRIMARY KEY UNIQUE NOT NULL,
    total FLOAT(30,2) DEFAULT 300000000.00,
    funds FLOAT(30,2) DEFAULT 300000000.00,
    value FLOAT(10,2) NOT NULL,
    diff FLOAT(10,2) NOT NULL,
    percent FLOAT(5,2) NOT NULL
);
INSERT INTO KRW(number, value, diff, percent) VALUES(1, 1, 0, 0);
CREATE TABLE TRY (
    number NUMERIC PRIMARY KEY UNIQUE NOT NULL,
    total FLOAT(30,2) DEFAULT 300000000.00,
    funds FLOAT(30,2) DEFAULT 300000000.00,
    value FLOAT(10,2) NOT NULL,
    diff FLOAT(10,2) NOT NULL,
    percent FLOAT(5,2) NOT NULL
);
INSERT INTO TRY(number, value, diff, percent) VALUES(1, 1, 0, 0);
CREATE TABLE INR (
    number NUMERIC PRIMARY KEY UNIQUE NOT NULL,
    total FLOAT(30,2) DEFAULT 300000000.00,
    funds FLOAT(30,2) DEFAULT 300000000.00,
    value FLOAT(10,2) NOT NULL,
    diff FLOAT(10,2) NOT NULL,
    percent FLOAT(5,2) NOT NULL
);
INSERT INTO INR(number, value, diff, percent) VALUES(1, 1, 0, 0);
CREATE TABLE RUB (
    number NUMERIC PRIMARY KEY UNIQUE NOT NULL,
    total FLOAT(30,2) DEFAULT 300000000.00,
    funds FLOAT(30,2) DEFAULT 300000000.00,
    value FLOAT(10,2) NOT NULL,
    diff FLOAT(10,2) NOT NULL,
    percent FLOAT(5,2) NOT NULL
);
INSERT INTO RUB(number, value, diff, percent) VALUES(1, 1, 0, 0);
CREATE TABLE BRL (
    number NUMERIC PRIMARY KEY UNIQUE NOT NULL,
    total FLOAT(30,2) DEFAULT 300000000.00,
    funds FLOAT(30,2) DEFAULT 300000000.00,
    value FLOAT(10,2) NOT NULL,
    diff FLOAT(10,2) NOT NULL,
    percent FLOAT(5,2) NOT NULL
);
INSERT INTO BRL(number, value, diff, percent) VALUES(1, 1, 0, 0);
CREATE TABLE ZAR (
    number NUMERIC PRIMARY KEY UNIQUE NOT NULL,
    total FLOAT(30,2) DEFAULT 300000000.00,
    funds FLOAT(30,2) DEFAULT 300000000.00,
    value FLOAT(10,2) NOT NULL,
    diff FLOAT(10,2) NOT NULL,
    percent FLOAT(5,2) NOT NULL
);
INSERT INTO ZAR(number, value, diff, percent) VALUES(1, 1, 0, 0);
CREATE TABLE DKK (
    number NUMERIC PRIMARY KEY UNIQUE NOT NULL,
    total FLOAT(30,2) DEFAULT 300000000.00,
    funds FLOAT(30,2) DEFAULT 300000000.00,
    value FLOAT(10,2) NOT NULL,
    diff FLOAT(10,2) NOT NULL,
    percent FLOAT(5,2) NOT NULL
);
INSERT INTO DKK(number, value, diff, percent) VALUES(1, 1, 0, 0);
CREATE TABLE PLN (
    number NUMERIC PRIMARY KEY UNIQUE NOT NULL,
    total FLOAT(30,2) DEFAULT 300000000.00,
    funds FLOAT(30,2) DEFAULT 300000000.00,
    value FLOAT(10,2) NOT NULL,
    diff FLOAT(10,2) NOT NULL,
    percent FLOAT(5,2) NOT NULL
);
INSERT INTO PLN(number, value, diff, percent) VALUES(1, 1, 0, 0);
CREATE TABLE TWD (
    number NUMERIC PRIMARY KEY UNIQUE NOT NULL,
    total FLOAT(30,2) DEFAULT 300000000.00,
    funds FLOAT(30,2) DEFAULT 300000000.00,
    value FLOAT(10,2) NOT NULL,
    diff FLOAT(10,2) NOT NULL,
    percent FLOAT(5,2) NOT NULL
);
INSERT INTO TWD(number, value, diff, percent) VALUES(1, 1, 0, 0);
CREATE TABLE THB (
    number NUMERIC PRIMARY KEY UNIQUE NOT NULL,
    total FLOAT(30,2) DEFAULT 300000000.00,
    funds FLOAT(30,2) DEFAULT 300000000.00,
    value FLOAT(10,2) NOT NULL,
    diff FLOAT(10,2) NOT NULL,
    percent FLOAT(5,2) NOT NULL
);
INSERT INTO THB(number, value, diff, percent) VALUES(1, 1, 0, 0);
CREATE TABLE MYR (
    number NUMERIC PRIMARY KEY UNIQUE NOT NULL,
    total FLOAT(30,2) DEFAULT 300000000.00,
    funds FLOAT(30,2) DEFAULT 300000000.00,
    value FLOAT(10,2) NOT NULL,
    diff FLOAT(10,2) NOT NULL,
    percent FLOAT(5,2) NOT NULL
);
INSERT INTO MYR(number, value, diff, percent) VALUES(1, 1, 0, 0);
USE tradingsim;
SELECT * FROM EUR;
DROP TABLE EUR;
SELECT * FROM tradingsim;
SHOW TABLES;
SELECT * FROM Users;

SELECT * FROM EUR;
SELECT * FROM AUD;
SELECT * FROM BRL;
SELECT * FROM JPY;
SELECT * FROM MYR;