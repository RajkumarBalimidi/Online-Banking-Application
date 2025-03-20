package com.online.banking.entity;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

@Entity
@Table(name="transactionHistory")
public class TransactionHistory {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name="thid")
    private int thid;
    @Column(name="fromName")
    private String fromName;
//    @Column(name="toAccNo")
//    private int toAccNo;
    @Column(name="toName")
    private String toName;
    @Column(name="toMobile")
    private String toMobile;
    @Column(name="amount")
    private double amount;
    @CreationTimestamp
    @Column(name="date", updatable = false, nullable = false, columnDefinition = "TIMESTAMP DEFAULT CURRENT_TIMESTAMP")
    private LocalDateTime date;
    
    @ManyToOne
    @JoinColumn(name="fromAccNo")
    private Customer transferredDetails;
    
    @ManyToOne
    @JoinColumn(name="toAccNo")
    private Customer receivedDetails;
    
    
    public Customer getTransferredDetails() {
        return transferredDetails;
    }
    public void setTransferredDetails(Customer transferredDetails) {
        this.transferredDetails = transferredDetails;
    }
    
    public Customer getReceivedDetails() {
        return receivedDetails;
    }
    public void setReceivedDetails(Customer receivedDetails) {
        this.receivedDetails = receivedDetails;
    }
    
    public int getThid() {
        return thid;
    }
    public void setThid(int thid) {
        this.thid = thid;
    }
    public String getFromName() {
        return fromName;
    }
    public void setFromName(String fromName) {
        this.fromName = fromName;
    }
   
    public String getToName() {
        return toName;
    }
    public void setToName(String toName) {
        this.toName = toName;
    }
    public double getAmount() {
        return amount;
    }
    public void setAmount(double amount) {
        this.amount = amount;
    }
    public LocalDateTime getDate() {
        return date;
    }
    public void setDate(LocalDateTime date) {
        this.date = date;
    }
    public String getToMobile() {
        return toMobile;
    }
    public void setToMobile(String toMobile) {
        this.toMobile = toMobile;
    }
    public TransactionHistory(int thid, int fromAccNo, String fromName, String toName, double amount,
            LocalDateTime date) {
        super();
        this.thid = thid;
        
        this.fromName = fromName;
        this.toName = toName;
        this.amount = amount;
        this.date = date;
    }
    public TransactionHistory(String fromName, String toName, String toMobile, double amount) {
        super();
        this.fromName = fromName;
        this.toName = toName;
        this.toMobile = toMobile;
        this.amount = amount;
    }
    public TransactionHistory() {
        super();
    }

}
