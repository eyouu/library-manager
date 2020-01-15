package org.project.library.controller;

import org.project.library.entity.Librarian;
import org.project.library.service.LibrarianService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/librarian")
public class LibrarianController {

    @Autowired
    private LibrarianService librarianService;


    @GetMapping("/addLibrarianForm")
    public String addLibrarianForm(Model model) {
        Librarian librarian = new Librarian();
        model.addAttribute("librarian", librarian);

        return "librarian-save-form";
    }


    @PostMapping("/saveLibrarian")
    public String saveLibrarian(@ModelAttribute("librarian") Librarian librarian ) {

        librarianService.saveLibrarian(librarian);

        return "redirect:/";
    }

}
