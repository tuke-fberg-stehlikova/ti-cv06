CREATE TABLE experiences (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE genres (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    birth_date DATE,
    experience_id INT,
    FOREIGN KEY (experience_id) REFERENCES experiences(id) ON DELETE RESTRICT
);

CREATE TABLE user_genres (
    user_id INT,
    genre_id INT,
    PRIMARY KEY (user_id, genre_id),
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (genre_id) REFERENCES genres(id) ON DELETE RESTRICT
);
