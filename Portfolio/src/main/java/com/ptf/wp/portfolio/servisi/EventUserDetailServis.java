package com.ptf.wp.portfolio.servisi;


import com.ptf.wp.portfolio.database.UserDao;
import com.ptf.wp.portfolio.models.SecurityUser;
import com.ptf.wp.portfolio.models.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;


public class EventUserDetailServis implements UserDetailsService {

    private final UserDao userDao;

    public EventUserDetailServis(UserDao userDao) {
        super();
        this.userDao = userDao;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userDao.findByEmail(username);
        if (user == null) {
            throw new UsernameNotFoundException("Ne postoji korisnik sa emailom: " + username);
        }
        SecurityUser securityUser = new SecurityUser(user);
        return securityUser;
    }


}
