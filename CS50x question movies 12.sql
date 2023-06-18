--In 12.sql, write a SQL query to list the titles of all movies in which both Johnny Depp and Helena Bonham Carter starred.

-- find all movies that Johnny Depp start in; then find all movies that Helena Bonham Carter starred In
SELECT
        movies.title
FROM movies
INNER JOIN stars ON movies.id = stars.movie_id
INNER JOIN people ON stars.person_id = people.id
WHERE people.name LIKE '%Johnny Depp%';


SELECT
        movies.title
FROM movies
INNER JOIN stars ON movies.id = stars.movie_id
INNER JOIN people ON stars.person_id = people.id
WHERE people.name LIKE '%Helena Bonham Carter%';




-- solution
SELECT movies.title
FROM movies
WHERE movies.title IN (SELECT
                        movies.title
                        FROM movies
                        INNER JOIN stars ON movies.id = stars.movie_id
                        INNER JOIN people ON stars.person_id = people.id
                        WHERE people.name LIKE '%Johnny Depp%'
                        )

AND movies.title IN (SELECT
                        movies.title
                        FROM movies
                        INNER JOIN stars ON movies.id = stars.movie_id
                        INNER JOIN people ON stars.person_id = people.id
                        WHERE people.name LIKE '%Helena Bonham Carter%'
                        )
;





