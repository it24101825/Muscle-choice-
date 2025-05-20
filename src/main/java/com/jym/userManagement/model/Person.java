package com.jym.userManagement.model;

import java.time.LocalDate;

public abstract class Person {
    private String id;
    private String name;
    private String email;
    private LocalDate joinDate;

    public Person(String id, String name, String email, LocalDate joinDate) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.joinDate = joinDate;
    }

    // Getters and Setters
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public LocalDate getJoinDate() {
        return joinDate;
    }

    public void setJoinDate(LocalDate joinDate) {
        this.joinDate = joinDate;
    }

    @Override
    public String toString() {
        return id + "," + name + "," + email + "," + joinDate;
    }
}