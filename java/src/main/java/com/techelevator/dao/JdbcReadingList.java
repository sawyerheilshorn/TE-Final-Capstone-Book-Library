package com.techelevator.dao;

import com.techelevator.model.bookmodel.BookDetail;
import com.techelevator.model.readinglist.ReadingList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Component
public class JdbcReadingList implements ReadingListDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Autowired
    private JdbcBookDetailDao jdbcBookDetailDao;


    @Override
    public int createReadingList(String listName, String userName) {
        String sql = "INSERT INTO reading_list(list_name, user_id) VALUES(?, (select user_id from users where username =?)) RETURNING list_id;";
        Integer newId = jdbcTemplate.queryForObject(sql, Integer.class, listName, userName);
        return newId;
    }

    @Override
    public List<ReadingList> getReadingListByUser(String userName) {
        List<ReadingList> readingLists = new ArrayList<>();
        String sql = "select * from reading_list where user_id =(select user_id from users where username = ?);";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, userName);
        while (results.next()){
            ReadingList readingList = mapRowToReadingList(results);
            int listId = readingList.getListId();
            String listName = readingList.getListName();
            List<BookDetail> bookDetailList = getAllBooks(listId);
            readingList.setBookDetailListId(bookDetailList);
          //  readingList.setBookDetailListMap(listName, bookDetailList);
            readingLists.add(readingList);
        }
        return readingLists;
    }


    private List<BookDetail> getAllBooks(int listId){
       List<BookDetail> bookDetailList = new ArrayList<>();
        String sql = "select * from book_details \n" +
                "JOIN reading_list_book ON reading_list_book.isbn = book_details.isbn\n" +
                "WHERE list_id=?;";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, listId);
        while (results.next()) {
            BookDetail bookDetail = jdbcBookDetailDao.mapRowToBookDetail(results);
            bookDetailList.add(bookDetail);
        }
        return bookDetailList;

    }



    private ReadingList mapRowToReadingList (SqlRowSet rowSet) {
        ReadingList readingList = new ReadingList();
        readingList.setListId(rowSet.getInt("list_id"));
        readingList.setListName(rowSet.getString("list_name"));
        readingList.setUser_id(rowSet.getInt("user_id"));
        return readingList;
    }

    @Override
//    public void addBookToList (String userName, String id, String isbn) {
    public void addBookToList (int id, String isbn) {
        String sql = "INSERT INTO reading_list_book (list_id, isbn) VALUES (?, ?);";
        jdbcTemplate.update(sql, id, isbn);
    }


}
