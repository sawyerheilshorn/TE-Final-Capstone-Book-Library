package com.techelevator.dao;

import com.techelevator.model.bookmodel.BookDetail;
import com.techelevator.model.bookmodel.Genre;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcBookDetailDao implements BookDetailDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public List<BookDetail> getAllBooks() {
        List<BookDetail> listOfBooks = new ArrayList<>();
        String sql = "SELECT * FROM book_details";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
        while (results.next()) {
            BookDetail bookDetails = mapRowToBookDetail(results);
            String isbnNumber = bookDetails.getIsbn();
            List<Genre> genreList = getGenreByISBN(isbnNumber);
            bookDetails.setGenreList(genreList);
            listOfBooks.add(bookDetails);
        }
        return listOfBooks;
    }

    private List<Genre> getGenreByISBN(String isbnNumber) {
        List<Genre> genreList = new ArrayList<>();
        String sqlQuery = "select genre_id, genre_name from genre where genre_id in (select genre_id from book_genre where isbn= ?);";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sqlQuery, isbnNumber);
        while (results.next()) {
            Genre genre = new Genre();
            genre.setGenre_id(results.getInt("genre_id"));
            genre.setGenre_name(results.getString("genre_name"));
            genreList.add(genre);
        }
        return genreList;
    }
    @Override
    public List<BookDetail> getAllBooksByUser(String userName) {
        List<BookDetail> bookList= new ArrayList<>();
        String sql = "SELECT * from book_details \n" +
                "JOIN user_book ON user_book.isbn = book_details.isbn\n" +
                "WHERE user_book.user_id = (SELECT user_id from users WHERE username = ?);";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, userName);
        while (results.next()){
            BookDetail bookDetails = mapRowToBookDetail(results);
            String isbnNumber = bookDetails.getIsbn();
            List<Genre> genreList = getGenreByISBN(isbnNumber);
            bookDetails.setGenreList(genreList);
            bookList.add(bookDetails);

        }
        return bookList;
    }


    public BookDetail mapRowToBookDetail(SqlRowSet rowSet) {
        BookDetail bookDetail = new BookDetail();
        bookDetail.setIsbn(rowSet.getString("isbn"));
        bookDetail.setAuthor(rowSet.getString("author"));
        bookDetail.setTitle(rowSet.getString("title"));
        return bookDetail;
    }

    public String addBookToLibrary(BookDetail bookDetail, String userName) {
        String isbn = bookDetail.getIsbn();

        String sqlQuery = "INSERT INTO book_details(isbn, title, author) VALUES(?, ?, ?);";
        jdbcTemplate.update(sqlQuery, bookDetail.getIsbn(), bookDetail.getTitle(), bookDetail.getAuthor());

        String sql = "INSERT INTO user_book (user_id, isbn) VALUES ((SELECT user_id FROM users WHERE username = ?), ?);";
        jdbcTemplate.update(sql, userName, isbn);

        String genreQuery = "INSERT INTO book_genre(isbn, genre_id) VALUES(?, (select genre_id from genre_name= ?));";
        jdbcTemplate.update(genreQuery, bookDetail.getIsbn(), bookDetail.getGenreList().get(0));
        return "added Book to library";
    }


}
