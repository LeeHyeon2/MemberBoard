package com.its.memberBoard.service;

import com.its.memberBoard.dto.CommentDTO;
import com.its.memberBoard.repository.CommentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentService {
    @Autowired
    public CommentRepository commentRepository;
    public void save(CommentDTO commentDTO) {
        commentRepository.save(commentDTO);

    }


    public List<CommentDTO> findAll(int id) {
        return commentRepository.findAll(id);
    }

    public void delete(int id) {
        commentRepository.delete(id);
    }

    public int boardId(int id) {
        return commentRepository.boardId(id);
    }
}
