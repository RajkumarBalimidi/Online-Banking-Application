package com.online.banking.hm;

import java.util.ArrayList;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.online.banking.entity.Customer;
import com.online.banking.entity.FixedDepositHistory;
import com.online.banking.entity.LoanHistory;
import com.online.banking.entity.PaidLoanHistory;
import com.online.banking.entity.TransactionHistory;

public class HibernateManager {
    private static Transaction transaction = null;
    private static Session session1;
    private static ArrayList<Customer> customerList;
    public HibernateManager() 
    {
        session1 = new Configuration().
        configure().
        addAnnotatedClass(Customer.class).
        addAnnotatedClass(TransactionHistory.class).
        addAnnotatedClass(LoanHistory.class).
        addAnnotatedClass(PaidLoanHistory.class).
        addAnnotatedClass(FixedDepositHistory.class).
        buildSessionFactory().
        openSession();
    }
    public int insertCustomer(Customer c)
    {
        session1.beginTransaction();
        session1.persist(c);
        session1.getTransaction().commit();
        return 1;
    }
    
    public Customer getCustomer(String email)
    {
        customerList = (ArrayList<Customer>) session1.createQuery("from Customer where email='"+email+"'").list();
        for(Customer customer : customerList)
        {
            return customer;
        }
        return null;
    }
    
    public int updatePassword(String email, String nPassword, String cPassword)
    {
        Customer c = getCustomer(email);
        if(c != null)
        {
            if(nPassword.equals(cPassword))
            {
                String s = nPassword;
                int specialChar = 0;
                int alphaLarge = 0;
                int alphaSmall = 0;
                int numbers = 0;
                int spaces = 0;
                if(s.length() >= 6){
                    for(int i=0;i<s.length();i++) {
                        char ch = s.charAt(i);
                        if(ch != ' '){
                            if(ch>='A' && ch<='Z'){
                                alphaLarge++;
                            }
                            else if(ch>='a' && ch<='z'){
                                alphaSmall++;
                            }
                            else if(ch>='0' && ch<='9'){
                                numbers++;
                            }
                            else{
                                specialChar++;
                            }
                        }
                        else{
                            spaces++;
                        }
                    }
                    if((spaces == 0) && (alphaLarge>=1 && alphaSmall>=1 && numbers>=1 && specialChar>=1)){
                        session1.beginTransaction();
                        c.setPassword(nPassword);
                        session1.persist(c);
                        session1.getTransaction().commit();
                        return 1;
                    }
                    else{
                        return 2;
                    }
                }
                else {
                    return 3;
                }
            }
            else
            {
                return 0;
            }
        }
        return -1;
    }
    
    public int loginSuccess(String email, String password) {
        Customer c = getCustomer(email);
        if(c != null){
            if(password.equals(c.getPassword())){
                return 1;
            }
            else{
                return 0;
            }
        }
        return -1;
    }
    
    public int updateProfile(int accNo, String firstName, String lastName, String email, String mobileNumber, String gender, String address, String work) {
        try {
            Customer c = session1.find(Customer.class, accNo);
            if(c != null)
            {
                c.setFirstName(firstName);
                c.setLastName(lastName);
                c.setEmail(email);
                c.setMobileNumber(mobileNumber);
                c.setGender(gender);
                c.setAddress(address);
                c.setWork(work);
                transaction = session1.beginTransaction();
                session1.persist(c);
                transaction.commit();
                return 1;
            }
            return 0;
        }
        catch(Exception e) {
            if(transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
            return 0;
        }
    }
    
       
    
   
}







