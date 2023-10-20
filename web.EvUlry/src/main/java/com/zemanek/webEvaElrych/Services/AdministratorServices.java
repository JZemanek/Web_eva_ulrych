/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.zemanek.webEvaElrych.Services;

import com.zemanek.webEvaElrych.Entity.Klient;
import com.zemanek.webEvaElrych.Entity.Poznamka;
import com.zemanek.webEvaElrych.Repository.KlientRepository;
import com.zemanek.webEvaElrych.Repository.PoznamkaRepository;
import jakarta.transaction.Transactional;
import java.util.List;
import org.springframework.stereotype.Service;

/**
 * Servisní třída pro stránky "/administrace/**"
 * @author Jan Zemánek
 */
@Service
public class AdministratorServices {

    private KlientRepository klientRepository;
    private PoznamkaRepository poznamkaRepository;

    /**
     *
     * @param klientRepository
     * @param poznamkaRepository
     */
    public AdministratorServices(KlientRepository klientRepository, PoznamkaRepository poznamkaRepository) {
        this.klientRepository = klientRepository;
        this.poznamkaRepository = poznamkaRepository;
    }

    //KlientRepositoryMethods

    /**
     *
     * @return Vrací seznam (List) všech klientů.
     */
    public List<Klient> vratSeznamVsechKlientu() {
        return klientRepository.findAll();
    }

    /**
     * Vytvoří nového klienta a uloží ho do databáze.
     * @param klient Entita klient
     * @return Nový klient
     */
    public Klient pridejNovehoKlienta(Klient klient) {
        return klientRepository.save(klient);
    }

    /**
     * Odstraní klienta na základě jeho ID.
     * @param id Id klienta
     */
    public void odstranKlientaNaZakladeId(int id) {
        klientRepository.deleteById(id);
    }

    /**
     * Nalezení klienta na základě jeho id.
     * @param id id klienta
     * @return Vrací entitu klient, nalezenou na základě požadovaného id.
     */
    public Klient najdiKlientaPodleId(int id) {
        return klientRepository.findById(id).orElse(null);
    }
    //

    //PoznamkaRepostoryMethods

    /**
     * Metoda uloží do databáze novou poznámku a přřadí ji ke klientovi na základě požadovaného id klienta.
     * @param poznamka Entita poznámka
     * @param id id klienta
     * @return poznamka
     */
    public Poznamka pridejNovouPoznamkuKeKlientoviPodleId(Poznamka poznamka, int id) {
        return poznamkaRepository.save(poznamka);
    }

    /**
     * Vrátí seznam (List) poznámek pro klienta na základě jeho id.
     * @param id id klienta
     * @return seznam poznámek
     */
    public List<Poznamka> najdiPoznamkyProUzivatelePodleId(int id) {
        return poznamkaRepository.findAllByidKlienta(id);
    }

    /**
     * Odstraní danou poznámku na základě jejího id.
     * @param idPoznamky id poznámky
     */
    public void odstranUrcitouPoznamkuUKlienta(Integer idPoznamky) {
        poznamkaRepository.deleteById(idPoznamky);
    }
    
    /**
     * Odstraní všechny poznámky, které souvisejí s klientem na základě jeho id.
     * @param id id klienta
     */
    public void odstranVsechnyPoznamkyKlientaPodleId(int id){
        poznamkaRepository.deletePoznamkyByKlientId(id);
    }

    /**
     * Vrátí entitu poznámky na základě jejího id.
     * @param idPoznamky id poznámky
     * @return poznamka
     */
    public Poznamka najdiPoznamkuPodleId(int idPoznamky) {
        return poznamkaRepository.findById(idPoznamky).orElse(null);
    }
    //
}
