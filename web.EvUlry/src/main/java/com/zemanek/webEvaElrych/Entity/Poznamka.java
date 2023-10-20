package com.zemanek.webEvaElrych.Entity;

import jakarta.annotation.Nullable;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import java.time.LocalDate;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;

/**
 * Entita poznámky
 * @author Jan Zemánek
 */
@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "Poznamky")
public class Poznamka {

    @Column(name = "id_poznamky")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    private int idPoznamky;

    @NonNull
    @Column(name = "text")
    private String text;
    
    @Nullable
    @Column(name = "datum_sezeni")
    private LocalDate datumSezeni;

    @NonNull
    @Column(name = "id_klienta")
    private int idKlienta;
    
    @NonNull
    @ManyToOne
    @JoinColumn(name = "id_klienta", referencedColumnName = "id", insertable = false, updatable = false)
    Klient klient;
}
