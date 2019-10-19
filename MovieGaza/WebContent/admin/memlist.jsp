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
	<div id="contents" style="margin:0 auto;height: 1000px; width: 900px;background-color: #EAEAEA;padding-top: 40px;">
		<h2>관리자 메인페이지(회원목록)</h2>
		<table border="1" style="margin: 0 auto;">
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
	</div>
	</section>
	</div>
</body>
</html>