package com.its.memberBoard.dto;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

@Data
public class MemberDTO {
   private int id;
    private String memberId;
    private String memberPassword;
    private String memberName;
    private String memberEmail;
    private String memberMobile;
    private MultipartFile memberFile; // saveFile.jsp 에서 컨트롤러로 넘어올 때 파일을 담아오는 용도
    private String memberProfile; // 상세조회 등을 할 때 파일 이름을 담을 용도
}
