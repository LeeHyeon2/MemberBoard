package com.its.memberBoard.service;

import com.its.memberBoard.dto.MemberDTO;
import com.its.memberBoard.dto.PageDTO;
import com.its.memberBoard.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    public MemberDTO login(MemberDTO memberDTO) {
        return memberRepository.login(memberDTO);
    }

    public MemberDTO findById(int id) {
        return memberRepository.findById(id);
    }

    public void update(MemberDTO memberDTO) throws IOException {
        MultipartFile memberFile1 = memberDTO.getMemberFile();
        String memberProfile = memberFile1.getOriginalFilename(); //1,2
        memberProfile = System.currentTimeMillis() + "-" + memberProfile; // 2.1
        memberDTO.setMemberProfile(memberProfile); // 3
        String savePath = "C:\\spring_img\\" + memberProfile; //4
        //5
        if(!memberFile1.isEmpty()){
            memberFile1.transferTo(new File(savePath));
        }

        memberRepository.update(memberDTO);
    }


    private static final int PAGE_LIMIT = 5; // 한 페이지에 보여줄 글 갯수
    private static final int BLOCK_LIMIT = 3; // 페이지 버튼의 갯수
    public List<MemberDTO> findAll(int page) {
        int pagingStart = (page-1) * PAGE_LIMIT;
        Map<String, Integer> pagingParam = new HashMap<>();
        pagingParam.put("start", pagingStart);
        pagingParam.put("limit", PAGE_LIMIT);
        List<MemberDTO> pagingList = memberRepository.pagingList(pagingParam);

        return pagingList;
    }

    public PageDTO paging(int page) {
        // 필요한 전체 페이지의 갯수
        int memberCount = memberRepository.memberCount();
        int maxPage = (int)(Math.ceil((double)memberCount / PAGE_LIMIT));
        int startPage = (((int)(Math.ceil((double)page / BLOCK_LIMIT))) - 1) * BLOCK_LIMIT + 1;
        int endPage = startPage + BLOCK_LIMIT - 1;
        if(endPage > maxPage)
            endPage = maxPage;
        PageDTO paging = new PageDTO();
        paging.setPage(page);
        paging.setStartPage(startPage);
        paging.setEndPage(endPage);
        paging.setMaxPage(maxPage);
        return paging;
    }


}
