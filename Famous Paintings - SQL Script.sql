SET SQL_SAFE_UPDATES = 0;

/* 14th Jan, 2025 6:30pm

A project on Kaggle's "Famous Paintings" dataset
YT Source : https://www.youtube.com/watch?v=AZ29DXaJ1Ts&t=321s&ab_channel=techTFQ
Dataset : https://www.kaggle.com/datasets/mexwell/famous-paintings
Note : Data was imported from csv files using the python script saved in the file : "csvfiles_import_script", which created the tables with the data.

*/

-- Query to check the creation/updation time of all the tables in the 'sql_portfolio_projects' database.

SELECT CREATE_TIME, UPDATE_TIME, TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'sql_portfolio_projects'
ORDER BY CREATE_TIME desc;

select * from artist; -- 421 rows
select * from canvas_size; -- 200 rows
select * from image_link; -- 14,775 rows
select * from museum_hours; -- 351 rows
select * from museum; -- 57 rows
select * from product_size; -- 110,34 rows
select * from subject; -- 6771 rows
select * from work; -- 14776 rows

-- Renaming the tables
rename table 
	artist to fp_artist,
    canvas_size to fp_canvas_size,
    image_link to fp_image_link,
    museum_hours to fp_museum_hours,
    museum to fp_museum,
    product_size to fp_product_size,
    subject to fp_subject,
    work to fp_work;

-- Showing the latestly updated tables in the 'sql_portfolio_projects' database
select table_name
from information_schema.tables
where table_schema = 'sql_portfolio_projects'
order by update_time desc;

-- Eyeballing the data in each of the tables
select * from fp_work limit 5;
select * from fp_subject limit 5;
select * from fp_product_size limit 5;
select * from fp_museum limit 5;
select * from fp_museum_hours limit 5;
select * from fp_image_link limit 5;
select * from fp_artist limit 5;
select * from fp_canvas_size limit 5;

-- Checking for NULLs
-- 1. fp_work
select * from fp_work limit 5;
SELECT 
    SUM(CASE WHEN work_id IS NULL THEN 1 ELSE 0 END) AS work_id_null_count,
    SUM(CASE WHEN name IS NULL THEN 1 ELSE 0 END) AS name_null_count,
    SUM(CASE WHEN artist_id IS NULL THEN 1 ELSE 0 END) AS artist_id_null_count,
    SUM(CASE WHEN style IS NULL THEN 1 ELSE 0 END) AS style_null_count,
    SUM(CASE WHEN museum_id IS NULL THEN 1 ELSE 0 END) AS museum_id_null_count
FROM fp_work;

SELECT * 
FROM fp_work 
WHERE work_id IS NULL OR name IS NULL OR artist_id IS NULL OR style IS NULL OR museum_id IS NULL;

-- 2. fp_subject
select * from fp_subject limit 5;
select 
	sum(case when work_id is null then 1 else 0 end) as workd_id_nulls,
    sum(case when subject is null then 1 else 0 end) as subject_nulls
from fp_subject;

select *
from fp_subject
where work_id is null or subject is null;

-- 3. fp_product_size
select * from fp_product_size limit 5;

select
	sum(case when work_id is null then 1 else 0 end) work_id_nulls,
    sum(case when size_id is null then 1 else 0 end) size_id_nulls,
    sum(case when sale_price is null then 1 else 0 end) sale_price_nulls,
    sum(case when regular_price is null then 1 else 0 end) regular_price_nulls
from fp_product_size;

select *
from fp_product_size
where work_id is null or size_id is null or sale_price is null or regular_price is null;

-- 4. fp_museum
select * from fp_museum limit 5;

select
	sum(case when museum_id is null then 1 else 0 end) as museum_id_nulls,
    sum(case when name is null then 1 else 0 end) as name_nulls,
    sum(case when address is null then 1 else 0 end) as address_nulls,
    sum(case when city is null then 1 else 0 end) as city_nulls,
    sum(case when state is null then 1 else 0 end) as state_nulls,
    sum(case when postal is null then 1 else 0 end) as postal_nulls,
    sum(case when country is null then 1 else 0 end) as country_nulls,
    sum(case when phone is null then 1 else 0 end) as phone_nulls,
    sum(case when url is null then 1 else 0 end) as url_nulls
from fp_museum;

select *
from fp_museum
where museum_id is  null or name is null or address is null or city is null or state is null or postal is null or country is null or phone is null or url is null;

-- 5. fp_museum_hours
select * from fp_museum_hours limit 5;
select
	sum(case when museum_id is null then 1 else 0 end) as museum_id_nulls,
    sum(case when day is null then 1 else 0 end) as day_nulls,
    sum(case when open is null then 1 else 0 end) as open_nulls,
    sum(case when close is null then 1 else 0 end) as close_nulls
from fp_museum_hours;

select *
from fp_museum_hours
where museum_id is null or day is null or open is null or close is null;

-- 6. fp_image_link
select * from fp_image_link limit 5;
select
	sum(case when work_id is null then 1 else 0 end) as work_id_nulls,
    sum(case when url is null then 1 else 0 end) as work_id_nulls,
    sum(case when thumbnail_small_url is null then 1 else 0 end) as work_id_nulls,
    sum(case when thumbnail_large_url is null then 1 else 0 end) as work_id_nulls
from fp_image_link;

select *
from fp_image_link
where work_id is null or url is null or thumbnail_small_url is null or thumbnail_large_url is null;


-- 7. fp_artist
select * from fp_artist limit 5;
select
	sum(case when artist_id is null then 1 else 0 end) as artist_id_nulls,
    sum(case when full_name is null then 1 else 0 end) as full_name_nulls,
    sum(case when first_name is null then 1 else 0 end) as first_name_nulls,
    sum(case when middle_names is null then 1 else 0 end) as middle_names_nulls,
    sum(case when last_name is null then 1 else 0 end) as last_name_nulls,
    sum(case when nationality is null then 1 else 0 end) as nationality_nulls,
    sum(case when birth is null then 1 else 0 end) as birth_nulls,
    sum(case when death is null then 1 else 0 end) as death_nulls,
    sum(case when style is null then 1 else 0 end) as style_nulls
from fp_artist;

select *
from fp_artist
where artist_id is null or full_name is null or first_name is null or middle_names is null or last_name is null or nationality is null or birth is null or death is null or style is null;


-- 8. fp_canvas_size
select * from fp_canvas_size limit 5;

select
	sum(case when size_id is null then 1 else 0 end) as size_id_nulls,
    sum(case when width is null then 1 else 0 end) as width_nulls,
    sum(case when height is null then 1 else 0 end) as height_nulls,
    sum(case when label is null then 1 else 0 end) as label_nulls
from fp_canvas_size;

select *
from fp_canvas_size
where size_id is null or width is null or height is null or label is null;

/*
Q1). Fetch all the paintings which are not displayed in any museums.
*/
select work_id, name, museum_id
from fp_work
where museum_id is null;

/*
Q2). Are there museums without any paintings?
*/
select * from fp_museum;

select m.*,w.*
from fp_museum m
join fp_work w on w.museum_id=m.museum_id
where work_id is null;  -- No.

/* 15th Jan, 2025 1:45pm
Q3). How many paintings have an asking price of more than their regular price? 
*/
select count(*) from fp_product_size
where sale_price>regular_price;

/* 
Q4). Identify the paintings whose asking price is less than 50% of its regular price
*/
select w.name, p.sale_price, p.regular_price from fp_product_size p
join fp_work w on w.work_id=p.work_id
where p.sale_price < 0.5*p.regular_price;

/* 
Q5). Which canva size costs the most?
*/
select c.height, c.width, c.label, p.sale_price, p.regular_price from fp_canvas_size c
join fp_product_size p on p.size_id=c.size_id
order by p.sale_price desc
limit 1;

/* 
Q6). Delete duplicate records from work, product_size, subject and image_link tables

Note : Since none of the tables have unique identifiers (like a serial#), hence the self join and other similar approaches won't work to find out the true duplicates.
The best approach would be the row_number() partitioned across all the columns, to find the true duplicates.
The rank() and dense_rank() won't give the true duplicates since unlike the row_number(), they don't allot unique values to each rows.
*/

-- 1. Duplicates in fp_work
select * from
			(select *,
				row_number() over(partition by work_id,name,artist_id,style,museum_id) rn  -- true duplicate is found when you partition by all the columns. Link to how Nulls are trated : https://i.imghippo.com/files/NJq9910rY.png
			from fp_work) x
where x.rn>1;  -- 60 true duplicates : Note that the partition across all columns is where the reasoning lies. Had you partitioned across only a few, the results would have differed.

select x.rn, count(*) duplicates_count from
			(select *,
				row_number() over(partition by work_id,name,artist_id,style,museum_id) rn
			from fp_work) x
group by x.rn;  -- rn=2 when 2 rows with same values across all columns. rn=3 when 3 rows with same values across all columns

-- 2. Duplicates in fp_product_size
select * from
			(select *,
			row_number() over(partition by work_id, size_id, sale_price, regular_price) rn
			from fp_product_size)x
where x.rn>1;  -- 687 true duplicates

select x.rn, count(*) duplicates_count from
			(select *,
					row_number() over(partition by work_id, size_id, sale_price, regular_price) rn
			from fp_product_size)x
group by x.rn;

-- 3. Duplicates in fp_subject
select * from
			(select *,
					row_number() over(partition by work_id, subject)rn
			from fp_subject)x
where x.rn>1;  -- 59 true duplicates

select x.rn, count(*) duplicates_count from
	(select *, row_number() over(partition by work_id, subject)rn from fp_subject)x
group by x.rn;

-- 4. Duplicates in fp_image_link
select * from (
	select *,
	row_number() over(partition by work_id, url, thumbnail_small_url, thumbnail_large_url)rn
from fp_image_link)x
where x.rn>1;  -- 60 true duplicates

select x.rn, count(*) duplicates_count from
	(select *,
		row_number() over(partition by work_id, url, thumbnail_small_url, thumbnail_large_url)rn
	from fp_image_link)x
group by x.rn;

-- Deleting all the duplicates : Copying the data in a temp table and then deleting the data from there, instead of the original source table.
drop table temp_fp_work;
create table temp_fp_work as (select * from fp_work);
select * from temp_fp_work;  -- 14776 records
select count(distinct(work_id)) from temp_fp_work;  -- 14716
select x.rn, count(*) from 
			(select *,
				row_number() over(partition by work_id, name, artist_id, style, museum_id)rn
			from temp_fp_work)x
group by x.rn;  -- 59 records that have exactly 2 duplicates group. 1 record that has 3 duplicates group.


delete from temp_fp_work
where work_id in (
					select work_id from
						(select *,
							row_number() over(partition by work_id, name, artist_id, style, museum_id)rn
						from temp_fp_work)x
					where x.rn>1
				 );  -- deleted 119 records (59*2 = 118 + 1*1=1. Total : 118+1 = 119)

/* 
Q7). Identify the museums with invalid city information in the given dataset.
*/
select city from fp_museum;  -- 57 cities
select city from fp_museum where city is null;  -- no Nulls
select distinct(city) from fp_museum;  -- 45 unique cities (39 valid names, 6 invalid)
/* Output : New York,Moscow,Melbourne,São Paulo,2,45128,38000,29000,Kansas City,75001,London,Boston,Amsterdam,Jerusalem,Zurich,Washington,Den Haag,Paris,Madrid,Philadelphia,Budapest,Cleveland,Houston,Los Angeles
Toledo,Indianapolis,Nancy,San Francisco,Chicago,St. Louis,Firenze,Kurashiki,Baltimore,6731 AW Otterlo,Cardiff,Columbus,Fort Worth,Liverpool,Oslo,Dallas,Bern,Norfolk,Nové Měst,Pasadena,Stran
Notice spaces, digits, special characters in the names of the cities
*/
select distinct(city) from fp_museum where city regexp ('^[A-Za-z]+$');  -- Outputs those cities which have alphabets(upper or lower)
select distinct(city) from fp_museum where city regexp ('^[A-Za-z\\s]+$');  -- Outputs those cities which have alphabets(upper or lower) and whitespace characters like space or tab
select distinct(city) from fp_museum where city regexp ('^[A-Za-z\\s0-9]+$');  -- Outputs those cities which have the above and numbers
select distinct(city) from fp_museum where city regexp ('^[A-Za-z\\s0-9[[:punct:]]]+$');  -- Outputs those cities which have the above and special characters (like  !@#$%^&*()-_=+[]{};:'",.<>?/|)
select distinct(city) from fp_museum where city regexp ('^[[:alpha:]0-9\\s[[:punct:]]]+$');  -- Outputs those cities which have the above and accented names (like Nové Měst, 'São Paulo')

-- Solution
select distinct(city) from fp_museum where city regexp ('^[[:alpha:]\\s[[:punct:]]]+$'); -- 39 cities (valid names)
select city from fp_museum where city not in (select distinct(city) from fp_museum where city regexp ('^[[:alpha:]\\s[[:punct:]]]+$'));  -- invalid names

/* 
Q8). Museum_Hours table has 1 invalid entry. Identify and remove it.
*/
select * from fp_museum_hours where museum_id is null or day is null or open is null or close is null;
select museum_id from fp_museum_hours where museum_id regexp ('^[0-9]+$');  -- all valid entries
select day from fp_museum_hours where day not in (select day from fp_museum_hours where day regexp ('^[A-Za-z]+$'));  -- all entries have alphabets
select distinct(day) from fp_museum_hours; -- 8 results (should be 7. It was found that Thursday was present along with Thusday)

-- Fixing this entry using a temp table to not update the original
create table temp_fp_museum_hours as select * from fp_museum_hours;
select distinct(day) from temp_fp_museum_hours;
Update temp_fp_museum_hours
set day = 'Thursday'
where day = 'Thusday';

/* 
Q9). Fetch the top 10 most famous painting subject.
Here, the fame of a painting is being judged by the number of times it has been viewed
*/
select * from fp_image_link;

with cte_1 as
(select url
from fp_image_link
group by url
order by count(*) desc
limit 10),  -- outputs the 10 most viewed URLs of paintings

cte_2 as
(select distinct(url), work_id  -- because some of the urls are multiple in the table, we are picking the distinct ones
from fp_image_link where url in (select * from cte_1))

select distinct(c2.url), w.work_id, w.name
from cte_2 c2
join fp_work w on w.work_id=c2.work_id;

-- Bonus : 10 most expensive painting with details about the painter, painting, museum and price
Select s.work_id, a.first_name "Painter's First Name", a.last_name "Painter's Last Name", a.nationality "Painter's Nationality", a.birth "Painter's Birth Year",
w.name 'Painting\'s Name', m.name 'Museum\'s Name', m.city "Museum City", m.country "Museum Country", s.subject "Painting's Subject", p.sale_price "Painting's Sale Price", p.regular_price 
from fp_subject s
join fp_product_size p on p.work_id=s.work_id
join fp_work w on w.work_id=p.work_id
join fp_artist a on a.artist_id=w.artist_id
join fp_museum m on m.museum_id=w.museum_id
order by p.sale_price desc
limit 10;

/* 16th Jan,2025 4:30pm
Q10). Modified Question: Identify the museums which are open on Saturday, Sunday and Monday. Display museum name, city and the days they are open on.
*/
select m.name, m.city,
	   group_concat(mh.day) days_open
from fp_museum m
join fp_museum_hours mh on mh.museum_id=m.museum_id
where mh.day in ('Saturday','Sunday','Monday')
group by m.name, m.city
having count(mh.day) = 3;

/* 
Q11). How many museums are open every single day?
*/
select m.name, group_concat(mh.day) days_open
from fp_museum m
join fp_museum_hours mh on mh.museum_id=m.museum_id
where mh.day in (select distinct day from fp_museum_hours)
group by m.name
having count(mh.day)=7;

/* 
Q12). Which are the top 5 most popular museum? (Popularity is defined based on most no of paintings in a museum)?
*/
select w.museum_id, m.name "Museums", m.city, count(*) "No. Of Paintings"
from fp_work w
join fp_museum m on w.museum_id=m.museum_id
group by w.museum_id, m.name, m.city
order by count(*) desc
limit 5;

/* 
Q13). Who are the top 5 most popular artist? (Popularity is defined based on most no of paintings done by an artist)?
*/
select w.artist_id, a.first_name, a.last_name, a.nationality, a.birth, count(*) "No. Of Paintings"
from fp_work w
join fp_artist a on a.artist_id=w.artist_id
group by w.artist_id, a.first_name, a.last_name, a.nationality, a.birth
order by count(*) desc
limit 5;

/* 
Q14). Display the 3 least popular canvas sizes
*/
select p.size_id, c.width, c.height, p.sale_price
from fp_canvas_size c
join fp_product_size p on p.size_id=c.size_id
group by p.size_id, c.width, c.height, p.sale_price
order by p.sale_price
limit 3;

/* 
Q15). Which museum is open for the longest during a day. Dispay museum name, state and hours open and which day?
*/
with cte_1 as
(select m.name, m.state, mh.day, str_to_date(mh.open, '%h:%i:%p') open_time, str_to_date(mh.close, '%h:%i:%p') close_time
from fp_museum_hours mh
join fp_museum m on m.museum_id=mh.museum_id)

select *, timediff(close_time,open_time) hours_open
from cte_1
order by hours_open desc
limit 1;


-- Bonus Question : Since "Musée du Louvre" is open the most on a day, than any other museum, fetch it's hours open for all the days
with cte_1 as
(select m.name, m.state, mh.day, str_to_date(mh.open, '%h:%i:%p') open_time, str_to_date(mh.close, '%h:%i:%p') close_time
from fp_museum_hours mh
join fp_museum m on m.museum_id=mh.museum_id)

select *, timediff(close_time,open_time) hours_open
from cte_1
where name = "Musée du Louvre"
group by m.name,m.state, mh.day, open_time, close_time, hours_open;

/* 
Q16). Which museum has the most no of most popular painting style?
*/
-- Step#1 : Finding which is the most popular painting style
select style, count(*)
from fp_work
group by style
order by count(*) desc;

-- Step#2 : Finding the museum which has the most number of that most popular painting style
select w.museum_id, m.name "Museum", w.style, count(*) "Total no. of the most famous paintings"
from fp_work w
join fp_museum m on w.museum_id=m.museum_id
where w.style = 'Impressionism'
group by w.museum_id, m.name, w.style
order by count(*) desc
limit 1;

/* 
Q17). Identify the artists whose paintings are displayed in multiple countries?
*/
select a.first_name, a.last_name, group_concat(distinct w.name) "Paintings", group_concat(distinct m.country) "Countries"
from fp_work w
join fp_artist a on w.artist_id=a.artist_id
join fp_museum m on m.museum_id=w.museum_id
group by a.first_name, a.last_name
having count(distinct m.country) > 1;

/* 
Q18). Display the city and the country with most no of museums. If there are multiple values, seperate them with comma.
*/
-- Step#1 : Finding out the cities and countries with most no of museums.
select city, country, count(*) Total_Museums
from fp_museum
group by city, country
order by count(*) desc
limit 5;

-- Step#2 : Since there are multiple cities and countries that have the same number of "most no. of museums", hence comma separating them
with cte_1 as
(select city, country, count(*) Total_Museums
from fp_museum
group by city, country
order by count(*) desc
limit 5)

select group_concat(city) Cities, group_concat(country) Countries, Total_Museums
from cte_1
where Total_Museums = 3;

/* 
Q19). Identify the artist and the museum where the most expensive and least expensive painting is placed. Display the artist name, sale_price, painting name, museum name, museum city and canvas label.
*/
select a.first_name, a.last_name, p.sale_price, w.name Painting, m.name Museum, m.city City, c.label Canvas_Label
from fp_work w
join fp_artist a on w.artist_id=a.artist_id
join fp_museum m on m.museum_id=w.museum_id
join fp_product_size p on p.work_id=w.work_id
join fp_canvas_size c on c.size_id=p.size_id
order by p.sale_price desc
limit 1;  -- Most expensive painting

select a.first_name, a.last_name, p.sale_price, w.name Painting, m.name Museum, m.city City, c.label Canvas_Label
from fp_work w
join fp_artist a on w.artist_id=a.artist_id
join fp_museum m on m.museum_id=w.museum_id
join fp_product_size p on p.work_id=w.work_id
join fp_canvas_size c on c.size_id=p.size_id
order by p.sale_price
limit 1;  -- Least expensive painting

/* 17th Jan, 2025 9:45pm
Q20). Which country has the 5th highest no of paintings?
*/
select m.country, count(*)
from fp_work w
join fp_museum m on m.museum_id=w.museum_id
group by m.country
order by count(*) desc
limit 1 offset 4;  -- offset 4 skips the first 4 output rows, to give you the 5th

/*
Q21). Which are the 3 most popular and 3 least popular painting styles?
*/
select p.sale_price, w.style
from fp_work w
join fp_product_size p on p.work_id=w.work_id
group by p.sale_price, w.style
order by p.sale_price desc
limit 3; -- Most popular painting styles

select p.sale_price, w.style
from fp_work w
join fp_product_size p on p.work_id=w.work_id
group by p.sale_price, w.style
order by p.sale_price
limit 3; -- Least popular painting styles

/*
Q22). Which artist has the most no of Portraits paintings outside USA?. Display artist name, no of paintings and the artist nationality.
*/
select a.first_name, a.last_name, m.country, count(*)
from fp_work w
join fp_artist a on a.artist_id=w.artist_id
join fp_museum m on m.museum_id=w.museum_id
where m.country not in ('USA')
group by a.first_name, a.last_name, m.country
order by count(*) desc;

-- Bonus Question : What's the total no. of paintings made by the artists? Output the result in desc order of the total paintings
select w.artist_id, a.first_name, a.last_name , count(*) Total_Paintings
from fp_work w
join fp_artist a on a.artist_id=w.artist_id
group by w.artist_id, a.first_name, a.last_name
order by count(*) desc;


-- **************************************************************************END******************************************************************************