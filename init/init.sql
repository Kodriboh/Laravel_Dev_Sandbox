CREATE DATABASE app_db;
USE app_db;

/* Create tables with foreign keys first*/
CREATE TABLE query_type (
    id SERIAL PRIMARY KEY,
    title VARCHAR(30) NOT NULL
);

CREATE TABLE call_stats (
    id SERIAL PRIMARY KEY,
    call_length TIME NOT NULL,
    recording_url TEXT NOT NULL
);

CREATE TABLE campaign (
    id SERIAL PRIMARY KEY, 
    campaign_name VARCHAR(50) NOT NULL,
    campaign_desc TEXT NOT NULL 
);

/* Create person table */
CREATE TABLE person (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    phone VARCHAR(13),
    email VARCHAR(65),
    query_id SERIAL REFERENCES query_type(id),
    call_stats_id SERIAL REFERENCES call_stats(id),
    campaign_id SERIAL REFERENCES campaign(id)
);

/* Populate query_type table */
INSERT INTO query_type (id, title)
VALUES (
    '1234',
    'SALE MADE'
);

INSERT INTO query_type(id, title) 
VALUES(
    '5678',
    'DECLINED OFFER'
);

/* Populate call_stats table */
INSERT INTO call_stats(id, call_length, recording_url)
VALUES(
    '5678',
    '01:56:34',
    'http://remote.system/recording/5678'
);

INSERT INTO call_stats(id, call_length, recording_url)
VALUES(
    '1213',
    '00:56:43',
    'http://remote.system/recording/1213'
);

/* Populate campaign table */
INSERT INTO campaign (id, campaign_name, campaign_desc)
VALUES (
    '1011',
    'Campaign A',
    'A lovely campaign for Michael'
);

INSERT INTO campaign (id, campaign_name, campaign_desc)
VALUES (
    '1516',
    'Campaign B',
    'A different campaign not for Michael'
);

/* Populate person table */
INSERT INTO person (first_name, last_name, phone, email, query_id, call_stats_id, campaign_id)
VALUES (
    'Michael',
    'Collier',
    '07707000000',
    'bigmike@collier.com',
    '1234',
    '5678',
    '1011'
);

INSERT INTO person (first_name, last_name, phone, email, query_id, call_stats_id, campaign_id)
VALUES (
    'Jimmy',
    'Joe',
    '07707000001',
    'bigjim@collier.com',
    '5678',
    '1213',
    '1516'
);