<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src=".././script/jquery-3.4.1.min.js"></script>
	<script>
		$(function(){
			console.log('memJQuery Ok');
			
			$('#btndelete').click(function(){
				console.log('btnDelete OK');
				
				document.memedit.action="${path}/controller/memDelete.do";
				document.memedit.submit();
			})
		});
	</script>
<style type="text/css">
	.mem-view-form {
 	 position: absolute;
 	 padding: 40px;
  	width: 800px;
  	background-color: #EEEFF1;
  	border-radius: 10px;
  	top: 1%;
  	left: 25%;
  transform: translate(-505, -50%);
}
</style>	
</head>
<body>
<div class="mem-view-form">
	<h1 align="center">회원 수정</h1>
		<table border="1">
			<tr>
				<td>아이디</td>
				<td>비밀번호</td>
				<td>이름</td>
				<td>성별</td>
				<td>핸드폰</td>
				<td>주소</td>
				<td>이메일</td>
				<td>가입날짜</td>
				<td>회원등급</td>
				<td>수정/삭제</td>
			</tr>
			
			<c:forEach items="${list}" var="a"> 
			<tr>
				<td>${a.userid}</td>
				<td>${a.userpwd}</td>
				<td>${a.name}</td>
				<td>${a.gender}</td>
				<td>${a.phone}</td>
				<td>${a.address}</td>
				<td>${a.email}</td>
				<td>${a.userdate }</td>
				<td>${a.usergrade }</td>
				<td>
					<a href="${path}/controller/memViewGo.do?userid=${a.userid}">
						<input type="button" value="수정" id="" /></a>
					<a href="${path}/controller/memDelete.do?userid=${a.userid}">
						 <input type="button" value="삭제" id="btndelete" /></a>
				</td>
			</tr>
			</c:forEach>
			<tr>
				<td colspan="10" align="center">
					<c:if test="${cur_block > 1}">
						<a href="${path }/controller/jmember.do?curPage=${prev_page}">[이전]</a>
					</c:if>
					<c:forEach var="i" begin="${blockStart }" end="${blockEnd }">
						<a href="${path }/controller/jmember.do?curPage=${i }">${i }</a>&nbsp;
					</c:forEach>
					<c:if test="${cur_block < totBlock }">
						<a href="${path }/controller/jmember.do?curPage=${next_page}">[다음]</a>
					</c:if>
				</td>
			</tr>
		</table>
	</div>
	<%@ include file="../home/footer.jsp" %>
</body>
</html>