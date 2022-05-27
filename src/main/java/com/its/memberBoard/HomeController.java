package com.its.memberBoard;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;

@Controller
public class HomeController {
    @GetMapping("/")
    public String index(){
        return "index";
    }
    @GetMapping("/main")
    public String main(HttpSession session){
        if(session.getAttribute("loginMemberId").equals("admin")){
            return "/member/admin";
        }
        return "main";
    }
}
