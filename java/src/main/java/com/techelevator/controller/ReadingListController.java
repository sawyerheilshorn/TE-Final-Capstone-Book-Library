package com.techelevator.controller;

import com.techelevator.dao.ReadingListDao;
import com.techelevator.model.readinglist.ReadingList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@CrossOrigin
public class ReadingListController {

    @Autowired
    private ReadingListDao readingListDao;

    @RequestMapping(path = "/createList", method = RequestMethod.POST)
    public int createReadingList(@RequestBody ReadingList readingList) {
        return readingListDao.createReadingList(readingList.getListName());
    }
}
