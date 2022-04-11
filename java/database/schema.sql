BEGIN TRANSACTION;

DROP TABLE IF EXISTS users, book_details;
DROP SEQUENCE IF EXISTS seq_user_id;

CREATE SEQUENCE seq_user_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;

CREATE TABLE book_details(
	isbn varchar(17) NOT NULL,
	title varchar(100) NOT NULL,
	author varchar(100) NOT NULL,
	CONSTRAINT PK_book_details PRIMARY KEY (isbn)
	);

CREATE TABLE users (
	user_id int DEFAULT nextval('seq_user_id'::regclass) NOT NULL,
	username varchar(50) NOT NULL,
	password_hash varchar(200) NOT NULL,
	role varchar(50) NOT NULL,
	CONSTRAINT PK_user PRIMARY KEY (user_id)
);

CREATE TABLE genre(
	genre_id serial,
	genre_name varchar(50), 
	CONSTRAINT PK_genre PRIMARY KEY (genre_id)
);

CREATE TABLE book_genre(
	isbn varchar(17) NOT NULL,
	genre_id int NOT NULL,
	PRIMARY KEY(isbn, genre_id)	
);

-- ********************** DATA for book_genre TABLE ************* --

INSERT INTO book_genre(isbn, genre_id) VALUES('9781400079278',1);
INSERT INTO book_genre(isbn, genre_id) VALUES('9781400079278',6);
INSERT INTO book_genre(isbn, genre_id) VALUES('9780356500157',2);
INSERT INTO book_genre(isbn, genre_id) VALUES('9780356500157',8);
INSERT INTO book_genre(isbn, genre_id) VALUES('9780684830490',1);
INSERT INTO book_genre(isbn, genre_id) VALUES('9781984822178',1);
INSERT INTO book_genre(isbn, genre_id) VALUES('9781984822178',5);
INSERT INTO book_genre(isbn, genre_id) VALUES('9783125971400',1);
INSERT INTO book_genre(isbn, genre_id) VALUES('9783125971400',6);


-- *************** Data for genre TABLE *******************
INSERT INTO genre(genre_id, genre_name) VALUES (1, 'Novel');
INSERT INTO genre(genre_id, genre_name) VALUES (2, 'Horror');
INSERT INTO genre(genre_id, genre_name) VALUES (3, 'Non Fiction');
INSERT INTO genre(genre_id, genre_name) VALUES (4, 'Comic');
INSERT INTO genre(genre_id, genre_name) VALUES (5, 'Adventure');
INSERT INTO genre(genre_id, genre_name) VALUES (6, 'Fantasy');
INSERT INTO genre(genre_id, genre_name) VALUES (7, 'SciFi');
INSERT INTO genre(genre_id, genre_name) VALUES (8, 'Drama');


-- *************************               Data for book_details TABLE                               ****************--

INSERT INTO book_details(isbn, title, author) VALUES ('9781400079278', 'Kafka by the Shore', 'Haruki Murakami');
INSERT INTO book_details(isbn, title, author) VALUES ('9780356500157', 'The Girl With All the Gifts', 'M.R. Carey');
INSERT INTO book_details(isbn, title, author) VALUES ('9780684830490', 'The Old Man and the Sea', 'Ernest Hemingway');
INSERT INTO book_details(isbn, title, author) VALUES ('9781984822178', 'Normal People', 'Sally Rooney');
INSERT INTO book_details(isbn, title, author) VALUES ('9783125971400', 'Le Petit Prince', 'Antoine de Saint-Exupéry');


-- *************************                Data for users TABLE                         **************** --

INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');

ALTER SEQUENCE genre_genre_id_seq RESTART WITH 100;

COMMIT TRANSACTION;
