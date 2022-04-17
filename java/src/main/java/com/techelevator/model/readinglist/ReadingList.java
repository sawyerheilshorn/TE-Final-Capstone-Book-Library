package com.techelevator.model.readinglist;


import com.techelevator.model.bookmodel.BookDetail;

import java.util.ArrayList;
import java.util.List;

public class ReadingList {

    private int listId;
    private String listName;
    private int user_id;
    private List<BookDetail> bookDetailListId = new ArrayList<>();

    public int getListId() {
        return listId;
    }

    public void setListId(int listId) {
        this.listId = listId;
    }

    public String getListName() {
        return listName;
    }

    public void setListName(String listName) {
        this.listName = listName;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public List<BookDetail> getBookDetailList() {
        return bookDetailListId;
    }

    public void setBookDetailListId(List<BookDetail> bookDetailListId) {
        this.bookDetailListId = bookDetailListId;
    }
}


