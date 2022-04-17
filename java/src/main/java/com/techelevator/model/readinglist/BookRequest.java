package com.techelevator.model.readinglist;


public class BookRequest {
    private int bookRequestId;
    private String bookISBN;
    private String title;
    private String requestSender;
    private String borrowFrom;
    private int transferStatus;

    public int getBookRequestId() {
        return bookRequestId;
    }

    public void setBookRequestId(int bookRequestId) {
        this.bookRequestId = bookRequestId;
    }

    public String getBookISBN() {
        return bookISBN;
    }

    public void setBookISBN(String bookISBN) {
        this.bookISBN = bookISBN;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getRequestSender() {
        return requestSender;
    }

    public void setRequestSender(String requestSender) {
        this.requestSender = requestSender;
    }

    public String getBorrowFrom() {
        return borrowFrom;
    }

    public void setBorrowFrom(String borrowFrom) {
        this.borrowFrom = borrowFrom;
    }

    public int getTransferStatus() {
        return transferStatus;
    }

    public void setTransferStatus(int transferStatus) {
        this.transferStatus = transferStatus;
    }
}


