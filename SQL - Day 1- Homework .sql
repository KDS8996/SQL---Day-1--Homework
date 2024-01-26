-- Query how many actors are there with the last name 'Wahlberg'?
select first_name, last_name
from actor
where last_name = 'Wahlberg';

-- Query how many payments were made between $3.99 and 5.99?
select customer_id, amount
from payment
where amount between 3.99 and 5.99
order by amount desc;

-- Query What film does the store have the most of? (search in inventory)
select film.title  as film_title, count(*) as film_count
from inventory
join film on inventory.film_id  = film.film_id 
group by film.title 
order by film_count desc 
limit 1;

-- Query How many customers have the name 'William'?
select first_name, last_name
from customer 
where last_name like  'William';

-- Query What store employee (get the id) sold the most rentals?
select staff_id as employee_id, count(*) as rental_count
from rental
where staff_id is not null 
group by staff_id 
order by rental_count desc 
limit 1;

-- Query How many different district names are there
select count(distinct district) as distinct_district_count
from city;

-- Query What film has the most actors in it? (use film_actor table and get film_id) 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
select film_id, count(*) as actor_count
from film_actor 
group by film_id 
order by actor_count desc;


-- Query In dbeaver, from store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
select count(*) as customer_count
from customer 
where store_id = 1 and last_name like '%es';

-- Query How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers  with ids between 380 and 430? (use group by and having > 250)
select amount, count(*) rental_count
from payment 
join rental on payment.rental_id = rental.rental_id 
join customer on rental.customer_id = customer.customer_id 
where customer.customer_id between 380 and 430
group by amount
having count(*) > 250;

-- Query  Within the film table, how many rating categories are there? And what rating has the most  movies total?
select count(distinct rating) as distinct_rating_count
from film;


