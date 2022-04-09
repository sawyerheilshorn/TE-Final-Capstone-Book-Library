package com.techelevator.controller;

import com.techelevator.dao.BookDetailDao;
import com.techelevator.model.bookmodel.BookDetail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
public class BookController {
    @Autowired
    private BookDetailDao bookDetailDao;


    @RequestMapping(path="/books", method = RequestMethod.GET)
    public List<BookDetail> retrieveAllBooks(){
        List<BookDetail> bookDetailList = new ArrayList<>();
        BookDetail bookDetail = new BookDetail();
        bookDetail.setIsbn("9781400079278");
        bookDetail.setTitle("Kafka by the Shore");
        bookDetail.setAuthor("Haruki Murakami");

        BookDetail bookDetail1 = new BookDetail();
        bookDetail1.setIsbn("9780356500157");
        bookDetail1.setTitle("The Girl With All the Gifts");
        bookDetail1.setAuthor("M.R. Carey");

        BookDetail bookDetail2 = new BookDetail();
        bookDetail2.setIsbn("9780684830490");
        bookDetail2.setTitle("The Old Man and the Sea");
        bookDetail2.setAuthor("Ernest Hemingway");

        bookDetailList.add(bookDetail);
        bookDetailList.add(bookDetail1);
        bookDetailList.add(bookDetail2);

        return bookDetailList;





       // return bookDetailDao.getAllBooks();
    }
}
