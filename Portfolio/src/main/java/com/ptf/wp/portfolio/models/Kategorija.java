package com.ptf.wp.portfolio.models;

public class Kategorija {

    private long id;
    private String nazivKategorije;
    private String ikonica;

    public String getNazivKategorije() {
        return nazivKategorije;
    }

    public void setNazivKategorije(String nazivKategorije) {
        this.nazivKategorije = nazivKategorije;
    }

    public String getIkonica() {
        return ikonica;
    }

    public void setIkonica(String ikonica) {
        this.ikonica = ikonica;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

}
