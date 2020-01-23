package org.project.library.controller;

import org.project.library.entity.Librarian;
import org.project.library.service.LibrarianService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/librarian")
public class LibrarianController {

    @Autowired
    private LibrarianService librarianService;


    @GetMapping("/list")
    public String showLibrarians(Model model) {
        List<Librarian> librarians = librarianService.getLibrarians();

        model.addAttribute("librarians", librarians);

        return "librarians-list";
    }


    @GetMapping("/addLibrarianForm")
    public String addLibrarianForm(Model model) {
        Librarian librarian = new Librarian();
        model.addAttribute("librarian", librarian);

        return "librarian-save-form";
    }


    @PostMapping("/saveLibrarian")
    public String saveLibrarian(@ModelAttribute("librarian") Librarian librarian ) {

        librarianService.saveLibrarian(librarian);


        return "redirect:/librarian/list";
    }

    @GetMapping("/updateLibrarian")
    public String updateLibrarian(@RequestParam("librarianId") Long id, Model model) {
        Librarian librarian = librarianService.getLibrarian(id);

        model.addAttribute("librarian", librarian);

        return "librarian-save-form";
    }

    @GetMapping("/deleteLibrarian")
    public String deleteLibrarian(@RequestParam("librarianId") Long id) {
        librarianService.deleteLibrarian(id);

        return "redirect:/librarian/list";
    }


}
