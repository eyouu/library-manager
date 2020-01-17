package org.project.library.controller;

import org.project.library.entity.Reader;
import org.project.library.service.ReaderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/reader")
public class ReaderController {

    @Autowired
    private ReaderService readerService;

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
    public String saveReader(@ModelAttribute("reader") Reader reader) {
        reader.setRegistrationDate(new Date());

        readerService.saveReader(reader);
        return "redirect:/reader/list";
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
}
