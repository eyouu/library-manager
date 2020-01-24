package org.project.library.controller;

import org.project.library.entity.RentInfo;
import org.project.library.service.LibrarianService;
import org.project.library.service.RentInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/rent")
public class RentInfoController {

    @Autowired
    private RentInfoService rentInfoService;


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
