-- 1. Všetci používatelia
-- 4 records
SELECT * FROM users;

-- 2. Používatelia zoradení podľa mena
-- upravené: zoradené zostupne (DESC)
-- 4 records
SELECT * FROM users ORDER BY name DESC;

-- 3. Výпис len mien a emailov
-- 4 records
SELECT name, email FROM users;

-- 4. Počet používatelí
-- 1 records
SELECT COUNT(*) AS total_users FROM users;

-- 5. Žánre filmov
-- upravené: zoradené podľa ID zostupne
-- 3 records
SELECT * FROM genres ORDER BY id DESC;

-- 6. Úrovnie skúseností
-- 3 records
SELECT * FROM experiences;

-- 7. Spojenie používateľov a skúseností
-- 4 records
SELECT users.name, experiences.name AS experience 
FROM users 
JOIN experiences ON users.experience_id = experiences.id;

-- 8. Väzbová tabuľka user_genres
-- 5 records
SELECT * FROM user_genres;

-- 9. Pridaný dátum narodenia (Úloha 7.6)
-- 4 records
SELECT name, email, birth_date FROM users;

-- 10. Počet žánrov na používateľa
-- 4 records
SELECT user_id, COUNT(genre_id) AS genre_count FROM user_genres GROUP BY user_id;

-- 11. Filtrowanie podľa skúsenosti
-- 2 records
SELECT * FROM users WHERE experience_id = 1;

-- 12. Agregácia (Úloha 7.6: zmena AVG/MAX/MIN)
-- 1 records
SELECT MAX(id) AS max_id, MIN(id) AS min_id FROM users;

-- 13. Group by s úpravou (Úloha 7.6: zoradenie podľa počtu zostupne)
-- 3 records
SELECT genre_id, COUNT(user_id) AS total_users 
FROM user_genres 
GROUP BY genre_id 
ORDER BY total_users DESC;

-- 14. Detail jedného používateľa
-- 1 records
SELECT * FROM users WHERE id = 1;

-- 15. Zoznam žánrov pre konkrétneho používateľa
-- 2 records
SELECT genres.name 
FROM user_genres 
JOIN genres ON user_genres.genre_id = genres.id 
WHERE user_genres.user_id = 1;

-- 16. Vlastný query
-- 4 records
SELECT name, email FROM users WHERE birth_date > '1995-01-01';
