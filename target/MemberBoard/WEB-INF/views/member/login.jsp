<%--
  Created by IntelliJ IDEA.
  User: GRAM
  Date: 2022-05-27
  Time: 오전 8:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <style>
        header{
            display:flex;
            justify-content: center;
        }
        form{
            padding:10px;
        }
        .input-box{
            position:relative;
            margin:10px 0;
        }
        .input-box > input{
            background:transparent;
            border:none;
            border-bottom: solid 1px #ccc;
            padding:20px 0px 5px 0px;
            font-size:14pt;
            width:100%;
        }
        input::placeholder{
            color:transparent;
        }
        input:placeholder-shown + label{
            color:#aaa;
            font-size:14pt;
            top:15px;

        }
        input:focus + label, label{
            color:#8aa1a1;
            font-size:10pt;
            pointer-events: none;
            position: absolute;
            left:0px;
            top:0px;
            transition: all 0.2s ease ;
            -webkit-transition: all 0.2s ease;
            -moz-transition: all 0.2s ease;
            -o-transition: all 0.2s ease;
        }

        input:focus, input:not(:placeholder-shown){
            border-bottom: solid 1px #8aa1a1;
            outline:none;
        }
        input[type=submit]{
            background-color: #8aa1a1;
            border:none;
            color:white;
            border-radius: 5px;
            width:100%;
            height:35px;
            font-size: 14pt;
            margin-top:100px;
        }
        #forgot{
            text-align: right;
            font-size:12pt;
            color:rgb(164, 164, 164);
            margin:10px 0px;
        }
    </style>
    <meta name="viewport" content="width=device-width, height=device-height, minimum-scale=1.0, maximum-scale=1.0, initial-scale=1.0">
</head>
<body>
<header>
    <h2>Login</h2>
</header>
<form action="/member/login" method="POST">

    <div class="input-box">
        <input id="memberId" type="text" name="memberId" placeholder="아이디">
        <label for="memberId">아이디</label>
    </div>

    <div class="input-box">
        <input id="memberPassword" type="password" name="memberPassword" placeholder="비밀번호">
        <label for="memberPassword">비밀번호</label>
    </div>
    <input type="submit" value="로그인">
</form>

</body>
<script>
    let loginResult = "";
    loginResult = '${msg}';
    if(loginResult == "fail"){
        alert("아이디 혹은 비밀번호가 다릅니다!!")
    }
</script>
</html>