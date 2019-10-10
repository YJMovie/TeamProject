<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화가즈아</title>
<link rel="stylesheet" href="../css/style.css" />
</head>
<body>
<%@ include file="header.jsp"%>
<%@ include file="menu.jsp"%>
<div style="height: 500px; width: 100%; border: 1px dotted black; margin: 0;">
		
		<section>
			<div id="contents">
				<table border="1" style="margin: 0 auto;">
					<tr>
						<td>제목</td>
						<td>장르</td>
						<td>포스터</td>
						<td>개봉일</td>
						<td>감독</td>
						<td>평점</td>
					</tr>
					<c:forEach var="list" items="${list }">					
						<tr>
							<td>${list.title }</td>
							<td>${list.genre }</td>
							<td>${list.postfname }</td>
							<td>${list.open }</td>
							<td>${list.director }</td>
							<td>${list.mark }</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<%@ include file="ad.jsp" %>
		</section>
</div>
<%@ include file="footer.jsp"%>
</body>
</html>