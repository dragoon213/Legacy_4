<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <h1>BankBook Detail test page</h1>
 
    <h3>Name : ${dto.bookName}</h3>
    <h3>Contents : ${dto.bookContents}</h3>
    <h3>Rate : ${dto.bookRate}</h3>
    <h3>Sale : ${dto.bookSale}</h3>
  
  	<a href="./List">List</a>
  	<a href="./delete?bookNumber=${dto.bookNumber}">Delete</a>
</body>
</html>