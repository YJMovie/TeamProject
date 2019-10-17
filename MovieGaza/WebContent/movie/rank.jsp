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
      var url = "${path}/Movie/title?movieTitle="
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
<nav>
현재 상영영화
<ul class="sorting">
<li><a href="${pageContext.request.contextPath}/Movie/rank">예매순</a></li>
<li><a href="${pageContext.request.contextPath}/Movie/date">개봉순</a></li>
<li><a href="${pageContext.request.contextPath}/Movie/stars">평점순</a></li>
</ul>
</nav>
<table border = "1">
<tr>
<td>영화순위</td>
<td>영화제목</td>
<td>영화 이미지</td>
<td>장르</td>
<td>영화시간</td>
<td>개봉일</td>
<td>감독</td>
<td>출연</td>
<td>사이트 이동</td>
</tr>



<c:forEach var="movieInfo" items="${movieInfo}" varStatus="status">
<tr>
<td><div>${status.count}</div>  </td>

<c:set var="moviename" value="movierank${status.count}"/>

<!-- id값이 한글로 지정이 안되기 때문에 각영화별로 movierank1, movierank2 형식으로 변경한 후 값을 넘겨줌 -->
<!-- 클릭시 해당함수 실행 및 id값을 보내줌. -->
<!-- 클래스값을 이용하여 영화제목을 받아올 것이기 때문에 클래스 값에 영화 제목 삽입 -->
<td><a href="javascript:void(0);" id="${moviename}" class="${movieInfo.movieTitle}" onclick="findMovie(this.id)"> ${movieInfo.movieTitle}</a></td>


<td><img src="${movieInfo.movieImg }"/></td>
<td>${movieInfo.movieGenre}</td>
<td>${movieInfo.movieTime}</td>
<td>${movieInfo.movieDate}</td>
<td>${movieInfo.movieDirector}</td>
<td>${movieInfo.movieActor}</td>

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
</table>
</body>
</html>