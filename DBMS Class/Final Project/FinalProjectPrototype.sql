DROP TABLE AD CASCADE CONSTRAINTS;
DROP TABLE ARTIST CASCADE CONSTRAINTS;
DROP TABLE COMPANY CASCADE CONSTRAINTS;
DROP TABLE DEPARTMENT CASCADE CONSTRAINTS;
DROP TABLE EMPLOYEE CASCADE CONSTRAINTS;
DROP TABLE INTERNET_STATION CASCADE CONSTRAINTS;
DROP TABLE MANAGER CASCADE CONSTRAINTS;
DROP TABLE PAYMENT CASCADE CONSTRAINTS;
DROP TABLE PLAYLIST CASCADE CONSTRAINTS;
DROP TABLE PLAYLIST_LOG CASCADE CONSTRAINTS;
DROP TABLE ROYALTY_PAYMENT CASCADE CONSTRAINTS;
DROP TABLE SEGMENT CASCADE CONSTRAINTS;
DROP TABLE SONG CASCADE CONSTRAINTS;
DROP TABLE STATION CASCADE CONSTRAINTS;

CREATE TABLE ad (
    ad_adid_pk          VARCHAR2(10) NOT NULL,
    ad_type             VARCHAR2(15),
    ad_description      VARCHAR2(50),
    ad_length           VARCHAR2(8),
    com_companyid_pk    VARCHAR2(10) NOT NULL
);

INSERT INTO ad VALUES('2501174740', '30 Sec', 'Clippers Ad', '0:30', '6195416557');
INSERT INTO ad VALUES('2672554095', '1 Min', 'Car Ad', '1:00', '8588785887');
INSERT INTO ad VALUES('7636930757', '30 Sec', 'Phone Ad', '0:30', '2443814308');
INSERT INTO ad VALUES('5601756822', '30 Sec', 'Car Ad', '0:30', '4435540651');
INSERT INTO ad VALUES('8602287258', '30 Sec', 'Movie Ad', '0:30', '3080871601');

CREATE TABLE artist (
    art_artistid_pk    VARCHAR2(10) NOT NULL,
    art_firstname      VARCHAR2(25),
    art_lastname       VARCHAR2(25)
);

INSERT INTO artist VALUES('4819707767', 'James', 'Bay');
INSERT INTO artist VALUES('8566412285', 'Lewis', 'Capaldi');
INSERT INTO artist VALUES('7687902907', 'Saint', 'Jhn');
INSERT INTO artist VALUES('9549788881', 'Selena', 'Gomez');
INSERT INTO artist VALUES('5779190443', 'Adele', 'NULL');
INSERT INTO artist VALUES('5156374115', 'Kane', 'Brown');
INSERT INTO artist VALUES('8845503482', 'Brett', 'Young');
INSERT INTO artist VALUES('8741826406', 'Florida Georgia', 'Line');
INSERT INTO artist VALUES('3998241308', 'Lionel', 'Hampton');
INSERT INTO artist VALUES('7388224357', 'Earl', 'Hines');
INSERT INTO artist VALUES('8816215190', 'Artie', 'Shaw');
INSERT INTO artist VALUES('7420935054', 'Big', 'Sean');
INSERT INTO artist VALUES('4972015624', 'Lecrae', 'Moore');
INSERT INTO artist VALUES('5171681647', 'NF', 'NULL');
INSERT INTO artist VALUES('2418855309', 'Steppenwolf', 'NULL');
INSERT INTO artist VALUES('2650543584', 'Scorpions', 'NULL');
INSERT INTO artist VALUES('6604148661', 'Guns N ', 'Roses');

CREATE TABLE company (
    com_companyid_pk  VARCHAR2(10) NOT NULL,
    com_name          VARCHAR2(25)
);

INSERT INTO company VALUES('6195416557', 'Wahl USA');
INSERT INTO company VALUES('8588785887', 'Saratoga Honda');
INSERT INTO company VALUES('2443814308', 'Apple');
INSERT INTO company VALUES('4435540651', 'Toyota');
INSERT INTO company VALUES('3080871601', 'Disney');

CREATE TABLE department (
    dept_deparmentid_pk       VARCHAR2(10) NOT NULL,
    dept_name                 VARCHAR2(25),
    stn_stationid_pk  VARCHAR2(10) NOT NULL
);

INSERT INTO department VALUES('3207855674', 'Operations', '2308357777');
INSERT INTO department VALUES('5196521342', 'Research', '3547047604');
INSERT INTO department VALUES('9346756084', 'Show', '9841629169');
INSERT INTO department VALUES('1906578533', 'Human Resources', '9841629169');
INSERT INTO department VALUES('7653657071', 'Media', '6300194235');


CREATE TABLE employee (
    emp_employeeid_pk               VARCHAR2(10) NOT NULL,
    emp_firstname                   VARCHAR2(25),
    emp_lastname                    VARCHAR2(25),
    emp_dob                         DATE,
    emp_jobtitle                    VARCHAR2(25),
    emp_ssn                         NUMBER(9),
    dept_deparmentid_pk  VARCHAR2(10) NOT NULL,
    man_managerid_pk        VARCHAR2(10)
);

INSERT INTO employee VALUES('2402849644', 'Randall', 'Muller', '05-SEP-88', 'Show Manager', '000000000', '9346756084', '');
INSERT INTO employee VALUES('4714188041', 'Sarah', 'Sanders', '03-MAR-95', 'Researcher', '000000001', '5196521342', '');
INSERT INTO employee VALUES('3500363502', 'Maria', 'Suarez', '19-MAY-93', 'Operations Associate', '000000002', '3207855674', '');
INSERT INTO employee VALUES('6072458456', 'Billy', 'Moore', '05-JUN-95', 'Operations Associate', '000000003', '3207855674', '');
INSERT INTO employee VALUES('7041081931', 'Emma', 'Barnes', '08-AUG-93', 'Researcher', '000000004', '5196521342', '');

CREATE TABLE internet_station (
    is_internetstationid_pk  VARCHAR2(10) NOT NULL,
    is_name                  VARCHAR2(25)
);

INSERT INTO internet_station VALUES('3896159994', 'FuzzyRock');
INSERT INTO internet_station VALUES('4689230914', 'JupiterBeats');
INSERT INTO internet_station VALUES('6976122526', 'SanFranSounds');
INSERT INTO internet_station VALUES('9471310103', 'AirWaves');
INSERT INTO internet_station VALUES('8434286442', 'SonicBoom');

CREATE TABLE manager (
    emp_employeeid_pk      VARCHAR2(10) NOT NULL,
    man_managerid_pk                VARCHAR2(10) NOT NULL,
    dept_deparmentid_pk  VARCHAR2(10) NOT NULL
); 

INSERT INTO manager VALUES('2402849644', '5379433314', '9346756084');
INSERT INTO manager VALUES('3500363502', '7695270890', '3207855674');

CREATE TABLE payment (
    pay_paymentid_pk            VARCHAR2(10) NOT NULL,
    pay_date                    DATE,
    pay_amount                  NUMBER,
    pay_type                    VARCHAR2(15),
    emp_employeeid_pk  VARCHAR2(10) NOT NULL
);

INSERT INTO payment VALUES('5079520084', '01-NOV-20', '22.00', 'Hourly', '2402849644');
INSERT INTO payment VALUES('7560646252', '01-NOV-20', '25.00', 'Hourly', '7041081931');
INSERT INTO payment VALUES('8420254112', '02-NOV-20', '700.00', 'Bonus', '4714188041');
INSERT INTO payment VALUES('5813420871', '02-NOV-20', '20.00', 'Hourly', '6072458456');
INSERT INTO payment VALUES('7228784711', '02-NOV-20', '700.00', 'Bonus', '6072458456');
INSERT INTO payment VALUES('1715269468', '03-NOV-20', '20.00', 'Hourly', '3500363502');
INSERT INTO payment VALUES('7430131762', '03-NOV-20', '700.00', 'Bonus', '3500363502');

CREATE TABLE playlist (
    play_playlistid_pk          VARCHAR2(10) NOT NULL,
    play_name                   VARCHAR2(25),
    play_genre                  VARCHAR2(20),
    play_length                 VARCHAR2(8),
    stn_stationid_pk    VARCHAR2(10),
    is_internetstationid_pk  VARCHAR2(10)
); 

INSERT INTO playlist VALUES('6876131618', 'Todays Hottest Hits', 'Pop', '57:00', '', '6976122526');
INSERT INTO playlist VALUES('8927324073', 'Jazz Songs', 'Jazz', '56:30', '3547047604', '');
INSERT INTO playlist VALUES('6884868781', 'New Music', 'HipHop', '57:30', '3547047604', '');
INSERT INTO playlist VALUES('5104016477', 'Rock Hits', 'Rock', '57:00', '2308357777', '');
INSERT INTO playlist VALUES('3883341623', 'Country Jams', 'Country', '57:00', '6066328984', '');

CREATE TABLE playlist_log (
    play_playlistid_pk  VARCHAR2(10) NOT NULL,
    stn_stationid_pk     VARCHAR2(10),
    is_internetstationid_pk   VARCHAR2(10),
    play_playlist_logid_pk       VARCHAR2(10) NOT NULL,
    play_timestamp               TIMESTAMP
);

INSERT INTO playlist_log VALUES('6876131618', '6300194235', '', '3738684638', TO_DATE('01-DEC-20 05:00:00 PM', 'DD-MON-YY HH:MI:SS AM'));
INSERT INTO playlist_log VALUES('8927324073', '3547047604', '', '7599351087', TO_DATE('01-DEC-20 08:00:00 AM', 'DD-MON-YY HH:MI:SS AM'));
INSERT INTO playlist_log VALUES('6884868781', '9841629169', '', '8070466451', TO_DATE('01-DEC-20 12:00:00 PM', 'DD-MON-YY HH:MI:SS AM'));
INSERT INTO playlist_log VALUES('5104016477', '2308357777', '', '4009118645', TO_DATE('01-DEC-20 03:00:00 PM', 'DD-MON-YY HH:MI:SS AM'));
INSERT INTO playlist_log VALUES('3883341623', '6066328984', '', '3872068622', TO_DATE('01-DEC-20 07:00:00 AM', 'DD-MON-YY HH:MI:SS AM'));

CREATE TABLE royalty_payment (
    roy_royaltyid_pk        VARCHAR2(10) NOT NULL,
    roy_date                DATE,
    roy_amount              NUMBER NOT NULL,
    art_artistid_pk  VARCHAR2(10) NOT NULL
);

INSERT INTO royalty_payment VALUES('6145008175', '01-DEC-20', '1.99', '5156374115');
INSERT INTO royalty_payment VALUES('4212602682', '01-DEC-20', '2.99', '8741826406');
INSERT INTO royalty_payment VALUES('9776096426', '01-DEC-20', '3.99', '5156374115');
INSERT INTO royalty_payment VALUES('6626729622', '01-DEC-20', '4.99', '8566412285');
INSERT INTO royalty_payment VALUES('7281980198', '01-DEC-20', '5.99', '4819707767');
INSERT INTO royalty_payment VALUES('7419175167', '01-DEC-20', '6.99', '9549788881');
INSERT INTO royalty_payment VALUES('6721865395', '01-DEC-20', '7.99', '3998241308');
INSERT INTO royalty_payment VALUES('5698700260', '01-DEC-20', '8.99', '7388224357');
INSERT INTO royalty_payment VALUES('8435236522', '01-DEC-20', '9.99', '8816215190');
INSERT INTO royalty_payment VALUES('5449795935', '01-DEC-20', '10.99', '7420935054');
INSERT INTO royalty_payment VALUES('9020386294', '01-DEC-20', '11.99', '5171681647');
INSERT INTO royalty_payment VALUES('9959344945', '01-DEC-20', '12.99', '4972015624');
INSERT INTO royalty_payment VALUES('4290792185', '01-DEC-20', '13.99', '2418855309');
INSERT INTO royalty_payment VALUES('3237447184', '01-DEC-20', '14.99', '2418855309');
INSERT INTO royalty_payment VALUES('3091086331', '01-DEC-20', '15.99', '2650543584');
INSERT INTO royalty_payment VALUES('8439066870', '01-DEC-20', '19.99', '6604148661');

CREATE TABLE segment (
    seg_segmentid_pk             VARCHAR2(10) NOT NULL,
    seg_segmentnum               VARCHAR2(10),
    seg_name                     VARCHAR2(50),
    play_playlistid_pk  VARCHAR2(10) NOT NULL,
    ad_adid_pk                VARCHAR2(10),
    song_songid_pk          VARCHAR2(10)
);

INSERT INTO segment VALUES('7519050647', '1', 'Song 1: Cool Again', '3883341623', '', '8923526106');
INSERT INTO segment VALUES('4774855677', '2', 'Song 2: Meant To Be', '3883341623', '', '4356812174');
INSERT INTO segment VALUES('3161804795', '3', 'Ad 1: Movie Ad', '3883341623', '8602287258', '');
INSERT INTO segment VALUES('9775098222', '4', 'Ad 2: Car Ad', '3883341623', '5601756822', '');
INSERT INTO segment VALUES('9959384268', '5', 'Song 3: Heaven', '3883341623', '', '5029113748');

INSERT INTO segment VALUES('3786865348', '1', 'Song 1: Before You Go', '6876131618', '', '7137265134');
INSERT INTO segment VALUES('9025265789', '2', 'Song 2: Hold Back The River', '6876131618', '', '3402077885');
INSERT INTO segment VALUES('9697830784', '3', 'Ad 1: Movie Ad', '6876131618', '8602287258', '');
INSERT INTO segment VALUES('1662211257', '4', 'Ad 2: Car Ad', '6876131618', '2672554095', '');
INSERT INTO segment VALUES('8188492907', '5', 'Song 3: Rare', '6876131618', '', '6645982152');

INSERT INTO segment VALUES('8754591574', '1', 'Song 1: It Dont Mean A Thing', '8927324073', '', '6471841934');
INSERT INTO segment VALUES('7272817167', '2', 'Song 2: Sweet Georgia Brown', '8927324073', '', '9926799394');
INSERT INTO segment VALUES('7983507047', '3', 'Song 3: All The Things You Are', '8927324073', '', '7531660674');
INSERT INTO segment VALUES('1344940923', '4', 'Ad 1: Phone Ad', '8927324073', '7636930757', '');
INSERT INTO segment VALUES('5689999297', '5', 'Ad 2: Clippers Ad', '8927324073', '2501174740', '');

INSERT INTO segment VALUES('374058519', '1', 'Song 1: Wolves Ft Post Malone', '6884868781', '', '6954019064');
INSERT INTO segment VALUES('159543491', '2', 'Song 2: Why', '6884868781', '', '6697599993');
INSERT INTO segment VALUES('693710952', '3', 'Song 3: Drown', '6884868781', '', '3987129694');
INSERT INTO segment VALUES('282598234', '4', 'Ad 1: Phone', '6884868781', '7636930757', '');
INSERT INTO segment VALUES('990210023', '5', 'Ad 2: Car Ad', '6884868781', '5601756822', '');

INSERT INTO segment VALUES('999275530', '1', 'Song 1: Born To Be Wild', '5104016477', '', '9924925821');
INSERT INTO segment VALUES('802828492', '2', 'Song 2: Magic Carpet Ride', '5104016477', '', '1777531063');
INSERT INTO segment VALUES('505128818', '3', 'Song 3: Wings Of Change', '5104016477', '', '7608122984');
INSERT INTO segment VALUES('306224929', '4', 'Song 4: November Rain', '5104016477', '', '4822457726');
INSERT INTO segment VALUES('770722796', '5', 'Ad 1: Clippers Ad', '5104016477', '2501174740', '');

CREATE TABLE song(
    song_songid_pk            VARCHAR2(10) NOT NULL,
    song_name                 VARCHAR2(25),
    song_length               VARCHAR2(8),
    song_genre                VARCHAR2(15),
    art_artistid_pk    VARCHAR2(10) NOT NULL
);

INSERT INTO song VALUES('6371552327', 'Roses', '02:50', 'Pop', '7687902907');
INSERT INTO song VALUES('7137265134', 'Before You Go', '04:08', 'Pop', '8566412285');
INSERT INTO song VALUES('6645982152', 'Rare', '03:44', 'Pop', '9549788881');
INSERT INTO song VALUES('3402077885', 'Hold Back The River', '04:06', 'Pop', '4819707767');
INSERT INTO song VALUES('8923526106', 'Cool Again', '02:44', 'Country', '5156374115');
INSERT INTO song VALUES('4356812174', 'Meant To Be', '02:50', 'Country', '8741826406');
INSERT INTO song VALUES('5029113748', 'Heaven', '02:55', 'Country', '5156374115');
INSERT INTO song VALUES('5285199096', 'In Case You Didnt Know', '03:56', 'Country', '8845503482');
INSERT INTO song VALUES('6471841934', 'It Dont Mean A Thing', '03:12', 'Jazz', '3998241308');
INSERT INTO song VALUES('9926799394', 'Sweet Georgia Brown', '02:46', 'Jazz', '7388224357');
INSERT INTO song VALUES('7531660674', 'All The Things You Are', '03:22', 'Jazz', '8816215190');
INSERT INTO song VALUES('6954019064', 'Wolves Ft Post Malone', '03:25', 'HipHop', '7420935054');
INSERT INTO song VALUES('6697599993', 'Why', '03:11', 'HipHop', '5171681647');
INSERT INTO song VALUES('3987129694', 'Drown', '03:21', 'HipHop', '4972015624');
INSERT INTO song VALUES('9924925821', 'Born To Be Wild', '03:35', 'Rock', '2418855309');
INSERT INTO song VALUES('1777531063', 'Magic Carpet Ride', '04:20', 'Rock', '2418855309');
INSERT INTO song VALUES('7608122984', 'Wings Of Change', '04:42', 'Rock', '2650543584');
INSERT INTO song VALUES('4822457726', 'November Rain', '09:16', 'Rock', '6604148661');

CREATE TABLE station (
    stn_stationid_pk  VARCHAR2(10) NOT NULL,
    stn_name          VARCHAR2(25),
    stn_region        VARCHAR2(20),
    stn_frequency     NUMBER
);

INSERT INTO station VALUES('6300194235', 'WestBayBeats', 'Western', '99.7');
INSERT INTO station VALUES('3547047604', 'CitySounds', 'Eastern', '86.1');
INSERT INTO station VALUES('2308357777', 'RockNRollers', 'Eastern', '94.1');
INSERT INTO station VALUES('9841629169', 'TheBrew', 'Western', '98.7');
INSERT INTO station VALUES('6066328984', 'HeartStrings', 'Northwest', '99.3');

ALTER TABLE ad ADD CONSTRAINT ad_pk PRIMARY KEY ( ad_adid_pk );

ALTER TABLE artist ADD CONSTRAINT artist_pk PRIMARY KEY ( art_artistid_pk );

ALTER TABLE company ADD CONSTRAINT company_pk PRIMARY KEY ( com_companyid_pk );

ALTER TABLE department ADD CONSTRAINT department_pk PRIMARY KEY ( dept_deparmentid_pk );

ALTER TABLE employee ADD CONSTRAINT employee_pk PRIMARY KEY ( emp_employeeid_pk );

ALTER TABLE internet_station ADD CONSTRAINT internet_station_pk PRIMARY KEY ( is_internetstationid_pk );

ALTER TABLE manager ADD CONSTRAINT manager_pk PRIMARY KEY ( man_managerid_pk );

ALTER TABLE payment ADD CONSTRAINT payment_pk PRIMARY KEY ( pay_paymentid_pk );

ALTER TABLE playlist ADD CONSTRAINT playlist_pk PRIMARY KEY ( play_playlistid_pk );

ALTER TABLE playlist_log ADD CONSTRAINT playlist_log_pk PRIMARY KEY ( play_playlist_logid_pk );

ALTER TABLE royalty_payment ADD CONSTRAINT royalty_payment_pk PRIMARY KEY ( roy_royaltyid_pk );

ALTER TABLE segment ADD CONSTRAINT segment_pk PRIMARY KEY ( seg_segmentid_pk );

ALTER TABLE song ADD CONSTRAINT song_pk PRIMARY KEY ( song_songid_pk );

ALTER TABLE station ADD CONSTRAINT station_pk PRIMARY KEY ( stn_stationid_pk );

ALTER TABLE ad ADD CONSTRAINT ad_company_fk FOREIGN KEY ( com_companyid_pk )
    REFERENCES company ( com_companyid_pk );
        
ALTER TABLE department ADD CONSTRAINT department_station_fk FOREIGN KEY ( stn_stationid_pk )
    REFERENCES station ( stn_stationid_pk );      
      
ALTER TABLE employee ADD CONSTRAINT employee_department_fk FOREIGN KEY ( dept_deparmentid_pk )
    REFERENCES department ( dept_deparmentid_pk );
    
ALTER TABLE employee ADD CONSTRAINT employee_manager_fk FOREIGN KEY ( man_managerid_pk )
    REFERENCES manager ( man_managerid_pk );

ALTER TABLE manager ADD CONSTRAINT manager_department_fk FOREIGN KEY ( dept_deparmentid_pk )
    REFERENCES department ( dept_deparmentid_pk );
    
ALTER TABLE manager ADD CONSTRAINT manager_employee_fk FOREIGN KEY ( emp_employeeid_pk )
    REFERENCES employee ( emp_employeeid_pk );
    
CREATE UNIQUE INDEX manager__idx ON
    manager (dept_deparmentid_pk ASC );
    
ALTER TABLE payment ADD CONSTRAINT payment_employee_fk FOREIGN KEY ( emp_employeeid_pk )
    REFERENCES employee ( emp_employeeid_pk );

ALTER TABLE playlist ADD CONSTRAINT playlist_station_fk FOREIGN KEY ( stn_stationid_pk )
    REFERENCES station ( stn_stationid_pk );
    
ALTER TABLE playlist_log ADD CONSTRAINT playlist_log_playlist_fk FOREIGN KEY ( play_playlistid_pk )
    REFERENCES playlist ( play_playlistid_pk );
    
ALTER TABLE playlist_log ADD CONSTRAINT playlist_log_station_fk FOREIGN KEY ( stn_stationid_pk )
    REFERENCES station ( stn_stationid_pk );
    
CREATE UNIQUE INDEX playlist_log__idx ON
    playlist_log (
        play_playlistid_pk
    ASC );
    
ALTER TABLE royalty_payment ADD CONSTRAINT royalty_payment_artist_fk FOREIGN KEY ( art_artistid_pk )
    REFERENCES artist ( art_artistid_pk );
    
ALTER TABLE segment ADD CONSTRAINT segment_playlist_fk FOREIGN KEY ( play_playlistid_pk )
    REFERENCES playlist ( play_playlistid_pk );

ALTER TABLE segment ADD CONSTRAINT segment_ad_fk FOREIGN KEY ( ad_adid_pk )
    REFERENCES ad ( ad_adid_pk );

ALTER TABLE segment ADD CONSTRAINT segment_song_fk FOREIGN KEY ( song_songid_pk )
    REFERENCES song ( song_songid_pk );
    
ALTER TABLE song ADD CONSTRAINT song_artist_fk FOREIGN KEY ( art_artistid_pk )
    REFERENCES artist ( art_artistid_pk );
	
SELECT s.seg_segmentid_pk AS "Segment ID#", s.seg_segmentnum AS "Segment #", s.seg_name AS "Segment Name", s.ad_adid_pk AS "AD ID#", s.song_songid_pk AS "Song ID#"
FROM segment s NATURAL JOIN playlist p 
WHERE p.play_name = 'Todays Hottest Hits' 
ORDER BY s.seg_segmentnum;

SELECT stn_stationid_pk AS "Station ID#", s.stn_name AS "Station Name", s.stn_region AS "Region", s.stn_frequency AS "Station Frequency"
FROM station s JOIN playlist p USING(stn_stationid_pk)
WHERE p.play_name = 'Country Jams';

SELECT play_playlistid_pk AS "Playlist ID#", p.play_name AS "Playlist Name", pl.play_timestamp AS "Playlist Played"
FROM playlist p JOIN playlist_log pl USING(play_playlistid_pk)
WHERE p.play_name = 'Country Jams';

SELECT DISTINCT rp.roy_royaltyid_pk AS "Payment ID#", s.song_songid_pk AS "Song ID#", rp.roy_date AS "Payment Date", a.art_firstname AS "First Name", a.art_lastname AS "Last Name", s.song_name AS "Song Name", s.song_genre AS "Genre", rp.roy_amount AS "Amount"
FROM song s JOIN artist a USING(art_artistid_pk) JOIN royalty_payment rp USING(art_artistid_pk) 
WHERE a.art_firstname = 'Lionel' AND  a.art_lastname = 'Hampton';

SELECT p.pay_paymentid_pk AS "Payment ID#", p.pay_date AS "Payment Date", e.emp_jobtitle AS "Job Title", e.emp_firstname "First Name", e.emp_lastname AS "Last Name", p.pay_amount AS "Payment Amount", p.pay_type AS "Payment Type"
FROM employee e JOIN payment p USING(emp_employeeid_pk) 
WHERE emp_firstname = 'Billy' AND emp_lastname = 'Moore';

SELECT e.emp_employeeid_pk AS "Employee ID#", e.emp_firstname AS "First Name", e.emp_lastname AS "Last Name", e.emp_jobtitle AS "Job Title"
FROM employee e NATURAL JOIN department d
WHERE d.dept_name = 'Operations';

SELECT m.man_managerid_pk AS "Manager ID#", emp_employeeid_pk AS "Employee ID#", stn_stationid_pk AS "Station ID#", s.stn_name AS "Station Name", e.emp_firstname AS "First Name", e.emp_lastname AS "Last Name", e.emp_jobtitle AS "Job Title"
FROM department d NATURAL JOIN employee e JOIN manager m USING(emp_employeeid_pk) JOIN station s USING(stn_stationid_pk)
WHERE d.dept_name = 'Operations';

SELECT pay_paymentid_pk AS "Payment ID#", emp_employeeid_pk AS "Employee ID#", p.pay_date AS "Payment Date", e.emp_firstname AS "First Name", e.emp_lastname AS "Last Name", p.pay_amount AS "Payment Amount", p.pay_type AS "Payment Type"
FROM employee e JOIN payment p USING(emp_employeeid_pk)
WHERE e.emp_jobtitle = 'Operations Associate';