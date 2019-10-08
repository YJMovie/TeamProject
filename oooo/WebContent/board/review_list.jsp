<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화가즈아</title>
</head>
<body>
<table border="1">
	<c:forEach var="list" items="${list }">
		<tr>
			<td>${list.writer }(${list.rtime })</td>
			<td>평점 : ${list.rmark }</td>
		</tr>
		<tr>
			<td colspan="2">
				내용 : ${list.rcomment }
			</td>
		</tr>
	
	</c:forEach>
	<tr>
		<td><a href="#">이전</a></td>
		<td><a href="#">다음</a></td>
	</tr>
</table>
</body>
</html>