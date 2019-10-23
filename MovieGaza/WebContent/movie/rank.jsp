<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화가즈아</title>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<script src="../js/bootstrap.min.js"></script>
<script src="../script/jquery-3.4.1.min.js"></script>

<c:set var="moviename" value="a"/>

<script>
   //넘어온 id값을 이용하여 다시 class값을 찾아 movieTitle에 영화 제목을 삽입한다
   //이후 url에 한글을 바로 쓸 수 없기에 인코딩 과정을 거쳐 삽입한 후 url로 이동
   function findMovie(clicked_id) {
      
      var movieTitle = $('#' + clicked_id).attr('class');
      /* var url = "${path}/Movie/title?movieTitle="
            + encodeURI(encodeURIComponent(movieTitle)); */
      var url = "${path }/Movie/info?movieTitle="
          + encodeURI(encodeURIComponent(movieTitle));
      
      $(function() {
         location.href = url;
      });
   }
</script>
</head>
<body>
<%@ include file="../home/header.jsp" %>
<%@ include file="../home/menu.jsp" %>
<div style="height: 1000px;background-color: white;">
<section>
<div id="contents" style="margin:0 auto;height: 1000px; width: 1300px;background-color: #FFFFF6;padding-top: 40px;">
<nav>
<h2 align="center">현재 상영영화</h2>
<div style="text-align: center;">
	<div style="display: inline-block;">
	
		<ul class="list-group list-group-horizontal-sm">
		<!-- <ul class="sorting"> -->
		<li class="list-group-item"><a href="${pageContext.request.contextPath}/Movie/rank">예매순</a></li>
		<li class="list-group-item"><a href="${pageContext.request.contextPath}/Movie/date">개봉순</a></li>
		<li class="list-group-item"><a href="${pageContext.request.contextPath}/Movie/stars">평점순</a></li>
		</ul>
	</div>
</div>
</nav>
<hr />
<table class="table">
  <thead class="thead-dark">
    <tr>
      <th scope="col" width="150px;">영화순위</th>
		<th scope="col">영화제목</th>
		<th scope="col">영화 이미지</th>
		<th scope="col">장르</th>
		<c:set var="chkStar" value="${chkStar}"/>
		<c:if test="${chkStar == 'N'}"><th scope="col">영화시간</th></c:if>
		<c:if test="${chkStar == 'Y'}"></c:if>
		<th scope="col">개봉일</th>
		<th scope="col">감독</th>
		<th scope="col">출연</th>
		<c:set var="movieBookingchk" value="${movieBookingChk}" scope="session"/>
		<c:if test="${movieBookingchk!=NULL }">
		   <th scope="col">예매율</th>   
		</c:if> 
		<c:set var="chkStar" value="${chkStar}"/>
		<c:if test="${chkStar == 'N'}"><th scope="col">사이트 이동</th></c:if>
		<c:if test="${chkStar == 'Y'}"><th scope="col">평점</th></c:if>
    </tr>
  </thead>
  <tbody>
    <c:if test="${chkStar == 'N'}">

	<c:forEach var="movieInfo" items="${movieInfo}" varStatus="status">
	<tr>
	<td><div>${status.count}</div>  </td>
	
	<c:set var="moviename" value="movierank${status.count}"/>
	
	<!-- id값이 한글로 지정이 안되기 때문에 각영화별로 movierank1, movierank2 형식으로 변경한 후 값을 넘겨줌 -->
	<!-- 클릭시 해당함수 실행 및 id값을 보내줌. -->
	<!-- 클래스값을 이용하여 영화제목을 받아올 것이기 때문에 클래스 값에 영화 제목 삽입 -->
	<td>
		<a href="javascript:void(0);" id="${moviename}" style="display:block;height:100px;line-height: 100px; border:0px solid red;" class="${movieInfo.movieTitle}" onclick="findMovie(this.id)"> ${movieInfo.movieTitle}</a>
	</td>
	
	
	<td><img src="${movieInfo.movieImg }" style="height: 100px;"/></td>
	<td>
		<div style="display:block;height:100px;line-height: 100px; border:0px solid red;"  >${movieInfo.movieGenre}</div>
		
	</td>
	<td>${movieInfo.movieTime}</td>
	<td>${movieInfo.movieDate}</td>
	<td>${movieInfo.movieDirector}</td>
	<td>${movieInfo.movieActor}</td>
	<c:if test="${movieBookingchk!=NULL }">
	<td>
	<c:set var="booking" value="${movieInfo.movieBooking}" scope="session"/>
	    <c:if test="${booking == 'noBook'}">
	        -
	    </c:if>
	    <c:if test="${booking != 'noBook'}">
	      ${movieInfo.movieBooking}%
	    </c:if>
	 </td>
	 </c:if>
	<td><c:set var="aaa" value="${movieInfo.movieReserveURL}" scope="session"/>
	    <c:if test="${aaa == 'noSite'}">
	        <p>예매 사이트가 없습니다.</p>
	    </c:if>
	    <c:if test="${aaa != 'noSite'}">
	       <a href="${movieInfo.movieReserveURL}">예매하기</a>    
	    </c:if>
	 </td>
	</tr>
	
	</c:forEach>
	</c:if>
	<c:if test="${chkStar == 'Y'}">
	<c:forEach var="listStars" items="${listStars}" varStatus="status">
	<tr>
	<td><div>${status.count}</div>  </td>
	<c:set var="moviename" value="movierank${status.count}"/>
	
	<!-- id값이 한글로 지정이 안되기 때문에 각영화별로 movierank1, movierank2 형식으로 변경한 후 값을 넘겨줌 -->
	<!-- 클릭시 해당함수 실행 및 id값을 보내줌. -->
	<!-- 클래스값을 이용하여 영화제목을 받아올 것이기 때문에 클래스 값에 영화 제목 삽입 -->
	<td><a href="javascript:void(0);" id="${moviename}" class="${listStars.title}" onclick="findMovie(this.id)"> ${listStars.title}</a></td>
	
	
	<td><img src="#"/></td>
	<td>장르</td>
	<td>${listStars.open}</td>
	<td>감독쓰</td>
	<td>배우쓰</td>
	
	<td>
	 </td>
	</tr>
	
	</c:forEach>
	
	</c:if>
  </tbody>
</table>
</div>
</section>
</div>
</body>
</html>