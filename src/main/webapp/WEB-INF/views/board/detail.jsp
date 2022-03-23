<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/header_css.jsp"></c:import>
</style>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
  <h1>${board} Detail Page Test</h1>
  <h3>NUM: ${dto.num}</h3>
  <h3>TITLE: ${dto.title} </h3>
  <h3>CONTENTS: ${dto.contents}</h3>
  <h3>WRITER: ${dto.writer} </h3>
  <h3>REGDATE: ${dto.regDate}</h3>
  <h3>HIT: ${dto.hit}</h3>
  <div>
    <c:forEach items="${dto.fileDTOs}" var="f">
    	<a href="./fileDown?fileNum=${f.fileNum}">${f.oriName}</a>
    </c:forEach>
  </div>
  <hr>
  <!-- <form action="../noticeReply/add" method="POST" enctype="application/x-www-form-urlencoded">  -->
  <div>
  	<input type="hidden" name="num" id="num" value="${dto.num}">
	<input type="text" readonly="readonly" name="writer" id="writer" value="${member.id}">
	<textarea rows="" cols="" name="contents" id="contents"></textarea>
  	<button type="button" id="reply">REPLY</button>
  </div>
  <!-- </form> -->
    
  <table id="replyResult">
  	
  </table>
  
</body>
  <a href="./list">BACK</a>
  <c:if test="${member.id eq dto.writer}">
  <a href="./update?num=${dto.num}">수정</a>
  <a href="./delete?num=${dto.num}">삭제</a>
  </c:if>
  <c:if test="${board ne 'notice'}">
  <a href="./reply?num=${dto.num}">답글</a>
  </c:if>
  <script src="../resources/js/noticeReply.js"></script>
</html>