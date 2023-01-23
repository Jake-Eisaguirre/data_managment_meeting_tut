-- set search path for schema, equivalent to setting working directory in RStudio

set search_path = 'survey_data';


-- select 'location' table, '*' is equivalent to 'everything' or '.' 

select * from location;


-- select 'region' table

select * from region;


-- select 'site' table 

select * from site;


-- select 'visit' table 

select * from visit;



-- join entire 'region' table onto entire 'location' table 

select l.*, r.*
from location l
join region r on l.location_id = r.location_id;


-- join specific column from 'location' table onto 'region' table

select l.location, r.region
from location l
join region r on l.location_id  = r.location_id; 



-- join specific column from 'location' table onto 'region' table 
-- and filter location 

select l.location, r.region
from location l
join region r on l.location_id = r.location_id 
where l.location = 'panama';


-- Now lets put it all together

select 
l.location, r.region, s.site, v.date, v.survey_time, su.start_time,
su.end_time, su.duration_minutes, c.species_capture, c.time_of_capture,
c.body_temp_c, c.svl_mm, c.body_mass_g, c.sex, c.life_stage
from location l
join region r on l.location_id = r.location_id 
join site s on r.region_id = s.region_id 
join visit v on s.site_id = v.site_id 
join survey su on v.visit_id = su.visit_id 
join capture c on su.survey_id = c.survey_id;



-- adding 'where' statement 

select 
l.location, r.region, s.site, v.date, v.survey_time, su.start_time,
su.end_time, su.duration_minutes, c.species_capture, c.time_of_capture,
c.body_temp_c, c.svl_mm, c.body_mass_g, c.sex, c.life_stage
from location l
join region r on l.location_id = r.location_id 
join site s on r.region_id = s.region_id 
join visit v on s.site_id = v.site_id 
join survey su on v.visit_id = su.visit_id 
join capture c on su.survey_id = c.survey_id
where c.svl_mm > '23' and l.location = 'panama';


