package ee.net.nurmoja.multidimension.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class FrontDataFormController {

    @RequestMapping("/{formFragment}")
    public String getFormFragment(@PathVariable String formFragment, Model model) {
        if (formFragment.equals("one")) {
            model.addAttribute("formFragment", "one :: one");
        } else {
            model.addAttribute("formFragment", "main :: main");
        }

        return formFragment;
    }
}
