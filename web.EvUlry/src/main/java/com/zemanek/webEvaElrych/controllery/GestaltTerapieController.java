
package com.zemanek.webEvaElrych.controllery;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 *
 * @author Jan Zemánek
 */
@Controller
public class GestaltTerapieController {
    
    /**
     *
     * @return Stránka "GestaltTerapie"
     */
    @GetMapping("/gestalt-terapie")
    public String zobrazStrankuGestaltTerapie(){
        return "GestaltTerapie";
    }
}
