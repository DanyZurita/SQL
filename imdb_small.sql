USE imdb_small;

/* 1. */

SELECT * 
FROM actors 
WHERE last_name = "Willis";

/* 2. */

SELECT id, name 
FROM movies 
WHERE name LIKE "% kill" 
	OR name LIKE "% pirates" 
	OR name LIKE "% man" 
	OR name LIKE "% wars" 
	OR name LIKE "% kill %" 
	OR name LIKE "% pirates %" 
	OR name LIKE "% man %" 
	OR name LIKE "% wars %" 
	OR name LIKE "kill %" 
	OR name LIKE "pirates %" 
	OR name LIKE "man %" 
	OR name LIKE "wars %" 
		ORDER BY name;

/* 3. */
SELECT M.name 
FROM movies as M, movies_directors as MD, directors AS D 
WHERE M.id = MD.movie_id 
	AND D.id = MD.director_id 
	AND D.first_name = "Ethan" 
	AND D.last_name = "Coen" 
		ORDER BY M.name;

/* 4. */
SELECT M.name, M.year 
FROM movies as M, movies_directors as MD, directors AS D 
WHERE M.id = MD.movie_id 
	AND D.id = MD.director_id 
	AND D.first_name = "Ethan" 
	AND D.last_name = "Coen" 
	AND M.year > 1996 
		ORDER BY M.year;

/* 5. */

SELECT id, name, year 
FROM movies 
WHERE id NOT IN 
	(SELECT movie_id 
	FROM movies_directors);

/* 6. */

SELECT CONCAT(D.first_name, " ",D.last_name) as director_name, M.name as movie_title, M.year, CONCAT(A.first_name, " ", A.last_name) as actor_name, R.role AS role 
FROM directors as D, movies as M, actors as A, roles as R, movies_directors as MD 
WHERE M.id = MD.movie_id 
	AND D.id = MD.director_id 
	AND R.actor_id = A.id 
	AND R.movie_id = M.id 
	AND M.name = "Lost in Translation";

/* 7. */

SELECT DISTINCT M.name as movie_title, M.year, CONCAT(D.first_name, " ",D.last_name) as artist_name
FROM directors as D, movies as M, actors as A, roles as R, movies_directors as MD
WHERE M.id = MD.movie_id 
	AND D.id = MD.director_id 
	AND R.actor_id = A.id 
	AND R.movie_id = M.id 
	AND A.first_name = D.first_name 
	AND A.last_name = D.last_name
	 ORDER BY CONCAT(D.first_name, " ",D.last_name);

/* 8. */

SELECT CONCAT(A.first_name, " ", A.last_name) as actors_name,  M.name as movie_title, M.year 
FROM movies as M, roles as R, actors as A 
WHERE M.id = R.movie_id AND
		A.id = R.actor_id AND M.name IN 
		(SELECT M.name as movie_title
		FROM movies as M, roles as R, actors as A 
		WHERE M.id = R.movie_id 
			AND A.id = R.actor_id 
			AND CONCAT(A.first_name, " ", A.last_name) = "Uma Thurman") 
			AND CONCAT(A.first_name, " ", A.last_name) <> "Uma Thurman"
				ORDER BY movie_title, actors_name;

/* 9. */

SELECT DISTINCT CONCAT(D.first_name, " ",D.last_name) as director_name
FROM directors as D, movies as M, actors as A, roles as R, movies_directors as MD
WHERE M.id = MD.movie_id 
	AND D.id = MD.director_id 
	AND R.actor_id = A.id 
	AND R.movie_id = M.id 
	AND A.first_name <> D.first_name 
	AND A.last_name <> D.last_name
		ORDER BY CONCAT(D.first_name, " ",D.last_name);

/* 10. */

SELECT DISTINCT CONCAT(D.first_name, " ",D.last_name) as director_name, S.counts AS "count(*)"
FROM directors AS D, movies_directors AS MD, 
	(SELECT COUNT(movie_id) AS counts, director_id as did 
	FROM movies_directors GROUP BY director_id) AS S 
WHERE MD.director_id = D.id AND S.did = D.id
	ORDER BY director_name;

/*10.2 */

SELECT CONCAT(D.first_name, " ",D.last_name) as director_name, COUNT(MD.movie_id)  
FROM directors AS D, movies_directors AS MD 
WHERE MD.director_id = D.id 
	GROUP BY MD.director_id 
	ORDER BY CONCAT(D.first_name, " ",D.last_name)

/* 11. */

SELECT A.first_name, A.last_name, COUNT(R.movie_id) AS Nº_movies
FROM actors AS A, roles AS R 
WHERE R.actor_id = A.id AND A.last_name LIKE "P%"
	GROUP BY R.actor_id
	ORDER BY Nº_movies DESC;

/* 12. No, it should be in different tables because you can't use the fact of been a director as another column in films that have more than 1 director, for example in case of a movie direted by brothers such as Coppola's. Having an exclusive table for directors means you don't have to be looking for the director's id in the same table and having more room to input more data about the director such as a foreign keys of other tables. */

/* 13. Yes, because you can have directors_id as foreign key in actors table. */




