<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
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
		console.log("JQuery ok");
		
		$('#idcheck').click(function(){
			console.log("idcheck ok");
				var userid = $('#userid').val();
				var userpwd = $('#userpwd').val();
				
				if(userid == ""){
					alert("아이디를 입력하세요");
					$('#userid').focus();
					
					return;
				}else if(userpwd == ""){
					alert("비밀번호를 입력하세요");
					$('#userpwd').focus();
					
					return;
				}
				document.login.action="${path}/Log/login.do";
				document.login.submit();
		});
		$('#back').click(function(){
			location.href = "${path}/Log/view.do";
		});
	});
</script>
</head>
<body>
	<%@ include file="../home/header.jsp"%>
	<%@ include file="../home/menu.jsp"%>
	
	<div style="height: 1000px;background-color: white;">
		
	<section>
	<div id="contents" style="margin:0 auto;height: 1000px; width: 60%;background-color: #EAEAEA;padding-top: 40px;">

 	<form action=""name="login"method="post">
 		<table border="1">
 			<tr>
 				<td>아이디 :</td>
 				<td><input type="text" id="userid" name="userid" /></td>
 			</tr>
 			<tr>
 				<td>비밀번호:</td>
 				<td><input type="password" id="userpwd" name="userpwd" /></td>
 			</tr>
 			<tr>
 				<td><input type="button" value="확인" id="idcheck"/></td>
 				<td>
 					<input type="reset" value="재작성" />
 					<input type="button" value="뒤로" id="back" />
 				</td>
 				
 			</tr>
 			<tr>
 				<td colspan="2">
 					<c:if test="${error eq 1 }">
 						<span style="color: red;">존재하지않습니다.</span>
 					</c:if>
 				</td>
 			</tr>
 		</table>
 	</form>
 	<form action="${path}/controller/jmember.do" method="post">
 		<button type="submit">회원관리</button>
 	</form>
 	</div>
 	</section>
 	</div>
</body>
</html>