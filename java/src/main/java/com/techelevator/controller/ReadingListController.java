package com.techelevator.controller;

import com.techelevator.dao.ReadingListDao;
import com.techelevator.model.readinglist.ReadingList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.List;

@PreAuthorize("isAuthenticated()")
@RestController
@CrossOrigin
public class ReadingListController {

    @Autowired
    private ReadingListDao readingListDao;

    @RequestMapping(path = "/createList", method = RequestMethod.POST)
    public int createReadingList(@RequestBody ReadingList readingList, Principal principal) {


        String userName = principal.getName();
        return readingListDao.createReadingList(readingList.getListName(), userName);
    }

    @RequestMapping(path = "/dashboard", method = RequestMethod.GET)
    public List<ReadingList> getReadingListByUser(Principal principal) {
        String userName = principal.getName();
        return readingListDao.getReadingListByUser(userName);
    }


}
