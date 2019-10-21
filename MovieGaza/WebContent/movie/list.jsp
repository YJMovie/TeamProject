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
		$("#btnHome").click(function(){
			console.log("btnHome Ok...");
			location.href = "${path}/";
		});
	});
</script>
<style>
	.list {
    	position: absolute;
        padding-top: 20px;
        /* top: 290px; */
        width: 150px;
        height: 150px;
        background: rgba(0,0,0,0.6);
        opacity: 0;
        -moz-transition: all 0.2s ease-in-out;
        -o-transition: all 0.2s ease-in-out;
        -webkit-transition: all 0.2s ease-in-out;
        transition: all 0.4s ease-in-out;
        z-index: 10;
    }
    .list:hover {
    	opacity: 1;
        -moz-transform: translateY(-200px);
        -ms-transform: translateY(-200px);
        -o-transform: translateY(-200px);
        -webkit-transform: translateY(-200px);
        transform: translateY(0px);
    }
    .list {
        color: #fff;
        text-align: center;
    }
    .list a {
    	text-decoration: none;
    	color: #fff;
    }
</style>
</head>
<body>
<%@ include file="../home/header.jsp" %>
<%@ include file="../home/menu.jsp" %>
<!-- <div style="height: 800px; width: 100%; border: 1px dotted black; margin: 0;"> -->
<div style="height: 1000px;background-color: white;">
<section>
<!-- <div id="contents"> -->
<div id="contents" style="margin:0 auto;height: 1000px; width: 1300px;background-color: #EAEAEA;padding-top: 40px;">
<div style="margin: 0 auto;width: 270px;">
	<ul class="list-group list-group-horizontal-sm">
	  <li class="list-group-item"><a href="${path }/Board/list.do?category=1">평점순</a></li>
	  <li class="list-group-item"><a href="${path }/Board/list.do?category=2">리뷰순</a></li>
	  <li class="list-group-item"><a href="${path }/Board/list.do?category=3">예매율</a></li>
	</ul>
</div>
<table border="1" style="margin: 0 auto;"><%int i=-1; %>
	<c:forEach var="list" items="${list }" varStatus="status">
		<c:if test="${status.count%3 == 1 }" ><tr><%i++; %></c:if>
			<td>
				<div style="width: 150px;height: 150px;border: 1px solid black;margin-top: 20px;">
			        <img src="${path }/images/${list.postfname }" alt="${list.postfname }" width="150px" height="150px"/>
			    </div>
		        <div class="list" style="top:<%=334+i*170%>px;">
		        <%=i %>
		        <h4>
					<a href="${path }/Movie/info?moviecode=${list.moviecode}&curPage=1">${list.title }</a> <br />
		        </h4> <br />
				${list.open } <br />
				${list.score } <br />
				</div>
			</td>
		<c:if test="${status.count%3 == 0 }"></tr></c:if>	
	</c:forEach>
	<tr>
		<td colspan="4">
			<c:if test="${curBlock > 1 }">
				<a href="${path }/Movie/list?category=${category}&curPage=${prev_page}">이전</a>
			</c:if>
			<c:forEach var="i" begin="${block_start }" end="${block_end }">
				<a href="${path }/Movie/list?category=${category}&curPage=${i}">${i }</a>
			</c:forEach>
			<c:if test="${curBlock < totBlock }">
				<a href="${path }/Movie/list?category=${category}&curPage=${next_page}">다음</a>
			</c:if>
		</td>
	</tr>
</table>
<br />
<button id="btnHome">홈으로</button>
</div>
</section>
</div>
<%@ include file="../home/footer.jsp" %>
</body>
</html>