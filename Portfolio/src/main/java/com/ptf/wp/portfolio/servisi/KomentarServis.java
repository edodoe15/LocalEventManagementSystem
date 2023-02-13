package com.ptf.wp.portfolio.servisi;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ptf.wp.portfolio.database.KategorijaDao;
import com.ptf.wp.portfolio.database.KomentarDao;
import com.ptf.wp.portfolio.models.Kategorija;
import com.ptf.wp.portfolio.models.Komentar;

@Service
public class KomentarServis {
	
	KomentarDao komentarDao;
	
	 public KomentarServis(KomentarDao komentarDao) {
	        super();
	        this.komentarDao = komentarDao;
	    }

	public boolean spasiKomentar(Komentar komentar) {
        return this.komentarDao.kreirajKomentar(komentar) > 0;
    }
	
	public List<Komentar> dohvatiKomentarePoDogadaju(Long dogadajId) {
        return komentarDao.dohvatiKomentare(dogadajId);
    }
}
