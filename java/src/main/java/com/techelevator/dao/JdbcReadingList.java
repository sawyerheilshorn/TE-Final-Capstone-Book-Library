package com.techelevator.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

@Component
public class JdbcReadingList implements ReadingListDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public int createReadingList(String listName) {
        String sql = "INSERT INTO reading_list(list_name, user_id) VALUES(?, 1) RETURNING list_id;";
        Integer newId = jdbcTemplate.queryForObject(sql, Integer.class, listName);
        return newId;
    }
}
