package com.ptf.wp.portfolio.servisi;

import com.ptf.wp.portfolio.database.DogadajDao;
import com.ptf.wp.portfolio.models.Dogadaj;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DogadajServis {

    private final DogadajDao dogadajDao;

    public DogadajServis(DogadajDao dogadajDao) {
        super();
        this.dogadajDao = dogadajDao;
    }

    public List<Dogadaj> dohvatiSveDogadaje() {
        return dogadajDao.dohvatiDogadaje();
    }

    public Dogadaj dohvatiDogadajPoId(Long id) {
        return dogadajDao.dohvatiDogadajPoIdu(id);
    }

    public void azurirajDogadaj(Dogadaj dogadaj) {
        dogadajDao.azurirajDogadajPoId(dogadaj);
    }

    public boolean spasiDogadaj(Dogadaj dogadaj) {
        return this.dogadajDao.kreirajDogadaj(dogadaj) > 0;
    }

    public List<Dogadaj> dohvatiDogadajPoNazivKategoijiLokaciji(String naziv, Long kategorijaId, Long lokacijaId) {
        return this.dogadajDao.dohvatiDogadajPoNazivuKategoijiILokaciji(naziv, kategorijaId, lokacijaId);
    }
}
