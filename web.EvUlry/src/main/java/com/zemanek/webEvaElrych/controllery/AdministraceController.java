package com.zemanek.webEvaElrych.controllery;

import com.zemanek.webEvaElrych.DTO.KlientDTO;
import com.zemanek.webEvaElrych.DTO.PoznamkaDTO;
import com.zemanek.webEvaElrych.Entity.Klient;
import com.zemanek.webEvaElrych.Entity.Poznamka;
import com.zemanek.webEvaElrych.Services.AdministratorServices;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * Controller třída pro stránky "/administrace/**"
 *
 * @author Jan Zemánek
 */
@Controller
@RequestMapping("/administrace")
public class AdministraceController {

    private AdministratorServices administratorServices;

    /**
     *
     * @param administratorServices Servisní třída administrace.
     */
    public AdministraceController(AdministratorServices administratorServices) {
        this.administratorServices = administratorServices;
    }

    /**
     *
     * @return Stránka "Administrace"
     */
    @GetMapping("")
    public String vratHlavniStrankuAdministrace() {
        return "Administrace";
    }

    /**
     *
     * @return Stránka "PridatKlienta"
     */
    @GetMapping("pridat-klienta")
    public String zobrazStrankuPridatKlient() {
        return "PridatKlienta";
    }

    /**
     *
     * @param id Id klienta
     * @param stranka Aktuální číslo stránky (výchozí = 1).
     * @param velikostStranky Velikost stránky pro zobrazení poznámek (výchozí =
     * 2).
     * @param model Model
     * @return Stránka "PodrobnostiKlienta"
     */
    @GetMapping("podrobnosti-klienta/{id}")
    public String zobrazStrankuPodrobnostiKlienta(@PathVariable int id,
            @RequestParam(name = "stranka", defaultValue = "1") int stranka,
            @RequestParam(name = "velikostStranky", defaultValue = "1") int velikostStranky,
            Model model) {

        //Nalezení klienta na základě id.
        Klient klient = administratorServices.najdiKlientaPodleId(id);
        
        //Vytvoří nové DTO pro klienta;
        KlientDTO klientDTO = new KlientDTO();

        //Proměnné pro formátované datum
        String pristiSchuzkaFormat = "";
        String posledniSchuzkaFormat = "";
        String prvniSchuzkaFormat = "";

        //Provde kontrolu, zda-li nejsou datumy null. Pokud ne, provede jejich formátování a uloží je jako text do proměnných.
        if (klient.getPristiSchuzka() != null) {
            LocalDateTime pristiSchuzka = klient.getPristiSchuzka();
            pristiSchuzkaFormat = pristiSchuzka.format(DateTimeFormatter.ofPattern("d.M.yyyy HH:mm"));
        }
        if (klient.getPosledniSchuzka() != null) {
            LocalDateTime posledniSchuzka = klient.getPosledniSchuzka();
            posledniSchuzkaFormat = posledniSchuzka.format(DateTimeFormatter.ofPattern("d.M.yyyy HH:MM"));
        }
        if (klient.getPrvniSchuzka() != null) {
            LocalDate prvniSchuzka = klient.getPrvniSchuzka();
            prvniSchuzkaFormat = prvniSchuzka.format(DateTimeFormatter.ofPattern("d.M.yyyy"));
        }
        
        //Naplněn
        klientDTO.setId(klient.getId());
        klientDTO.setJmeno(klient.getJmeno());
        klientDTO.setPrijmeni(klient.getPrijmeni());
        klientDTO.setEmail(klient.getEmail());
        klientDTO.setTelCislo(klient.getTelCislo());
        klientDTO.setPohlavi(klient.getPohlavi());
        klientDTO.setPosledniSchuzka(posledniSchuzkaFormat);
        klientDTO.setPristiSchuzka(pristiSchuzkaFormat);
        klientDTO.setPrvniSchuzka(prvniSchuzkaFormat);

        //Vytvoří model pro DTO klienta k použití v JSP.
        model.addAttribute("klient", klientDTO);
        
            //POZNÁMKY
        //Vytvoří seznam poznámek a pomocí servisní třídy ho naplní.
        List<Poznamka> seznamPoznamek = administratorServices.najdiPoznamkyProUzivatelePodleId(klient.getId());
        
        //Vytvoření seznamu DTO pro poznámky.
        List<PoznamkaDTO> seznamPoznamekDTO = new ArrayList<>();

        //Určí, kde začít získávat poznámky.
        int startIndex = (stranka - 1) * velikostStranky;
        //Určí, kde přestat získávat poznámky.
        int endIndex = Math.min(startIndex + velikostStranky, seznamPoznamek.size());
        //Celkový počet poznámek v seznamu
        int celkovyPocetPoznamek = seznamPoznamek.size();
        //Výpočet celkového počtu stránek
        int maxStranek = (int) Math.ceil((double) celkovyPocetPoznamek / velikostStranky);

        //Procházení pozámek na aktuální stránce
        for (int i = startIndex; i < endIndex; i++) {
            Poznamka poznamka = seznamPoznamek.get(i);

            //Uloží datum sezení poznámky do nové proměnné.
            LocalDate datumSezeni = poznamka.getDatumSezeni();
            //Vytvoří proměnnou pro formátovanné datum.
            String datumSezeniFormat = "";

            //Provede kontrolu, zda-li je sezení null. Pokud není, provede formát datumu.
            if (datumSezeni != null) {
                datumSezeniFormat = datumSezeni.format(DateTimeFormatter.ofPattern("d.M.yyyy"));
            }

            //Vytvoří novou poznámku.
            PoznamkaDTO poznamkaDTO = new PoznamkaDTO();
            
            //Naplní novou poznámku hodnotami.
            poznamkaDTO.setDatumSezeni(datumSezeniFormat);
            poznamkaDTO.setIdKlienta(poznamka.getIdKlienta());
            poznamkaDTO.setIdPoznamky(poznamka.getIdPoznamky());
            poznamkaDTO.setText(poznamka.getText());
            poznamkaDTO.setKlient(poznamka.getKlient());

            //Přidá novou poznámku do seznamu DTO.
            seznamPoznamekDTO.add(poznamkaDTO);
        }
        
        //Vytvoří model pro seznam poznámek k použití v JSP.
        model.addAttribute("seznamPoznamek", seznamPoznamekDTO);
        //Vytvoří model pro maximální počet stránek k použití v JSP.
        model.addAttribute("maxStranek", maxStranek);
        //Vytvoří model pro stránku k použití v JSP.
        model.addAttribute("stranka", stranka);

        //Vrátí stránku "PodrobnostiKlienta"
        return "PodrobnostiKlienta";
    }

    /**
     *
     * @param model Model
     * @return Stránka "DatabazeKlientu" s údaji o všech klientech
     */
    @GetMapping("databaze-klientu")
    public String zobrazStrankuSDatabaziKlientu(Model model) {
        
        //Získání seznamu všech klientů.
        List<Klient> seznamKlientu = administratorServices.vratSeznamVsechKlientu();
        
        //Vytvoření seznamu (List) pro DTO klienta
        List<KlientDTO> seznamKlientuDTO = new ArrayList<>();

        //Procházení seznamem.
        for (Klient klient : seznamKlientu) {

            //Vytvoří proměnné pro formátování data
            String pristiSchuzkaFormat = "";
            String posledniSchuzkaFormat = "";
            String prvniSchuzkaFormat = "";

            //Provede kontrol hodnot a v případě, kdy hodnota není null provede formát data a uloží ho do připravené proměnné.
            if (klient.getPristiSchuzka() != null) {
                LocalDateTime pristiSchuzka = klient.getPristiSchuzka();
                pristiSchuzkaFormat = pristiSchuzka.format(DateTimeFormatter.ofPattern("d.M.yyyy HH:mm"));
            }
            if (klient.getPosledniSchuzka() != null) {
                LocalDateTime posledniSchuzka = klient.getPosledniSchuzka();
                posledniSchuzkaFormat = posledniSchuzka.format(DateTimeFormatter.ofPattern("d.M.yyyy HH:MM"));
            }
            if (klient.getPrvniSchuzka() != null) {
                LocalDate prvniSchuzka = klient.getPrvniSchuzka();
                prvniSchuzkaFormat = prvniSchuzka.format(DateTimeFormatter.ofPattern("d.M.yyyy"));
            }

            //Vytvoří DTO klienta.
            KlientDTO klientDTO = new KlientDTO();
            
            //Naplní vytvořené DTO klienta hodnotami.
            klientDTO.setId(klient.getId());
            klientDTO.setJmeno(klient.getJmeno());
            klientDTO.setPrijmeni(klient.getPrijmeni());
            klientDTO.setEmail(klient.getEmail());
            klientDTO.setTelCislo(klient.getTelCislo());
            klientDTO.setPohlavi(klient.getPohlavi());
            klientDTO.setPosledniSchuzka(posledniSchuzkaFormat);
            klientDTO.setPristiSchuzka(pristiSchuzkaFormat);
            klientDTO.setPrvniSchuzka(prvniSchuzkaFormat);

            //Přidá nové DTO do seznamu.
            seznamKlientuDTO.add(klientDTO);
        }
        //Vytvoří model seznamu pro použití v JSP
        model.addAttribute("seznamKlientu", seznamKlientuDTO);
        
        //Vrací stránku "DatabazeKlientu"
        return "DatabazeKlientu";
    }

    /**
     * Metoda na základě parametrů z formuláře vytvoří novou entitu klienta.
     * Pomocí servisní třídy uloží entitu i s paramtry do databáze.
     *
     * @param jmeno Jméno nového klienta.
     * @param prijmeni Příjmení nového klienta.
     * @param email Email nového klienta.
     * @param telCislo Telefonní číslo nového klienta.
     * @param pohlavi Pohlaví nového klienta.
     * @param prvniSchuzka První schůzka nového klienta.
     * @param posledniSchuzka Poslední schůzka nového klienta.
     * @param pristiSchuzka Příští schůzka nového klienta.
     * @param klient Entita klient
     * @param model Model
     * @param redirectAttributes redirectAttributes pro předání zprávy po
     * úspěšném přidání klienta.
     * @return Přesměrování na stránku "DatabazeKlientu"
     */
    @PostMapping("novy-klient")
    public String pridejNovehoKlienta(
            @RequestParam String jmeno,
            @RequestParam String prijmeni,
            @RequestParam String email,
            @RequestParam String telCislo,
            @RequestParam String pohlavi,
            @RequestParam(required = false) LocalDate prvniSchuzka,
            @RequestParam(required = false) LocalDateTime posledniSchuzka,
            @RequestParam(required = false) LocalDateTime pristiSchuzka,
            Klient klient, Model model,
            RedirectAttributes redirectAttributes) {

        //Za pomoci servisní třídy vytvoří klienta s daty z formuláře a uloží ho do databáze.
        administratorServices.pridejNovehoKlienta(klient);
        
        //Vytvoří model pro použití v JSP
        model.addAttribute("klient", klient);

        //Vytvoření zprávy pro úspěšné vytvoření klienta
        redirectAttributes.addAttribute("fromRedirect", "true");
        redirectAttributes.addFlashAttribute("successMessage", "Klient byl úspěšně přidán.");
        
        //Přesměrování na stránku "DatabazeKlientu"
        return "redirect:/administrace/databaze-klientu";
    }

    /**
     *
     * @param id Id klienta.
     * @param redirectAttributes RedirectAttributes pro předání zprávy po
     * úspěšném odstranění klienta.
     * @return Přesměruje na stránku "DatabazeKlientu" po úspěšném odstranění.
     */
    @PostMapping("odstranit-klienta/{id}")
    public String odstranitKlienta(@RequestParam int id, RedirectAttributes redirectAttributes) {
        //Za pomoci servisní třídy odstraní všechny poznámky daného klienta na základě jeho id.
        administratorServices.odstranVsechnyPoznamkyKlientaPodleId(id);
        
        //Za pomoci servisní třídy odstraní klienta na základě jeho id.
        administratorServices.odstranKlientaNaZakladeId(id);
        
        //Vytvoří redirect zprávu pro úspěšé smazání.
        redirectAttributes.addFlashAttribute("successMessage", "Klient byl úspěšně odstraněn.");
        
        //Přesměrování na stránku "DatabazeKlientu"
        return "redirect:/administrace/databaze-klientu";
    }

    /**
     * Metoda pro upravení parametrů klienta na základě údajů z formuláře.
     *
     * @param id ID klienta.
     * @param jmeno Jméno klienta.
     * @param prijmeni Příjmení klienta.
     * @param email Email klienta.
     * @param telCislo Telefonní číslo klienta.
     * @param pohlavi Pohlaví klienta.
     * @param prvniSchuzka První schůzka klienta.
     * @return Přesměrování na stránku klienta.
     */
    @PostMapping("upravit-klienta/{id}")
    @ResponseBody
    public String upravHodnotyKlienta(@PathVariable int id,
            @RequestParam(required = false) String jmeno,
            @RequestParam(required = false) String prijmeni,
            @RequestParam(required = false) String email,
            @RequestParam(required = false) String telCislo,
            @RequestParam(required = false) String pohlavi,
            @RequestParam(required = false) LocalDate prvniSchuzka) {

        //Nalezení entity klienta na základě jeho id.
        Klient klient = administratorServices.najdiKlientaPodleId(id);
        
        //Provedení kontrol hodnot z formuláře. Pokud se nějaká hodnota rovná null nebo je prázdná, nastaví původní hodnotu.
        if (jmeno == null || jmeno.isEmpty()) {
            jmeno = klient.getJmeno();
        }
        if (prijmeni == null || prijmeni.isEmpty()) {
            prijmeni = klient.getPrijmeni();
        }
        if (email == null || email.isEmpty()) {
            email = klient.getEmail();
        }
        if (telCislo == null || telCislo.isEmpty()) {
            telCislo = klient.getTelCislo();
        }
        if (prvniSchuzka == null) {
            prvniSchuzka = klient.getPrvniSchuzka();
        }

        //Uložení nových hodnot z formuláře nebo uchování původních.
        klient.setJmeno(jmeno);
        klient.setPrijmeni(prijmeni);
        klient.setEmail(email);
        klient.setTelCislo(telCislo);
        klient.setPohlavi(pohlavi);
        klient.setPrvniSchuzka(prvniSchuzka);

        //Uložení upravené entity klienta.
        administratorServices.pridejNovehoKlienta(klient);

        //Přesměrování na stránku klienta.
        return "redirect:/administrace/podrobnosti-klienta/{id}";
    }

    /**
     * Metoda pro nastavení příští a popřípadě předchozí schůzky. Metoda
     * umožňuje automaticky dosadit hodnotu příští schůzky na hodnotu poslední
     * schůzky (posledníSchuzka = pristiSchuzka)
     *
     * @param id Id klienta.
     * @param posledniSchuzka Poslední schůzka klienta.
     * @param pristiSchuzka Příští schůzka klienta.
     * @param prevestDatum Funkce pro převedení hodnoti "pristiSchuzka" do
     * hodnoty "posledniSchuzka" (true/false - checkbox)
     * @return Přesměrování na stránku klienta.
     */
    @PostMapping("zmenit-datum/{id}")
    public String zmenitDatumNavstevy(@PathVariable int id,
            @RequestParam(required = false) LocalDateTime posledniSchuzka,
            @RequestParam LocalDateTime pristiSchuzka,
            @RequestParam(value = "prevestDatum", required = false) Boolean prevestDatum) {

        //Nalezení klienta na základě jeho id.
        Klient klient = administratorServices.najdiKlientaPodleId(id);

        //Vytvoření proměnné pro novou příští schůzku.
        LocalDateTime novaPristiSchuzka = pristiSchuzka;

        //Zkontroluje hodnotu prevestDatum. Pokud je null, nastaví na false.
        if (prevestDatum == null) {
            prevestDatum = false;
        }

        //Zkontroluje hodnotu prevestDatum.
        //Pokud je hodnota true, nastaví novou hodnotu posledniSchuzka na původní hodnotu pristiSchuzka.
        //Nastaví hodnotu pristiSchuzka na hodnotu zadanou uživatelem.
        if (prevestDatum == true) {
            LocalDateTime novaPosledniSchuzka = klient.getPristiSchuzka();
            klient.setPristiSchuzka(novaPristiSchuzka);
            klient.setPosledniSchuzka(novaPosledniSchuzka);
            
        //Pokud je hodnota false, hodnotu zadává uživatel. V případě, že hodnotu nezadá, zůstává stejná.
        //Nastaví hodnotu pristiSchuzka na hodnotu zadanou uživatelem.
        } else {
            LocalDateTime novaPosledniSchuzka = posledniSchuzka;
            klient.setPristiSchuzka(novaPristiSchuzka);
            klient.setPosledniSchuzka(novaPosledniSchuzka);
        }

        //Uloží provedené úpravy do databáze.
        administratorServices.pridejNovehoKlienta(klient);

        //Přesměrování na stránku klienta
        return "redirect:/administrace/podrobnosti-klienta/{id}";
    }

    /**
     * Vytvoří novou poznámku vztahující se ke klientovi na základě jeho id.
     *
     * @param id Id klienta.
     * @param textPoznamky Text poznámky.
     * @param datumSezeni Datum sezení ke kterému se poznámka vztahuje.
     * @return Přesměrování na stránku klienta.
     */
    @PostMapping("pridat-poznamku/{id}")
    public String pridatPoznamkuKeKlientovi(@PathVariable int id,
            @RequestParam String textPoznamky, @RequestParam(required = false) LocalDate datumSezeni) {

        //Nalezení klienta, ke kterému se bude poznámka vztahovat, na základě jeho id.
        Klient klient = administratorServices.najdiKlientaPodleId(id);
        //Vytvoření nové poznámky.
        Poznamka poznamka = new Poznamka();

        //Naplnění hodnot nové poznámky.
        poznamka.setDatumSezeni(datumSezeni);
        poznamka.setIdKlienta(klient.getId());
        poznamka.setText(textPoznamky);
        poznamka.setKlient(klient);

        //Uloží novou poznámku do databáze a přiřadí ji ke klientovi.
        administratorServices.pridejNovouPoznamkuKeKlientoviPodleId(poznamka, id);

        //Přesměrování na stránku klienta.
        return "redirect:/administrace/podrobnosti-klienta/{id}";
    }

    /**
     * Upravuje již vytvořenou poznámku.
     *
     * @param id Id klienta.
     * @param idPoznamky Id Poznámky.
     * @param textPoznamky Text poznámky.
     * @param datumSezeni Datum sezení ke kterému se poznámka vztahuje.
     * @return Přesměrování na stránku klienta.
     */
    @PostMapping("upravit-poznamku/{id}/{idPoznamky}")
    public String upravitPoznamku(@PathVariable int id,
            @PathVariable int idPoznamky,
            @RequestParam(required = false) String textPoznamky,
            @RequestParam(required = false) LocalDate datumSezeni) {

        //Nalezení entity klienta podle jeho id
        Klient klient = administratorServices.najdiKlientaPodleId(id);
        //Nalezení entity poznámky podle jeho id
        Poznamka poznamka = administratorServices.najdiPoznamkuPodleId(idPoznamky);

        //Zkontroluje, jestli je datum sezení vyplněné. Pokud vyplněné není, nastaví hodnotu na původní.
        //V opačném případě nastaví novou hodnotu pro datum sezení.
        if (datumSezeni == null) {
            poznamka.setDatumSezeni(poznamka.getDatumSezeni());
        } else {
            poznamka.setDatumSezeni(datumSezeni);
        }
        //Zkontroluje, jestli je text vyplněný. Pokud vyplněný není, nastaví hodnotu na původní.
        //V opačném případě nastaví novou hodnotu pro text.
        if (textPoznamky == null) {
            poznamka.setText(poznamka.getText());
        } else {
            poznamka.setText(textPoznamky);
        }

        //Nastavení dalších hodnot, které zůstávají stejné.
        poznamka.setIdPoznamky(poznamka.getIdPoznamky());
        poznamka.setIdKlienta(klient.getId());
        poznamka.setKlient(klient);

        //Upravení poznámky
        administratorServices.pridejNovouPoznamkuKeKlientoviPodleId(poznamka, id);
        //Přesměrování na stránku klienta
        return "redirect:/administrace/podrobnosti-klienta/{id}";
    }

    /**
     * TATO FUNKCE NENÍ V TUTO CHVÍLI K DISPOZICI!!!!!!!!!!!!!!!!!!!!!!!!!
     *
     * Odstraní poznámku za pomoci servisní třídy.
     *
     * @param id Id klienta.
     * @param idPoznamky Id poznámky.
     * @param redirectAttributes RedirectAttributes pro zaslání zprávy po
     * úspěšném odstranění.
     * @return Přesměrování na stránku klienta.
     */
    @PostMapping("odstranit-poznamku/{id}/{idPoznamky}")
    public String odstranUrcitouPoznamkuUKlienta(@PathVariable int id, @PathVariable Integer idPoznamky, RedirectAttributes redirectAttributes) {
        //Pomocí servisní třídy odstraní poznámku.
        administratorServices.odstranUrcitouPoznamkuUKlienta(idPoznamky);
        //Vytvoření redirect zprávy.
        redirectAttributes.addFlashAttribute("SuccesNoteDelete", "Poznámka byla úspěšně smazána.");
        //Přesměrování
        return "redirect:/administrace/podrobnosti-klienta/{id}";
    }
    
    
    /*
                if ((klient.getPosledniSchuzka() != null)
                    && ((klient.getPosledniSchuzka().toLocalDate()).isBefore(LocalDate.now().plusYears(2)))) {
                administratorServices.odstranKlientaNaZakladeId(klient.getId());
            }
    */
}
