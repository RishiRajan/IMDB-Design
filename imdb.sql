CREATE TABLE movie (
  id INT PRIMARY KEY,
  title VARCHAR(255),
  release_year INT,
  plot_summary TEXT
);

-- Media table for diferent meda types from movies referencing movie with id

CREATE TABLE media (
  id INT PRIMARY KEY,
  movie_id INT,
  media_type VARCHAR(10),
  url VARCHAR(255),
  FOREIGN KEY (movie_id) REFERENCES movie(id)
);


CREATE TABLE genre (
  id INT PRIMARY KEY,
  name VARCHAR(255),
  description TEXT
);

-- Combined table as each movie can have multiple genres

CREATE TABLE movie_genre (
  movie_id INT,
  genre_id INT,
  PRIMARY KEY (movie_id, genre_id),
  FOREIGN KEY (movie_id) REFERENCES movie(id),
  FOREIGN KEY (genre_id) REFERENCES genre(id)
);


CREATE TABLE user (
  id INT PRIMARY KEY,
  username VARCHAR(255),
  password VARCHAR(255)
);

CREATE TABLE review (
  id INT PRIMARY KEY,
  movie_id INT,
  user_id INT,
  rating INT,
  comment TEXT,
  review_date DATE,
  FOREIGN KEY (movie_id) REFERENCES movie(id),
  FOREIGN KEY (user_id) REFERENCES user(id)
);


CREATE TABLE artist (
  id INT PRIMARY KEY,
  name VARCHAR(255),
  bio TEXT
);

CREATE TABLE skill (
  id INT PRIMARY KEY,
  artist_id INT,
  skill_name VARCHAR(255),
  FOREIGN KEY (artist_id) REFERENCES artist(id)
);

CREATE TABLE role_type (
  id INT PRIMARY KEY,
  name VARCHAR(255),
  description TEXT
);

CREATE TABLE role (
  id INT PRIMARY KEY,
  movie_id INT,
  artist_id INT,
  role_name VARCHAR(255),
  role_type_id INT,
  FOREIGN KEY (movie_id) REFERENCES movie(id),
  FOREIGN KEY (artist_id) REFERENCES artist(id),
  FOREIGN KEY (role_type_id) REFERENCES role_type(id)
);

CREATE TABLE movie_artist_role (
  movie_id INT,
  artist_id INT,
  role_id INT,
  PRIMARY KEY (movie_id, artist_id, role_id),
  FOREIGN KEY (movie_id) REFERENCES movie(id),
  FOREIGN KEY (artist_id) REFERENCES artist(id),
  FOREIGN KEY (role_id) REFERENCES role
)

