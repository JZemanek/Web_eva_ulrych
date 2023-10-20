package com.zemanek.webEvaElrych.controllery;

import com.zemanek.webEvaElrych.EmailSender.EmailService;
import org.apache.commons.mail.EmailException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * Controller třída pro stránku "Kontakty"
 * @author Jan Zemánek
 */
@Controller
public class KontakyController {

    EmailService emailService;
    
    /**
     *
     * @param emailService Servisní třída pro zasílání emailů.
     */
    @Autowired
    public KontakyController(EmailService emailService) {
        this.emailService = emailService;
    }

    /**
     *
     * @return Stránka "Kontakty"
     */
    @GetMapping("/kontakty")
    public String zobrazStrankuKontakty() {
        return "Kontakty";
    }

    /**
     * Metoda odešle zprávu s parametry, vyplněnými na stránce "Kontakty".
     * 
     * @param jmeno Jméno odesílatele
     * @param prijmeni Příjmení odesílatele
     * @param email Email odesílatele
     * @param telefon Telefonní číslo odesílatele
     * @param zprava Textová zpráva odesílatele
     * @param redirectAttributes redirectAttributes pro předání zprávy po přesměrování.
     * @return Redirect na stránku "Kontakty" po odeslání emailu.
     * @throws EmailException V případě chyby při odesílání emailu.
     */
    @PostMapping("/odeslat-email")
    public String odeslatEmailZForulare(@RequestParam("jmeno") String jmeno,
            @RequestParam("prijmeni") String prijmeni,
            @RequestParam("email") String email,
            @RequestParam("telefon") String telefon,
            @RequestParam("zprava") String zprava,
            RedirectAttributes redirectAttributes) throws EmailException{

        String prijemce = "jan.zemos@gmail.com";
        String predmet = "Nová zpráva z webu";

        // Vytvoření zprávy na základě údajů z formuláře.
        String zpravaEmailu = "Jméno: " + jmeno + "\n";
        zpravaEmailu += "Příjmení: " + prijmeni + "\n";
        zpravaEmailu += "E-mail: " + email + "\n";
        zpravaEmailu += "Telefon: " + telefon + "\n\n";
        zpravaEmailu += "Zpráva:\n" + zprava;

        //Odeslání emailu přes servisní třídu.
        emailService.odesliEmail(prijemce, predmet, zpravaEmailu);
        
        //Atribut zprávy po úspěšém odeslání.
        redirectAttributes.addFlashAttribute("uspesneOdeslano", "Zpráva byla úspěšně odeslána.");

        //Přesměrování na stránku "Kontakty"
        return "redirect:/kontakty";
    }
}
