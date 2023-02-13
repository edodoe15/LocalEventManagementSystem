package com.ptf.wp.portfolio.servisi;

import com.ptf.wp.portfolio.database.UserDao;
import com.ptf.wp.portfolio.models.Role;
import com.ptf.wp.portfolio.models.RoleType;
import com.ptf.wp.portfolio.models.SecurityUser;
import com.ptf.wp.portfolio.models.User;
import com.ptf.wp.portfolio.viewandmodels.UserRegistration;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class UserServis {

    private final UserDao userDao;
    private final PasswordEncoder encoder;

    public UserServis(UserDao userDao, PasswordEncoder encoder) {
        super();
        this.userDao = userDao;
        this.encoder = encoder;
    }

    public SecurityUser save(UserRegistration registration) {
        User user = new User(
                registration.getFirstName(),
                registration.getLastName(),
                registration.getEmail(),
                encoder.encode(registration.getPassword()),
                new Role(RoleType.ROLE_USER.name())
        );

        return new SecurityUser(userDao.save(user));
    }


    public boolean userExist(String email) {
        User user = userDao.findByEmail(email);
        System.out.println(user);

        return user == null;
    }
    
    public void suspendUser(Long userId) {
    	userDao.suspend(userId);
    }

}
