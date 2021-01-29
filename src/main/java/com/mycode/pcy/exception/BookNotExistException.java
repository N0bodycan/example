package com.mycode.pcy.exception;

public class BookNotExistException extends RuntimeException {
    public BookNotExistException(String message) {
        super(message);
    }

    public BookNotExistException(String message, Throwable cause) {
        super(message, cause);
    }
}
