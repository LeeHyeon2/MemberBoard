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


}
