<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>환영합니당</title>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<script src="../js/bootstrap.min.js"></script>
</head>
<body>
	<%@ include file="../home/header.jsp"%>
	<%@ include file="../home/menu.jsp"%>
	
	<div style="height: 1000px;background-color: white;">
		
	<section>
	<div id="contents" style="margin:0 auto;height: 1000px; width: 900px;background-color: #EAEAEA;padding-top: 40px;">
		<h2> ${name }님 환영합니다 </h2>
		<a href="${path }/Home"><button>홈으로</button></a>
	</div>
	</section>
	</div>
</body>
</html>