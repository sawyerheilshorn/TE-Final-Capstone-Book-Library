package com.techelevator.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

public class JdbcReadingList implements ReadingListDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public int createReadingList(String listName) {
        String sql = "INSERT INTO reading_list(list_name, user_id) VALUES(?, 1);";
        Integer newId = jdbcTemplate.queryForObject(sql, Integer.class, listName);
        return newId;
    }
}
