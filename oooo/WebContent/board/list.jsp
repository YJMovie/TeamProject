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
<script src="../script/jquery-3.4.1.min.js"></script>
<script>
	$(function(){
		$("#btnHome").click(function(){
			console.log("btnHome Ok...");
			location.href = "${path}/";
		});
	});
</script>
</head>
<body>
<%@ include file="../main/header.jsp" %>
<%@ include file="../main/menu.jsp" %>
<div style="height: 800px; width: 100%; border: 1px dotted black; margin: 0;">
<section>
<div id="contents">
<div id="listMenu">
	<ul>
		<li><a href="${path }/Board/list.do?category=1">평점순</a></li>
		<li><a href="${path }/Board/list.do?category=2">리뷰순</a></li>
		<li><a href="${path }/Board/list.do?category=3">예매율</a></li>
	</ul>
</div>
<table border="1" style="margin: 0 auto;">
	<c:forEach var="list" items="${list }" varStatus="status">
		<c:if test="${status.count%4 == 1 }"><tr></c:if>
			<td>
				${list.title } <br />
				<a href="${path }/Board/info.do?num=${list.num}&curPage=1">이미지</a> <br />
				${list.open } <br />
				${list.director } <br />
				${list.mark } <br />
				${list.totreview } <br />
			</td>
		<c:if test="${status.count%4 == 0 }"></tr></c:if>	
	</c:forEach>
	<tr>
		<td colspan="4">
			<c:if test="${curBlock > 1 }">
				<a href="${path }/Board/list.do?category=${category}&curPage=${prev_page}">이전</a>
			</c:if>
			<c:forEach var="i" begin="${block_start }" end="${block_end }">
				<a href="${path }/Board/list.do?category=${category}&curPage=${i}">${i }</a>
			</c:forEach>
			<c:if test="${curBlock < totBlock }">
				<a href="${path }/Board/list.do?category=${category}&curPage=${next_page}">다음</a>
			</c:if>
		</td>
	</tr>
</table>
<br />
<button id="btnHome">홈으로</button>
</div>
</section>
</div>
</body>
</html>