package com.techelevator.controller;

import com.techelevator.dao.BookDetailDao;
import com.techelevator.model.bookmodel.BookDetail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@CrossOrigin
public class BookController {
    @Autowired
    private BookDetailDao bookDetailDao;


    @RequestMapping(path = "/books", method = RequestMethod.GET)
    public List<BookDetail> retrieveAllBooks() {
        return bookDetailDao.getAllBooks();
    }
}
