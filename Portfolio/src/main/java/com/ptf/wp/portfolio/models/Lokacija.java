package com.ptf.wp.portfolio.models;

public class Lokacija {

    private long id;
    private String naziv;
    private String opis;
    private String lokacijaURL;


    public String getNaziv() {
        return naziv;
    }

    public void setNaziv(String naziv) {
        this.naziv = naziv;
    }

    public String getOpis() {
        return opis;
    }

    public void setOpis(String opis) {
        this.opis = opis;
    }

    public String getLokacijaURL() {
        return lokacijaURL;
    }

    public void setLokacijaURL(String lokacijaURL) {
        this.lokacijaURL = lokacijaURL;
    }

    public Long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return "Lokacija [id=" + id + ", naziv=" + naziv + ", opis=" + opis + ", lokacijaURL=" + lokacijaURL + "]";
    }


}
