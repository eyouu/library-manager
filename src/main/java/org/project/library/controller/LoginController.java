package org.project.library.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {

    @GetMapping("/loginPage")
    public String loginPage() {

        return "login-page";
    }

    @GetMapping("/accessDenied")
    public String accessDenied() {

        return "access-denied";
    }
}
