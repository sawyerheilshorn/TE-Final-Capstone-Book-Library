package com.techelevator.dao;

import com.techelevator.model.readinglist.BookRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcBookRequestDao implements BookRequestDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public List<BookRequest> getUserBookStatus(String userName) {
        List<BookRequest> bookRequestList = new ArrayList<>();
        String sql = "select b.book_request_id, bd.isbn, bd.title, b.book_request_status_id, u.username as request_sender, u1.username as borrow_from from book_request AS b \n" +
                "JOIN book_details AS bd ON b.book_isbn = bd.isbn \n" +
                "JOIN users AS u ON b.request_received_from = u.user_id \n" +
                "JOIN users AS u1 ON b.request_sent_to = u1.user_id\n" +
                "WHERE b.book_request_status_id = (SELECT book_request_status_id FROM \n" +
                "\tbook_request_status WHERE book_request_status_desc = 'Pending') AND (u.username = ? OR u1.username = ?);";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, userName, userName);
        while (results.next()) {
            BookRequest bookRequest = mapRowToBookRequest(results);
            bookRequestList.add(bookRequest);
        }

        String sql1 = "select b.book_request_id, bd.isbn, bd.title, b.book_request_status_id, u.username as request_sender, u1.username as borrow_from from book_request AS b \n" +
                "JOIN book_details AS bd ON b.book_isbn = bd.isbn \n" +
                "JOIN users AS u ON b.request_received_from = u.user_id \n" +
                "JOIN users AS u1 ON b.request_sent_to = u1.user_id\n" +
                "WHERE b.book_request_status_id = (SELECT book_request_status_id FROM \n" +
                "\tbook_request_status WHERE book_request_status_desc = 'Approved') AND (u.username = ? OR u1.username = ?);";

        SqlRowSet results1 = jdbcTemplate.queryForRowSet(sql1, userName, userName);
        while (results1.next()) {
            BookRequest bookRequest = mapRowToBookRequest(results1);
            bookRequestList.add(bookRequest);
        }

        String sql2 = "select b.book_request_id,bd.isbn, bd.title,b.book_request_status_id, u.username as request_sender, u1.username as borrow_from from book_request AS b                \n" +
                "JOIN book_details AS bd  ON b.book_isbn = bd.isbn \n" +
                "JOIN users AS u ON b.request_received_from = u.user_id \n" +
                "JOIN users AS u1 ON b.request_sent_to = u1.user_id\n" +
                "WHERE b.book_request_status_id = (SELECT book_request_status_id FROM \n" +
                "\tbook_request_status WHERE (book_request_status_desc = 'Declined') AND (u.username = ? OR u1.username = ?));\n";

        SqlRowSet results2 = jdbcTemplate.queryForRowSet(sql2, userName, userName);
        while (results2.next()) {
            BookRequest bookRequest = mapRowToBookRequest(results2);
            bookRequestList.add(bookRequest);
        }

        return bookRequestList;
    }

    @Override
    public int sendRequest(String isbn, String userBorrowFrom, String userSender) {
        String sql = "INSERT INTO book_request(book_isbn, book_request_status_id, request_sent_to, request_received_from) VALUES(?, 1, ((select user_id from users where username = ?)), (select user_id from users where username =?))\n" +
                "RETURNING book_request_id; ";
        Integer newId = jdbcTemplate.queryForObject(sql, Integer.class, isbn, userBorrowFrom, userSender);
        return newId;
    }

    @Override
    public String updateUserBookStatusToApproved(BookRequest bookRequest, String userName) {
        String sql = "INSERT INTO user_book(user_id, isbn) VALUES\n" +
                "((select user_id from users where username=?),?);";
        String requestSenderName = bookRequest.getRequestSender();
        String isbn = bookRequest.getBookISBN();
        jdbcTemplate.update(sql, requestSenderName, isbn);

        String borrowFromName = bookRequest.getBorrowFrom();
        String sql1 = "DELETE FROM user_book where user_id= (select user_id from users where username= ?)AND isbn = ?;";
        jdbcTemplate.update(sql1, borrowFromName, isbn);

        String sql3 = "UPDATE book_request SET book_request_status_id=2 WHERE " +
                "request_received_from=(select user_id from users where username=?) AND book_isbn = ?;";

        jdbcTemplate.update(sql3, requestSenderName,isbn);
        return "Request Approved for user : " + requestSenderName + " isbn: " + isbn + "Successfully";
    }

    @Override
    public String updateUserBookStatusToDeclined(BookRequest bookRequest, String userName) {
        String borrowFromName = bookRequest.getBorrowFrom();
        String isbn = bookRequest.getBookISBN();
        String sql = "UPDATE book_request SET book_request_status_id=3 \n" +
                "WHERE request_received_from=(select user_id from users where username=?) AND book_isbn = ?;";
        jdbcTemplate.update(sql, borrowFromName,isbn);
        return "Request Declined for user : " + bookRequest.getRequestSender() + " isbn: " + isbn;


    }


    private BookRequest mapRowToBookRequest(SqlRowSet rowSet) {
        BookRequest bookRequest = new BookRequest();
        bookRequest.setBookRequestId(rowSet.getInt("book_request_id"));
        bookRequest.setBookISBN(rowSet.getString("isbn"));
        bookRequest.setTitle(rowSet.getString("title"));
        bookRequest.setTransferStatus(rowSet.getInt("book_request_status_id"));
        try {
            bookRequest.setRequestSender(rowSet.getString("request_sender"));
            bookRequest.setBorrowFrom(rowSet.getString("borrow_from"));
        } catch (DataAccessException e) {

        }
        return bookRequest;

    }


}
