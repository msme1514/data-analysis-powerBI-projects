select *, (year(curdate())-birth_year) as age from actors order by age desc

select  title,currency,unit, (revenue-budget) as profit from financials join movies using (movie_id)

select *, revenue,
case
       when unit='Billions' then revenue*1000
        when unit='Thousands' then revenue/1000
            else revenue
end
as revenue_in_millions
from financials

select movie_id, round(((revenue-budget)*100 / budget),2) as profit_percent from financials


#1. Show all the movies with their language names
select title,name from movies join languages l on movies.language_id = l.language_id

# 2. Show all Telugu movie names (assuming you don't know the language id for Telugu)
select title,name from movies join languages l on movies.language_id = l.language_id
where name = "Telugu"

#3. Show the language and number of movies released in that language
select name,count(*) from movies join languages l on l.language_id = movies.language_id
group by name