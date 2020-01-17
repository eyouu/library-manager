package org.project.library.controller;

import org.project.library.entity.Book;
import org.project.library.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/book")
public class BookController {

    @Autowired
    private BookService bookService;

    @GetMapping("/list")
    public String showBooks(Model model) {
        List<Book> books = bookService.getBooks();

        model.addAttribute("books", books);

        return "books-list";
    }

    @GetMapping("/addBookForm")
    public String addBookForm(Model model) {
        Book book = new Book();

        model.addAttribute("book", book);

        return "book-save-form";
    }

    @PostMapping("/saveBook")
    public String saveBook(@ModelAttribute("book") Book book) {
        bookService.saveBook(book);

        return "redirect:/book/list";
    }

    @GetMapping("/updateBook")
    public String updateBook(@RequestParam("bookId") Long id, Model model) {
        Book book = bookService.getBook(id);

        model.addAttribute("book", book);

        return "book-save-form";
    }

    @GetMapping("/deleteBook")
    public String deleteBook(@RequestParam("bookId") Long id) {
        bookService.deleteBook(id);

        return "redirect:/book/list";
    }

}
