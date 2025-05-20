package com.jym.dsa.model;

import java.time.LocalDate;

public class RenewalRequest {
    private String memberId;
    private String memberName;
    private int durationDays;
    private String bank;
    private String transactionId;
    private LocalDate renewalDate;

    public RenewalRequest(String memberId, String memberName, int durationDays, String bank, String transactionId, LocalDate renewalDate) {
        this.memberId = memberId;
        this.memberName = memberName;
        this.durationDays = durationDays;
        this.bank = bank;
        this.transactionId = transactionId;
        this.renewalDate = renewalDate;
    }

    // Getters
    public String getMemberId() { return memberId; }
    public String getMemberName() { return memberName; }
    public int getDurationDays() { return durationDays; }
    public String getBank() { return bank; }
    public String getTransactionId() { return transactionId; }
    public LocalDate getRenewalDate() { return renewalDate; }

    @Override
    public String toString() {
        return String.format("Member ID: %s, Name: %s, Duration: %d days, Bank: %s, Transaction ID: %s, Renewal Date: %s",
                memberId, memberName, durationDays, bank, transactionId, renewalDate.toString());
    }

}