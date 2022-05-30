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

    </style>
    <title>Title</title>
</head>
<body>
<jsp:include page="../layout/mainHeader.jsp" flush="false"></jsp:include>
<div class="container">
    <table class="table">
        <tr><th>글 작성</th></tr>
        <form action="/board/save" method="post" name="saveForm" enctype="multipart/form-data">
            <tr><th>작성자  <input style="border:none" type="text" id="writerName" value="${sessionScope.loginMemberName}" readonly></th></tr>
            <tr><th>ID  <input style="border:none" type="text" name="boardWriter" id="boardWriter" value="${sessionScope.loginMemberId}" readonly></th></tr>

            <tr><th>제목 입력</th></tr>
            <tr><td><input type="text" name="boardTitle" id="boardTitle" placeholder="제목"></td></tr>
            <tr><th>내용 입력</th></tr>
            <tr><td><textarea name="boardContents" id="boardContents" rows="5" cols="50" placeholder="내용"></textarea></td></tr>
            <tr><th colspan="2">첨부파일 <br> <input type="file" name="boardFile"> </th></tr>
            <tr><th><input class="btb btn-primary" type="button" value="제출" onclick="save()"></th></tr>
        </form>
    </table>
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
