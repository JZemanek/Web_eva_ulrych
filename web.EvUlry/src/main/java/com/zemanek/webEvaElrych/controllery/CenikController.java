package com.zemanek.webEvaElrych.controllery;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * 
 * @author Jan Zemánek
 */
@Controller
public class CenikController {

    /**
     *
     * @return Stránka "Cenik"
     */
    @GetMapping("cenik")
    public String zobrazStrankuCenik() {
        return "Cenik";
    }
}
