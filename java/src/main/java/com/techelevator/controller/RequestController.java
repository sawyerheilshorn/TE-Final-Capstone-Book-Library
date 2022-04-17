package com.techelevator.controller;

import com.techelevator.dao.JdbcBookDetailDao;
import com.techelevator.dao.JdbcBookRequestDao;
import com.techelevator.model.readinglist.BookRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.List;

@PreAuthorize("isAuthenticated()")
@RestController
@CrossOrigin
public class RequestController {
    @Autowired
    private JdbcBookRequestDao bookRequestDao;


    @RequestMapping(path = "/getBookStatus", method = RequestMethod.GET)
    public List<BookRequest> getBookStatus(Principal principal) {
        String userName = principal.getName();
        return bookRequestDao.getUserBookStatus(userName);
    }

    @RequestMapping(path = "/updateStatus", method = RequestMethod.POST)
    public String updateBookStatus(@RequestBody BookRequest bookRequest, Principal principal) {
        String userName = principal.getName();
        String message = null;
        int status = bookRequest.getTransferStatus();
        if (status == 2) {
            message = bookRequestDao.updateUserBookStatusToApproved(userName);
        } else if (status == 3) {
            message = bookRequestDao.updateUserBookStatusToDeclined(userName);
        }
        return message;
    }


}
