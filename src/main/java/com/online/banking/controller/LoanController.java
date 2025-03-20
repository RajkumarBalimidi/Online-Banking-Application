package com.online.banking.controller;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.online.banking.entity.Customer;
import com.online.banking.entity.LoanHistory;
import com.online.banking.entity.PaidLoanHistory;
import com.online.banking.hm.LoanHiberManager;

@Controller
public class LoanController {
    
    private static LoanHiberManager lhm = new LoanHiberManager();
    private static int status;
    
    @RequestMapping("/Loan")
    public String loanHistory() {
        return "loanHistory";
    }
    
    @RequestMapping("/PayLoanNow") 
    public String payLoanAmount(int lid, HttpSession session, Model model) {
        
        LoanHistory lHis = lhm.getLoanHistoryByLoanId(lid);
        if(lHis != null)
        {
            session.setAttribute("loanId", lHis);
            return "payLoanNow";
        }
        else {
            model.addAttribute("loanCleared", "Loan Cleared");
            return "loanHistory";
        }
    }
    
    @RequestMapping("/PayLoan")
    public String payLoan(
            @RequestParam("holderName") String holderName,
            @RequestParam("payAmount") String payAmount,
            @RequestParam("password") String password,
            HttpSession session,
            Model model
            )
    {
        LoanHistory loanHistory = (LoanHistory) session.getAttribute("loanId");
        Customer customer = (Customer) session.getAttribute("customer");
        double amount = Double.parseDouble(payAmount);
        status = lhm.paidLoanSuccess(holderName, amount, password, customer, loanHistory);
        if(status == 0) {
            model.addAttribute("loanPayPwd", "Password Not Matched");
            return "payLoanNow";
        }
        else if(status == 2) {
            model.addAttribute("loanPayPwd", "Sufficient Amount Not Found");
            return "payLoanNow";
        }
        else if(status == 1) {
            return "successLoanPaid";
        }
        else {
            return "errorMessage";
        }
    }

    
    @RequestMapping("/ViewLoanPaidHistory")
    public String loanPaidHistory(@RequestParam("lid") int loanId, HttpSession session) {
        List<PaidLoanHistory> paidLoanHisList = (List<PaidLoanHistory>) lhm.paidLoanHistoryDisplay(loanId);
        Collections.sort(paidLoanHisList, Comparator.comparing(PaidLoanHistory::getDate).reversed());
        if(paidLoanHisList != null) {
            session.setAttribute("paidLoanHisList", paidLoanHisList);
            return "loanPaidHistory";
        }
        return "errorMessage";
    }
    
    
    
}
