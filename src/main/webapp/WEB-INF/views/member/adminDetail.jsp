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
    <div class="container">
        <table class="table">
            <tr><th>댓글 작성</th></tr>
            <tr>
                <form action="/comment/save" method="get" name="commentSave">
                    <input type="hidden" name="commentWriter" value="${sessionScope.loginMemberId}">
                    <input type="hidden" name="boardId" value="${boardDTO.id}">
                    <td><textarea name="commentContents" id="contents" cols="100" rows="5" placeholder="댓글을 달아주세요."></textarea>
                        <input class="btn btn-primary" type="button" onclick="comment()" value="등록"></td>
                </form>
            </tr>
            <c:forEach items="${commentList}" var="comment">
            <tr>
                <th>작성자 : ${comment.commentWriter}</th>
                <th>작성 시간 : ${comment.commentCreatedDate}</th>
            </tr>
            <tr>

                <c:if test="${sessionScope.loginMemberId ne boardDTO.boardWriter}">
                    <th>댓글내용 : <input type="text" style="border:none" value="${comment.commentContents}" readonly></th>
                    <td></td>
                </c:if>

                <c:if test="${sessionScope.loginMemberId eq boardDTO.boardWriter}">
                    <c:if test="${sessionScope.loginMemberId ne comment.commentWriter}">
                        <th>댓글내용 : <input style="border:none"  type="text" value="${comment.commentContents}" name="commentContents" readonly></th>
                        <td></td>
                    </c:if>

                    <form action="/comment/update" method="get">
                        <input type="hidden" name="id" value="${comment.id}">
                        <c:if test="${sessionScope.loginMemberId eq comment.commentWriter}">
                            <th>댓글내용 : <input type="text" value="${comment.commentContents}" name="commentContents"></th>
                            <td></td>
                            <td><input type="submit" onclick="commentUpdate()" value="수정"></td>
                        </c:if>
                    </form>
                </c:if>
                <td><input type="button" value="삭제" onclick="commentDelete(${comment.id})"></td>
            </tr>
            </c:forEach>
    </div>
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
    function comment(){
        let contents = document.getElementById("contents").value;
        if(contents == ""){
            alert("댓글내용을 입력해주세요!!")
        }else{
            commentSave.submit();
            alert("댓글이 등록되었습니다!!")
        }
    }
    const commentDelete = (i) => {
        alert("댓글이 삭제되었습니다.");
        location.href = "/comment/delete?id=" + i;
    }
    const commentUpdate = () => {
        alert("수정완료")
    }
</script>
</html>
