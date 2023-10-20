package com.zemanek.webEvaElrych.DTO;

import lombok.Data;

/**
 * DTO pro klienta
 * @author Jan Zemánek
 */
@Data
public class KlientDTO {
    private int id;
    private String jmeno;
    private String prijmeni;
    private String prvniSchuzka;
    private String posledniSchuzka;
    private String pristiSchuzka;
    private String email;
    private String telCislo;
    private String pohlavi;
}
