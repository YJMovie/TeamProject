<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>

<head>
<meta charset="UTF-8">
<title>table board</title>
<script src="${path }/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${path }/css/bootstrap.min.css">
<link rel="stylesheet" href="${path }/css1/style.css">
<style>
@import url('https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap');
body{
 font-family: 'Do Hyeon', sans-serif;
}
</style>
</head>
<body>
</body>
<footer>
	<div id="footer">
		<nav>
			<div id="ftmenu_area">
				<ul id="ftmenu">
					<li><a href="company_introduce.jsp">회사소개</a></li>
					<li><a href="ad.jsp">광고 및 제휴 안내</a></li>
					<li><a href="help.jsp">고객센터</a></li>
					<li><a href="information.jsp">개인정보취급방침</a></li>
					<li><a href="twodragon.jsp">이용약관</a></li>
				</ul>
			</div>
		</nav>
		
			<div id="copyright">
				Copyright (c) 2019.영화가즈아. All rights reserved<br /> 부산시 부산진구 양정동 <br />
				대표전화 : 051-123-4567
			</div>
	
			<div id="SNS">
				<h4>영화가즈아 소셜미디어</h4>
				<ul id="SNS1">
					<li><a href="http://facebook.com"> <img
							src="../images/images/facebook.png" height="40" alt="Facebook"></a></li>
					<li><a href="http://instagram.com"> <img
							src="../images/images/instagram.PNG" height="40" alt="Instagram"></a></li>
					<li><a href="http://twitter.com"> <img
							src="../images/images/twitter.png" height="40" alt="Twitter"></a></li>
					<li><a href="http://youtube.com"> <img
							src="../images/images/youtube.PNG" height="40" alt="Youtube"></a></li>
				</ul>
			</div>
	
		
	</div>
</footer>