<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>QnA List Test Page</title>
  <c:import url="../template/header_css.jsp"></c:import>
  <link href="../resources/css/table.css" rel="stylesheet">
  <link href="../resources/css/list.css" rel="stylesheet">
</head>
<body>
  <c:import url="../template/header.jsp"></c:import>
  <div class="table-container">
    <h1 class="title">QnA List Test Page</h1>
    <div>
      <form action="./list" method="get">
        <fieldset>
          <select name="kind">
              <option value="col1">제목</option>
              <option value="col2">본문</option>
              <option value="col3">작성자</option>
          </select>
          <input type="text" name="search" value="${pager.search}">
          <button type="submit">검색</button>
        </fieldset>
      </form>
    </div>
      <table class="table-basic">
        <tr>
          <th>NUM</th>
          <th>TITLE</th>
          <th>CONTENTS</th>
          <th>WRITER</th>
          <th>REGDATE</th>
          <th>HIT</th>
          <th>REF</th>
          <th>STEP</th>
          <th>DEPTH</th>
        </tr>
        
        <!-- Collection 반복 items="collection 속성명", var="dto를담을변수명"-->
        <c:forEach items="${list}" var="qna">
          <tr>
            <td>${qna.num}</td>
            <td><a href="./detail?num=${qna.num}">${qna.title}</a></td>
            <td>${qna.contents}</td>
            <td>${qna.writer}</td>
            <td>${qna.regDate}</td>
            <td>${qna.hit}</td>
            <td>${qna.ref}</td>
            <td>${qna.step}</td>
            <td>${qna.depth}</td>
          </tr>
        </c:forEach>
      </table>
        <div>
          <c:if test="${pager.pre}">
            <a href="./list?page=${pager.startNum - 1}">PREVIEW</a>
          </c:if>
          <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
          <a href="./list?page=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a>
        </c:forEach>
        <c:if test="${pager.next}">
          <a href="./list?page=${pager.lastNum + 1}">NEXT</a>
        </c:if>
        </div>
        <a href="./add">글쓰기</a>
      </div>
  </div>
</body>
</html>