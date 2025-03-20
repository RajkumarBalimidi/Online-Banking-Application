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

public class LoanHiberManager {
    
    private Transaction transaction = null;
    private Session session2;
    public LoanHiberManager() {
        session2 = new Configuration()
            .configure()
            .addAnnotatedClass(Customer.class)
            .addAnnotatedClass(TransactionHistory.class)
            .addAnnotatedClass(LoanHistory.class)
            .addAnnotatedClass(PaidLoanHistory.class)
            .addAnnotatedClass(FixedDepositHistory.class)
            .buildSessionFactory()
            .openSession();
    } 

    public List<LoanHistory> getLoanHistoryByAccNo(int accNum) {
       
        List<LoanHistory> loanHisList = null;
        try {
            transaction = session2.beginTransaction();

            // Use a parameterized query to avoid SQL injection
            Query<LoanHistory> query = session2.createQuery(
                "from LoanHistory where customer1.accNo = :accNum", LoanHistory.class);
            query.setParameter("accNum", accNum);

            loanHisList = query.getResultList();

            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session2.close();
        }
        return loanHisList;
    }
    
    
    public LoanHistory getLoanHistoryByLoanId(int lid) {
        LoanHistory lHis = session2.find(LoanHistory.class, lid);
        if(lHis != null && lHis.getPaidLoan() != lHis.getTotalLoanAmount()) {
           return lHis;
        }
        return null;
    }
    
    public int paidLoanSuccess(String holderName, double amount, String password, Customer customer, LoanHistory loanHistory) {
        try {
            if(customer != null)
            {
                if(loanHistory != null)
                {
                    if(password.equals(customer.getPassword()))
                    {
                        if(amount <= customer.getAmount())
                        {
                            try {
                                
                                transaction = session2.beginTransaction();
                                customer.setAmount(customer.getAmount()-amount);
                                session2.merge(customer);
                                loanHistory.setPaidLoan(loanHistory.getPaidLoan()+amount);
                                loanHistory.setRemainingLoan(loanHistory.getRemainingLoan()-amount);
                                session2.merge(loanHistory);
                                PaidLoanHistory plHis = new PaidLoanHistory(holderName, amount);
                                plHis.setCustomer(customer);
                                plHis.setLoanHistory(loanHistory);
                                session2.persist(plHis);
                                transaction.commit();
                                return 1;
                            }
                            catch(Exception f) {
                                if(transaction != null) {
                                    transaction.rollback();
                                }
                                f.printStackTrace();
                                return -1;
                            }
                        }
                        return 2;
                    }
                    return 0;
                }
                return -1;
            }
            return -1;
        }
        catch(Exception e) {
            e.printStackTrace();
            return -1;
        }
    }
    

    public List<PaidLoanHistory> paidLoanHistoryDisplay(int loanId){
        try {
            Query<PaidLoanHistory> query = session2.createQuery(
                "from PaidLoanHistory where loanHistory.id = :loanId", PaidLoanHistory.class);
            query.setParameter("loanId", loanId);

            return query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
            return new ArrayList<>();
        }
    }
 
}
