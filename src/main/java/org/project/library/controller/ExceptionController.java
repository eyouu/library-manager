package org.project.library.controller;

import org.project.library.exception.NotEnoughBookException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import javax.servlet.http.HttpServletRequest;

@ControllerAdvice
public class ExceptionController {

    @ExceptionHandler(NotEnoughBookException.class)
    public String handleBookQuantityError(HttpServletRequest request, NotEnoughBookException e) {

        return "book-quantity-error";
    }

    @ExceptionHandler(Exception.class)
    public String handleError(HttpServletRequest request, Exception e) {

        return "general-error";
    }
}
