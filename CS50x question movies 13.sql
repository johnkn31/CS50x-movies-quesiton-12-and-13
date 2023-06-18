-- In 13.sql, write a SQL query to list the names of all people who starred in a movie in which Kevin Bacon also starred

-- find out the names of the movies in which Kevin Bacon stars in
SELECT
    movies.title
FROM movies
INNER JOIN stars ON movies.id = stars.movie_id
INNER JOIN people ON stars.person_id = people.id
WHERE people.name LIKE '%Kevin Bacon%'
AND people.birth LIKE '%1958%';



--find out the people who are stared with Kevin Bacon
SELECT people.name
FROM people
INNER JOIN stars ON people.id = stars.person_id
INNER JOIN movies ON stars.movie_id = movies.id
WHERE movies.title IN ( SELECT
                            movies.title
                        FROM movies
                        INNER JOIN stars ON movies.id = stars.movie_id
                        INNER JOIN people ON stars.person_id = people.id
                        WHERE people.name LIKE '%Kevin Bacon%'
                        AND people.birth LIKE '%1958%')

AND people.name != 'Kevin Bacon'
;


















