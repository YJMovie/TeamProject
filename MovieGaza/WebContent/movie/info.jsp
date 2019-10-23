<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화가즈아</title>
<link rel="stylesheet" href="${path }/css/bootstrap.min.css">
<script src="${path }/js/bootstrap.min.js"></script>
<script src="${path }/script/jquery-3.4.1.min.js"></script>
<!-- bxslider CDN -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous" />
<script>
	$(function(){
		
		$("#btnList").click(function(){
			document.infoform.action = "${path}/Movie/list";
			document.infoform.submit();
		});
		$('#btnReview').click(function(){
			var sName = $('#btnReview').val();
			if (sName == "") {
				alert("로그인 하세요.");
				return;
			}
			document.infoform.action = "${path}/Movie/write?moviecode=${dto.moviecode}";
			document.infoform.submit();
		});
		$('#btnMemMovie').click(function(){
			var moviecode = $('#btnMemMovie').val();
			var sName = $('#sName').val();
			if (sName == "") {
				alert("로그인 하세요.");
				return;
			}
			document.infoform.action = "${path}/Member/favoriteMovie?sId=${sId}&moviecode="+moviecode;
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
		
		   $('#info_front').ready(function(){ 
		         var make_star = ${make_star};
		         
		         $(".info_front").css('width',make_star+"px");

		         });

	});
</script>

<style>
@import url('https://fonts.googleapis.com/css?family=Sunflower:300&display=swap');
.box {
   float: left;
   width : 150px;
   margin: 0 8px;
   position: relative;
}

.info_front {
   position: relative;
   top: 0;
   overflow:hidden;
   
   /* max-width : 97.5px; */
   
}

.info_back{

   position: absolute;
   top: 0;
   left: 0;
   
   
}
.info_front img{
   width : 150px;
}

.info_back img{
   width : 150px;
}
#infospan {
	font-family: 'Sunflower', sans-serif;
	font-size: 30px;
}
.badge {
	font-family: 'Sunflower', sans-serif;
	margin-bottom: 10px;
}
</style>


</head>
<body>
<%@ include file="../home/menu.jsp" %>
<%@ include file="../home/header.jsp" %>
<%-- ${dto.moviecode } <br />
${curPage } --%>
<!-- <div style="height: 800px; width: 100%; border: 1px dotted black; margin: 0;"> -->
<div style="height: 1000px;background-color: white;">
<section>
<div id="contents" style="margin:0 auto;height: 1500px; width: 1300px;background-color: #FFFFF6;padding-top: 40px;">
<form action="" method="post" name="infoform">
	<table style="margin-left: 100px;">
		<tr>
			<td><img src="../images/${dto.postfname }" width="250px" height="400px"/></td>
			<td>
				<div style=" padding-top: 100px;padding-left: 100px">
					<span class="badge badge-pill badge-dark" style="font-size: 30px;">제목</span>
					<span id="infospan">${dto.title }</span> <br />
					<span class="badge badge-pill badge-dark" style="font-size: 30px;">장르</span>
					<span id="infospan">${grname1 } ${grname2 } ${grname3 } ${grname4 } ${grname5 }</span>
					<span class="badge badge-pill badge-dark" style="font-size: 30px;">영화감독</span>
					<c:forEach var="pscodeB" items="${pscodeB }">
						<span id="infospan">${pscodeB }</span>
					</c:forEach><br />
					<span class="badge badge-pill badge-dark" style="font-size: 30px;">출연배우</span>
					<c:forEach var="pscodeA" items="${pscodeA }">
						<span id="infospan">${pscodeA }</span>
					</c:forEach>
					<span class="badge badge-pill badge-dark" style="font-size: 30px;">명대사</span>
					<span id="infospan">${dto.lines }</span> <br />
					
					
					<span class="badge badge-pill badge-dark" style="font-size: 30px;">개봉일</span>
					<span id="infospan">${dto.open }</span> <br />
					<span class="badge badge-pill badge-dark" style="font-size: 30px;">평점</span>
					<span id="infospan">${star_result}</span> <br/>
					<div class="box">
         <div class="info_back"><img src='../images/back_stars.png' ></div>
         <!-- 색깔별 --><div class="info_front" id="info_front"><img src='../images/front_stars.png'></div>
         </div>
				</div>
			</td>
		</tr>
			
	</table>
	<hr />
	<div style="text-align: right;">
	
		<div style="display: inline-block;">
			<button id="btnList" class="btn btn-warning">목록</button>
			<button id="btnReview" class="btn btn-warning" value="${sName }" >리뷰하기</button>
			<button id="btnMemMovie" class="btn btn-warning" value="${dto.moviecode }">즐겨찾기 추가</button>
		</div>
	</div>
	<input type="hidden" id="sName" value="${sName }" />
</form>
<hr />
<div id="reviewList"></div>
</div>
</section>
</div>
<%@ include file="../home/footer.jsp" %>
</body>
</html>