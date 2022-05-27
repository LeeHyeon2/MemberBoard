<%--
  Created by IntelliJ IDEA.
  User: GRAM
  Date: 2022-05-27
  Time: 오후 3:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<html>
<head>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
    <script src="/resources/jquery/jquery.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <style>
        input{
            display: block;
        }
    </style>
    <title>Title</title>
</head>
<body>
<jsp:include page="../layout/mainHeader.jsp" flush="false"></jsp:include>
<div class="container">
    <h2>글쓰기</h2>
        <form action="/board/save" method="post" name="saveForm" enctype="multipart/form-data">
            <input type="text" id="writerName" value="${sessionScope.loginMemberName}" readonly>
            <input type="text" name="boardWriter" id="boardWriter" value="${sessionScope.loginMemberId}" readonly>
            <input type="text" name="boardTitle" id="boardTitle" placeholder="제목">
            <textarea name="boardContents" id="boardContents" rows="5" cols="10" placeholder="내용"></textarea>
            <div>첨부파일</div>
            <input type="file" name="boardFile">
            <input type="button" value="제출" onclick="save()">
        </form>
</div>
</body>
<script>
    function save(){
        let title = document.getElementById("boardTitle").value;
        let contents = document.getElementById("boardContents").value;
        if(title == ""){
            alert("제목을 입력해주세요!!");
        }else{
            if(contents == ""){
                alert("내용을 입력해주세요!!");
            }else{
                alert("작성 완료!!");
                saveForm.submit();
            }
        }
    }
</script>
</html>
