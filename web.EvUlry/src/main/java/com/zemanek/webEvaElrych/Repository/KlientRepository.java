/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.zemanek.webEvaElrych.Repository;

import com.zemanek.webEvaElrych.Entity.Klient;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Repozitář - klient
 * @author Jan Zemánek
 */
public interface KlientRepository extends JpaRepository<Klient, Integer>{

}
