package controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Arrays;
import java.util.Random;

@Controller
public class GameController {

    @RequestMapping("/test")
    public String welcome(Model model) {
        return "test";
    }

    @RequestMapping(value = "/game", method = RequestMethod.GET)
    public String getGame(Model model){
        Random rand = new Random();
        String strNum = "";
        int[] number = new int[4];
        for (int i=0; i<4; i++) {
            number[i] = rand.nextInt(10);
            strNum += number[i];
        }
        model.addAttribute("number", strNum);
        return "game";
    }
}
