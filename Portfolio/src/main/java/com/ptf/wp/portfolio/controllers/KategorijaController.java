package com.ptf.wp.portfolio.controllers;

import com.ptf.wp.portfolio.models.Kategorija;
import com.ptf.wp.portfolio.servisi.KategorijaServis;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;


@Controller
@RequestMapping("/kategorija")
public class KategorijaController {

    private final KategorijaServis kategorijaServis;

    public KategorijaController(KategorijaServis kategorijaServis) {
        this.kategorijaServis = kategorijaServis;
    }


    @GetMapping
    public ModelAndView dohvatiKategorije() {
        ModelAndView modelAndView = new ModelAndView("kategorija/index");
        List<Kategorija> kategorije = kategorijaServis.dohvatiSveKategorije();
        modelAndView.addObject("kategorije", kategorije);
        return modelAndView;
    }

    @GetMapping("/add2")
    public ModelAndView otvoriFormuDodajKategoriju() {
        ModelAndView modelAndView = new ModelAndView("kategorija/add2");
        modelAndView.addObject("kategorija", new Kategorija());
        return modelAndView;
    }

    @PostMapping("/add2")
    public String dodajKategoriju(@ModelAttribute("kategorija") Kategorija kategorija) {
        System.out.println("Nova kategorija: " + kategorija);
        kategorijaServis.spasiKategoriju(kategorija);
        return "redirect:/kategorija";
    }

    @GetMapping("/update/{id}")
    public ModelAndView otvoriFormuDodajKategorijuEdit(@PathVariable("id") Long id) {
        ModelAndView modelAndView = new ModelAndView("kategorija/update");
        modelAndView.addObject("kategorija", kategorijaServis.dohvatiKategorijuPoId(id));
        return modelAndView;
    }

    @PostMapping("/update")
    public String updateKategorije(@ModelAttribute("kategorija") Kategorija kategorija) {
        kategorijaServis.azurirajKategoriju(kategorija);
        return "redirect:/kategorija";
    }

    /*@RequestMapping(value = "/editsave", method = RequestMethod.PUT)
    public String azurirajKategoriju(@ModelAttribute("lokacija") Kategorija kategorija) {
        this.kategorijaServis.azurirajKategoriju(kategorija);
        return "redirect:/lokacija";
    }

    @RequestMapping(value = "", method = RequestMethod.POST)
    public String spasiKategoriju(@ModelAttribute("lokacija") Kategorija kategorija) {
        this.kategorijaServis.spasiKategoriju(kategorija);
        return "";

    }*/

}
