package com.online.banking.controller;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.online.banking.entity.Customer;
import com.online.banking.entity.TransactionHistory;
import com.online.banking.hm.TransactionHiberManager;

@Controller
public class TransactionController {
    private static int status;
    private static  TransactionHiberManager thm = new TransactionHiberManager();
    
        
    @RequestMapping("/CheckBalance")
    public String checkAmount(HttpSession session) {
        return "checkBalance";
    }
    
    @RequestMapping("/TransferMoney")
    public String transferMoneySearch() {
        return "transferMoneySearch";
    }
    
    @RequestMapping("/SearchAccountNumber")
    public String searchAccountNumber(@RequestParam("checkAccNo") String accNo, Model model, HttpSession session) {
        int accNum = Integer.parseInt(accNo);
        Customer cst = thm.searchedAccountNumber(accNum);
        if(cst != null)
        {
//            model.addAttribute("toDetails", cst);
            session.setAttribute("ToCustomer", cst);
            return "sendMoneyToAccount";
        }
        model.addAttribute("toAccNotFound", "Account Not Found");
        return "transferMoneySearch";
    }
    
    
    @RequestMapping(value="/TransferredMoneyToAnotherAccount", method=RequestMethod.POST)
    public String transferredMoney(@RequestParam("fromAccNo") String fromAccNo,
            @RequestParam("fromName") String fromName,
            @RequestParam("toAccNo") String toAccNo,
            @RequestParam("toName") String toName,
            @RequestParam("toMobile") String toMobile,
            @RequestParam("amount") String amountt,
            @RequestParam("password") String password,
            HttpSession session,
            Model model
            )
    {
        int fromAcc = Integer.parseInt(fromAccNo);
        int toAcc = Integer.parseInt(toAccNo);
        double amount = Double.parseDouble(amountt);
        int status1 = thm.verifyPasswordAndAmount(fromAcc, password, amount); // fromName, toAcc, toName, amount, fromAcc
        if(status1 == 1)
        {
            int toStatus = thm.addAmount(toAcc, amount);
            int fromStatus = thm.subtractAmount(fromAcc, amount);
            if(fromStatus==1 && toStatus==1)
            {
                Customer customer = (Customer) session.getAttribute("customer");
                status = thm.insertTransactionHistory(fromName, toAcc, toName, toMobile, amount, customer);
                if(status == 1) {
                    Customer updatedCustomer = thm.getParticularCustomer(fromAcc);
                    session.setAttribute("customer",updatedCustomer);
                    return "successTransfer";
                }
                return "errorMessage";
            }
            return "errorMessage";
        }
        else if(status1 == 0)
        {
            model.addAttribute("wrongPwdandBalance", "Wrong Password");
            return "sendMoneyToAccount";
        }
        else if(status1 == -1) {
            model.addAttribute("wrongPwdandBalance", "Your Account have not sufficient Amount!!!");
            return "sendMoneyToAccount";
        }
        return "redirect:/Home";
    }
    
    
    @RequestMapping("/TransferredMoneyHistory")
    public String transferredHistory(HttpSession session) {
        Customer c = (Customer)session.getAttribute("customer");
        int accNo = c.getAccNo();
        List<TransactionHistory> transHisList = thm.transferredHistory(accNo);
        Collections.sort(transHisList, Comparator.comparing(TransactionHistory::getDate).reversed());
        session.setAttribute("transHisList", transHisList);
        return "transferredHistory";
       
    }
    
    
    @RequestMapping("/ReceivedMoneyHistory")
    public String receivedHistory(HttpSession session) {
        Customer c = (Customer)session.getAttribute("customer");
        int accNo = c.getAccNo();
        List<TransactionHistory> recHisList = thm.receivedHistory(accNo);
        Collections.sort(recHisList, Comparator.comparing(TransactionHistory::getDate).reversed());
        session.setAttribute("recHisList", recHisList);
        return "receivedHistory";
    }
    
   
}







