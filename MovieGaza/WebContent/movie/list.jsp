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
<!-- bxslider CDN -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script>
	$(function(){
		$("#btnHome").click(function(){
			console.log("btnHome Ok...");
			location.href = "${path}/";
		});
	});
</script>
<style>
@import url('https://fonts.googleapis.com/css?family=Hi+Melody&display=swap');
	.list {
    	position: absolute;
    	margin: 0 20px;
        padding-top: 20px;
        /* top: 290px; */
        width: 300px;
        height: 300px;
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
    #paging a {
    	font-family: 'Hi Melody', cursive;
    	font-size: 50px;
    }
</style>
</head>
<body>
<%@ include file="../home/menu.jsp" %>
<%@ include file="../home/header.jsp" %>

<!-- <div style="height: 800px; width: 100%; border: 1px dotted black; margin: 0;"> -->
<div style="height: 1000px;background-color: white;">
<section>
<!-- <div id="contents"> -->
<div id="contents" style="margin:0 auto;height: 1500px; width: 1300px;background-color: #FFFFF6;padding-top: 40px;">
<div style="margin: 0 auto;width: 270px;">
	<ul class="list-group list-group-horizontal-sm">
	  <li class="list-group-item"><a href="${path }/Movie/list?category=1">평점순</a></li>
	  <li class="list-group-item"><a href="${path }/Movie/list?category=2">개봉순</a></li>
	</ul>
</div> <br />
<table style="margin: 0 auto;text-align: center;"><%int i=-1; %>
	<c:forEach var="list" items="${list }" varStatus="status">
		<c:if test="${status.count%3 == 1 }" ><tr><%i++; %></c:if>
			<td>
				<div style="width: 300px;height: 300px;border: 1px solid black;margin: 20px 20px;">
			        <img src="${path }/images/${list.postfname }" alt="${list.postfname }" width="300px" height="300px"/>
			    </div>
		        <div class="list" style="top:<%=338+i*338%>px;">
		        <%=i %>
		        <h1>
					<a href="${path }/Movie/info?moviecode=${list.moviecode}&curPage=1">${list.title }</a> <br />
		        </h1> <br />
		        <div style="margin-top: 40px;">
		        	<h2>
		        		${list.open } <br />
						${list.score } <br />
		        	</h2>
		        	
		        </div>
				</div>
			</td>
		<c:if test="${status.count%3 == 0 }"></tr></c:if>	
	</c:forEach>
	<tr id="paging">
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