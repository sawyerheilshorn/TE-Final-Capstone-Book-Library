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


-- *************************               Data for book_details TABLE                               ****************--

INSERT INTO book_details(isbn, title, author) VALUES ('9781400079278', 'Kafka by the Shore', 'Haruki Murakami');
INSERT INTO book_details(isbn, title, author) VALUES ('9780356500157', 'The Girl With All the Gifts', 'M.R. Carey');
INSERT INTO book_details(isbn, title, author) VALUES ('9780684830490', 'The Old Man and the Sea', 'Ernest Hemingway');


-- *************************                Data for users TABLE                         **************** --
INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');


COMMIT TRANSACTION;
