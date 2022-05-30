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
  <style>
    tr.colored:hover td{
      background-color:#f3e9e9 !important;
      color:#303f39 !important;
    }
  </style>
  <link href="/resources/css/headers.css" rel="stylesheet">
</head>
<body>
<jsp:include page="../layout/adminHeader.jsp" flush="false"></jsp:include>
<c:if test="${noSearch eq '1'}">
<body onload="noSearch()">
</c:if>

<div class="container mt-3">
  <form action="/board/search" method="get" name="search">
    <select name="searchType">
      <option value="boardTitle">제목</option>
      <option value="boardWriter">작성자</option>
    </select>
    <input type="text" name="q" id="searchValue" placeholder="검색어를 입력하세요.">
    <input style="background-color: #b6d4fe" type="button" onclick="search1()" value="검색">
  </form>
</div>

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
      <tr class="colored" onclick="location.href='/board/detail?id=${board.id}'">
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
          <a class="page-link" href="/board/findAll?page=${paging.page-1}&searchType=${searchType}&q=${q}">[이전]</a>
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
            <a class="page-link" href="/board/findAll?page=${i}&searchType=${searchType}&q=${q}">${i}</a>
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
          <a class="page-link" href="/board/findAll?page=${paging.page+1}&searchType=${searchType}&q=${q}">[다음]</a>
        </li>
      </c:otherwise>
    </c:choose>
  </ul>
</div>
</body>
<script>
  function search1() {
    let searchValue = document.getElementById("searchValue").value;
    if(searchValue == ""){
      alert("검색어를 입력 해 주세요!!")
    }else {
      search.submit();
    }
  }
  function noSearch() {
    alert("검색결과가 없습니다!!")
    location.href = "/board/findAll";
  }
</script>
</html>
