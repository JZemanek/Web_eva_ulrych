/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.zemanek.webEvaElrych.Repository;

import com.zemanek.webEvaElrych.Entity.Poznamka;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Repozitář - poznámky
 * @author Jan Zemánek
 */
public interface PoznamkaRepository extends JpaRepository<Poznamka, Integer> {

    /**
     *
     * @param id Id klienta
     * @return Vrací seznam poznámek daného klienta
     */
    public List<Poznamka> findAllByidKlienta(int id);

    /**
     * Metoda smaže všechny poznámky související s klientem na základě jeho id.
     * @param id Id klienta
     */
    public void deletePoznamkyByKlientId(int id);
    }
