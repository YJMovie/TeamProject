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
	
	<div id="contents" style="margin:0 auto;height: 1500px; width: 1300px;background-color: #FFFFF6;padding-top: 40px;">
		<div style="display: inline-block;margin-left: 325px;">
		
			<h2>회원가입</h2>
		</div>
		<div style="width: 650px;margin-left: 325px;">
			<hr style="border: 2px solid #FFDC7E;">
		
		</div>
			<div style="display: inline-block;margin-left: 325px;">
			<h2> ${name }님 환영합니다 </h2>
			</div>
			<div style="display: inline-block;margin-left: 325px;">
			
				<a href="${path }/Home"><button class="btn btn-warning">홈으로</button></a>
			</div>
	</div>
	<%@ include file="../home/footer.jsp" %>
</body>
</html>