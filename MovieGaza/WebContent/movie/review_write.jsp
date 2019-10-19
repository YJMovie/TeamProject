<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="path" value="${pageContext.request.contextPath }"></c:set><!-- root path:MVC2 -->
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
		$('#btnWrite').click(function(){
			console.log("sxfxfsf...");
			if ($('#rcomment').val() == "") {
				alert("리뷰를 입력해주세요.");
				$('#rcomment').focus();
				return;
			}
			document.writeform.action = "${path}/Movie/insert";
			document.writeform.submit();
		});
		$('#btnPrevious').click(function(){
			location.href = "${path}/Board/info.do?num=${num}&curPage=1";
		});
	});
</script>
</head>
<body>
<%@ include file="../home/header.jsp" %>
<%@ include file="../home/menu.jsp" %>
<%-- ${num } --%>
<div style="height: 1000px;background-color: white;">
<div id="contents" style="margin:0 auto;height: 1000px; width: 60%;background-color: #EAEAEA;padding-top: 40px;">
<form name="writeform" action="" method="post">
	<table border="1">
		<tr>
			<td>작성자</td>
			<td><input type="text" name="writer" value="${sName }" readonly="readonly"></td>
			<td>평점</td>
			<td>
				<select name="r_score" >
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
				<textarea name="r_comment" id="r_comment" cols="30" rows="10"></textarea>
			</td>
			<td>
				<button id="btnWrite">작성</button><br />
				<input type="reset" value="다시입력"/>
				<input type="hidden" name="moviecode" value="${moviecode }" />
			</td>
		</tr>
	</table>
</form>
<button id="btnPrevious">뒤로</button>
</div>
</div>
<%@ include file="../home/footer.jsp" %>
</body>
</html>