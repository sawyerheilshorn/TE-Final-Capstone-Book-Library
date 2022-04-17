package com.techelevator.dao;

import com.techelevator.model.bookmodel.BookDetail;
import com.techelevator.model.readinglist.BookRequest;
import com.techelevator.model.readinglist.ReadingList;

import java.security.Principal;
import java.util.List;

public interface ReadingListDao {
    int createReadingList(String listName, String userName);

    List<ReadingList> getReadingListByUser(String userName);

    String addBookToList(int id, String isbn);

    List<BookRequest> getUserBookStatus(String userName);

    String updateUserBookStatusToApproved(String userName);

    String updateUserBookStatusToDeclined(String userName);

    String removeBookFromList(int id, String isbn);

    String removeList(int id);
}
