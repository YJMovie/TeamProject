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
		$('#btnSave').click(function(){
			if ($('#moviecode').val() == "") {
				alert("영화코드를 입력하세요.");
				$('#moviecode').focus();
				return;
			}
			if ($('#title').val() == "") {
				alert("영화제목을 입력하세요.");
				$('#moviecode').focus();
				return;
			}
			if ($('#postfname').val() == "") {
				alert("파일을 첨부하세요.");
				$('#moviecode').focus();
				return;
			}
			if ($('#score').val() == "") {
				alert("점수를 입력하세요.");
				$('#moviecode').focus();
				return;
			}
			if ($('#open').val() == "") {
				alert("개봉일을 입력하세요.");
				$('#moviecode').focus();
				return;
			}
			if ($('#lines').val() == "") {
				alert("명대사를 입력하세요.");
				$('#moviecode').focus();
				return;
			}
			document.addmovieform.action = "insert";
			document.addmovieform.submit();
		});
	});
</script>
</head>
<body>
	<%@ include file="../home/header.jsp" %>
	<%@ include file="../home/menu.jsp" %>
	<div style="height: 1000px;background-color: white;">
	<section>
	<div id="contents" style="margin:0 auto;height: 1000px; width: 60%;background-color: #EAEAEA;padding-top: 40px;">
		<h2>관리자페이지</h2>
		<p>마지막 영화코드:${mvcodeMax }</p>
		<form action="" name="addmovieform" method="post" enctype="multipart/form-data"> <!-- enctype="multipart/form-data" -->
			<table border="1">
				<tr>
					<td>영화코드</td>
					<td><input type="text" id="moviecode" name="moviecode" /></td>
				</tr>
				<tr>
					<td>영화제목</td>
					<td><input type="text" id="title" name="title" /></td>
				</tr>
				<tr>
					<td>포스터파일첨부</td>
					<td><input type="file" id="postfname" name="postfname" /></td>
				</tr>
				<tr>
					<td>점수</td>
					<td><input type="text" id="score" name="score" /></td>
				</tr>
				<tr>
					<td>개봉일</td>
					<td><input type="text" id="open" name="open" placeholder="yyyy-mm-dd" /></td>
				</tr>
				<tr>
					<td>명대사</td>
					<td><input type="text" id="lines" name="lines" /></td>
				</tr>
				<tr>
					<td colspan="2">
						<button id="btnSave">저장하기</button>
						<input type="reset" value="다시입력"/>
					</td>
				</tr>
			</table>
		</form>
	</div>
	</section>
	</div>
</body>
</html>