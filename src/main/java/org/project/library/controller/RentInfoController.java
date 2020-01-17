package org.project.library.controller;

import org.project.library.entity.RentInfo;
import org.project.library.service.RentInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Date;
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

    @GetMapping("/addRentForm")
    public String addRent(Model model) {
        RentInfo rentInfo = new RentInfo();

        model.addAttribute("rentInfo", rentInfo);

        return "rent-save-form";
    }

    @PostMapping("/saveRent")
    public String saveRent(@ModelAttribute("rentInfo") RentInfo rentInfo) {
        rentInfo.setDateOfRent(new Date());

        rentInfoService.saveRent(rentInfo);

        return "redirect:/rent/list";
    }

    @GetMapping("/updateRent")
    public String updateRent(@RequestParam("rentId") Long id, Model model) {
        RentInfo rent = rentInfoService.getRent(id);

        model.addAttribute("rent", rent);

        return "rent-save-form";
    }

    @GetMapping("/deleteRent")
    public String deleteRent(@RequestParam("rentId") Long id) {
        rentInfoService.deleteRent(id);

        return "redirect:/rent/list";
    }



    public void populateDefaultModel(Model model) {
        List<String> statuses = new ArrayList<>();
        statuses.add("IN RENT");
        statuses.add("RETURNED");
        model.addAttribute("statusess", statuses);
    }



}
