package com.ptf.wp.portfolio.models;

import java.time.LocalDate;

public class Dogadaj {

    Lokacija lokacija;
    Kategorija kategorija;
    private long id;
    private String nazivDogadaja;
    private String stringDatum;
    private LocalDate datum;
    private String opis;
    private String slikaURL;
    private long kategorijaId;
    private long lokacijaId;
    
    


    public String getStringDatum() {
		return stringDatum;
	}

	public void setStringDatum(String stringDatum) {
		this.stringDatum = stringDatum;
	}

	public long getKategorijaId() {
        return kategorijaId;
    }

    public void setKategorijaId(long kategorijaId) {
        this.kategorijaId = kategorijaId;
    }

    public long getLokacijaId() {
        return lokacijaId;
    }

    public void setLokacijaId(long lokacijaId) {
        this.lokacijaId = lokacijaId;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getNazivDogadaja() {
        return nazivDogadaja;
    }

    public void setNazivDogadaja(String nazivDogadaja) {
        this.nazivDogadaja = nazivDogadaja;
    }

    public LocalDate getDatum() {
        return datum;
    }

    public void setDatum(LocalDate datum) {
        this.datum = datum;
    }

    public String getOpis() {
        return opis;
    }

    public void setOpis(String opis) {
        this.opis = opis;
    }

    public String getSlikaURL() {
        return slikaURL;
    }

    public void setSlikaURL(String slikaURL) {
        this.slikaURL = slikaURL;
    }

    public Lokacija getLokacija() {
        return lokacija;
    }

    public void setLokacija(Lokacija lokacija) {
        this.lokacija = lokacija;
    }

    public Kategorija getKategorija() {
        return kategorija;
    }

    public void setKategorija(Kategorija kategorija) {
        this.kategorija = kategorija;
    }

}
