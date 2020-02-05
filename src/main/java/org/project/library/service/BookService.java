package org.project.library.service;

import org.project.library.entity.Book;
import org.project.library.entity.Reader;

import java.util.List;

public interface BookService {

    List<Book> getBooks();

    Book getBook(Long id);

    void saveBook(Book book);

    void deleteBook(Long id);

    List<Book> searchBook(String searchBook);

    List<Reader> getBookReaders(Long bookId);
}
