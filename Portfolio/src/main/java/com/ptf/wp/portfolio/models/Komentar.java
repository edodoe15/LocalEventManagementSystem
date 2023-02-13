package com.ptf.wp.portfolio.models;

import java.time.LocalDate;

public class Komentar {

	private Long id;
	private Long userid;
	private LocalDate datum;
	private String tekst;
	private Long dogadajId;
	private User user;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getUserid() {
		return userid;
	}
	public void setUserid(Long userid) {
		this.userid = userid;
	}
	public LocalDate getDatum() {
		return datum;
	}
	public void setDatum(LocalDate datum) {
		this.datum = datum;
	}
	public String getTekst() {
		return tekst;
	}
	public void setTekst(String tekst) {
		this.tekst = tekst;
	}
	public Long getDogadajId() {
		return dogadajId;
	}
	public void setDogadajId(Long dogadajId) {
		this.dogadajId = dogadajId;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	
		
}
