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
@Table(name="fixedDepositHistory")
public class FixedDepositHistory {
     @Id
     @GeneratedValue(strategy = GenerationType.AUTO)
     @Column(name="fixedDepositId")
     private int fixedDepositId;
     
     @Column(name="accHolderName")
     private String accHolderName;
     @Column(name="mobileNumber")
     private String mobileNumber;
     
     @Column(name="nomineeName")
     private String nomineeName;
     @Column(name="nomineeMobile")
     private String nomineeMobile;
     @Column(name="nomineeDOB")
     private String nomineeDOB;
     
     @Column(name="tenure")
     private int tenure;
//     @Column(name="aadhaarNum")
//     private String aadhaarNum;
//     @Column(name="panNum")
//     private String panNum;
     
     @Column(name="fixedDepositAmount")
     private double fixedDepositAmount;
     
     @Column(name="rateofInterest")
     private float rateofInterest;
     
     @Column(name="interestAmount")
     private double interestAmount;
     
     @CreationTimestamp
     @Column(name="fromDate", updatable=false, nullable=false, columnDefinition="TIMESTAMP DEFAULT CURRENT_TIMESTAMP")
     private LocalDateTime fromDate;
     
     @Column(name="toDate")
     private LocalDateTime toDate;
     
     @Column(name="totalAmountFD")
     private double totalAmountFD;
     
     @Column(name="status")
     private String status = "Opened";
     
     @ManyToOne
     @JoinColumn(name="accNo")
     private Customer customer;
     
	public Customer getCustomer() {
        return customer;
    }
    public void setCustomer(Customer customer) {
        this.customer = customer;
    }
    
    public int getFixedDepositId() {
        return fixedDepositId;
    }
    public void setFixedDepositId(int fixedDepositId) {
        this.fixedDepositId = fixedDepositId;
    }
    public String getAccHolderName() {
        return accHolderName;
    }
    public void setAccHolderName(String accHolderName) {
        this.accHolderName = accHolderName;
    }
    public String getMobileNumber() {
        return mobileNumber;
    }
    public void setMobileNumber(String mobileNumber) {
        this.mobileNumber = mobileNumber;
    }
    public String getNomineeName() {
        return nomineeName;
    }
    public void setNomineeName(String nomineeName) {
        this.nomineeName = nomineeName;
    }
    public String getNomineeMobile() {
        return nomineeMobile;
    }
    public void setNomineeMobile(String nomineeMobile) {
        this.nomineeMobile = nomineeMobile;
    }
    public String getNomineeDOB() {
        return nomineeDOB;
    }
    public void setNomineeDOB(String nomineeDOB) {
        this.nomineeDOB = nomineeDOB;
    }
    public int getTenure() {
        return tenure;
    }
    
    
//    public void setTenure(int tenure) {
//        this.tenure = tenure;
//    }
    
    
    public void setTenure(int tenure) {
        this.tenure = tenure;
        if (this.fromDate != null) {
            this.toDate = this.fromDate.plusYears(tenure);
        }
    }
    
    
    public double getFixedDepositAmount() {
        return fixedDepositAmount;
    }
    public void setFixedDepositAmount(double fixedDepositAmount) {
        this.fixedDepositAmount = fixedDepositAmount;
    }
    public float getRateofInterest() {
        return rateofInterest;
    }
    public void setRateofInterest(float rateofInterest) {
        this.rateofInterest = rateofInterest;
    }
    public double getInterestAmount() {
        return interestAmount;
    }
    public void setInterestAmount(double interestAmount) {
        this.interestAmount = interestAmount;
    }
    public LocalDateTime getFromDate() {
        return fromDate;
    }
    
    
    
    
//    public void setFromDate(LocalDateTime fromDate) {
//        this.fromDate = fromDate;
//    }
    
    
    
    public void setFromDate(LocalDateTime fromDate) {
        this.fromDate = fromDate;
        if (this.tenure > 0) {
            this.toDate = fromDate.plusYears(this.tenure);
        }
    }
    
    
    
    
    public LocalDateTime getToDate() {
        return toDate;
    }
    public void setToDate(LocalDateTime toDate) {
        this.toDate = toDate;
    }
    public double getTotalAmountFD() {
        return totalAmountFD;
    }
    public void setTotalAmountFD(double totalAmountFD) {
        this.totalAmountFD = totalAmountFD;
    }
    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }
    public FixedDepositHistory(int fixedDepositId, String accHolderName, String mobileNumber, String nomineeName,
            String nomineeMobile, String nomineeDOB, int tenure, double fixedDepositAmount, float rateofInterest,
            double interestAmount, LocalDateTime fromDate, LocalDateTime toDate, double totalAmountFD, String status,
            Customer customer) {
        super();
        this.fixedDepositId = fixedDepositId;
        this.accHolderName = accHolderName;
        this.mobileNumber = mobileNumber;
        this.nomineeName = nomineeName;
        this.nomineeMobile = nomineeMobile;
        this.nomineeDOB = nomineeDOB;
        this.tenure = tenure;
        this.fixedDepositAmount = fixedDepositAmount;
        this.rateofInterest = rateofInterest;
        this.interestAmount = interestAmount;
//        this.fromDate = fromDate;
        this.toDate = toDate;
        this.totalAmountFD = totalAmountFD;
        this.status = status;
        this.customer = customer;
        
        // Set the fromDate to current time and calculate toDate
        this.fromDate = LocalDateTime.now();
        this.toDate = this.fromDate.plusYears(this.tenure);
        
    }
    public FixedDepositHistory(String accHolderName, String mobileNumber, String nomineeName, String nomineeMobile,
            String nomineeDOB, int tenure, double fixedDepositAmount, float rateofInterest, double interestAmount,
            double totalAmountFD, Customer customer) {
        super();
        this.accHolderName = accHolderName;
        this.mobileNumber = mobileNumber;
        this.nomineeName = nomineeName;
        this.nomineeMobile = nomineeMobile;
        this.nomineeDOB = nomineeDOB;
        this.tenure = tenure;
        this.fixedDepositAmount = fixedDepositAmount;
        this.rateofInterest = rateofInterest;
        this.interestAmount = interestAmount;
        this.totalAmountFD = totalAmountFD;
        this.customer = customer;
    }
    
	public FixedDepositHistory() {
		super();
	}
    
    
     
}
