package com.ptf.wp.portfolio.database;

import com.ptf.wp.portfolio.models.Lokacija;
import org.springframework.jdbc.core.BeanPropertyRowMapper;

import java.util.List;


public class LokacijaDao extends BazaDao {

    public List<Lokacija> dohvatiLokacije() {
        String sql = "SELECT * FROM Lokacija";
        return template.query(sql, new BeanPropertyRowMapper<>(Lokacija.class));
    }

    public Lokacija dohvatiLokacijuPoIdu(Long id) {
        String sql = "SELECT * FROM Lokacija WHERE id = " + id;
        return template.queryForObject(sql, new BeanPropertyRowMapper<>(Lokacija.class));
    }

    public int azurirajLokacijuPoId(Lokacija lokacija) {
        String sql = "UPDATE Lokacija SET naziv='" + lokacija.getNaziv() + "',opis= '" + lokacija.getOpis() + "',lokacijaURL='" + lokacija.getLokacijaURL() +
                "' WHERE id = " + lokacija.getId();
        return template.update(sql);
    }

    public int kreirajLokaciju(Lokacija lokacija) {
        String sql = "INSERT INTO Lokacija(naziv, opis, lokacijaURL) values('" + lokacija.getNaziv() +
                "','" + lokacija.getOpis() + "','" + lokacija.getLokacijaURL() + "')";
        return template.update(sql);
    }

}
