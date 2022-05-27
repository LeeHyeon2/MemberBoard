package com.its.memberBoard.controller;

import com.its.memberBoard.dto.MemberDTO;
import com.its.memberBoard.dto.PageDTO;
import com.its.memberBoard.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

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
            if(login.getMemberId().equals("admin")){
                model.addAttribute("login", login);
                session.setAttribute("loginMemberId", login.getMemberId());
                session.setAttribute("loginMemberPassword", login.getMemberPassword());
                session.setAttribute("loginMemberName", login.getMemberName());
                session.setAttribute("loginId", login.getId());
                return "member/admin";
            }else {
                model.addAttribute("login", login);
                session.setAttribute("loginMemberId", login.getMemberId());
                session.setAttribute("loginMemberPassword", login.getMemberPassword());
                session.setAttribute("loginMemberName", login.getMemberName());
                session.setAttribute("loginId", login.getId());
                return "main";
            }
        }else{
            model.addAttribute("msg","fail");
            return "/member/login";
        }
    }
    @GetMapping("/admin")
    public String admin(){
        return "/member/admin";
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

    @GetMapping("/myPageUpdate")
    public String myPageUpdateForm(@RequestParam("id") int id,Model model,HttpSession session){
        MemberDTO findById = memberService.findById(id);
        model.addAttribute("myDTO",findById);
        return "/member/myPageUpdate";
    }

    @PostMapping("/update")
    public String update(@ModelAttribute MemberDTO memberDTO) throws IOException {
        memberService.update(memberDTO);
        return "redirect:/member/myPage";
    }

    @GetMapping("/findAll")
    public String findAll(@RequestParam(value="page", required=false, defaultValue="1") int page, Model model){
        List<MemberDTO> memberDTOList = memberService.findAll(page);
        PageDTO paging = memberService.paging(page);
        model.addAttribute("memberList",memberDTOList);
        model.addAttribute("paging",paging);
        return "/member/findAll";
    }


}
