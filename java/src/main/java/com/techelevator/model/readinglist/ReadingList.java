package com.techelevator.model.readinglist;


import com.techelevator.model.bookmodel.BookDetail;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ReadingList {

    private int listId;
    private String listName;
    private int user_id;
    private Map<String, List<BookDetail>> bookDetailListMap = new HashMap<>();

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

    public Map<String, List<BookDetail>> getBookDetailListMap() {
        return bookDetailListMap;
    }
//
//    public void setBookDetailListMap(Map<Integer, List<BookDetail>> bookDetailListMap) {
//        this.bookDetailListMap = bookDetailListMap;
//    }

    public void setBookDetailListMap(String listName, List<BookDetail> bookDetailList) {
        bookDetailListMap.put(listName, bookDetailList);
    }
}
