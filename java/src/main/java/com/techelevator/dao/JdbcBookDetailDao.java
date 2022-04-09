package com.techelevator.dao;

import com.techelevator.model.bookmodel.BookDetail;
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
        while (results.next()){
            BookDetail bookDetails = mapRowBookDetail(results);
            listOfBooks.add(bookDetails);
        }
        return listOfBooks;
    }
    private BookDetail mapRowBookDetail(SqlRowSet rowSet){
        BookDetail bookDetail = new BookDetail();
        bookDetail.setIsbn(rowSet.getNString("isbn"));
        bookDetail.setTitle(rowSet.getNString("title"));
        bookDetail.setAuthor(rowSet.getNString("author"));
        return bookDetail;

    }
}
