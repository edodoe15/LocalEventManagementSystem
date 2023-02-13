package com.ptf.wp.portfolio.models;


public class Role {

    private Long id;
    private String name;

    public Role(String name) {
        super();
        this.name = name;
    }

    public Role() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }


}
