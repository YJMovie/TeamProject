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

</script>


</head>
<body>
<%@ include file="../home/header.jsp" %>
<%@ include file="../home/menu.jsp" %>

<table border = "1">
<tr>
<td>영화순위</td>
<td>영화제목</td>
<td>영화 이미지</td>
<td>감독</td>
<td>장르</td>
<td>출연</td>
<td>사이트 이동</td>
</tr>
<c:forEach var="movieInfo" items="${movieInfo}" varStatus="status">
<tr>
<td>${status.count}  </td>
<td><a href="${movieInfo.movieURL}"> <c:out value="${movieInfo.movieTitle}"/></a></td>
<td><img src="${movieInfo.movieImg }"/></td>
<td>${movieInfo.movieDirector}</td>
<td>${movieInfo.movieGenre}</td>
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