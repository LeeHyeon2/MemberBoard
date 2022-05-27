package com.its.memberBoard.controller;

import com.its.memberBoard.dto.BoardDTO;
import com.its.memberBoard.dto.PageDTO;
import com.its.memberBoard.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/board")
public class BoardController {
    @Autowired
    public BoardService boardService;


    @GetMapping("/save")
    public String saveForm(){
        return "/board/save";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute BoardDTO boardDTO,HttpSession session) throws IOException {
        boardService.save(boardDTO);
        if(session.getAttribute("loginMemberId").equals("admin")){
            return "/member/admin";
        }else{
            return "/main";
        }
    }

    @GetMapping("/findAll")
    public String findAll(@ModelAttribute BoardDTO boardDTO, Model model, HttpSession session ,@RequestParam(value="page", required=false, defaultValue="1") int page){
        List<BoardDTO> boardList = boardService.pagingList(page);
        PageDTO paging = boardService.paging(page);
        model.addAttribute("boardList", boardList);
        model.addAttribute("paging", paging);

        String sessionCheck = (String) session.getAttribute("loginMemberId");
        if(sessionCheck == null){
            return "findAll";
        }else if(sessionCheck.equals("admin")){
            return "/member/adminFindAll";
        }else{
            return "/member/myPageFindAll";
        }
    }

    @GetMapping("/detail")
    public String detail(@RequestParam("id") int id , Model model ,HttpSession session){
        BoardDTO boardDTO = boardService.findById(id);
        model.addAttribute("boardDTO",boardDTO);
        String sessionCheck = (String) session.getAttribute("loginMemberId");
        if(sessionCheck == null){
            return "detail";
        }else if(sessionCheck.equals("admin")){
            return "/member/adminDetail";
        }else{
            return "/member/myPageDetail";
        }
    }

    @GetMapping("/delete")
    public String delete(@RequestParam("id") int id , HttpSession session){
        boardService.delete(id);
        return "redirect:/board/findAll";
    }

    @GetMapping("/update")
    public String updateForm(@RequestParam("id") int id , Model model ){
        BoardDTO boardDTO = boardService.findById(id);
        model.addAttribute("boardDTO",boardDTO);
        return "/board/update";
    }

    @PostMapping("update")
    public String update(@ModelAttribute BoardDTO boardDTO){
        System.out.println("boardDTO = " + boardDTO);
        boardService.update(boardDTO);
        return "redirect:/board/findAll";
    }
}
