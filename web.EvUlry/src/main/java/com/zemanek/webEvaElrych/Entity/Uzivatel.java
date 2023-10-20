package com.zemanek.webEvaElrych.Entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;

/**
 * Entita uživatele
 * @author Jan Zemánek
 */
@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "uzivatele")
public class Uzivatel {

    @Column(name = "id_uzivatele")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    private int idUzivatele;

    @NonNull
    @Column(name = "login")
    private String login;

    @NonNull
    @Column(name = "heslo")
    private String heslo;

    @NonNull
    @Column(name = "opravneni")
    private String opravneni;
}
