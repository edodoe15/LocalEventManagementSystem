package com.ptf.wp.portfolio.controllers;

import com.ptf.wp.portfolio.models.Dogadaj;
import com.ptf.wp.portfolio.models.Kategorija;
import com.ptf.wp.portfolio.models.Komentar;
import com.ptf.wp.portfolio.models.Lokacija;
import com.ptf.wp.portfolio.servisi.DogadajServis;
import com.ptf.wp.portfolio.servisi.KategorijaServis;
import com.ptf.wp.portfolio.servisi.KomentarServis;
import com.ptf.wp.portfolio.servisi.LokacijaServis;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.time.LocalDate;
import java.util.List;


@Controller
public class DogadajController {

    private final DogadajServis dogadajServis;
    public LokacijaServis lokacijaServis;
    public KategorijaServis kategorijaServis;
    public KomentarServis komentarServis;

    public DogadajController(DogadajServis dogadajServis, LokacijaServis lokacijaServis, KategorijaServis kategorijaServis, KomentarServis komentarServis) {
        this.dogadajServis = dogadajServis;
        this.lokacijaServis = lokacijaServis;
        this.kategorijaServis = kategorijaServis;
        this.komentarServis = komentarServis;
    }

    @GetMapping({"/", "/dogadaj"})
    public ModelAndView dohvatiDogadaje() {
        ModelAndView modelAndView = new ModelAndView("dogadaj/index");
        List<Dogadaj> dogadaji = dogadajServis.dohvatiSveDogadaje();
        modelAndView.addObject("dogadaji", dogadaji);
        modelAndView.addObject("dogadaj", new Dogadaj());
        modelAndView.addObject("kategorije", kategorijaServis.dohvatiSveKategorije());
        modelAndView.addObject("lokacije", lokacijaServis.dohvatiSveLokacije());
        modelAndView.addObject("komentar", new Komentar());
        return modelAndView;
    }

    @PostMapping("/dogadaj/search")
    public ModelAndView pretraziDogadaje(@ModelAttribute("dogadaj") Dogadaj dogadaj) {
        ModelAndView modelAndView = new ModelAndView("dogadaj/index");
        List<Dogadaj> dogadaji = dogadajServis.dohvatiDogadajPoNazivKategoijiLokaciji(dogadaj.getNazivDogadaja(), dogadaj.getKategorijaId(), dogadaj.getLokacijaId());
        modelAndView.addObject("dogadaji", dogadaji);
        modelAndView.addObject("kategorije", kategorijaServis.dohvatiSveKategorije());
        modelAndView.addObject("lokacije", lokacijaServis.dohvatiSveLokacije());
        modelAndView.addObject("komentar", new Komentar());
        return modelAndView;
    }
    
    @GetMapping("/dogadaj/{id}/komentar")
    public ModelAndView otvoriFormuDodajKomentar( @PathVariable("id") Long id) {
        ModelAndView modelAndView = new ModelAndView("dogadaj/dodajKomentar");
        Komentar komentar = new Komentar();
        komentar.setDogadajId(id);
        modelAndView.addObject("komentar", komentar);
        return modelAndView;
    }
    
    @PostMapping("/dogadaj/komentar")
    public String komentiraj(@ModelAttribute("komentar") Komentar komentar){
    	komentarServis.spasiKomentar(komentar);
    	return "redirect:/dogadaj";
    }

    @GetMapping("/dogadaj/add3")
    public ModelAndView otvoriFormuDodajDogadaj() {
        ModelAndView modelAndView = new ModelAndView("dogadaj/add3");
        modelAndView.addObject("dogadaj", new Dogadaj());
        modelAndView.addObject("kategorije", kategorijaServis.dohvatiSveKategorije());
        modelAndView.addObject("lokacije", lokacijaServis.dohvatiSveLokacije());
        return modelAndView;
    }
    
    @GetMapping("/dogadaj/{id}/komentari")
    public ModelAndView pregledajKomentar( @PathVariable("id") Long id) {
        ModelAndView modelAndView = new ModelAndView("dogadaj/komentari");       
        modelAndView.addObject("komentari", komentarServis.dohvatiKomentarePoDogadaju(id));
        return modelAndView;
    }

    @PostMapping("/dogadaj/add3")
    public String dodajLokaciju(@ModelAttribute("dogadaj") Dogadaj dogadaj) {
        System.out.println("Novi dogadaj: " + dogadaj);
        Lokacija lokacija = lokacijaServis.dohvatiLokacijuPoId(dogadaj.getLokacijaId());
        dogadaj.setLokacija(lokacija);

        Kategorija kategorija = kategorijaServis.dohvatiKategorijuPoId(dogadaj.getKategorijaId());
        dogadaj.setKategorija(kategorija);
        
        dogadaj.setDatum(LocalDate.parse(dogadaj.getStringDatum()));

        dogadajServis.spasiDogadaj(dogadaj);
        return "redirect:/dogadaj";
    }

    @GetMapping("/dogadaj/update3/{id}")
    public ModelAndView otvoriFormuDodajDogadajEdit(@PathVariable("id") Long id) {
        ModelAndView modelAndView = new ModelAndView("dogadaj/update3");
        modelAndView.addObject("dogadaj", dogadajServis.dohvatiDogadajPoId(id));
        modelAndView.addObject("kategorije", kategorijaServis.dohvatiSveKategorije());
        modelAndView.addObject("lokacije", lokacijaServis.dohvatiSveLokacije());
        return modelAndView;
    }

    @PostMapping("/dogadaj/update3")
    public String updateKategorije(@ModelAttribute("dogadaj") Dogadaj dogadaj) {
        dogadajServis.azurirajDogadaj(dogadaj);
        return "redirect:/dogadaj";
    }
/*
    @RequestMapping(value = "/dogadaj/editsave", method = RequestMethod.PUT)
    public String azurirajDogadaj(@ModelAttribute("dogadaj") Dogadaj dogadaj) {
        this.dogadajServis.azurirajDogadaj(dogadaj);
        // return "redirect:/lokacija";
        return "";
    }

    @RequestMapping(value = "/dogadaj", method = RequestMethod.POST)
    public String spasiDogadaj(@ModelAttribute("dogadaj") Dogadaj dogadaj) {
        this.dogadajServis.spasiDogadaj(dogadaj);
        return "";

    }*/
}
