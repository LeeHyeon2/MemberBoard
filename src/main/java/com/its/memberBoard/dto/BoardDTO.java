package com.its.memberBoard.dto;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

@Data
public class BoardDTO {
    private int id;
    private String boardTitle;
    private String boardWriter;
    private String boardContents;
    private int boardHits;
    private String boardCreatedDate;
    private MultipartFile boardFile; // saveFile.jsp 에서 컨트롤러로 넘어올 때 파일을 담아오는 용도
    private String boardFileName; // 상세조회 등을 할 때 파일 이름을 담을 용도
}
