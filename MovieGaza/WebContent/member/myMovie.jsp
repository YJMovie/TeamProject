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
</head>
<body>
	
	<%@ include file="../home/menu.jsp" %>
	<%@ include file="../home/header.jsp" %>
	<div id="contents" style="margin:0 auto;height: 1000px; width: 1300px;background-color: #FFFFF6;padding-top: 40px;">
		<div style="display: inline-block;margin-left: 325px;">
		
			<h2>${sId }님 즐겨찾는 영화</h2>
		</div>
		<div style="width: 650px;margin-left: 325px;">
			<hr style="border: 2px solid #FFDC7E;">
		
		</div>
		
		
		<div style="display: inline-block;margin-left: 325px;">
		<table class="table">
		  <thead class="table-warning">
		    <tr>
		      <th scope="col">영화제목</th>
		      <th scope="col">영화장르</th>
		      <th scope="col">출연배우</th>
		      <th scope="col">감독</th>
		      <th scope="col">개봉일</th>
		      <th scope="col">명대사</th>
		      <th scope="col">수정/삭제</th>
		    </tr>
		  </thead>
		  <tbody>
		    <c:forEach items="${MovieList}" var="a"> 
			<tr>
				<td>${a.title }</td>
				<td>장르</td>
				<td>출연배우</td>
				<td>감독</td>
				<td>${a.open }</td>
				<td>${a.lines }</td>
				
				<td>
					<a href="${path}/Member/mymovie_delete?mem_mvcode=${a.moviecode}&mem_userid=${sId}">
						 <input type="button" class="btn btn-warning" value="삭제" id="btndelete" /></a>
				</td>
			</tr>
			</c:forEach>
			<tr>
				<td colspan="10" align="center">
					<c:if test="${cur_block > 1}">
						<a href="${path }/controller/jmember.do?curPage=${prev_page}">[이전]</a>
					</c:if>
					<c:forEach var="i" begin="${blockStart }" end="${blockEnd }">
						<a href="${path }/controller/jmember.do?curPage=${i }">${i }</a>&nbsp;
					</c:forEach>
					<c:if test="${cur_block < totBlock }">
						<a href="${path }/controller/jmember.do?curPage=${next_page}">[다음]</a>
					</c:if>
				</td>
			</tr>
		  </tbody>
		</table>
		</div>
		<div style="margin-left: 910px;">
			<a href="mypage?sId=${sId }"><button class="btn btn-warning">뒤로가기</button></a>
		</div>
	</div>
	<%@ include file="../home/footer.jsp" %>
</body>
</html>