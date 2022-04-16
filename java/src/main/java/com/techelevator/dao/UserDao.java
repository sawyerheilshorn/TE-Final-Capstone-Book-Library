package com.techelevator.dao;

import com.techelevator.model.User;

import java.util.List;

public interface UserDao {

    List<User> findAll();

    User getUserById(Long userId);

    User findByUsername(String username);

    List<User> getUsersByIsbn(String isbn);

    int findIdByUsername(String username);

    boolean create(String username, String password, String role);
}
