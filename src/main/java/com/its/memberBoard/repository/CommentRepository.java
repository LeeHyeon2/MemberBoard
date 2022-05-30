package com.its.memberBoard.repository;

import com.its.memberBoard.dto.CommentDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CommentRepository {
    @Autowired
    public SqlSessionTemplate sql;
    public void save(CommentDTO commentDTO) {
        sql.insert("Comment.save",commentDTO);
    }


    public List<CommentDTO> findAll(int id) {
        return sql.selectList("Comment.findAll",id);
    }

    public void delete(int id) {
        sql.delete("Comment.delete",id);
    }

    public int boardId(int id) {
        return sql.selectOne("Comment.boardId",id);
    }
}
