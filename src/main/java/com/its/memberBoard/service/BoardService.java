package com.its.memberBoard.service;

import com.its.memberBoard.dto.BoardDTO;
import com.its.memberBoard.dto.PageDTO;
import com.its.memberBoard.repository.BoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class BoardService {
    @Autowired
    public BoardRepository boardRepository;

    public void save(BoardDTO boardDTO) throws IOException {
        MultipartFile boardFile = boardDTO.getBoardFile(); // 1.
        String boardFileName = boardFile.getOriginalFilename(); // 2.
        boardFileName = System.currentTimeMillis() + "-" + boardFileName; // 2.1.
        boardDTO.setBoardFileName(boardFileName); // 3.
        String savePath = "C:\\spring_img\\" + boardFileName; // 4.
        //5.
        if(!boardFile.isEmpty()){
            boardFile.transferTo(new File(savePath));
        }else{
            boardDTO.setBoardFileName(null);
        }
        boardRepository.saveFile(boardDTO); // 6.
    }

    public List<BoardDTO> findAll() {
        return boardRepository.findAll();
    }

    private static final int PAGE_LIMIT = 5; // 한 페이지에 보여줄 글 갯수
    private static final int BLOCK_LIMIT = 5; // 페이지 버튼의 갯수
    public List<BoardDTO> pagingList(int page) {
        int pagingStart = (page-1) * PAGE_LIMIT;
        Map<String, Integer> pagingParam = new HashMap<>();
        pagingParam.put("start", pagingStart);
        pagingParam.put("limit", PAGE_LIMIT);
        List<BoardDTO> pagingList = boardRepository.pagingList(pagingParam);
        return pagingList;
    }

    public PageDTO paging(int page) {
        // 필요한 전체 페이지의 갯수
        int boardCount = boardRepository.boardCount();
        // 시작페이2지 = 1 7 6 10
        int maxPage = (int)(Math.ceil((double)boardCount / PAGE_LIMIT));
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

    public BoardDTO findById(int id) {
        return boardRepository.findById(id);
    }

    public void delete(int id) {
        boardRepository.delete(id);
    }

    public void update(BoardDTO boardDTO) {
        boardRepository.update(boardDTO);
    }
}
