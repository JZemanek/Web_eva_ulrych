/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.zemanek.webEvaElrych.Services;

import com.zemanek.webEvaElrych.Entity.Uzivatel;
import com.zemanek.webEvaElrych.Repository.UzivatelRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

/**
 * Servisní třída pro uživatele
 * @author Jan Zemánek
 */
@Service
@AllArgsConstructor
public class UzivatelServices {
    
    UzivatelRepository uzivatelRepository;
    
    /**
     * Na základě přihlašovacího jména (login) vrátí uživatele.
     * @param login Přihlašovací jméno
     * @return uzivatel
     */
    public Uzivatel najdiUzivatelePodleJmena(String login){
        return uzivatelRepository.findByLogin(login);
    }
    
}
