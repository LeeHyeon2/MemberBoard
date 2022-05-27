<%--
  Created by IntelliJ IDEA.
  User: GRAM
  Date: 2022-05-27
  Time: 오후 6:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<html>
<head>
</head>
<body>
<jsp:include page="../layout/adminHeader.jsp" flush="false"></jsp:include>
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
    <c:if test="${sessionScope.loginMemberId eq boardDTO.boardWriter}">
        <input class="btn btn-primary" type="button" onclick="update()" value="수정">
    </c:if>
    <input class="btn btn-primary" type="button" onclick="delete1()" value="삭제">
</div>
</body>
<script>
    const update = () => {
        location.href = "/board/update?id="+'${boardDTO.id}';
    }
    function delete1(){
        alert("글이 삭제되었습니다!")
        location.href = "/board/delete?id="+'${boardDTO.id}';
    }
</script>
</html>
