select movie_id, title, release_year, budget, revenue, unit, currency from movies right join financials using (movie_id)
order by release_year desc

select title,imdb_rating from movies where studio like '%marvel%'

select studio,count(*),avg(imdb_rating) from movies group by studio

select stddev(revenue) from financials where currency = 'USD' and unit = 'Millions'

#1. How many movies were released between 2015 and 2022
select count(*) from movies where release_year between 2015 and 2022
#2. Print the max and min movie release year
select min(release_year),max(release_year) from movies
#3. Print a year and how many movies were released in that year starting with the latest year
select release_year, count(*) from movies group by release_year order by release_year