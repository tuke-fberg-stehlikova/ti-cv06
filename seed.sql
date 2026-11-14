INSERT INTO experiences (id, name) VALUES (1, 'Začiatočník'), (2, 'Pokročilý'), (3, 'Expert');

INSERT INTO genres (id, name) VALUES (1, 'Komédia'), (2, 'Dráma'), (3, 'Sci-Fi');

INSERT INTO users (id, name, email, birth_date, experience_id) VALUES 
(1, 'Ján Mrkvička', 'jan@example.com', '1995-05-12', 1),
(2, 'Mária Kratochvílová', 'maria@example.com', '1998-10-20', 2),
(3, 'Peter Novák', 'peter@example.com', '2000-01-15', 3);

-- DOPLŇ: štvrtý record (Анна)
INSERT INTO users (id, name, email, birth_date, experience_id) VALUES 
(4, 'Anna', 'anna@example.com', '2004-02-01', 1);

INSERT INTO user_genres (user_id, genre_id) VALUES (1, 1), (1, 2), (2, 2), (3, 3), (4, 1);
