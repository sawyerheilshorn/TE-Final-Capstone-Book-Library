package com.techelevator.dao;

import com.techelevator.model.readinglist.BookRequest;

import java.util.List;

public interface BookRequestDao {
    List<BookRequest> getUserBookStatus(String userName);

    String updateUserBookStatusToApproved(BookRequest bookRequest, String userName);

    String updateUserBookStatusToDeclined(BookRequest bookRequest, String userName);

    int sendRequest(String isbn,String userBorrowFrom, String userSender);
}
