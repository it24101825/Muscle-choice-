package com.jym.dsa.model;

import java.time.LocalDate;

public class RenewalRecord implements Comparable<RenewalRecord> {
    private String memberId;
    private String name;
    private int durationDays;
    private String bank;
    private String transactionId;
    private LocalDate renewalDate;

    public RenewalRecord(String memberId, String name, int durationDays, String bank, String transactionId, LocalDate renewalDate) {
        this.memberId = memberId;
        this.name = name;
        this.durationDays = durationDays;
        this.bank = bank;
        this.transactionId = transactionId;
        this.renewalDate = renewalDate;
    }

    // Getters
    public String getMemberId() { return memberId; }
    public String getName() { return name; }
    public int getDurationDays() { return durationDays; }
    public String getBank() { return bank; }
    public String getTransactionId() { return transactionId; }
    public LocalDate getRenewalDate() { return renewalDate; }

    @Override
    public int compareTo(RenewalRecord other) {
        return this.renewalDate.compareTo(other.renewalDate);
    }
}