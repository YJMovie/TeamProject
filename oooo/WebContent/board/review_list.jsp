<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화가즈아</title>
<script src="../script/jquery-3.4.1.min.js"></script>
<script>
	$(function(){
		$('#btnNext').click(function(){
			console.log('다음...');
		});
	});
</script>
</head>
<body>
<table border="1">
	<c:forEach var="list" items="${list }">
		<tr>
			<td>${list.writer }(${list.rtime })</td>
			<td>평점 : ${list.rmark }</td>
		</tr>
		<tr>
			<td colspan="2">
				내용 : ${list.rcomment }
			</td>
		</tr>
	
	</c:forEach>
	<tr>
		<td colspan="2">
			<c:if test="${curBlock > 1 }">
				<a href="${path }/Board/info.do?num=${movie_num}&curPage=${prev_page}">이전</a>
			</c:if>
			<c:forEach var="i" begin="${block_start }" end="${block_end }">
				<a href="${path }/Board/info.do?num=${movie_num}&curPage=${i}">${i }</a>
			</c:forEach>
			<c:if test="${curBlock < totBlock }">
				<a href="${path }/Board/info.do?num=${movie_num}&curPage=${next_page}">다음</a>
			</c:if>
		</td>
	</tr>
</table>
<hr />
${movie_num } <br />
${curPage }
</body>
</html>