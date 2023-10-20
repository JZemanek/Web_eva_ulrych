/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.zemanek.webEvaElrych.Repository;

import com.zemanek.webEvaElrych.Entity.Uzivatel;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Repozitář - uživatel
 * @author Jan Zemánek
 */
public interface UzivatelRepository extends JpaRepository<Uzivatel, Integer>{
    
    /**
     *
     * @param login Login (jméno) uživatele
     * @return Vrací uživatele na základě jeho přihlašovcího jména (login)
     */
    public Uzivatel findByLogin(String login);
    
}
