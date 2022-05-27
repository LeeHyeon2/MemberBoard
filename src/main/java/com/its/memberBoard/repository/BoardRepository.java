package com.its.memberBoard.repository;

import com.its.memberBoard.dto.BoardDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardRepository {
    @Autowired
    public SqlSessionTemplate sql;

    public void saveFile(BoardDTO boardDTO) {
        sql.insert("Board.save",boardDTO);
    }
}
