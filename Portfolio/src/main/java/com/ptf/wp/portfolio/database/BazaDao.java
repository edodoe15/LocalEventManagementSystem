package com.ptf.wp.portfolio.database;

import org.springframework.jdbc.core.JdbcTemplate;

public class BazaDao {
    protected JdbcTemplate template;

    public void setTemplate(JdbcTemplate template) {
        this.template = template;
    }
}
