package com.techelevator.dao;

import com.techelevator.model.User;
import com.techelevator.model.bookmodel.BookDetail;
import com.techelevator.model.readinglist.ReadingList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcReadingList implements ReadingListDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;

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
            readingLists.add(readingList);
        }
        return readingLists;
    }



    private ReadingList mapRowToReadingList (SqlRowSet rowSet) {
        ReadingList readingList = new ReadingList();
        readingList.setListId(rowSet.getInt("list_id"));
        readingList.setListName(rowSet.getString("list_name"));
        readingList.setUser_id(rowSet.getInt("user_id"));
        return readingList;
    }

}
