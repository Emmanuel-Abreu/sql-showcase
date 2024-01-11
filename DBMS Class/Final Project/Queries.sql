SELECT s.seg_segmentid_pk AS "Segment ID#", s.seg_segmentnum AS "Segment #", s.seg_name AS "Segment Name", s.ad_adid_pk AS "AD ID#", s.song_songid_pk AS "Song ID#"
FROM segment s NATURAL JOIN playlist p 
WHERE p.play_name = 'Todays Hottest Hits' 
ORDER BY s.seg_segmentnum;

SELECT stn_stationid_pk AS "Station ID#", s.stn_name AS "Station Name", s.stn_region AS "Station Region", s.stn_frequency AS "Station Frequency"
FROM station s JOIN playlist p USING(stn_stationid_pk)
WHERE p.play_name = 'Country Jams';

SELECT play_playlistid_pk AS "Playlist ID#", p.play_name AS "Playlist Name", pl.play_timestamp AS "Playlist Played"
FROM playlist p JOIN playlist_log pl USING(play_playlistid_pk)
WHERE p.play_name = 'Country Jams';

SELECT DISTINCT rp.roy_royaltyid_pk AS "Payment ID#", s.song_songid_pk AS "Song ID#", rp.roy_date AS "Payment Date", s.song_name AS "Song Name", a.art_firstname AS "First Name", a.art_lastname AS "Last Name", s.song_name AS "Song Name", s.song_genre AS "Genre", rp.roy_amount AS "Amount"
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