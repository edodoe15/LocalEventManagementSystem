package com.ptf.wp.portfolio.controllers;

import com.ptf.wp.portfolio.models.Lokacija;
import com.ptf.wp.portfolio.servisi.LokacijaServis;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;


@Controller
@RequestMapping("/lokacija")
public class LokacijaController {

    private final LokacijaServis lokacijaServis;

    public LokacijaController(LokacijaServis lokacijaServis) {
        this.lokacijaServis = lokacijaServis;
    }

    @GetMapping
    public ModelAndView dohvatiLokacije() {
        ModelAndView modelAndView = new ModelAndView("lokacija/index");
        List<Lokacija> lokacije = lokacijaServis.dohvatiSveLokacije();
        modelAndView.addObject("lokacije", lokacije);
        return modelAndView;
    }

    @GetMapping("/add")
    public ModelAndView otvoriFormuDodajLokaciju() {
        ModelAndView modelAndView = new ModelAndView("lokacija/add");
        modelAndView.addObject("lokacija", new Lokacija());
        return modelAndView;
    }

    @PostMapping("/add")
    public String dodajLokaciju(@ModelAttribute("lokacija") Lokacija lokacija) {
        System.out.println("Nova lokacija: " + lokacija);
        lokacijaServis.spasiLokaciju(lokacija);
        return "redirect:/lokacija";
    }

    @GetMapping("/update2/{id}")
    public ModelAndView otvoriFormuDodajLokacijuEdit(@PathVariable("id") Long id) {
        ModelAndView modelAndView = new ModelAndView("lokacija/update2");
        modelAndView.addObject("lokacija", lokacijaServis.dohvatiLokacijuPoId(id));
        return modelAndView;
    }

    @PostMapping("/update2")
    public String updateLokacije(@ModelAttribute("lokacija") Lokacija lokacija) {
        lokacijaServis.azurirajLokaciju(lokacija);
        return "redirect:/lokacija";
    }
/*
    @RequestMapping(value = "", method = RequestMethod.PUT)
    public String azurirajLokaciju(@ModelAttribute("lokacija") Lokacija lokacija, Model model) {
        lokacijaServis.azurirajLokaciju(lokacija);
        // model.addAttribute("lokacije", model);
        //return "redirect:/lokacija";    
        return "lokacija/index";
    }

    @RequestMapping(value = "", method = RequestMethod.POST)
    public String spasiLokaciju(@ModelAttribute("lokacija") Lokacija lokacija) {
        this.lokacijaServis.spasiLokaciju(lokacija);
        return "";

    }
*/

}
