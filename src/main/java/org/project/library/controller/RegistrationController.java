package org.project.library.controller;

import org.apache.log4j.Logger;
import org.project.library.entity.User;
import org.project.library.service.UserService;
import org.project.library.user.LibraryUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@Controller
@RequestMapping("/register")
public class RegistrationController {

    @Autowired
    private UserService userService;

    private static final Logger logger = Logger.getLogger(ExceptionController.class);

    @InitBinder
    public void initBinder(WebDataBinder dataBinder) {
        StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);
        dataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
    }

    @GetMapping("/showRegistrationForm")
    public String showMyLoginPage(Model theModel) {

        theModel.addAttribute("libraryUser", new LibraryUser());

        return "registration-form";
    }

    @PostMapping("/processRegistrationForm")
    public String processRegistrationForm(
            @Valid @ModelAttribute("libraryUser") LibraryUser libraryUser,
            BindingResult theBindingResult,
            Model theModel) {

        String userName = libraryUser.getUserName();
        logger.info("Processing registration form for: " + userName);

        if (theBindingResult.hasErrors()){
            return "registration-form";
        }

        // check the database if user already exists
        User existing = userService.findByUserName(userName);
        if (existing != null) {
            theModel.addAttribute("libraryUser", new LibraryUser());
            theModel.addAttribute("registrationError", "User name already exists.");

            logger.warn("User name already exists.");
            return "registration-form";
        }

        userService.save(libraryUser);
        logger.info("Successfully created user: " + userName);

        return "registration-confirmation";
    }

}
