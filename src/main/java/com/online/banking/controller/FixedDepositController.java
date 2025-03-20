package com.online.banking.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.online.banking.entity.Customer;
import com.online.banking.hm.TransactionHiberManager;

@Controller
public class FixedDepositController {
    
    private static TransactionHiberManager thm= new TransactionHiberManager();
    
    @RequestMapping("/FixedDeposit")
    public String fixedDeptHis() {
        return "fixedDepositHistory";
    }
    
    @RequestMapping("/AddFixedDeposit")
    public String addFixedDeposit() {
        return "addFixedDeposit";
    }
    
    @RequestMapping("/AddFixedDepositMoney")
    public String successFixedDeposit(@RequestParam("accNo") String accNo,
            @RequestParam("fullName") String fullName,
            @RequestParam("mobileNumber") String mobileNumber,
            @RequestParam("nomineefullName") String nomineeFullName,
            @RequestParam("nomineemobileNumber") String nomineeMobileNumber,
            @RequestParam("nomineedateofbirth") String nomineeDOB,
            @RequestParam("tenure") String tenure,
            @RequestParam("aadhaarNum") String aadhaarNum,
            @RequestParam("panNum") String panNum,
            @RequestParam("amount") String amount,
            @RequestParam("password") String password,
            HttpSession session,
            Model model
            )
    {
        int accNum = Integer.parseInt(accNo);
        int tenuree = Integer.parseInt(tenure);
        double amountFD = Double.parseDouble(amount);
        int status = thm.openFixedDeposit(accNum, fullName, mobileNumber, nomineeFullName, nomineeMobileNumber, nomineeDOB, tenuree, aadhaarNum, panNum, amountFD, password);
        Customer customer = (Customer) session.getAttribute("customer");
        if(status == 1) {
            Customer updatedCustomer = thm.getParticularCustomer(accNum);
            session.setAttribute("customer",updatedCustomer);
            return "successFixedDeposit";
        }
        else if(status == -1) {
            model.addAttribute("noOneMatched", "Aadhaar number not matched");
            return "addFixedDeposit";
        }
        else if(status == -2) {
            model.addAttribute("noOneMatched", "Password not matched");
            return "addFixedDeposit";
        }
        else if(status == -3) {
            model.addAttribute("noOneMatched", "Sufficient amount not available in your Account");
            return "addFixedDeposit";
        }
        else if(status == -4) {
            model.addAttribute("noOneMatched", "PAN number is empty in your profile");
            return "addFixedDeposit";
        }
        else if(status == -5) {
            model.addAttribute("noOneMatched", "PAN number not matched");
            return "addFixedDeposit";
        }
        else if(status == -6) {
            model.addAttribute("noOneMatched", "PAN number should not be Empty");
            return "addFixedDeposit";
        }
        else
        {
            return "errorMessage";
        }
    }
    
    
}
