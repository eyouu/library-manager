package org.project.library.controller;

import org.project.library.entity.Book;
import org.project.library.entity.Reader;
import org.project.library.entity.RentInfo;
import org.project.library.service.BookService;
import org.project.library.service.LibrarianService;
import org.project.library.service.ReaderService;
import org.project.library.service.RentInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/rent")
public class RentInfoController {

    @Autowired
    private RentInfoService rentInfoService;

    @Autowired
    private BookService bookService;

    @Autowired
    private ReaderService readerService;

    @GetMapping("/list")
    public String showRents(Model model) {

        List<RentInfo> rents = rentInfoService.getRentList();
        model.addAttribute("rents", rents);


        return "rents-list";
    }

    @GetMapping("/changeStatus")
    public String changeStatus(@RequestParam("statusId") Long id) {
        rentInfoService.changeRentStatus(id);

        return "redirect:/rent/list";
    }

    @GetMapping("/deleteRent")
    public String deleteRent(@RequestParam("rentId") Long id) {
        rentInfoService.deleteRent(id);

        return "redirect:/rent/list";
    }

    @GetMapping("/showBooksInRent")
    public String showBooksInRent(Model model) {

        List<RentInfo> booksInRent = rentInfoService.getRentedBooks();
        model.addAttribute("rents", booksInRent);

        return "rents-list";
    }

    @GetMapping("/showReturnedBooks")
    public String showReturnedBooks(Model model) {

        List<RentInfo> returnedBooks = rentInfoService.getReturnedBooks();
        model.addAttribute("rents", returnedBooks);

        return "rents-list";
    }

    @GetMapping("/showMoreRentDetails")
    public String showMoreRentDetails(@RequestParam("rentId") Long rentId, Model model) {
        RentInfo rentInfo = rentInfoService.getRent(rentId);

        Book book = bookService.getBook(rentInfo.getBook().getId());
        Reader reader = readerService.getReader(rentInfo.getReader().getId());

        model.addAttribute("rent", rentInfo);
        model.addAttribute("book", book);
        model.addAttribute("reader", reader);

        return "rent-details";
    }

    @GetMapping("/searchByRentId")
    public String searchByRentId(@RequestParam("rentId") Long rentId, Model model) {

        List<RentInfo> rents = rentInfoService.searchRentByRentId(rentId);

        model.addAttribute("rents", rents);

        return "rents-list";
    }

    @GetMapping("/searchByReaderId")
    public String searchByReaderId(@RequestParam("readerId") Long readerId, Model model) {

        List<RentInfo> rents = rentInfoService.searchRentByReaderId(readerId);
        model.addAttribute("rents", rents);

        return "rents-list";
    }

    @GetMapping("/searchByBookId")
    public String searchByBookId(@RequestParam("bookId") Long bookId, Model model) {

        List<RentInfo> rents = rentInfoService.searchRentByBookId(bookId);
        model.addAttribute("rents", rents);

        return "rents-list";
    }




}
