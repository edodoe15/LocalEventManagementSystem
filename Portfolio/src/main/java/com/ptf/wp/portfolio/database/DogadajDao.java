package com.ptf.wp.portfolio.database;

import com.ptf.wp.portfolio.models.Dogadaj;
import com.ptf.wp.portfolio.models.Kategorija;
import com.ptf.wp.portfolio.models.Lokacija;
import org.springframework.jdbc.core.BeanPropertyRowMapper;

import java.time.LocalDate;
import java.util.List;
import java.util.stream.Collectors;

public class DogadajDao extends BazaDao {

    public List<Dogadaj> dohvatiDogadaje() {
        String sql = "SELECT * FROM Dogadaj";

        List<Dogadaj> dogadaji = template.query(sql, new BeanPropertyRowMapper<>(Dogadaj.class));
        dogadaji = dogadaji.stream().filter(dogadaj -> dogadaj.getDatum().compareTo(LocalDate.now()) >= 0).collect(Collectors.toList());

        for (Dogadaj dogadaj : dogadaji) {

            String sqlLokacija = "SELECT * FROM Lokacija WHERE id = " + dogadaj.getLokacijaId();
            Lokacija lokacija = template.queryForObject(sqlLokacija, new BeanPropertyRowMapper<>(Lokacija.class));
            dogadaj.setLokacija(lokacija);

            String sqlKategorija = "SELECT * FROM Kategorija WHERE id = " + dogadaj.getKategorijaId();
            Kategorija kategorija = template.queryForObject(sqlKategorija, new BeanPropertyRowMapper<>(Kategorija.class));
            dogadaj.setKategorija(kategorija);
        }

        return dogadaji;

    }

    public Dogadaj dohvatiDogadajPoIdu(Long id) {
        String sql = "SELECT * FROM Dogadaj WHERE id = " + id;
        return template.queryForObject(sql, new BeanPropertyRowMapper<>(Dogadaj.class));
    }

    public List<Dogadaj> dohvatiDogadajPoNazivuKategoijiILokaciji(String naziv, Long kategorijaId, Long lokacijaId) {
        String sql = "SELECT * FROM Dogadaj WHERE nazivDogadaja = '" + naziv + "' AND kategorijaId = " + kategorijaId + " AND lokacijaId = " + lokacijaId;
        List<Dogadaj> dogadaji = template.query(sql, new BeanPropertyRowMapper<>(Dogadaj.class));

        for (Dogadaj dogadaj : dogadaji) {

            String sqlLokacija = "SELECT * FROM Lokacija WHERE id = " + dogadaj.getLokacijaId();
            Lokacija lokacija = template.queryForObject(sqlLokacija, new BeanPropertyRowMapper<>(Lokacija.class));
            dogadaj.setLokacija(lokacija);

            String sqlKategorija = "SELECT * FROM Kategorija WHERE id = " + dogadaj.getKategorijaId();
            Kategorija kategorija = template.queryForObject(sqlKategorija, new BeanPropertyRowMapper<>(Kategorija.class));
            dogadaj.setKategorija(kategorija);
        }

        return dogadaji;
    }


    public int azurirajDogadajPoId(Dogadaj dogadaj) {
        String sql = "UPDATE Dogadaj SET nazivDogadaja='" + dogadaj.getNazivDogadaja() + "',opis= '" + dogadaj.getOpis() + "',datum= '" + dogadaj.getDatum() +
                "',slikaURL= '" + dogadaj.getSlikaURL() + "',lokacijaId= " + dogadaj.getLokacijaId() + ",kategorijaId= " + dogadaj.getKategorijaId() +
                " WHERE id = " + dogadaj.getId();
        return template.update(sql);
    }

    public int kreirajDogadaj(Dogadaj dogadaj) {
        String sql = "INSERT INTO Dogadaj(nazivDogadaja, opis, datum, slikaURL, lokacijaId, kategorijaId) "
                + "values('" + dogadaj.getNazivDogadaja() + "','" + dogadaj.getOpis()
                + "','" + dogadaj.getDatum() + "','" + dogadaj.getSlikaURL() + "','" + dogadaj.getLokacijaId() + "','" + dogadaj.getKategorijaId() + "')";
        return template.update(sql);
    }
}
