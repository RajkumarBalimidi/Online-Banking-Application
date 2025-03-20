package com.online.banking.entity;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

@Entity
@Table(name="paidLoanHistory")
public class PaidLoanHistory {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name="paidLoanId")
    private int paidLoanId;
    private String accHolderName;
    @Column(name="amount")
    private double amount;
    @CreationTimestamp
    @Column(name="date", updatable = false, nullable = false, columnDefinition = "TIMESTAMP DEFAULT CURRENT_TIMESTAMP")
    private LocalDateTime date;
    
    @ManyToOne
    @JoinColumn(name="loanId")
    private LoanHistory loanHistory;
    
    @OneToOne
    @JoinColumn(name="accNo")
    private Customer customer;
    
    public Customer getCustomer() {
        return customer;
    }
    public void setCustomer(Customer customer) {
        this.customer = customer;
    }
    
    public LoanHistory getLoanHistory() {
        return loanHistory;
    }
    public void setLoanHistory(LoanHistory loanHistory) {
        this.loanHistory = loanHistory;
    }
    
    public int getPaidLoanId() {
        return paidLoanId;
    }
    public void setPaidLoanId(int paidLoanId) {
        this.paidLoanId = paidLoanId;
    }
    public String getAccHolderName() {
        return accHolderName;
    }
    public void setAccHolderName(String accHolderName) {
        this.accHolderName = accHolderName;
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
    public PaidLoanHistory(int paidLoanId, String accHolderName, double amount, LocalDateTime date) {
        super();
        this.paidLoanId = paidLoanId;
        this.accHolderName = accHolderName;
        this.amount = amount;
        this.date = date;
    }
    public PaidLoanHistory(String accHolderName, double amount) {
        super();
        this.accHolderName = accHolderName;
        this.amount = amount;
    }
    public PaidLoanHistory() {
        super();
    }
    
}
