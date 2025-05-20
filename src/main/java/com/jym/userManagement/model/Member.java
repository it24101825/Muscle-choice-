package com.jym.userManagement.model;

import java.time.LocalDate;

public class Member extends Person {
    private String password;
    private String membershipType;
    private LocalDate lastRenewal;

    public Member(String id, String name, String email, LocalDate joinDate, String password, String membershipType, LocalDate lastRenewal) {
        super(id, name, email, joinDate);
        this.password = password;
        this.membershipType = membershipType;
        this.lastRenewal = lastRenewal;
    }

    // Getters and Setters
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getMembershipType() {
        return membershipType;
    }

    public void setMembershipType(String membershipType) {
        this.membershipType = membershipType;
    }

    public LocalDate getLastRenewal() {
        return lastRenewal;
    }

    public void setLastRenewal(LocalDate lastRenewal) {
        this.lastRenewal = lastRenewal;
    }

    @Override
    public String toString() {
        return super.toString() + "," + password + "," + membershipType + "," + lastRenewal;
    }
}