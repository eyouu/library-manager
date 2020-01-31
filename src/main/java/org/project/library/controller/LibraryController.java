package org.project.library.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LibraryController {

    private static final Logger logger = Logger.getLogger(LibraryController.class);

    @GetMapping("/")
    public String showMainPage() {
        logger.info("Loading main page");
        return "redirect:/book/list";
    }

}
