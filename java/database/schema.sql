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
	book_isbn varchar(1000) NOT NULL,
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
INSERT INTO genre(genre_id, genre_name) VALUES (9, 'Computer');
INSERT INTO genre(genre_id, genre_name) VALUES (10, 'Kids');


-- *************************Data for book_details TABLE ****************--

--INSERT INTO book_details(isbn, title, author) VALUES ('9781400079278', 'Kafka by the Shore', 'Haruki Murakami');
INSERT INTO book_details(isbn, title, author) VALUES ('0060935464', 'To Kill a Mockingbird', 'Harper Lee');
--INSERT INTO book_details(isbn, title, author) VALUES ('9780356500157', 'The Girl With All the Gifts', 'M.R. Carey');
INSERT INTO book_details(isbn, title, author) VALUES ('9781408849927', 'Harry Potter and the Philosophers Stone', 'J. K. Rowling');
INSERT INTO book_details(isbn, title, author) VALUES ('9780684830490', 'The Old Man and the Sea', 'Ernest Hemingway');
INSERT INTO book_details(isbn, title, author) VALUES ('9781402712173', 'The Adventures of Sherlock Holmes', 'Sasaki and Doyle');
INSERT INTO book_details(isbn, title, author) VALUES ('9781984822178', 'Normal People', 'Sally Rooney');
INSERT INTO book_details(isbn, title, author) VALUES ('9780141323749', 'Anne of Green Gables', 'Lucy Maud Montgomery,Claus,M. A.');
INSERT INTO book_details(isbn, title, author) VALUES ('000711561X', 'The lion, the witch and the wardrobe', 'C.S. Lewis');
INSERT INTO book_details(isbn, title, author) VALUES ('9783125971400', 'Le Petit Prince', 'Antoine de Saint-Exupéry');
INSERT INTO book_details(isbn, title, author) VALUES ('9781534431003', 'This Is How You Lose the Time War', 'Amal El-Mohtar');
INSERT INTO book_details(isbn, title, author) VALUES ('048627263X', 'Flatland', 'Edwin A. Abbott');
INSERT INTO book_details(isbn, title, author) VALUES ('9780449208106', 'Things Fall Apart', 'Chinua Achebe');
INSERT INTO book_details(isbn, title, author) VALUES ('9780072472615', 'The Interactive Computing Series', 'Kenneth C. Laudon');
INSERT INTO book_details(isbn, title, author) VALUES ('0078823684', 'Java programmers reference', 'Herbert Schildt');
INSERT INTO book_details(isbn, title, author) VALUES ('9782212677836', 'Applications web complexes', 'Brice Chaponneau');
INSERT INTO book_details(isbn, title, author) VALUES ('978-1-64200-200-3', 'Vue.js Succinctly', 'Ed Freitas');
INSERT INTO book_details(isbn, title, author) VALUES ('9780321117847', 'Algorithmics The Spirit of Computing', 'David Harel and Yishai Feldman');
INSERT INTO book_details(isbn, title, author) VALUES ('9780692156216', 'Algorithms Special Topics', 'Kenneth A Berman');
INSERT INTO book_details(isbn, title, author) VALUES ('9783319055053', 'Cloud Computing', 'Victor C.M. Leung and Min Chen');
INSERT INTO book_details(isbn, title, author) VALUES ('9783319105307', 'Cloud Computing', 'Thomas Erl, Ricardo Puttini, and Zaigham Mahmood');
INSERT INTO book_details(isbn, title, author) VALUES ('9780544430563', 'Curious George gymnastics fun', 'Leora Bernstein');
--INSERT INTO book_details(isbn, title, author) VALUES ('9780606410090', 'Curious George Mothers Day Surprise', 'H. A. Rey');
INSERT INTO book_details(isbn, title, author) VALUES ('9781423109624', 'I Will Surprise My Friend!', 'Mo Willems');
INSERT INTO book_details(isbn, title, author) VALUES ('9781423164821', 'Lets go for a drive!', 'Mo Willems');
INSERT INTO book_details(isbn, title, author) VALUES ('9780375828379', 'Hop on Pop', 'Dr.Seuss');
--INSERT INTO book_details(isbn, title, author) VALUES ('9780394929200', 'Theres a Wocket in my Pocket!', 'Dr.Seuss');

-- ********************** DATA for book_genre TABLE ************* --

INSERT INTO book_genre(isbn, genre_id) VALUES('0060935464',1);
INSERT INTO book_genre(isbn, genre_id) VALUES('0060935464',6);
INSERT INTO book_genre(isbn, genre_id) VALUES('9781408849927',1);
INSERT INTO book_genre(isbn, genre_id) VALUES('9781408849927',5);
INSERT INTO book_genre(isbn, genre_id) VALUES('000711561X',1);
INSERT INTO book_genre(isbn, genre_id) VALUES('000711561X',5);
INSERT INTO book_genre(isbn, genre_id) VALUES('9781402712173',5);
INSERT INTO book_genre(isbn, genre_id) VALUES('9780141323749',1);
INSERT INTO book_genre(isbn, genre_id) VALUES('0078823684',9);
INSERT INTO book_genre(isbn, genre_id) VALUES('9783125971400',1);
INSERT INTO book_genre(isbn, genre_id) VALUES('9783125971400',6);
INSERT INTO book_genre(isbn, genre_id) VALUES('9780072472615',9);
INSERT INTO book_genre(isbn, genre_id) VALUES('9782212677836',9);
INSERT INTO book_genre(isbn, genre_id) VALUES('9780544430563',10);
INSERT INTO book_genre(isbn, genre_id) VALUES('9781423109624',10);
INSERT INTO book_genre(isbn, genre_id) VALUES('9781423164821',10);
INSERT INTO book_genre(isbn, genre_id) VALUES('9780375828379',10);



-- ************************* Data for users TABLE **************** --

INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');
INSERT INTO users (username,password_hash,role) VALUES ('naveena','$2a$10$vA9tZrrI3R9HqeHfKMNdxev81yjmaeYrHxczvU7UwVJxPSXWxwSKK','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('michael','$2a$10$Gz85MrJiIr/Il.KaDLN7S.yEFUXl0YY6aVPQLZnEcDsYE4ttiaUDe','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('abdalla','$2a$10$DJaD92405KaCVJC.POLq8ecOb/.C1jaMxv7/VscC9nscK2G487.Q.','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('sawyer','$2a$10$f2UprJn2cNZODZj2N9ER3uUfeGJ/Rhyi7UQf3iTYEGkTcYypC7JQC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('steve','$2a$10$TNniwAd.1.E9zZg7QAyZy.Ng5TAc.CEpoQAHv97.x5Snm6vh2wy1C','ROLE_USER');

-- ********************** DATA for reading_list TABLE ********** --
-- select * from reading_list;
INSERT INTO reading_list(list_name, user_id) VALUES('My Books', 1);
INSERT INTO reading_list(list_name, user_id) VALUES('Wish List', 1);
INSERT INTO reading_list(list_name, user_id) VALUES('My Books', 3);
INSERT INTO reading_list(list_name, user_id) VALUES('Kids List', 3);
INSERT INTO reading_list(list_name, user_id) VALUES('My Books', 4);
INSERT INTO reading_list(list_name, user_id) VALUES('Beach Reading', 4);
INSERT INTO reading_list(list_name, user_id) VALUES('My Books', 5);
INSERT INTO reading_list(list_name, user_id) VALUES('Bedtime Stories', 5);
INSERT INTO reading_list(list_name, user_id) VALUES('My Books', 6);
INSERT INTO reading_list(list_name, user_id) VALUES('Tech Books', 6);
INSERT INTO reading_list(list_name, user_id) VALUES('My Books', 7);
INSERT INTO reading_list(list_name, user_id) VALUES('Bedtime Stories', 7);


--********************** DATA for user_book Table ****************--
INSERT INTO user_book(user_id, isbn) VALUES (4, '9781408849927');
INSERT INTO user_book(user_id, isbn) VALUES (5, '9781402712173');
INSERT INTO user_book(user_id, isbn) VALUES (7, '0060935464');

--naveena user_id=3
INSERT INTO user_book(user_id, isbn) VALUES (3, '0060935464');
INSERT INTO user_book(user_id, isbn) VALUES (3, '9780141323749');
INSERT INTO user_book(user_id, isbn) VALUES (3, '9783319055053');
INSERT INTO user_book(user_id, isbn) VALUES (3, '9781423109624');
INSERT INTO user_book(user_id, isbn) VALUES (3, '000711561X');
INSERT INTO user_book(user_id, isbn) VALUES (3, '9781423164821');
INSERT INTO user_book(user_id, isbn) VALUES (3, '9780375828379');
--michael user_id=4
INSERT INTO user_book(user_id, isbn) VALUES (4, '9781402712173');
INSERT INTO user_book(user_id, isbn) VALUES (4, '000711561X');
INSERT INTO user_book(user_id, isbn) VALUES (4, '0078823684');
INSERT INTO user_book(user_id, isbn) VALUES (4, '978-1-64200-200-3');
INSERT INTO user_book(user_id, isbn) VALUES (4, '9780684830490');
INSERT INTO user_book(user_id, isbn) VALUES (4, '0060935464');
--abdalla user_id=5
INSERT INTO user_book(user_id, isbn) VALUES (5, '9783125971400');
INSERT INTO user_book(user_id, isbn) VALUES (5, '000711561X');
INSERT INTO user_book(user_id, isbn) VALUES (5, '048627263X');
INSERT INTO user_book(user_id, isbn) VALUES (5, '9780072472615');
INSERT INTO user_book(user_id, isbn) VALUES (5, '9781984822178');

--sawyer user_id=6
INSERT INTO user_book(user_id, isbn) VALUES (6, '9781534431003');
INSERT INTO user_book(user_id, isbn) VALUES (6, '9782212677836');
INSERT INTO user_book(user_id, isbn) VALUES (6, '048627263X');
INSERT INTO user_book(user_id, isbn) VALUES (6, '9780684830490');
INSERT INTO user_book(user_id, isbn) VALUES (6, '9781984822178');
INSERT INTO user_book(user_id, isbn) VALUES (6, '0060935464');

--steve user_id=7
INSERT INTO user_book(user_id, isbn) VALUES (7, '9781402712173');
INSERT INTO user_book(user_id, isbn) VALUES (7, '9780692156216');
INSERT INTO user_book(user_id, isbn) VALUES (7, '0078823684');
INSERT INTO user_book(user_id, isbn) VALUES (7, '9780544430563');

-- ****** DATA for reading_list_book TABLE ****--
-- select * from reading_list_book;
INSERT INTO reading_list_book(list_id, isbn) VALUES (1, '9781408849927');
INSERT INTO reading_list_book(list_id, isbn) VALUES (2, '9781402712173');
INSERT INTO reading_list_book(list_id, isbn) VALUES (2, '0060935464');
INSERT INTO reading_list_book(list_id, isbn) VALUES (3, '9781402712173');
INSERT INTO reading_list_book(list_id, isbn) VALUES (3, '0060935464');
INSERT INTO reading_list_book(list_id, isbn) VALUES (4, '9781423109624');
INSERT INTO reading_list_book(list_id, isbn) VALUES (4, '9780375828379');
INSERT INTO reading_list_book(list_id, isbn) VALUES (5, '0060935464');
INSERT INTO reading_list_book(list_id, isbn) VALUES (5, '9780684830490');
INSERT INTO reading_list_book(list_id, isbn) VALUES (6, '978-1-64200-200-3');
INSERT INTO reading_list_book(list_id, isbn) VALUES (6, '0078823684');
INSERT INTO reading_list_book(list_id, isbn) VALUES (7, '9783125971400');
INSERT INTO reading_list_book(list_id, isbn) VALUES (7, '000711561X');
INSERT INTO reading_list_book(list_id, isbn) VALUES (8, '048627263X');
INSERT INTO reading_list_book(list_id, isbn) VALUES (9, '9781984822178');
INSERT INTO reading_list_book(list_id, isbn) VALUES (9, '048627263X');
INSERT INTO reading_list_book(list_id, isbn) VALUES (10, '9782212677836');
INSERT INTO reading_list_book(list_id, isbn) VALUES (11, '0078823684');
INSERT INTO reading_list_book(list_id, isbn) VALUES (12, '9780544430563');

-- ****** DATA for book_request_status TABLE ****--
INSERT INTO book_request_status (book_request_status_desc) VALUES ('Pending');
INSERT INTO book_request_status (book_request_status_desc) VALUES ('Approved');
INSERT INTO book_request_status (book_request_status_desc) VALUES ('Declined');

-- ****** DATA for book_request TABLE ****--

--select * from users;
--select * from book_request;
INSERT INTO book_request( book_isbn,book_request_status_id, request_received_from, request_sent_to) 
VALUES('0060935464',1, 5, 3); 

INSERT INTO book_request( book_isbn, book_request_status_id, request_received_from, request_sent_to) 
VALUES('0078823684',1, 3, 4);

INSERT INTO book_request( book_isbn, book_request_status_id, request_received_from, request_sent_to) 
VALUES('9780072472615',1, 6, 5);

INSERT INTO book_request( book_isbn, book_request_status_id, request_received_from, request_sent_to) 
VALUES('9780141323749',1, 6, 3);

INSERT INTO book_request( book_isbn, book_request_status_id, request_received_from, request_sent_to) 
VALUES('9781534431003',1, 4, 6);
 
INSERT INTO book_request( book_isbn, book_request_status_id, request_received_from, request_sent_to) 
VALUES('9780375828379',1,7,3);

INSERT INTO book_request( book_isbn, book_request_status_id, request_received_from, request_sent_to) 
VALUES('9780692156216',1,4,7);

ALTER SEQUENCE genre_genre_id_seq RESTART WITH 100;

COMMIT TRANSACTION;
