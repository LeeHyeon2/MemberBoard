<%--
  Created by IntelliJ IDEA.
  User: GRAM
  Date: 2022-05-27
  Time: 오전 9:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<head>
    <script src="/resources/jquery/jquery.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <style>
        input{
            display: block;
        }
    </style>
    <title>myPageUpdate.jsp</title>
</head>
<body>
    <jsp:include page="../layout/myPageHeader.jsp" flush="false"></jsp:include>
    <div class="container">
        <div class="py-5 text-center">
            <h3>내 정보 수정</h3>
            <form action="/member/update" method="post" name="updateForm" enctype="multipart/form-data">
                <input class="form-control mb-2" type="text"  name="memberId"  value="${myDTO.memberId}" readonly>
                <input class="form-control mb-2" type="password" id="pw" name="memberPassword" placeholder="비밀번호를 입력해주세요">
                <input class="form-control mb-2" type="text" id="name" name="memberName" value="${myDTO.memberName}" placeholder="이름(변경)">
                <input class="form-control mb-2" type="text" id="email" name="memberEmail" value="${myDTO.memberEmail}" placeholder="이메일(변경)">
                <input class="form-control mb-2" type="text" name="memberMobile" value="${myDTO.memberMobile}" placeholder="전화번호(변경)">
                <h4 align="left">현재 프로필</h4>
                <div align="left"><img src="${pageContext.request.contextPath}/upload/${myDTO.memberProfile}" alt="" height="100" width="100"></div>

                <input class="mb-2" type="file" name="memberFile" value="${myDTO.memberProfile}">
                <div></div>
                <input class="btn btn-primary" type="button" onclick="passwordCheck()" value="변경">
            </form>
        </div>
    </div>
</body>
<script>
    const passwordCheck = () => {
        let checkPw = document.getElementById("pw").value;
        const memberPassword = '${myDTO.memberPassword}';

        if(checkPw != memberPassword){
            alert("비밀번호가 일치하지 않습니다!")
        }else{
            update()
        }
    }
    const update = () => {
        const name = document.getElementById("name").value;
        const email = document.getElementById("email").value;
        let emailCheck = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; //이메일 정규식

        if(name==""){
            alert("이름을 입력해주세요.")
        }else{
            if(email==""){
                alert("이메일을 입력해주세요")
            }else if(!emailCheck.test(email)){
                alert("이메일 형식을 맞춰주세요")
            }else{
                alert("수정 완료!!")
                updateForm.submit();
            }
        }
    }
</script>
</html>
