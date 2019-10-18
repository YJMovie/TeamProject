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
			/* alert($('#btnReview').val()); */
			var sName = $('#btnReview').val();
			if (sName == "") {
				alert("로그인 하세요.");
				return;
			}
			document.infoform.action = "${path}/Movie/write?moviecode=${dto.moviecode}";
			document.infoform.submit();
		});
		review_list();
		function review_list() {
			var param = "moviecode=${dto.moviecode}&curPage=${curPage}";
			$.ajax({
				type : "get",
				url : "${path}/Movie/reply",
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
<%@ include file="../home/header.jsp" %>
<%@ include file="../home/menu.jsp" %>
<%-- ${dto.num } <br />
${curPage } --%>
<!-- <div style="height: 800px; width: 100%; border: 1px dotted black; margin: 0;"> -->
<div style="height: 1000px;background-color: white;">
<section>
<div id="contents" style="margin:0 auto;height: 1000px; width: 900px;background-color: #EAEAEA;padding-top: 40px;">
<form action="" method="post" name="infoform">
	<table>
		<tr>
			<td><img src="../images/${dto.postfname }" /></td>
			<td>
				<div style=" padding-top: 350px;padding-left: 100px">
					제목 ${dto.title } <br />
					장르 ${grname1 } ${grname2 } ${grname3 } ${grname4 } ${grname5 } <br />
					영화감독
					<c:forEach var="pscodeB" items="${pscodeB }">
						${pscodeB }
					</c:forEach><br />
					출연배우
					<c:forEach var="pscodeA" items="${pscodeA }">
						${pscodeA }
					</c:forEach><br />
					명대사 ${dto.lines } <br />
					평점 ${dto.score } <br />
					개봉일 ${dto.open } <br />
				</div>
			</td>
		</tr>
			
	</table>
	<br />
	<button id="btnList">목록</button>
	<button id="btnReview" value="${sName }">리뷰하기</button>
</form>
<hr />
<div id="reviewList"></div>
</div>
</section>
</div>
</body>
</html>