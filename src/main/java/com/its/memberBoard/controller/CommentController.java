package com.its.memberBoard.controller;

import com.its.memberBoard.dto.CommentDTO;
import com.its.memberBoard.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/comment")
public class CommentController {
    @Autowired
    public CommentService commentService;

    @GetMapping("/save")
    public String save(@ModelAttribute CommentDTO commentDTO, HttpSession session){
        commentService.save(commentDTO);

        return "redirect:/board/detail?id=" + commentDTO.getBoardId();
    }

    @GetMapping("/delete")
    public String delete(int id){
        int boardId = commentService.boardId(id);
        commentService.delete(id);

        return "redirect:/board/detail?id=" + boardId ;
    }

    @GetMapping("/update")
    public String updateForm(@ModelAttribute CommentDTO commentDTO){
        int boardId = commentService.boardId(commentDTO.getId());
        commentService.update(commentDTO);

        return "redirect:/board/detail?id=" + boardId;
    }
}
