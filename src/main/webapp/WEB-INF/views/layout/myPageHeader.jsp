<%--
  Created by IntelliJ IDEA.
  User: GRAM
  Date: 2022-05-23
  Time: 오후 3:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<html>
<head>
    <link href="/resources/css/headers.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <header class="d-flex flex-wrap justify-content-center py-3 mb-4 border-bottom">
        <a href="/member/myPage" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-dark text-decoration-none">
            <svg class="bi me-2" width="40" height="32"><use xlink:href="#bootstrap"/></svg>
            <span class="fs-4">MyPage</span>
        </a>

        <ul class="nav nav-pills">
            <li class="nav-item"><a href="/member/myPageUpdate?id=${sessionScope.loginId}" class="nav-link active" aria-current="page">내 정보(수정)</a></li>
            <li class="nav-item"><a href="#" class="nav-link ">글쓰기</a></li>
            <li class="nav-item"><a href="/main" class="nav-link">Main</a></li>
            <li class="nav-item"><a href="/member/logout" class="nav-link">로그아웃</a></li>
        </ul>
    </header>
</div>

<div class="b-example-divider"></div>

</body>
</html>
