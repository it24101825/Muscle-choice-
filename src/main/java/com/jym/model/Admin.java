package com.jym.model;

import java.time.LocalDate;

public class Admin extends Person {
    private String username;
    private String password;

    public Admin(String id, String name, String email, LocalDate joinDate, String username, String password) {
        super(id, name, email, joinDate);
        this.username = username;
        this.password = password;
    }

    // Getters and Setters
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return super.toString() + "," + username + "," + password;
    }
}