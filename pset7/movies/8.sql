SELECT name FROM stars
JOIN people ON people.id = stars.person_id
JOIN movies ON stars.movie_id = movies.id
WHERE title IS "Toy Story";