
package com.zemanek.webEvaElrych.controllery;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 *
 * @author Jan Zemánek
 */

@Controller
public class HomepageController {
    
    /**
     *
     * @return Stránka "Homepage"
     */
    @GetMapping({"/","/homepage"})
    public String zobrazDomovskouStranku(){
        return "Homepage";
    }
}
