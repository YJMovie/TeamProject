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
		$('#btnDelete').click(function(){
			console.log("btnDelte Ok...");
			var moviecode = $('#btnDelete').val();
			if (confirm("삭제하시겠습니까?")) {
				location.href="movie_delete?moviecode="+moviecode;
			} else {
				return;
			}
		});
	});
</script>
</head>
<body>
	<%@ include file="../home/header.jsp" %>
	<%@ include file="../home/menu.jsp" %>
	<div style="height: 1000px;background-color: white;">
	<section>
	<div id="contents" style="margin:0 auto;height: 1000px; width: 1300px;background-color: #FFFFF6;padding-top: 40px;">
		<h2 style="padding-left: 50px;">관리자페이지</h2>
		<div class="container">
         <div class="row">
            <div class="col-md-4" ></div>
            <div class="col-md-4" ></div>
            <div class="col-md-4" >
               <div align="right"><a href="main"><button class="btn btn-warning">뒤로가기</button></a></div>
            </div>
         </div>
            <table class="table table-borderless table-hover">
            <thead class="table-warning">
               <tr>
                  <th scope="col">영화코드</th>
                  <th scope="col">영화제목</th>
                  <th scope="col">영화장르</th>
                  <th scope="col">포스터파일</th>
                  <th scope="col">출연배우</th>
                  <th scope="col">영화감독</th>
                  <th scope="col">개봉일</th>
                  <th scope="col">명대사</th>
                  <th scope="col">삭제</th>
               </tr>
            </thead>
            <c:forEach var="list" items="${list }">
            <tbody>
               <tr>
                  <th scope="row">${list.moviecode}</th>
                  <td>${list.title }</td>
                  <td></td>
                  <td>${list.postfname }</td>
                  <td></td>
                  <td></td>
                  <td>${list.open }</td>
                  <td>${list.lines }</td>
                  <td>
                     <%-- <button id="btnDelete" value="${list.moviecode }">삭제</button> --%>
                     <a href="movie_delete?moviecode=${list.moviecode }">
                        <button class="btn btn-warning">삭제</button>
                     </a>
                  </td>
               </tr>
            </tbody>   
            </c:forEach>
               <tr>
                  <td colspan=12" align="center">
                     <c:if test="${curBlock > 1 }">
                        <a href="${path }/Admin/movie_list?category=${category}&curPage=${prev_page}">이전</a>
                     </c:if>
                     <c:forEach var="i" begin="${block_start }" end="${block_end }">
                        <a href="${path }/Admin/movie_list?category=${category}&curPage=${i}">${i }</a>
                     </c:forEach>
                     <c:if test="${curBlock < totBlock }">
                        <a href="${path }/Admin/movie_list?category=${category}&curPage=${next_page}">다음</a>
                     </c:if>
                  </td>
               </tr>
         </table>
      </div>
      </div>
		<%-- <table border="1" style="margin: 0 auto; text-align: center;">
			<tr>
				<td>영화코드</td>
				<td>영화제목</td>
				<td>영화장르</td>
				<td>포스터파일</td>
				<td>출연배우</td>
				<td>영화감독</td>
				<td>개봉일</td>
				<td>명대사</td>
				<td>삭제</td>
			</tr>
			<c:forEach var="list" items="${list }">
				<tr>
					<td>${list.moviecode }</td>
					<td>${list.title }</td>
					<td></td>
					<td>${list.postfname }</td>
					<td></td>
					<td></td>
					<td>${list.open }</td>
					<td>${list.lines }</td>
					<td>
						<button id="btnDelete" value="${list.moviecode }">삭제</button>
						<a href="movie_delete?moviecode=${list.moviecode }">
							<button>삭제</button>
						</a>
					</td>
				</tr>
				
			</c:forEach>
			<tr>
				<td colspan="9">
					<c:if test="${curBlock > 1 }">
						<a href="${path }/Admin/movie_list?category=${category}&curPage=${prev_page}">이전</a>
					</c:if>
					<c:forEach var="i" begin="${block_start }" end="${block_end }">
						<a href="${path }/Admin/movie_list?category=${category}&curPage=${i}">${i }</a>
					</c:forEach>
					<c:if test="${curBlock < totBlock }">
						<a href="${path }/Admin/movie_list?category=${category}&curPage=${next_page}">다음</a>
					</c:if>
				</td>
			</tr>
		</table> --%>
	</div>
	</section>
	</div>
</body>
</html>