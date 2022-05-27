package com.its.memberBoard.controller;

import com.its.memberBoard.dto.MemberDTO;
import com.its.memberBoard.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
@RequestMapping("/member")
public class MemberController {

    @Autowired
    public MemberService memberService;

    @GetMapping("/save")
    public String saveForm(){
        return "/member/save";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute MemberDTO memberDTO) throws IOException {
        System.out.println("memberDTO = " + memberDTO);
        memberService.save(memberDTO);
        return "index";
    }

    @PostMapping("/duplicateCheck")
    public @ResponseBody String duplicateCheck(@RequestParam("memberId") String memberId){
        System.out.println("memberId = " + memberId);
        String check = memberService.duplicateCheck(memberId);
        System.out.println(check);
        return check ;
    }
    @GetMapping("/login")
    public String loginForm(){
        return "/member/login";
    }

    @PostMapping("/login")
    public String login(@ModelAttribute MemberDTO memberDTO, Model model , HttpSession session){
        MemberDTO login = memberService.login(memberDTO);
        if(login != null){
            model.addAttribute("login",login);
            session.setAttribute("loginMemberId",login.getMemberId());
            session.setAttribute("loginMemberPassword",login.getMemberPassword());
            session.setAttribute("loginMemberName",login.getMemberName());
            return "main";
        }else{
            return "redirect:/member/login";
        }
    }
    @GetMapping("/logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "index";
    }

    @GetMapping("/myPage")
    public String myPageForm(){
        return "/member/myPage";
    }
}
