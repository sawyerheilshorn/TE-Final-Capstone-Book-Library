package com.techelevator.dao;

import com.techelevator.model.bookmodel.BookDetail;
import com.techelevator.model.readinglist.BookRequest;
import com.techelevator.model.readinglist.ReadingList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
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
        while (results.next()) {
            ReadingList readingList = mapRowToReadingList(results);
            int listId = readingList.getListId();
            String listName = readingList.getListName();
            List<BookDetail> bookDetailList = getAllBooks(listId);
            readingList.setBookDetailListId(bookDetailList);
            readingLists.add(readingList);
        }
        return readingLists;
    }

    @Override
    public String addBookToList(int id, String isbn) {
        String sql = "INSERT INTO reading_list_book (list_id, isbn) VALUES (?, ?);";
        jdbcTemplate.update(sql, id, isbn); //try -catch
        return "Book " + isbn + " added to  list";
    }

    @Override
    public String removeBookFromList(int id, String isbn) {
        String sql = "DELETE FROM reading_list_book WHERE list_id= ? AND isbn = ?";
        jdbcTemplate.update(sql, id, isbn); //try -catch
        return "Book " + isbn + " removed from list";
    }

    @Override
    public String removeList(int id) {
        String sql = "DELETE FROM reading_list_book WHERE list_id= ?;";
        jdbcTemplate.update(sql, id);

        String sql1 = "DELETE FROM reading_list WHERE list_id= ?;";
        jdbcTemplate.update(sql1, id);

        return "List #: " + id + " removed";
    }

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
        return bookRequestList;
    }

    @Override
    public String updateUserBookStatusToApproved(String userName) {
        //todo update status to approved in the book_request_table and delete the book from user list
        return "Approved method";
    }

    @Override
    public String updateUserBookStatusToDeclined(String userName) {
        //todo delete the entry from book_request_table
        return "Decline method";
    }

    private List<BookDetail> getAllBooks(int listId) {
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

    private ReadingList mapRowToReadingList(SqlRowSet rowSet) {
        ReadingList readingList = new ReadingList();
        readingList.setListId(rowSet.getInt("list_id"));
        readingList.setListName(rowSet.getString("list_name"));
        readingList.setUser_id(rowSet.getInt("user_id"));
        return readingList;
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
