package com.techelevator.dao;

import com.techelevator.model.bookmodel.BookDetail;

import java.util.List;

public interface BookDetailDao {
    List<BookDetail> getAllBooks();
    List<BookDetail> getAllBooksByUser(String userName);
    String addBookToLibrary(BookDetail bookDetail, String userName);
}
