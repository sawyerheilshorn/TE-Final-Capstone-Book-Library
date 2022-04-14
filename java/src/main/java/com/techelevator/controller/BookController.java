package com.techelevator.controller;

import com.techelevator.dao.BookDetailDao;
import com.techelevator.model.bookmodel.BookDetail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
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

    @PreAuthorize("isAuthenticated()")
    @RequestMapping(path = "/getMyBooks", method = RequestMethod.GET)
    public List<BookDetail> getAllBooksByUser(Principal principal){
//        String userName = principal.getName();
        String userName = "user";
        return bookDetailDao.getAllBooksByUser(userName);
    }

    @PreAuthorize("isAuthenticated()")
    @RequestMapping(path = "/addBookToLibrary", method = RequestMethod.POST)
    public String addBookToLibrary(@RequestBody BookDetail bookDetail, Principal principal){
        String userName = principal.getName();
        return bookDetailDao.addBookToLibrary(bookDetail, userName);
    }
}
