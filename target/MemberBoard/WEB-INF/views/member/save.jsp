<%--
  Created by IntelliJ IDEA.
  User: GRAM
  Date: 2022-05-26
  Time: 오후 2:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<html>
<head>
    <script src="/resources/jquery/jquery.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <style>
        input{
            display: block;
        }
    </style>
    <title>save.jsp</title>
</head>
<body>
<div class="container">
    <h2 class="display-4 fw-normal">회원가입</h2>
    <div class="py-5 text-center">
        <form action="/member/save" method="post" name="saveForm" enctype="multipart/form-data">
            <input class="form-control mb-2" type="text" onblur="duplicateCheck()" id="memberId" name="memberId"  placeholder="아이디(필수입력)">
            <span id="dup-check-result"></span>
            <input class="form-control mb-2" type="text" id="pw" name="memberPassword" placeholder="4~12자 영문,숫자 입력(필수 입력)">
            <input class="form-control mb-2" type="text" id="pwChecked" placeholder="비밀번호 확인(필수입력)" >
            <input class="form-control mb-2" type="text" id="name" name="memberName" placeholder="이름(필수입력)">
            <input class="form-control mb-2" type="text" id="email" name="memberEmail" placeholder="이메일(필수입력)">
            <input class="form-control mb-2" type="text" id="mobile" name="memberMobile" placeholder="전화번호">
            <input type="file" name="memberFile">
            <input class="btn btn-primary" type="button" onclick="save()" value="가입">
        </form>
    </div>
</div>
</body>
<script>
    let saveCheck = 0;
    const duplicateCheck = () => {
        const memberId = document.getElementById("memberId").value;
        const checkResult = document.getElementById("dup-check-result");
        $.ajax({
            type: "post", // http request method
            url: "/member/duplicateCheck", // 요청주소(컨트롤러 주소값)
            data: {"memberId": memberId}, // 전송하는 파라미터
            dataType: "text",
            success: function (result){
                if(result == "ok"){
                    checkResult.style.color = "green";
                    checkResult.innerHTML = "가입가능 합니다!"
                    saveCheck = 1;
                }else{
                    checkResult.style.color = "red";
                    checkResult.innerHTML = "중복된 아이디 입니다.";
                    saveCheck = 0;
                }
            },
            error: function (){
                alert("실패")
            }
        })
    }
    const save = () => {
        const pw = document.getElementById("pw").value;
        const pwCheck = document.getElementById("pwChecked").value;
        const name = document.getElementById("name").value;
        const email = document.getElementById("email").value;
        let passwordCheck = /^[A-Za-z0-9]{4,12}$/; // 비밀번호 정규식
        let emailCheck = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; //이메일 정규식

        if(saveCheck==1){
            if(!passwordCheck.test(pw)){
                alert("비밀번호 형식을 맞춰주세요")
            }else{
                if (pw==pwCheck){
                    if(name==""){
                        alert("이름을 입력해주세요.")
                    }else{
                        if(email==""){
                            alert("이메일을 입력해주세요")
                        }else if(!emailCheck.test(email)){
                            alert("이메일 형식을 맞춰주세요")
                        }else{
                            alert("가입이 완료되었습니다.")
                            saveForm.submit();
                        }
                    }
                }else{
                    alert("비밀번호가 일치하지 않습니다.")
                }
            }
        }else {
            alert("아이디를 확인해주세요")
        }
    }

</script>
</html>
