<%--
  Created by IntelliJ IDEA.
  User: GRAM
  Date: 2022-05-27
  Time: 오후 5:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<link href="/resources/css/headers.css" rel="stylesheet">
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="container">
    <header class="d-flex flex-wrap justify-content-center py-3 mb-4 border-bottom">
        <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-dark text-decoration-none">
            <svg class="bi me-2" width="40" height="32"><use xlink:href="#bootstrap"/></svg>
            <span class="fs-4">MemberBoard</span>
        </a>

        <ul class="nav nav-pills">
            <li class="nav-item"><a href="/member/save" class="nav-link active" aria-current="page">회원가입</a></li>
            <li class="nav-item"><a href="/member/login" class="nav-link ">로그인</a></li>
            <li class="nav-item"><a href="/board/findAll" class="nav-link">글 목록</a></li>
        </ul>
    </header>
</div>

<div class="container">
    <table class="table">
        <tr>
            <th>글번호</th>
            <th>작성자</th>
            <th>조회수</th>
            <th>작성일자</th>
        </tr>

        <tr>
            <td>${boardDTO.id}</td>
            <td>${boardDTO.boardWriter}</td>
            <td>${boardDTO.boardHits}</td>
            <td>${boardDTO.boardCreatedDate}</td>
        </tr>

        <tr>
            <th>제목</th>
            <td colspan="3">${boardDTO.boardTitle}</td>
        </tr>
        <tr>
        </tr>
        <tr>
            <th>내용</th>
            <td rowspan="3" colspan="3" width="50px" style="word-break: break-all">${boardDTO.boardContents}</td>
        </tr>
        <tr></tr>
        <tr></tr>
    </table>
</div>

</body>

</html>
