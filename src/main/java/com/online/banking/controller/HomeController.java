package com.online.banking.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.online.banking.entity.Customer;
import com.online.banking.hm.HibernateManager;


@Controller
public class HomeController {
    
    private Customer c;
    private int status;
    private HibernateManager hm = new HibernateManager();
    
    @RequestMapping("/")
    public String loginPage() {
        return "index";
    }
    
    @RequestMapping("/Login")
    public String signIn(){
        return "login";
    }
        
    @RequestMapping("/Register")
    public String registerCustomer() {
        return "register";
    }

    @RequestMapping("/Forgot")
    public String forgotPassword() {
        return "forgotPassword";
    }
    
    @RequestMapping(value = "/RegisterCustomer", method=RequestMethod.POST)
    public String RegisterCustomer(@RequestParam("firstName") String firstName,
            @RequestParam("lastName") String lastName,
            @RequestParam("email") String email,
            @RequestParam("mobileNumber") String mobileNumber,
            @RequestParam("gender") String gender,
            @RequestParam("address") String address,
            @RequestParam("work") String work,
            @RequestParam("aadhaarNum") String aadhaarNum,
            @RequestParam("panNum") String panNum)
            
    {
        c = new Customer(firstName, lastName, email, mobileNumber, gender, address, work, aadhaarNum, panNum);
        status = hm.insertCustomer(c);
        if(status == 1) {
            return "forgotPassword";
        }
        return "errorMessage";
    }
    
    @RequestMapping("/**")
    public String notFound() {
        return "errorMessage";
    }
     
    @RequestMapping(value = "/ForgotPassword", method=RequestMethod.POST)
    public String requestMethodName(@RequestParam("email") String email,
            @RequestParam("npassword") String npassword,
            @RequestParam("cpassword") String cpassword,
            Model model)
    {
        status = hm.updatePassword(email, npassword, cpassword);
        if(status == -1)
        {
            model.addAttribute("notMatchedPwd", "Register Now");
            return "forgotPassword";
        }
        else if(status == 0){
            model.addAttribute("notMatchedPwd", "Confirm Password Not Matched");
            return "forgotPassword";
        }
        else if(status == 1) {
            return "login";
        }
        else if(status == 2) {
            model.addAttribute("notMatchedPwd", "Password must include uppercase letters, lowercase letters, numbers, special characters, and no spaces");
            return "forgotPassword";
        }
        else
        {
            model.addAttribute("notMatchedPwd", "Password should contain more than 6 characters");
            return "forgotPassword";
        }
    }
    
    @RequestMapping(value = "/LoginForm", method=RequestMethod.POST)
    public String homePageWithLogin(@RequestParam("username") String email, @RequestParam("password") String password, Model model, HttpSession session) {
        status = hm.loginSuccess(email, password);
        Customer customer = hm.getCustomer(email);
        if(status == 1)
        {
            session.setAttribute("customer", customer); // Store in session
            return "homeWithLogin";
        }
        else if(status == 0) {
            model.addAttribute("notMatchedEmail", "Password Not Matched");
            return "login";
        }
        else {
            model.addAttribute("notMatchedEmail", "Register Now");
            return "login";            
        }
    }
    
    
    
    @GetMapping("/Home")
    public String homePages(HttpSession session) {
        Customer c = (Customer) session.getAttribute("customer");
        if (c != null) {
            return "homeWithLogin";
        } else {
            return "homeWithoutLogin";
        }
    }

    @GetMapping("/Index")
    public String indexPage() {
        return "index";
    }
    
    @RequestMapping("/Logout")
    public String logout(HttpSession session) {
        if(session != null)
        {
            session.removeAttribute("customer");
            session.invalidate(); // Clear session
        }
        return "redirect:/";
    }
    
    @RequestMapping("/Profile")
    public String profilePage() {
        return "profile";
    }
    
    @RequestMapping(value = "/EditCustomer", method=RequestMethod.POST)
    public String editedCustomer(@RequestParam("accNo") String accNo,
            @RequestParam("firstName") String firstName,
            @RequestParam("lastName") String lastName,
            @RequestParam("email") String email,
            @RequestParam("mobileNumber") String mobileNumber,
            @RequestParam("gender") String gender,
            @RequestParam("address") String address,
            @RequestParam("work") String work
            )
    {
        int acNo;
        try {
            acNo = Integer.parseInt(accNo);
            status = hm.updateProfile(acNo, firstName, lastName, email, mobileNumber, gender, address, work);
            if(status == 1) {
                return "homeWithLogin";
            }
            else{
                return "errorMessage";
            }
        } catch (NumberFormatException e) {
            return "errorMessage";
        }
    }

    
    
}
