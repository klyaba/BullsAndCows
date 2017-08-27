package controllers;

import domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import service.UserService;

import java.security.Principal;

@Controller
public class UserController {
    @Autowired
    UserService userService;

    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String getRegistration(@ModelAttribute ("newUser") User user) {
        return "registration";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String processRegistration(@ModelAttribute ("newUser") User userToBeAdded, BindingResult result){
        String[] suppressedFields = result.getSuppressedFields();
        if (suppressedFields.length > 0) {
            throw new RuntimeException("Attempting to bind disallowed fields: " + StringUtils.arrayToCommaDelimitedString(suppressedFields));
        }

        userService.addUser(userToBeAdded);
        return "profile";
    }

    @RequestMapping(value = "/profile", method = RequestMethod.GET)
    public String getProfile(Model model, Principal user){
        model.addAttribute("user", user);
        return "profile";
    }

}
