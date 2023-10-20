
package com.zemanek.webEvaElrych.controllery;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 *
 * @author Jan Zemánek
 */
@Controller
public class SluzbyController {

    /**
     *
     * @return Stránka "Sluzby"
     */
    @GetMapping("/sluzby")
    public String zobrazStrankuSluzby() {
        return "Sluzby";
    }
}
