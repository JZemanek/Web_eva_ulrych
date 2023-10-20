
package com.zemanek.webEvaElrych.controllery;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 *
 * @author Jan Zemánek
 */
@Controller
public class OMneController {

    /**
     *
     * @return Stránka "OMne"
     */
    @GetMapping("o-mne")
    public String zobrazStrankuOMne() {
        return "OMne";
    }
}
