package com.ptf.wp.portfolio.controllers;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.ptf.wp.portfolio.servisi.UserServis;
import com.ptf.wp.portfolio.viewandmodels.UserRegistration;



@Controller
public class AccountController {
    private final UserServis userServis;

    public AccountController(UserServis userServis) {
        super();
        this.userServis = userServis;
    }

    @GetMapping("/login")
    public String login(Model model, String error, String logout) {
        if (error != null)
            model.addAttribute("error", "Your username and password is invalid.");

        if (logout != null)
            model.addAttribute("message", "You have been logged out successfully.");

        return "account/login";
    }

    @GetMapping("/registration")
    public String showRegistrationForm(Model model) {
        UserRegistration registration = new UserRegistration();
        model.addAttribute("user", registration);

        return "account/registration";
    }
    
    @GetMapping("/users/suspend/{id}")
    public String showRegistrationForm(@PathVariable("id") Long id) {
        userServis.suspendUser(id);
        return "redirect:/";
    }

    @PostMapping("registration")
    public String RegisterUser(@ModelAttribute("user") UserRegistration registration,
                               BindingResult result,
                               Model model) {
       /* boolean existing = userServis.userExist(registration.getEmail());
        if (existing) {
            result.rejectValue("email", null, "Već postoji račun registriran sa tom e-poštom");
        }
        if (result.hasErrors()) {
            model.addAttribute("user", registration);
            return "account/registration";
        }*/

        userServis.save(registration);

        return "redirect:/";
    }
}
