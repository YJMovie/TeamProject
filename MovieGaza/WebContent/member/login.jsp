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
			document.login.action = "${path}/member/login.jsp";
		});
	});
</script>
</head>
<body>
	<%@ include file="../home/header.jsp"%>
	<%@ include file="../home/menu.jsp"%>
	
	<div style="height: 1000px;background-color: white;">
		
	<section>
	<div id="contents" style="margin:0 auto;height: 1000px; width: 900px;background-color: #EAEAEA;padding-top: 40px;">

 	<form action=""name="login"method="post">
 		<table style="margin: 0 auto;">
 			<tr>
 				<td>
 					<div class="form-group">
					    <label for="exampleInputEmail1">아이디</label>
					    <input type="text" class="form-control" id="userid" name="userid" aria-describedby="emailHelp" placeholder="USER ID">
					  </div>
 				</td>
 			</tr>
 			<tr>
 				<td>
 					<div class="form-group">
					    <label for="exampleInputPassword1">비밀번호</label>
					    <input type="password" class="form-control" id="userpwd" name="userpwd" placeholder="USER PASSWORD">
					  </div>
 				</td>
 			</tr>
 			<tr>
 				<td>
 					<button id="idcheck" class="btn btn-primary">로그인</button>
 					<button id="idfind" class="btn btn-primary">아이디찾기</button>
 					<button id="pwdfind" class="btn btn-primary">비밀번호찾기</button>
 					<button id="back">뒤로</button>
 				</td>
 			</tr>
 			<tr>
 				<td>
 					<c:if test="${error eq 1 }">
 						<span style="color: red;">존재하지않습니다.</span>
 					</c:if>
 				</td>
 			</tr>
 		</table>
 	</div>
 	</section>
 	</div>
 	
</body>
</html>