create table`studentresume`.`studentinfo` (
`idsinfo` int not null,
`firstname` varchar(45) null,
`lastname` varchar(45) null,
`age` int null,
primary key (`idsinfo`));
select lastname,firstname,age from database123.familyinfo;
select * from database123.familyinfo order by FIRSTNAME desc;
update database123.familyinfo set lastname='john' ,age=99 where idemployeeinfo=3;
update database123.familyinfo set firstname='omg' ,age=109 where idemployeeinfo=4;
INSERT INTO database123.familyinfo (idemployeeinfo,firstname,lastname,age) value (1,'mark','bill',34);
insert into database123.familyinfo (idemployeeinfo,firstname,lastname,age) value (999,'jery','henson',108);
insert into database123.familyinfo (idemployeeinfo,firstname,lastname,age) value (9997,'fung','boston',123);
select * from DATABASE123.familyinfo;
delete from database123.familyinfo where idemployeeinfo=9997;
select * from DATABASE123;
select sum(age)from database123.familyinfo;
select avg(age)from DATABASE123.familyinfo;
select min(age)from DATABASE123.familyinfo;
select max(age)from DATABASE123.familyinfo;
select count(age)from DATABASE123.familyinfo;
select * from DATABASE123.familyinfo;
select * from database123.familyinfo;
select * from database123.students;
rename table students to workers;

select * from payment where amount =2.99 order by payment_date desc;

#=================SQL_for_NewBs===============
#count and Group by
select title, rentle_rate
from file
where rentle_rate = 0.99
;

select count(title)
from file
where rental_rate = 0.99
;

select count(title), rentle_rate
from film
group by rental_rate
;

select count(title), rentle_rate
from film
group by 2
;

select rating, count(film_id)
from film
group by 1
;
select rating, rental_rate, count(film_id)
from film
group by 2,1
;

select title, rental_rate
from film
group by rental_rate
;
# if a selected expression is not in group by clouse, you can use "any_value" as below.
select any_value(title), rental_rate
from film
group by 2;

select title, any_value(rental_rate)
from film
group by 1;

# which rating do we have the most films in?
select rating, count(title)
from film
group by 1;

# Are there 70 films that have an R rating at $.99? (YES)
select count(title), any_value(rating), rental_rate
from film
group by 3,2;
#======================================

#lecture 13: customer id, name(first and last), mailing address
select customer.customer_id, customer.firstname, customer.lastname, address.address
from customer, address
where customer.address_id = address.address_id
#where cluse is to connect 2 tables making coorespondate to each table, no duplication or repeatation.
#======================================
#L14 film name, category, language
select film.title, category.name, language.name

from film, language, film_category, category
#where is condition and connect
where film.film_id = film_category.film_id
      and
      category.category_id = film_category.category_id
      and 
      film.language_id = language.language_id
      ;

select f.title, c.name, l.name
# to add shortcut, change the names in FROM cluse first. exp: film f meaning film space f
from film f, language l, film_category fc, category c
#where is condition and connect
where f.film_id = fc.film_id
      and
      c.category_id = fc.category_id
      and 
      f.language_id = l.language_id
      ;

#==================================
#how many times each movie has been rented out?
select
      f.title, count(r.rental_id)
from
      film f, rental r, inventory i
where f.film_id = r.inventory_id
      and
      i.inventory_id = r.inventory_id
 
group by 1;
#LEC 17 ==================================
# revenue per video title
select
      f.title as " film title",count(r.rental_id), f.rental_rate, count(r.rental_id) * f.rental_rate as revenue
from
      film f, rental r, inventory i
where f.film_id = r.inventory_id
      and
      i.inventory_id = r.inventory_id
 
group by 1, 3

order by 4 desc;

#Expression #3 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'sakila.' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by
# revenue = price * number of rentals

#=================================
# which customer has paid us the most money?
select 
P.customer_id, SUM(P.amount)

from payment p

group by 1

order by 2 desc;
#=================================
what is the total revenue ?
select 
any_value(P.customer_id), count(P.amount)

from payment p

where amount > 0;

#================================
# total revenue by store
select i.store_id as " STORE ID", SUM(p.amount) as REVENUE

from inventory i, payment p, rental r

where p.rental_id = r.rental_id
      and 
      r.inventory_id = i.inventory_id

group by 1

order by  2 desc;



