<%--
  Created by IntelliJ IDEA.
  User: GRAM
  Date: 2022-05-27
  Time: 오후 6:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="container">
    <form action="/board/update?id=${boardDTO.id}" method="post" name="updateForm">
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
                <td colspan="3"><input type="text" id="boardTitle" name="boardTitle" value="${boardDTO.boardTitle}"></td>
            </tr>
            <tr>
            </tr>
            <tr>
                <th>내용</th>
                <td rowspan="3" colspan="3" width="50px" style="word-break: break-all"><textarea id="boardContents" name="boardContents" rows="10" cols="50">${boardDTO.boardContents}</textarea></td>
            </tr>
            <tr></tr>
            <tr></tr>
        </table>
        <input class="btn btn-primary" type="button" onclick="update()" value="수정">
    </form>
</div>
</body>
<script>
    function update(){
        let title = document.getElementById("boardTitle").value;
        let contents = document.getElementById("boardContents").value;
        if(title == ""){
            alert("제목을 입력해주세요!!");
        }else{
            if(contents == ""){
                alert("내용을 입력해주세요!!");
            }else{
                alert("수정 완료!!");
                updateForm.submit();
            }
        }
    }
</script>
</html>
