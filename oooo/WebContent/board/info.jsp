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
<script>
	$(function(){
		$("#btnList").click(function(){
			document.infoform.action = "${path}/Board/list.do";
			document.infoform.submit();
		});
		$('#btnReview').click(function(){
			document.infoform.action = "${path}/Board/review_write.do?num=${dto.num}";
			document.infoform.submit();
		});
		review_list();
		function review_list() {
			var param = "movie_num=${dto.num}&curPage=${curPage}";
			$.ajax({
				type : "get",
				url : "${path}/Board/review_reply.do",
				data : param,
				success : function(result){
					console.log("success..");
					$('#reviewList').html(result);
				}
			});
		}
	});
</script>
</head>
<body>
<%@ include file="../main/header.jsp" %>
<%@ include file="../main/menu.jsp" %>
<%-- ${dto.num } <br />
${curPage } --%>
<!-- <div style="height: 800px; width: 100%; border: 1px dotted black; margin: 0;"> -->
<div style="height: 1000px;background-color: white;">
<section>
<div id="contents" style="margin:0 auto;height: 1000px; width: 60%;background-color: #EAEAEA;padding-top: 40px;">
<form action="" method="post" name="infoform">
	<table border="1">
		<tr>
			<td>제목</td>
			<td>${dto.title }</td>
		</tr>
		<tr>
			<td>장르</td>
			<td>${dto.genre }</td>
		</tr>
		<tr>
			<td>포스터</td>
			<td>${dto.postfname }</td>
		</tr>
		<tr>
			<td>포토</td>
			<td>${dto.photofname }</td>
		</tr>
		<tr>
			<td>감독</td>
			<td>${dto.director }</td>
		</tr>
		<tr>
			<td>배우</td>
			<td>${dto.actor }</td>
		</tr>
		<tr>
			<td>명대사</td>
			<td>${dto.lines }</td>
		</tr>
		<tr>
			<td>평점</td>
			<td>${dto.mark }</td>
		</tr>
		<tr>
			<td>리뷰</td>
			<td>${dto.review }</td>
		</tr>
	</table>
	<br />
	<button id="btnList">목록</button>
	<button id="btnReview">리뷰하기</button>
</form>
<hr />
<div id="reviewList"></div>
</div>
</section>
</div>
</body>
</html>