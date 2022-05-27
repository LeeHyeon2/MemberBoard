<%--
  Created by IntelliJ IDEA.
  User: GRAM
  Date: 2022-05-27
  Time: 오후 1:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<html>
<head>
    <title>detail</title>
</head>
<body>
<jsp:include page="../layout/adminHeader.jsp" flush="false"></jsp:include>
<div class="container">
    <table class="table">
        <tr>
            <th>ID</th>
            <th>비밀번호</th>
            <th>이름</th>
            <th>Email</th>
            <th>전화번호</th>
            <th>프로필</th>
        </tr>
        <tr>
            <th>${member.memberId}</th>
            <th>${member.memberPassword}</th>
            <th>${member.memberName}</th>
            <th>${member.memberEmail}</th>
            <th>${member.memberMobile}</th>
            <th><img src="${pageContext.request.contextPath}/upload/${member.memberProfile}" alt="" height="100" width="100"></th>
        </tr>
    </table>
</div>
</body>
</html>
