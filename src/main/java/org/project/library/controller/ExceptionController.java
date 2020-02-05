package org.project.library.controller;

import org.apache.log4j.Logger;
import org.project.library.exception.NotEnoughBookException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import javax.persistence.NoResultException;
import javax.servlet.http.HttpServletRequest;

@ControllerAdvice
public class ExceptionController {

    private static final Logger logger = Logger.getLogger(ExceptionController.class);

    @ExceptionHandler(NotEnoughBookException.class)
    public String handleBookQuantityError(HttpServletRequest request, NotEnoughBookException e) {
        logger.error("Request: " + request.getRequestURL() + " threw an exception", e);
        return "book-quantity-error";
    }

    @ExceptionHandler(NoResultException.class)
    public String handleNoResultError(HttpServletRequest request, NoResultException e) {
        logger.error("Request: " + request.getRequestURL() + " threw an exception", e);
        return "no-result-error";
    }


    @ExceptionHandler(Exception.class)
    public String handleError(HttpServletRequest request, Exception e) {
        logger.error("Request: " + request.getRequestURL() + " threw an exception", e);
        return "general-error";
    }
}
