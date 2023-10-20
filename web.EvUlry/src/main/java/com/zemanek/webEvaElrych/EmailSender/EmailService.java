package com.zemanek.webEvaElrych.EmailSender;

import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.Email;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;
import org.springframework.stereotype.Service;

/**
 * Servisní třída pro zasílání emailů.
 * @author Jan Zemánek
 */
@Service
public class EmailService {

    /**
     * Metoda definuje všechny potřebné hodnoty pro zasílání emailových zpráv.
     * @param prijemce Příjemce zprávy.
     * @param predmet Předmět zprávy.
     * @param zprava Text zprávy.
     * @throws EmailException
     */
    public void odesliEmail(String prijemce, String predmet, String zprava) throws EmailException {
        Email email = new SimpleEmail();
        email.setHostName("smtp.gmail.com");
        email.setSmtpPort(465);
        email.setAuthenticator(new DefaultAuthenticator("jan.zemos@gmail.com", "mmon vmss sscd aklv"));
        email.setSSLOnConnect(true);
        email.setFrom("jan.zemos@gmail.com");
        email.setSubject(predmet);
        email.setMsg(zprava);
        email.addTo(prijemce);
        email.send();
    }
}
