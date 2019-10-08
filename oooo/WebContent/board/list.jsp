<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화가즈아</title>
<script src="../script/jquery-3.4.1.min.js"></script>
<script>
	$(function(){
		$("#btnHome").click(function(){
			console.log("btnHome Ok...");
			location.href = "${path}/";
		});
	});
</script>
</head>
<body>
<h1>게시판 목록</h1>
<hr />
<table border="1">
	<c:forEach var="list" items="${list }" varStatus="status">
		<c:if test="${status.count%3 == 1 }"><tr></c:if>
			<td>
				${list.title } <br />
				<a href="${path }/Board/info.do?num=${list.num}">이미지</a> <br />
				${list.open } <br />
				${list.director } <br />
			</td>
		<c:if test="${status.count%3 == 0 }"></tr></c:if>	
	</c:forEach>
	
</table>
<br />
<button id="btnHome">홈으로</button>
</body>
</html>