<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화가즈아</title>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<script src="../js/bootstrap.min.js"></script>
<script src="../script/jquery-3.4.1.min.js"></script>
</head>
<body>
	
	<%@ include file="../home/header.jsp" %>
	<%@ include file="../home/menu.jsp" %>
	<div style="height: 1000px;background-color: white;">
	<section>
	<div id="contents" style="margin:0 auto;height: 1000px; width: 60%;background-color: #EAEAEA;padding-top: 40px;">
		<h2>관리자 메인페이지</h2>
			<ul>
				<li><a href="addmovie">영화목록 추가하기</a></li>
				<li></li>
				<li></li>
			</ul>
	</div>
	</section>
	</div>
</body>
</html>