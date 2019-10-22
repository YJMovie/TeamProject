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
		$('#btnNext').click(function(){
			console.log('다음...');
		});
		
		   $('#front').ready(function(){ 
		         var make_star = ${make_star};
		         
		         $(".front").css('width',make_star+"px");

		         });

	});
</script>

<style>


.box {
   float: left;
   width : 70px;
   margin: 0 8px;
   position: relative;
}

.front {
   position: relative;
   top: 0;
   overflow:hidden;
   width : 10px;
   /* max-width : 97.5px; */
   
}

.back{

   position: absolute;
   top: 0;
   left: 0;
   
   
}
.front img{
   width : 70px;
}

.back img{
   width : 70px;
}

</style>


</head>
<body>
<table border="1">
	<c:forEach var="list" items="${list }">
		<tr>
			<td>${list.writer }(${list.r_date })</td>

			<td colspan="2">
				 ${list.r_comment }
			</td>

			<td> <div class="box">
            <c:set var="starscore" value="${list.r_score/5*70}"></c:set>
         <div class="back"><img src='../images/back_stars.png' ></div>
         <!-- 색깔별 --><div class="front" id="front" style="width:${starscore}px"><img src='../images/front_stars.png'></div>
         </div>
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
${curPage }
</body>
</html>