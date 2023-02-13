package com.ptf.wp.portfolio.servisi;

import com.ptf.wp.portfolio.database.KategorijaDao;
import com.ptf.wp.portfolio.models.Kategorija;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class KategorijaServis {

    private final KategorijaDao kategorijaDao;

    public KategorijaServis(KategorijaDao kategorijaDao) {
        super();
        this.kategorijaDao = kategorijaDao;
    }

    public List<Kategorija> dohvatiSveKategorije() {
        return kategorijaDao.dohvatiKategorije();
    }

    public Kategorija dohvatiKategorijuPoId(Long id) {
        return kategorijaDao.dohvatiKategorijuPoIdu(id);
    }

    public void azurirajKategoriju(Kategorija kategorija) {
        kategorijaDao.azurirajKategorijuPoId(kategorija);
    }

    public boolean spasiKategoriju(Kategorija kategorija) {
        return this.kategorijaDao.kreirajKategoriju(kategorija) > 0;
    }
}
