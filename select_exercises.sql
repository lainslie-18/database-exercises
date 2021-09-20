-- Create a new file called select_exercises.sql. Store your code for this exercise in that file. You should be testing your code in Sequel Ace as you go.

-- Use the albums_db database.
use albums_db;

-- Explore the structure of the albums table.
show tables;
describe albums;

-- a. How many rows are in the albums table?
select count(*) from albums;
-- 31 rows in albums table

-- b. How many unique artist names are in the albums table?
select count(distinct artist) from albums;
-- 23 unique artist names

-- c. What is the primary key for the albums table?
describe albums;
-- primary key is id

-- d. What is the oldest release date for any album in the albums table? What is the most recent release date?
select min(release_date) from albums;
select max(release_date) from albums;
-- 1967, 2011

-- 4. Write queries to find the following information:
-- a. The name of all albums by Pink Floyd
select name from albums where artist = 'Pink Floyd';

-- b. The year Sgt. Pepper's Lonely Hearts Club Band was released
select release_date from albums where name = 'Sgt. Pepper\'s Lonely Hearts Club Band';

-- c. The genre for the album Nevermind
select genre from albums where name = "Nevermind";

-- d. Which albums were released in the 1990s
select name from albums where release_date between 1990 and 1999;

-- e. Which albums had less than 20 million certified sales
select name from albums where sales < 20.0;

-- f. All the albums with a genre of "Rock". Why do these query results not include albums with a genre of "Hard rock" or "Progressive rock"?
select name from albums where genre = 'Rock';
-- because SQL is very literal and by enclosing rock in single quotes, we are explicitly telling it to look for only rock. If we wanted albums where rock is in the genre name we could:
select name from albums where genre like '%rock%';

