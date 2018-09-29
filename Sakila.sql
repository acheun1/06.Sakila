/*Sakila
2018 09 23 
Cheung Anthony
*/


Queries
/*1. What query would you run to get all the customers inside city_id = 312? 
Your query should return customer first name, last name, email, and address.*/

SELECT * FROM sakila.customer LIMIT 10
SELECT * FROM sakila.city LIMIT 10
SELECT * FROM sakila.address LIMIT 10	

    SELECT 
		A. first_name,
        A. last_name,
        A. email,
        B. address,
        B. city_id
FROM 
	sakila.customer a
LEFT JOIN
	sakila.address b
ON A.address_id = B.address_id
		WHERE city_id=312

	
/*2. What query would you run to get all comedy films? 
Your query should return film title, description, release year, rating, special features, and genre (category).*/

SELECT * FROM sakila.film LIMIT 10
SELECT * FROM sakila.film_category LIMIT 10
SELECT * FROM sakila.category LIMIT 10

	SELECT 
		A. title,
        A. description,
        A. release_year,
        A. rating,
        A. special_features,
        C. name AS genre
FROM 
	sakila.film a
LEFT JOIN
	sakila.film_category b
ON A.film_id = B.film_id
LEFT JOIN
	sakila.category c
ON B.category_id=C.category_id
	WHERE C.name like '%comedy%'

/*3. What query would you run to get all the films joined by actor_id=5? 
Your query should return the actor id, actor name, film title, description, and release year.*/

SELECT * FROM sakila.film LIMIT 10
SELECT * FROM sakila.film_actor WHERE actor_id=5 
SELECT * FROM sakila.actor LIMIT 10

	SELECT 
		C. actor_id,
        C. first_name,
        C. last_name,    
		A. title AS film_title,
        A. description,
        A. release_year,
        B.film_id
FROM 
	sakila.film a
LEFT JOIN
	sakila.film_actor b
ON A.film_id=B.film_id
LEFT JOIN
	sakila.actor c
ON B.actor_id=C.actor_id
	where B.actor_id=5

	
/*4. What query would you run to get all the customers in store_id = 1 and inside these cities (1, 42, 312 and 459)? 
Your query should return customer first name, last name, email, and address.*/

SELECT * FROM sakila.customer LIMIT 10
SELECT * FROM sakila.city LIMIT 10
SELECT * FROM sakila.address LIMIT 10

	SELECT 
		A.first_name,
        A.last_name,
        A.email,
        B.address
FROM
	sakila.customer A
LEFT JOIN
	sakila.address B
ON A.address_id = B.address_id
LEFT JOIN
	sakila.city C
ON B.city_id = C.city_id
	WHERE A.store_id=1 AND C.city_id IN (1,42,312,459)

/*5. What query would you run to get all the films with a "rating = G" and "special feature = behind the scenes", joined by actor_id = 15? 
Your query should return the film title, description, release year, rating, and special feature. Hint: You may use LIKE function in getting the 'behind the scenes' part.*/


SELECT * FROM sakila.film LIMIT 10
SELECT * FROM sakila.film_actor WHERE actor_id=5 
SELECT * FROM sakila.actor LIMIT 10

	SELECT 
		A. title AS film_title,
        A. description,
        A. release_year,
        A. rating,
        A. special_features
FROM 
	sakila.film a
LEFT JOIN
	sakila.film_actor b
ON A.film_id=B.film_id
LEFT JOIN
	sakila.actor c
ON B.actor_id=C.actor_id
	where B.actor_id=15 AND A.rating like '%G%' AND A.special_features like '%behind the scenes%'


/*6. What query would you run to get all the actors that joined in the film_id = 369? 
Your query should return the film_id, title, actor_id, and actor_name.*/

	SELECT 
        B.film_id,
		A. title AS film_title,        
		C. actor_id,
        C. first_name,
        C. last_name
FROM 
	sakila.film a
LEFT JOIN
	sakila.film_actor b
ON A.film_id=B.film_id
LEFT JOIN
	sakila.actor c
ON B.actor_id=C.actor_id
	where B.film_id=369

/*7. What query would you run to get all drama films with a rental rate of 2.99? 
Your query should return film title, description, release year, rating, special features, and genre (category).*/

	SELECT 
		A. title,
        A. description,
        A. release_year,
        A. rating,
        A. special_features,
        C. name AS genre
FROM 
	sakila.film a
LEFT JOIN
	sakila.film_category b
ON A.film_id = B.film_id
LEFT JOIN
	sakila.category c
ON B.category_id=C.category_id
	WHERE A.rental_rate=2.99


/*8. What query would you run to get all the action films which are joined by SANDRA KILMER? 
Your query should return film title, description, release year, rating, special features, genre (category), and actor's first name and last name.*/

SELECT * FROM sakila.film LIMIT 10
SELECT * FROM sakila.film_actor WHERE actor_id=5 
SELECT * FROM sakila.actor LIMIT 10
SELECT * FROM sakila.film_category LIMIT 10
SELECT * FROM sakila.category LIMIT 10

	SELECT 
		A. title AS film_title,
        A. description,
        A. release_year,
        A. rating,
        A. special_features,
        E. name AS genre,
        C. first_name,
        C. last_name        
FROM 
	sakila.film a
LEFT JOIN
	sakila.film_actor b
ON A.film_id=B.film_id
LEFT JOIN
	sakila.actor c
ON B.actor_id=C.actor_id

LEFT JOIN
	sakila.film_category d
ON A.film_id = d.film_id
LEFT JOIN
	sakila.category e
ON D.category_id=e.category_id
	WHERE E.name like '%action%' AND C.first_name like '%sandra' AND C.last_name like '%KILMER%'





