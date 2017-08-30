package controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Arrays;
import java.util.Random;

@Controller
public class GameController {

    @RequestMapping(value = "/game", method = RequestMethod.GET)
    public String getGame(Model model){
        return "game";
    }
}
