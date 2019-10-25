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
<style>
@import url('https://fonts.googleapis.com/css?family=Hi+Melody&display=swap');
	.table {
    	font-family: 'Hi Melody', cursive;
    	font-weight: bold;
    }
    .table tbody a {
    	text-decoration: none;
    	color: black;
    }
</style>
</head>
<body>
<%@ include file="header.jsp"%>
<%@ include file="menu.jsp"%>
<!-- <div style="height: 500px; width: 100%; border: 1px dotted black; margin: 0;"> -->
			<div id="contents" style="margin:0 auto;height: 1500px; width: 1300px;background-color: #FFFFF6;padding-top: 40px;">
				<div style="display: inline-block;margin-left: 295px;">
				
					<h2>'${keyword }'에 대한 검색결과</h2>
				</div>
				<div style="width: 800px;margin-left: 295px;">
					<hr style="border: 2px solid #FFDC7E;">
				
				</div>
				<table class="table" style="text-align: center;width: 800px;margin-left: 295px;">
              <thead class="table-warning" style="font-size: 30px;">
                <tr>
                  <th scope="col" width="150px">포스터</th>
                  <th scope="col" >제목</th>
                  <th scope="col" >장르</th>
                  <th scope="col" >개봉일</th>
                  <th scope="col" >평점</th>
                </tr>
              </thead>
              <tbody style="font-size: 25px;">
                <c:forEach var="list" items="${list }">               
                  <tr>
                     <td>
                        <img src="../images/${list.postfname }" width="100px" />
                     </td>
                     <td>
                     <div style="display:block;height:100px;line-height: 100px;">
                     <a href="${path }/Movie/info?moviecode=${list.moviecode}&curPage=1">${list.title }</a>
                     </div>
                     </td>
                     <td>
                     	<div style="display:block;height:100px;line-height: 100px;">
                        ${list.moviegenre }
                        </div>
                     </td>
                     <td><div style="display:block;height:100px;line-height: 100px;">${list.open }</div></td>
                     <td><div style="display:block;height:100px;line-height: 100px;">${list.score }</div></td>
                  </tr>
               </c:forEach>
               <tr id="paging">
                  <td colspan="6">
                     <c:if test="${curBlock > 1 }">
                        <a href="${path }/Search/list?keyword=${keyword }&curPage=${prev_page}">이전</a>
                     </c:if>
                     <c:forEach var="i" begin="${block_start }" end="${block_end }">
                        <a href="${path }/Search/list?keyword=${keyword }&curPage=${i}">${i }</a>
                     </c:forEach>
                     <c:if test="${curBlock < totBlock }">
                        <a href="${path }/Search/list?keyword=${keyword }&curPage=${next_page}">다음</a>
                     </c:if>
                  </td>
               </tr>
              </tbody>
            </table>
			</div>
<%@ include file="footer.jsp"%>
</body>
</html>