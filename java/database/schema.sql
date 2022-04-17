BEGIN TRANSACTION;

DROP TABLE IF EXISTS reading_list, users, book_details, genre, 
book_genre, reading_list_book, book_request_status, book_request ;

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
	PRIMARY KEY(isbn, genre_id),
	CONSTRAINT FK_book_genre_book_details_isbn FOREIGN KEY(isbn) REFERENCES book_details(isbn),
	CONSTRAINT FK_book_genre_genre FOREIGN KEY(genre_id) REFERENCES genre(genre_id)
);

CREATE TABLE reading_list(
	list_id serial NOT NULL,
	list_name varchar(250) NOT NULL,
	user_id int NOT NULL,
	CONSTRAINT PK_reading_list PRIMARY KEY (list_id),
	CONSTRAINT FK_reading_list_users FOREIGN KEY(user_id) REFERENCES users(user_id)

);

CREATE TABLE user_book (
	user_id int NOT NULL,
	isbn varchar(17) NOT NULL,
	PRIMARY KEY(user_id, isbn),
	CONSTRAINT FK_users_book_details FOREIGN KEY(user_id) REFERENCES users(user_id),
	CONSTRAINT FK_book_details_users FOREIGN KEY(isbn) REFERENCES book_details(isbn)
);

CREATE TABLE reading_list_book(
	list_id int NOT NULL,
	isbn varchar(17) NOT NULL,
	PRIMARY KEY(list_id, isbn),
	CONSTRAINT FK_reading_list_reading_list_book FOREIGN KEY(list_id) REFERENCES reading_list(list_id),
	CONSTRAINT FK_book_details_reading_list_book FOREIGN KEY(isbn) REFERENCES book_details(isbn)
 );
 
 
CREATE TABLE book_request_status (
	book_request_status_id serial NOT NULL,
	book_request_status_desc varchar(10) NOT NULL,
	CONSTRAINT PK_book_request_status PRIMARY KEY (book_request_status_id)
);

CREATE TABLE book_request(
	book_request_id serial,
	book_isbn varchar(50) NOT NULL,
	book_request_status_id int NOT NULL,
	request_received_from int NOT NULL,
	request_sent_to int NOT NULL,	
	CONSTRAINT PK_book_request_id PRIMARY KEY (book_request_id),
	CONSTRAINT FK_book_request_book_details FOREIGN KEY (book_isbn) REFERENCES book_details(isbn),
	CONSTRAINT FK_book_request_from_users FOREIGN KEY (request_received_from) REFERENCES users(user_id),
	CONSTRAINT FK_book_request_sent_users FOREIGN KEY (request_sent_to) REFERENCES users(user_id)
);



-- *************** Data for genre TABLE *******************
INSERT INTO genre(genre_id, genre_name) VALUES (1, 'Novel');
INSERT INTO genre(genre_id, genre_name) VALUES (2, 'Horror');
INSERT INTO genre(genre_id, genre_name) VALUES (3, 'Non Fiction');
INSERT INTO genre(genre_id, genre_name) VALUES (4, 'Comic');
INSERT INTO genre(genre_id, genre_name) VALUES (5, 'Adventure');
INSERT INTO genre(genre_id, genre_name) VALUES (6, 'Fantasy');
INSERT INTO genre(genre_id, genre_name) VALUES (7, 'SciFi');
INSERT INTO genre(genre_id, genre_name) VALUES (8, 'Drama');


-- *************************Data for book_details TABLE ****************--

INSERT INTO book_details(isbn, title, author) VALUES ('9781400079278', 'Kafka by the Shore', 'Haruki Murakami');
INSERT INTO book_details(isbn, title, author) VALUES ('9780356500157', 'The Girl With All the Gifts', 'M.R. Carey');
INSERT INTO book_details(isbn, title, author) VALUES ('9780684830490', 'The Old Man and the Sea', 'Ernest Hemingway');
INSERT INTO book_details(isbn, title, author) VALUES ('9781984822178', 'Normal People', 'Sally Rooney');
INSERT INTO book_details(isbn, title, author) VALUES ('9783125971400', 'Le Petit Prince', 'Antoine de Saint-Exupéry');
INSERT INTO book_details(isbn, title, author) VALUES ('9781534431003', 'This Is How You Lose the Time War', 'Amal El-Mohtar');
INSERT INTO book_details(isbn, title, author) VALUES ('048627263X', 'Flatland', 'Edwin A. Abbott');
INSERT INTO book_details(isbn, title, author) VALUES ('9780449208106', 'Things Fall Apart', 'Chinua Achebe');

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

-- ************************* Data for users TABLE **************** --

INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');
INSERT INTO users (username,password_hash,role) VALUES ('naveena','$2a$10$vA9tZrrI3R9HqeHfKMNdxev81yjmaeYrHxczvU7UwVJxPSXWxwSKK','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('steve','$2a$10$TNniwAd.1.E9zZg7QAyZy.Ng5TAc.CEpoQAHv97.x5Snm6vh2wy1C','ROLE_USER');

-- ********************** DATA for reading_list TABLE ********** --

INSERT INTO reading_list(list_name, user_id) VALUES('My Books', 1);
INSERT INTO reading_list(list_name, user_id) VALUES('Wish List', 1);
INSERT INTO reading_list(list_name, user_id) VALUES('My Books', 3);
INSERT INTO reading_list(list_name, user_id) VALUES('Wish List', 3);
INSERT INTO reading_list(list_name, user_id) VALUES('My Books', 4);
INSERT INTO reading_list(list_name, user_id) VALUES('Wish List', 4);


--********************** DATA for user_book Table ****************--
INSERT INTO user_book(user_id, isbn) VALUES (1, '9780356500157');
INSERT INTO user_book(user_id, isbn) VALUES (1, '9780684830490');
INSERT INTO user_book(user_id, isbn) VALUES (1, '9781984822178');
INSERT INTO user_book(user_id, isbn) VALUES (3, '9780684830490');
INSERT INTO user_book(user_id, isbn) VALUES (3, '9781984822178');
INSERT INTO user_book(user_id, isbn) VALUES (4, '9780684830490');
INSERT INTO user_book(user_id, isbn) VALUES (4, '9781984822178');

-- ****** DATA for reading_list_book TABLE ****--
INSERT INTO reading_list_book(list_id, isbn) VALUES (1, '9780356500157');
INSERT INTO reading_list_book(list_id, isbn) VALUES (2, '9780684830490');
INSERT INTO reading_list_book(list_id, isbn) VALUES (2, '9781984822178');
INSERT INTO reading_list_book(list_id, isbn) VALUES (3, '9780684830490');
INSERT INTO reading_list_book(list_id, isbn) VALUES (3, '9781984822178');
INSERT INTO reading_list_book(list_id, isbn) VALUES (4, '9780684830490');
INSERT INTO reading_list_book(list_id, isbn) VALUES (4, '9781984822178');

-- ****** DATA for book_request_status TABLE ****--
INSERT INTO book_request_status (book_request_status_desc) VALUES ('Pending');
INSERT INTO book_request_status (book_request_status_desc) VALUES ('Approved');
INSERT INTO book_request_status (book_request_status_desc) VALUES ('Declined');

-- ****** DATA for book_request TABLE ****--

INSERT INTO book_request( book_isbn,book_request_status_id, request_received_from, request_sent_to) 
VALUES('9781984822178',1, 1, 3); 

INSERT INTO book_request( book_isbn, book_request_status_id, request_received_from, request_sent_to) 
VALUES('9780684830490',1, 1, 3);

INSERT INTO book_request( book_isbn, book_request_status_id, request_received_from, request_sent_to) 
VALUES('9780356500157',1, 3, 1);




ALTER SEQUENCE genre_genre_id_seq RESTART WITH 100;

COMMIT TRANSACTION;
