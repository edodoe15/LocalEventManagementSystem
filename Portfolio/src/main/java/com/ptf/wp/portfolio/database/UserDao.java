package com.ptf.wp.portfolio.database;

import com.ptf.wp.portfolio.models.Role;
import com.ptf.wp.portfolio.models.User;
import org.springframework.jdbc.core.BeanPropertyRowMapper;


public class UserDao extends BazaDao {

    public User findByEmail(String email) {
        String sql = "SELECT * FROM User WHERE email = '" + email + "' AND suspended = false";
        User user = template.queryForObject(sql, new BeanPropertyRowMapper<>(User.class));

        if (user != null) {
            String roleSql = "SELECT * FROM Role WHERE id = '" + user.getRoleId() + "'";
            Role userRole = template.queryForObject(roleSql, new BeanPropertyRowMapper<>(Role.class));
            user.setRole(userRole);
        }

        return user;
    }

    public User save(User user) {

        String roleSql = "SELECT * FROM Role WHERE name = '" + user.getRole().getName() + "'";
        Role userRole = template.queryForObject(roleSql, new BeanPropertyRowMapper<>(Role.class));

        String sql = "INSERT INTO User(firstName, lastName, email, password, roleId, suspended)"
                + "values('" + user.getFirstName() + "','" + user.getLastName()
                + "','" + user.getEmail() + "','" + user.getPassword() + "'," + userRole.getId() + "," + false + ")";
        template.update(sql);

        User newUser = findByEmail(user.getEmail());

        return newUser;
    }

	public void suspend(Long userId) {
		 String sql = "UPDATE User SET suspended = true WHERE id = " + userId;
		 template.update(sql);
		
	}

}
