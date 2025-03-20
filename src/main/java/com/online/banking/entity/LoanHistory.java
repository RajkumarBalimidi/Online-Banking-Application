package com.online.banking.entity;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;


@Entity
@Table(name="loanHistory")
public class LoanHistory {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name="loanId")
    private int loanId;
    @Column(name="accHolderName")
    private String accHolderName;
    @Column (name="mobileNumber")
    private String mobileNumber;
    @Column(name="loanType")
    private String loanType;
    @Column(name="loanAmount")
    private double loanAmount;
    @Column(name="rateforOneYear")
    private float rateforOneYear;
    @CreationTimestamp
    @Column(name="date", updatable = false, nullable = false, columnDefinition = "TIMESTAMP DEFAULT CURRENT_TIMESTAMP")
    private LocalDateTime date;
    @Column(name="interestAmount")
    private double interestAmount;
    @Column(name="surityName")
    private String surityName;
    @Column(name="totalLoanAmount")
    private double totalLoanAmount;
    @Column(name="paidLoan")
    private double paidLoan;
    @Column(name="reminingLoan")
    private double remainingLoan;
    @Column(name="status")
    private String status;
    
    @OneToOne
    @JoinColumn(name="loanPersonAccNo")
    private Customer customer1;
    
    @OneToOne
    @JoinColumn(name="surityPersonAccNo")
    private Customer customer2;
    
    public Customer getCustomer2() {
        return customer2;
    }
    public void setCustomer2(Customer customer2) {
        this.customer2 = customer2;
    }
    
    public Customer getCustomer1() {
        return customer1;
    }
    public void setCustomer1(Customer customer1) {
        this.customer1 = customer1;
    }
    
    public int getLoanId() {
        return loanId;
    }
    public void setLoanId(int loanId) {
        this.loanId = loanId;
    }
    
    public String getLoanType() {
        return loanType;
    }
    public void setLoanType(String loanType) {
        this.loanType = loanType;
    }
    public double getInterestAmount() {
        return interestAmount;
    }
    public void setInterestAmount(double interestAmount) {
        this.interestAmount = interestAmount;
    }
    public String getAccHolderName() {
        return accHolderName;
    }
    public void setAccHolderName(String accHolderName) {
        this.accHolderName = accHolderName;
    }
    public double getLoanAmount() {
        return loanAmount;
    }
    public void setLoanAmount(double loanAmount) {
        this.loanAmount = loanAmount;
    }
    public float getRateforOneYear() {
        return rateforOneYear;
    }
    public void setRateforOneYear(float rateforOneYear) {
        this.rateforOneYear = rateforOneYear;
    }
    public LocalDateTime getDate() {
        return date;
    }
    public void setDate(LocalDateTime date) {
        this.date = date;
    }
    public String getSurityName() {
        return surityName;
    }
    public void setSurityName(String surityName) {
        this.surityName = surityName;
    }
    public double getTotalLoanAmount() {
        return totalLoanAmount;
    }
    public void setTotalLoanAmount(double totalLoanAmount) {
        this.totalLoanAmount = totalLoanAmount;
    }
    public double getPaidLoan() {
        return paidLoan;
    }
    public void setPaidLoan(double paidLoan) {
        this.paidLoan = paidLoan;
    }
    public double getRemainingLoan() {
        return remainingLoan;
    }
    public void setRemainingLoan(double remainingLoan) {
        this.remainingLoan = remainingLoan;
    }
    public String getMobileNumber() {
        return mobileNumber;
    }
    public void setMobileNumber(String mobileNumber) {
        this.mobileNumber = mobileNumber;
    }
    
    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }
    public LoanHistory(int loanId, String accHolderName,String mobileNumber,String loanType, double loanAmount, float rateforOneYear, LocalDateTime date,
            double interestAmount, String surityName, double totalLoanAmount, double paidLoan, double remainingLoan, String status) {
        super();
        this.loanId = loanId;
        this.accHolderName = accHolderName;
        this.mobileNumber = mobileNumber;
        this.loanType = loanType;
        this.loanAmount = loanAmount;
        this.rateforOneYear = rateforOneYear;
        this.date = date;
        this.interestAmount = interestAmount;
        this.surityName = surityName;
        this.totalLoanAmount = totalLoanAmount;
        this.paidLoan = paidLoan;
        this.remainingLoan = remainingLoan;
        this.status = status;
    }
    public LoanHistory(String accHolderName,String mobileNumber, double loanAmount, float rateforOneYear, String surityName,
            double totalLoanAmount, double paidLoan, double remainingLoan, String status) {
        super();
        this.accHolderName = accHolderName;
        this.mobileNumber = mobileNumber;
        this.loanAmount = loanAmount;
        this.rateforOneYear = rateforOneYear;
        this.surityName = surityName;
        this.totalLoanAmount = totalLoanAmount;
        this.paidLoan = paidLoan;
        this.remainingLoan = remainingLoan;
        this.status = status;
    }
    public LoanHistory() {
        super();
    }
    
}
