<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<% request.setCharacterEncoding("utf-8");  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../script/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<script src="../js/bootstrap.min.js"></script>
<script>
	$(function(){
		console.log('function ok');
		
			$('#btnBack').click(function(){
				console.log('back ok');
				
				document.memupdate.action="${path}/";
				document.memupdate.submit();
			})
	});
</script>
<style type="text/css">
	.mem-update-form {
 	 position: absolute;
 	 padding: 20px;
  	width: 300px;
  	background-color: #EEEFF1;
  	border-radius: 5px;
  	top: 15%;
  	left: 40%;
  transform: translate(-505, -50%);
}
</style>
</head>
<body>
	<%@ include file="../home/menu.jsp"%>
	<%@ include file="../home/header.jsp"%>
	
		<div style="height: 1000px;background-color: white;">
		<section>
		<div id="contents" style="margin:0 auto;height: 1000px; width: 1300px;background-color: #FFFFF6;padding-top: 40px;">
			
		<div style="display: inline-block;margin-left: 325px;">
		
			<h2>마이페이지</h2>
		</div>
		<div style="width: 650px;margin-left: 325px;">
			<hr style="border: 2px solid #FFDC7E;">
		
		</div>
		<div style="display: inline-block;margin-left: 325px;">
		<a href="${path }/Member/update.do?sId=${sId}"><button type="button" class="btn btn-outline-warning">회원수정</button></a>
		<a href="myMovie?userid=${sId }"><button type="button" class="btn btn-outline-warning">${sName }님 즐겨찾는 영화</button></a>
		</div>
	</div>
	</section>
	</div>
	  <%@ include file="../home/footer.jsp" %>
</body>
</html>