package com.techelevator.dao;

import com.techelevator.model.bookmodel.BookDetail;
import com.techelevator.model.readinglist.ReadingList;

import java.security.Principal;
import java.util.List;

public interface ReadingListDao {
    int createReadingList(String listName, String userName);
    List<ReadingList> getReadingListByUser(String userName);
//    void addBookToList(String userName, String id, String isbn);
    void addBookToList(int id, String isbn);


//    int createMyLibrary(String userName);

}
