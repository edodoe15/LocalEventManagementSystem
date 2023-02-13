package com.ptf.wp.portfolio.servisi;


import com.ptf.wp.portfolio.database.LokacijaDao;
import com.ptf.wp.portfolio.models.Lokacija;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LokacijaServis {

    private final LokacijaDao lokacijaDao;

    public LokacijaServis(LokacijaDao lokacijaDao) {
        super();
        this.lokacijaDao = lokacijaDao;
    }

    public List<Lokacija> dohvatiSveLokacije() {
        return lokacijaDao.dohvatiLokacije();
    }

    public Lokacija dohvatiLokacijuPoId(Long id) {
        return lokacijaDao.dohvatiLokacijuPoIdu(id);
    }

    // azurirajLokaciju..

    public void azurirajLokaciju(Lokacija lokacija) {
        lokacijaDao.azurirajLokacijuPoId(lokacija);
    }

    public boolean spasiLokaciju(Lokacija lokacija) {
        return this.lokacijaDao.kreirajLokaciju(lokacija) > 0;
    }

}
