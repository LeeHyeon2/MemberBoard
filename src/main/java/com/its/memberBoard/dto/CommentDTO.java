package com.its.memberBoard.dto;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class CommentDTO {
    private int id;
    private String commentWriter;
    private String commentContents;
    private int boardId;
    private Timestamp commentCreatedDate;
}
