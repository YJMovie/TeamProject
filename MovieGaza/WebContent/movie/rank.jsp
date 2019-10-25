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
<style>
@import url('https://fonts.googleapis.com/css?family=Hi+Melody&display=swap');
	.table {
    	font-family: 'Hi Melody', cursive;
    	font-size: 20px;
    	font-weight: bold;
    }
    #category ul li a {
    	text-decoration: none;
    	color: black;
    }
    
    
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

<script>
   //넘어온 id값을 이용하여 다시 class값을 찾아 movieTitle에 영화 제목을 삽입한다
   //이후 url에 한글을 바로 쓸 수 없기에 인코딩 과정을 거쳐 삽입한 후 url로 이동
   function findMovie(clicked_id) {
      
      var movieTitle = $('#' + clicked_id).attr('class');
      /* var url = "${path}/Movie/title?movieTitle="
            + encodeURI(encodeURIComponent(movieTitle)); */
      var url = "${path }/Movie/info?movieTitle="
          + encodeURI(encodeURIComponent(movieTitle)) ;
      
      $(function() {
         location.href = url;
      });
   }
   
</script>
<script>

$('#front').ready(function(){ 
    var make_star = ${make_star};
   
    $(".front").css('width',make_star+"px");
    });
</script>
</head>
<body>
<%@ include file="../home/header.jsp" %>
<%@ include file="../home/menu.jsp" %>

<div id="contents" style="margin:0 auto;height: 1000px; width: 1300px;background-color: #FFFFF6;padding-top: 40px;">
<nav>
<div style="color: red;font-size: 40px;"align="center">
<strong>현재 상영영화</strong>
</div>
<div style="text-align: center;">
	<div id="category" style="display: inline-block;">
	
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
  <thead class="table-warning">
    <tr>
      <th scope="col" width="150px">영화순위</th>
		<th scope="col" width="150px">영화제목</th>
		<th scope="col">포스터</th>
		<th scope="col" width="120px">장르</th>
		<c:set var="chkStar" value="${chkStar}"/>
		<c:if test="${chkStar == 'N'}"><th scope="col" width="150px">상영시간</th></c:if>
		<c:if test="${chkStar == 'Y'}"></c:if>
		<th scope="col">개봉일</th>
		<th scope="col">감독</th>
		<c:set var="chkStar" value="${chkStar}"/>
		<c:if test="${chkStar == 'N'}">
		<th scope="col">출연</th>
		</c:if>
		<c:set var="movieBookingchk" value="${movieBookingChk}" scope="session"/>
		<c:if test="${movieBookingchk!=NULL }">
		   <th scope="col" width="120px">예매율</th>   
		</c:if> 
		<c:if test="${chkStar == 'N'}"><th scope="col" width="150px">예매</th></c:if>
		<c:if test="${chkStar == 'Y'}"><th scope="col">평점</th></c:if>
    </tr>
  </thead>
  <tbody>
    <c:if test="${chkStar == 'N'}">

	<c:forEach var="movieInfo" items="${movieInfo}" varStatus="status">
	<tr>
	<td>
		<div style="display:block;height:100px;line-height: 100px; border:0px solid red;"  >${status.count}</div>
	</td>
	
	<c:set var="moviename" value="movierank${status.count}"/>
	
	<!-- id값이 한글로 지정이 안되기 때문에 각영화별로 movierank1, movierank2 형식으로 변경한 후 값을 넘겨줌 -->
	<!-- 클릭시 해당함수 실행 및 id값을 보내줌. -->
	<!-- 클래스값을 이용하여 영화제목을 받아올 것이기 때문에 클래스 값에 영화 제목 삽입 -->
	<td>
		<a href="javascript:void(0);" id="${moviename}" style="display:block;height:100px;line-height: 100px; border:0px solid red;" class="${movieInfo.movieTitle}" onclick="findMovie(this.id)"> ${movieInfo.movieTitle}</a>
	</td>
	
	
	<td><img src="${movieInfo.movieImg }" style="height: 100px;"/></td>
	<td>
		<div style="display:block;height:100px;line-height: 100px; ">${movieInfo.movieGenre}</div>
		
	</td>
	<td>
		<div style="display:block;height:100px;line-height: 100px; ">${movieInfo.movieTime}</div>
	</td>
	<td>
		<div style="display:block;height:100px;line-height: 100px; ">${movieInfo.movieDate}</div>
	</td>
	<td>
		<div style="display:block;height:100px;line-height: 100px;">${movieInfo.movieDirector}</div>
	</td>
	<td>
		<div style="display:block;height:100px;line-height: 100px;">${movieInfo.movieActor}</div>
	</td>
	<c:if test="${movieBookingchk!=NULL }">
	<td>
	<div style="display:block;height:100px;line-height: 100px; border:0px solid red;"  >
	<c:set var="booking" value="${movieInfo.movieBooking}" scope="session"/>
	    <c:if test="${booking == 'noBook'}">
	        -
	    </c:if>
	    <c:if test="${booking != 'noBook'}">
	      ${movieInfo.movieBooking}%
	    </c:if>
	 </div>
	 </td>
	 </c:if>
	<td><c:set var="aaa" value="${movieInfo.movieReserveURL}" scope="session"/>
	    <c:if test="${aaa == 'noSite'}">
	        <p>예매 사이트가 없습니다.</p>
	    </c:if>
	    <div style="display:block;height:100px;line-height: 100px; border:0px solid red;"  >
	    <c:if test="${aaa != 'noSite'}">
	       <a href="${movieInfo.movieReserveURL}">예매하기</a>    
	    </c:if>
	    </div>
	 </td>
	</tr>
	
	</c:forEach>
	</c:if>
	<c:if test="${chkStar == 'Y'}">
	<c:forEach var="listStars" items="${listStars}" varStatus="status">
	<tr>
	<td><div style="display:block;height:100px;line-height: 100px; ">${status.count}</div>  </td>
	<c:set var="moviename" value="movierank${status.count}"/>
	
	<!-- id값이 한글로 지정이 안되기 때문에 각영화별로 movierank1, movierank2 형식으로 변경한 후 값을 넘겨줌 -->
	<!-- 클릭시 해당함수 실행 및 id값을 보내줌. -->
	<!-- 클래스값을 이용하여 영화제목을 받아올 것이기 때문에 클래스 값에 영화 제목 삽입 -->
	<td>
	<div style="display:block;height:100px;line-height: 100px; ">
	<a href="javascript:void(0);" id="${moviename}" class="${listStars.title}" onclick="findMovie(this.id)"> ${listStars.title}</a>
	</div>
	</td>
	
	
	<td><img src="../images/${listStars.postfname }" width="100px"/></td>
	<td><div style="display:block;height:100px;line-height: 100px; ">${listStars.grname }</div></td>
	<td><div style="display:block;height:100px;line-height: 100px; ">${listStars.open}</div></td>
	<td><div style="display:block;height:100px;line-height: 100px; ">${listStars.psname}</div></td>
	
	<td>
	   <div class="box">
            <c:set var="starscore" value="${listStars.score/5*70}"></c:set>
            <div style="display:block;height:100px;line-height: 100px; ">
         <div class="back"><img src='../images/back_stars.png' ></div>
         <!-- 색깔별 --><div class="front" id="front" style="width:${starscore}px"><img src='../images/front_stars.png'></div>
         </div>
         </div>
         <div style="display:block;height:100px;line-height: 100px; ">
         ${listStars.score}점
         </div>
	
	 </td>
	</tr>
	
	</c:forEach>
	
	</c:if>
  </tbody>
</table>
</div>

</body>
</html>