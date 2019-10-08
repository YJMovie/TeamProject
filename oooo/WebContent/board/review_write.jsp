<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="path" value="${pageContext.request.contextPath }"></c:set><!-- root path:MVC2 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화가즈아</title>
<script src="../script/jquery-3.4.1.min.js"></script>
<script>
	$(function(){
		$('#btnWrite').click(function(){
			console.log("sxfxfsf...");
			if ($('#comment').val() == null) {
				alert("리뷰를 입력해주세요.");
				$('#comment').focus();
				return;
			}
			document.writeform.action = "${path}/Board/review_insert.do";
			document.writeform.submit();
		});
		$('#btnPrevious').click(function(){
			location.href = "${path}/";
		});
	});
</script>
</head>
<body>
<h1>리뷰작성</h1>
<hr />

<form name="writeform" action="" method="post">
	<table border="1">
		<tr>
			<td>작성자</td>
			<td><input type="text" id="writer"></td>
			<td>평점</td>
			<td>
				<select name="mark" >
					<option value="0" selected="selected">0</option>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
				</select>
				점
			</td>
		</tr>
		<tr>
			<td>리뷰</td>
			<td colspan="2">
				<textarea name="comment" id="comment" cols="30" rows="10"></textarea>
			</td>
			<td>
				<button id="btnWrite">작성</button><br />
				<input type="reset" value="다시입력"/>
			</td>
		</tr>
	</table>
</form>
<button id="btnPrevious">뒤로</button>
</body>
</html>