package org.project.library.controller;

import org.project.library.entity.Book;
import org.project.library.entity.Reader;
import org.project.library.service.ReaderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/reader")
public class ReaderController {

    @Autowired
    private ReaderService readerService;


    // trims white spaces to resolve validation issue
    @InitBinder
    private void initBinder(WebDataBinder webDataBinder) {
        StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);

        webDataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
    }

    @GetMapping("/list")
    public String showReaders(Model model) {
        List<Reader> readers = readerService.getReaders();

        model.addAttribute("readers", readers);

        return "readers-list";
    }

    @GetMapping("/addReaderForm")
    public String addReaderForm(Model model) {
        Reader reader = new Reader();

        model.addAttribute("reader", reader);

        return "reader-save-form";
    }

    @PostMapping("/saveReader")
    public String saveReader(@Valid @ModelAttribute("reader") Reader reader, BindingResult bindingResult) {

        if (bindingResult.hasErrors()) {
            return "reader-save-form";
        } else {
            readerService.saveReader(reader);
            return "redirect:/reader/list";
        }

    }

    @GetMapping("/updateReader")
    public String updateReader(@RequestParam("readerId") Long id, Model model) {
        Reader reader = readerService.getReader(id);

        model.addAttribute("reader", reader);

        return "reader-save-form";
    }

    @GetMapping("/deleteReader")
    public String deleteReader(@RequestParam("readerId") Long id) {
        readerService.deleteReader(id);

        return "redirect:/reader/list";
    }

    @GetMapping("/searchByName")
    public String searchReaderByName(@RequestParam("searchName") String searchName, Model model) {
        List<Reader> readers = readerService.searchReaderByName(searchName);

        model.addAttribute("readers", readers);

        return "readers-list";
    }

    @GetMapping("/showReaderBooks")
    public String showReaderBooks(@RequestParam("readerId") Long id, Model model) {
        List<Book> books = readerService.getReaderBooks(id);

        Reader reader = readerService.getReader(id);

        model.addAttribute("books", books);
        model.addAttribute("reader", reader);

        return "reader-books";
    }
}
