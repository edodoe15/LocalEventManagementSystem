package com.ptf.wp.portfolio.database;

import com.ptf.wp.portfolio.models.Kategorija;
import org.springframework.jdbc.core.BeanPropertyRowMapper;

import java.util.List;


public class KategorijaDao extends BazaDao {

    public List<Kategorija> dohvatiKategorije() {
        String sql = "SELECT * FROM Kategorija";
        return template.query(sql, new BeanPropertyRowMapper<>(Kategorija.class));
    }

    public Kategorija dohvatiKategorijuPoIdu(Long id) {
        String sql = "SELECT * FROM Kategorija WHERE id = " + id;
        return template.queryForObject(sql, new BeanPropertyRowMapper<>(Kategorija.class));
    }

    public int azurirajKategorijuPoId(Kategorija kategorija) {
        String sql = "UPDATE Kategorija SET nazivKategorije='" + kategorija.getNazivKategorije() + "',ikonica= '" + kategorija.getIkonica() +
                "' WHERE id = " + kategorija.getId();
        return template.update(sql);
    }

    public int kreirajKategoriju(Kategorija kategorija) {
        String sql = "INSERT INTO Kategorija(nazivKategorije, ikonica) values('" + kategorija.getNazivKategorije() +
                "','" + kategorija.getIkonica() + "')";
        return template.update(sql);
    }
}
