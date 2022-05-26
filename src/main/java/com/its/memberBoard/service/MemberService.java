package com.its.memberBoard.service;

import com.its.memberBoard.dto.MemberDTO;
import com.its.memberBoard.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

@Service
public class MemberService {
    @Autowired
    public MemberRepository memberRepository;
    public void save(MemberDTO memberDTO) throws IOException {
        /**
         1. DTO 객체에 담길 파일을 꺼냄.
         2. 파일의 이름을 가져옴.
         2.1. 파일 이름 중복을 피하기 위한 조치
         3. 파일 이름을 DTO 객체의 boardFileName에 저장
         4. 파일의 저장위치 지정.
         5. 파일 저장처리
         6. DTO 객체 repository로 전달
         */
        MultipartFile memberFile = memberDTO.getMemberFile();
        String memberProfile = memberFile.getOriginalFilename(); //1,2
        memberProfile = System.currentTimeMillis() + "-" + memberProfile; // 2.1
        memberDTO.setMemberProfile(memberProfile); // 3
        String savePath = "C:\\spring_img\\" + memberProfile; //4
        //5
        if(!memberFile.isEmpty()){
            memberFile.transferTo(new File(savePath));
        }
        memberRepository.save(memberDTO);
    }

    public String duplicateCheck(String memberId) {
        String duplicateCheck = memberRepository.duplicateCheck(memberId);
        if(duplicateCheck == null){
            return "ok";
        }else{
            return "no";
        }
    }
}
