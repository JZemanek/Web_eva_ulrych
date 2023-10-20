package com.zemanek.webEvaElrych.Entity;

import jakarta.annotation.Nullable;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import java.time.LocalDate;
import java.time.LocalDateTime;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import org.springframework.format.annotation.DateTimeFormat;

/**
 * Entita klienta
 * @author Jan Zemánek
 */
@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "klient")
public class Klient {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @NonNull
    @Column(name = "jmeno")
    private String jmeno;

    @NonNull
    @Column(name = "prijmeni")
    private String prijmeni;

    @Nullable
    @DateTimeFormat(pattern = "dd.MM.yyyy HH:mm:ss")
    @Column(name = "posledni_schuzka")
    private LocalDateTime posledniSchuzka;

    @Nullable
    @DateTimeFormat(pattern = "dd.MM.yyyy HH:mm:ss")
    @Column(name = "pristi_schuzka")
    private LocalDateTime pristiSchuzka;

    @Nullable
    @DateTimeFormat(pattern = "dd.MM.yyyy")
    @Column(name = "prvni_schuzka")
    private LocalDate prvniSchuzka;
    
    @NonNull
    @Column(name = "email")
    private String email;
    
    @NonNull
    @Column(name = "tel_číslo")
    private String telCislo;
    
    @NonNull
    @Column(name = "pohlavi")
    private String pohlavi;
}
