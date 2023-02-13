package com.ptf.wp.portfolio.database;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import com.ptf.wp.portfolio.models.Dogadaj;
import com.ptf.wp.portfolio.models.Kategorija;
import com.ptf.wp.portfolio.models.Komentar;
import com.ptf.wp.portfolio.models.Lokacija;
import com.ptf.wp.portfolio.models.Role;
import com.ptf.wp.portfolio.models.User;

public class KomentarDao extends BazaDao{
	

	public int kreirajKomentar(Komentar komentar) {
		
		User user = null;
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if (!(authentication instanceof AnonymousAuthenticationToken)) {
		    String currentUserName = authentication.getName();
		    user = findByEmail(currentUserName);
		}
		
        String sql = "INSERT INTO Komentar(tekst, userId, datum, dogadajId) values('" + komentar.getTekst() +
                "'," + user.getId() + ",'" + Date.valueOf(LocalDate.now()) + "'," + komentar.getDogadajId() + ")";
        return template.update(sql);
     }
	
	  public User findByEmail(String email) {
	        String sql = "SELECT * FROM User WHERE email = '" + email + "'";
	        User user = template.queryForObject(sql, new BeanPropertyRowMapper<>(User.class));

	        if (user != null) {
	            String roleSql = "SELECT * FROM Role WHERE id = '" + user.getRoleId() + "'";
	            Role userRole = template.queryForObject(roleSql, new BeanPropertyRowMapper<>(Role.class));
	            user.setRole(userRole);
	        }

	        return user;
	    }
	  
	  
	  public List<Komentar> dohvatiKomentare(Long dogadajId) {
		  System.out.println("Dogadaj id "  + dogadajId);
		  
	        String sql = "SELECT * FROM Komentar WHERE dogadajId = " + dogadajId;

	        List<Komentar> komentari = template.query(sql, new BeanPropertyRowMapper<>(Komentar.class));

	        for (Komentar komentar : komentari) {

	            String sqlUser = "SELECT * FROM User WHERE id = " + komentar.getUserid();
	            User user = template.queryForObject(sqlUser, new BeanPropertyRowMapper<>(User.class));
	            komentar.setUser(user);
	        }

	        return komentari;

	    }
}
