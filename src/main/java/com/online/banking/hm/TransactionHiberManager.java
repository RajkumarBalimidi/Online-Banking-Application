package com.online.banking.hm;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import com.online.banking.entity.Customer;
import com.online.banking.entity.FixedDepositHistory;
import com.online.banking.entity.LoanHistory;
import com.online.banking.entity.PaidLoanHistory;
import com.online.banking.entity.TransactionHistory;

public class TransactionHiberManager {
    
    private static Transaction transaction = null;
    private static Session session3;
    private static ArrayList<Customer> customerList;
    public TransactionHiberManager() 
    {
        session3 = new Configuration().
        configure().
        addAnnotatedClass(Customer.class).
        addAnnotatedClass(TransactionHistory.class).
        addAnnotatedClass(LoanHistory.class).
        addAnnotatedClass(PaidLoanHistory.class).
        addAnnotatedClass(FixedDepositHistory.class).
        buildSessionFactory().
        openSession();
    }
    
    public Customer getParticularCustomer(int accNo) {
        Customer c = (Customer) session3.find(Customer.class, accNo);
        return c;
    }
    
    public Customer searchedAccountNumber(int accNo) {
        Customer c = getParticularCustomer(accNo);
        if(c != null){
            return c;
        }else{
            return null;
        }
    }
    
    public int verifyPasswordAndAmount(int fromAccNo, String password, double amount) {
        Customer c = getParticularCustomer(fromAccNo);
        if(c != null)
        {
            if(password.equals(c.getPassword()))
            {
                if(amount <= c.getAmount()) {
                    return 1;
                }
                return -1;
            }
            return 0;
        }
        return -2;
    }
    

    public int insertTransactionHistory(String fromName, int toAccNo, String toName, String toMobile, double amount, Customer c) {
        try {
            transaction = session3.beginTransaction();
            Customer toCustomer = getParticularCustomer(toAccNo);
            TransactionHistory thHis = new TransactionHistory(fromName, toName, toMobile, amount);
            thHis.setTransferredDetails(c);
            thHis.setReceivedDetails(toCustomer);

            session3.persist(thHis);
            transaction.commit();
            return 1; // Success
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback(); // Rollback in case of failure
            }
            e.printStackTrace(); // Log the exception (use a logger in production)
            return 0; // Failure
        }
    }
    
    
    public int subtractAmount(int fromAccNo, double amount) {
        try {
            Customer c = getParticularCustomer(fromAccNo);
            if(c != null)
            {
                transaction = session3.beginTransaction();
                c.setAmount(c.getAmount()-amount);
                session3.update(c);
                transaction.commit();
                return 1;
            }
            return 0;
        }
        catch(Exception e) {
            if(transaction != null) {
                transaction.rollback();
            }
            return 0;
        }
    }
    
    
    public int addAmount(int toAccNo, double amount) {
        try {
            Customer c = getParticularCustomer(toAccNo);
            if(c != null)
            {
                transaction = session3.beginTransaction();
                c.setAmount(c.getAmount()+amount);
                session3.update(c);
                transaction.commit();
                return 1;
            }
            return 0;
        }
        catch(Exception e) {
            if(transaction != null) {
                transaction.rollback();
            }
            return 0;
        }
    }

    
    public List<TransactionHistory> transferredHistory(int accNo){
        try {
            Query<TransactionHistory> query = session3.createQuery(
                    "from TransactionHistory where transferredDetails.id =: accNo",TransactionHistory.class);
            query.setParameter("accNo", accNo);
            return query.getResultList();
        }
        catch(Exception e) {
            e.printStackTrace();
            return new ArrayList<>();
        }
    }
    
    public List<TransactionHistory> receivedHistory(int accNo){
        try {
            Query<TransactionHistory> query = session3.createQuery(
                    "from TransactionHistory where receivedDetails.id =: accNo",TransactionHistory.class);
            query.setParameter("accNo", accNo);
            return query.getResultList();
        }
        catch(Exception e) {
            e.printStackTrace();
            return new ArrayList<>();
        }
    }
    
    
    
    
    

    
    public float fetchTenureRate(int tenure) {
        double getTenureRate;
        if(tenure==1) {
            return 3.5f;
        }
        else if(tenure==2) {
            return 4.0f;
        }
        else if(tenure==3) {
            return 4.5f;
        }
        else if(tenure==4) {
            return 5.0f;
        }
        else if(tenure==5) {
            return 5.5f;
        }
        return 6.0f;
    }
    
    public double totalAmountFD(double amount,int tenure, double getTenureRate) {
        double interestAmount;
        return interestAmount = (amount*tenure*getTenureRate)/100;
    }
    
    
    public int openFixedDeposit(int accNo, String fullName, String mobileNum, String nomineeFullName, String nomineeMobileNum, 
            String nomineeDOB, int tenure, String aadhaarNum, String panNum, double amount, String password) {
        
        Customer c = getParticularCustomer(accNo);
        try {
            float getTenureRate = fetchTenureRate(tenure);
            double interestAmount = totalAmountFD(amount,tenure,getTenureRate);
            double totalFdAmount = interestAmount + amount;
            if(aadhaarNum.equals(c.getAadhaarNumber()))
            {
                if(password.equals(c.getPassword()))
                {
                    if(amount <= c.getAmount())
                    {
                        if(amount >= 50000)
                        {
                            
                            if(c.getPanNumber().isEmpty() || c.getPanNumber() == null)
                            {
                                if(panNum.isEmpty())
                                {
                                    return -6;
                                }
                                else if(panNum.equals(c.getPanNumber()))
                                {
                                    transaction = session3.beginTransaction();
                                    FixedDepositHistory fdHis = new FixedDepositHistory(fullName, mobileNum, nomineeFullName, nomineeMobileNum, nomineeDOB, tenure, amount, getTenureRate, interestAmount, totalFdAmount, c);
                                    c.setAmount(c.getAmount()-amount);
                                    session3.persist(fdHis);
                                    session3.persist(c);
                                    transaction.commit();
                                    return 1;
                                }
                                else {
                                    return -5;
                                }
                            }
                            return -4;
                            
                        }
                        else {
                            transaction = session3.beginTransaction();
                            FixedDepositHistory fdHis = new FixedDepositHistory(fullName, mobileNum, nomineeFullName, nomineeMobileNum, nomineeDOB, tenure, amount, getTenureRate, interestAmount, totalFdAmount, c);
                            c.setAmount(c.getAmount()-amount);
                            session3.persist(fdHis);
                            session3.persist(c);;
                            transaction.commit();
                            return 1;
                        }
                    }
                    return -3;
                }
                return -2;
            }
            return -1;
        }
        catch(Exception e) {
            if(transaction != null) {
                transaction.rollback();
            }
            return 0;
        }
        
    }

    
    
 
    public List<FixedDepositHistory> fixedDepositedHistory(int accNo) {
        
        try {
            Query<FixedDepositHistory> query = session3.createQuery("FROM FixedDepositHistory WHERE customer.id = :accNo", FixedDepositHistory.class);
            query.setParameter("accNo", accNo);
            return query.getResultList(); // Get the list
            
        } catch (Exception e) {
            e.printStackTrace(); // Handle exception properly (use logging in real applications)
            return new ArrayList<>();
        } 
        
    }

   
    
    
}
