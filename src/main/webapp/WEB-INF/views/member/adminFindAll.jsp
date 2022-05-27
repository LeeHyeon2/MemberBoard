<%--
  Created by IntelliJ IDEA.
  User: GRAM
  Date: 2022-05-27
  Time: 오후 4:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<html>
<head>
  <link href="/resources/css/headers.css" rel="stylesheet">
</head>
<body>
<jsp:include page="../layout/adminHeader.jsp" flush="false"></jsp:include>
<div class="b-example-divider"></div>
<div class="container">
  <table class="table">
    <tr>
      <th>글번호</th>
      <th>작성자</th>
      <th>제목</th>
      <th>조회수</th>
      <th>작성일자</th>
    </tr>
    <c:forEach items="${boardList}" var="board">
      <tr>
        <td>${board.id}</td>
        <td>${board.boardWriter}</td>
        <td>${board.boardTitle}</td>
        <td>${board.boardHits}</td>
        <td>${board.boardCreatedDate}</td>
      </tr>
    </c:forEach>
  </table>
</div>
<div class="container">
  <ul class="pagination justify-content-center">
    <c:choose>
      <%-- 현재 페이지가 1페이지면 이전 글자만 보여줌--%>
      <c:when test="${paging.page<=1}">
        <li class="page-item disabled">
          <a class="page-link">[이전]</a>
        </li>
      </c:when>
      <%-- 1페이지가 아닌 경우에는 이전을 클릭하면 현재 페이지보다 1작은페이지요청 --%>
      <c:otherwise>
        <li class="page-item">
          <a class="page-link" href="/board/findAll?page=${paging.page-1}">[이전]</a>
        </li>
      </c:otherwise>
    </c:choose>

    <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
      <c:choose>
        <%-- 요청한 페이지에 있는 경우 페이지 ㅓ번호는 텍스므만 보이게 --%>
        <c:when test="${i eq paging.page}">
          <li class="page-item active">
            <a class="page-link">${i}</a>
          </li>
        </c:when>
        <c:otherwise>
          <li class="page-item">
            <a class="page-link" href="/board/findAll?page=${i}">${i}</a>
          </li>
        </c:otherwise>
      </c:choose>
    </c:forEach>
    <c:choose>
      <c:when test="${paging.page>=paging.maxPage}">
        <li class="page-item disabled">
          <a class="page-link">[다음]</a>
        </li>
      </c:when>
      <c:otherwise>
        <li class="page-item">
          <a class="page-link" href="/board/findAll?page=${paging.page+1}">[다음]</a>
        </li>
      </c:otherwise>
    </c:choose>
  </ul>
</div>
</body>
</html>
