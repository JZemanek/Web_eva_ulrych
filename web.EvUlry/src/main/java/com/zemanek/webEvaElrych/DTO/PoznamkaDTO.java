package com.zemanek.webEvaElrych.DTO;

import com.zemanek.webEvaElrych.Entity.Klient;
import lombok.Data;

/**
 * DTO pro poznámku
 * @author Jan Zemánek
 */
@Data
public class PoznamkaDTO {

    private int idPoznamky;
    private String text;
    private String datumSezeni;
    private int idKlienta;
    Klient klient;
}
