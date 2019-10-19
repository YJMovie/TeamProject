<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화가즈아</title>
<link rel="stylesheet" href="${path }/css/bootstrap.min.css">
<script src="${path }/js/bootstrap.min.js"></script>
<style>
    .list {
    	position: absolute;
        padding-top: 20px;
        top: 330px;
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
    .list1 {
    	position: absolute;
        padding-top: 20px;
        top: 546px;
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
    .list1:hover {
    	opacity: 1;
        -moz-transform: translateY(-200px);
        -ms-transform: translateY(-200px);
        -o-transform: translateY(-200px);
        -webkit-transform: translateY(-200px);
        transform: translateY(0px);
    }
    .list1 {
        color: #fff;
        text-align: center;
    }
    .list1 a {
    	text-decoration: none;
    	color: #fff;
    }
    .list2 {
    	position: absolute;
        padding-top: 20px;
        top: 770px;
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
    .list2:hover {
    	opacity: 1;
        -moz-transform: translateY(-200px);
        -ms-transform: translateY(-200px);
        -o-transform: translateY(-200px);
        -webkit-transform: translateY(-200px);
        transform: translateY(0px);
    }
    .list2 {
        color: #fff;
        text-align: center;
    }
    .list2 a {
    	text-decoration: none;
    	color: #fff;
    }
</style>
</head>
<body>
<div>
	<%@ include file="header.jsp"%>
	<%@ include file="menu.jsp"%>
	
	<div style="height: 1000px;background-color: white;">
		
		<section>
			<div id="contents" style="margin:0 auto;height: 1000px; width: 900px;background-color: #EAEAEA;padding-top: 40px;">

					<h2>영화목록</h2>
					<table border="1" style="margin: 0 auto;">
						<tr>
							
							<c:forEach var="list" items="${listRandom }">
								<td>
									<div style="width: 150px;height: 150px;border: 1px solid black;margin-top: 20px;">
							        	<img src="${path }/images/${list.postfname }" alt="${list.postfname }" width="150px" height="150px"/>
							        </div>
									<div class="list">
										<h4>
										<a href="${path }/Movie/info?moviecode=${list.moviecode}&curPage=1">${list.title }</a>
										</h4> <br />
										${list.open }<br />
									</div>
								</td>						
							</c:forEach>
							
						</tr>
					</table>			

				<h2>평점순</h2>
				<table border="1" style="margin: 0 auto;">
					<tr>
						<c:if test="${curPage > 1 }">						
							<td><a href="${path }/Home?curPage=${curPage-1}">◀</a></td>
						</c:if>
						<c:forEach var="list" items="${listScore }">
							<td>
								<div style="width: 150px;height: 150px;border: 1px solid black;margin-top: 20px;">
							        <img src="${path }/images/${list.postfname }" alt="${list.postfname }" width="150px" height="150px"/>
							    </div>
						        <div class="list1">
						        	<h4>
									<a href="${path }/Movie/info?moviecode=${list.moviecode}&curPage=1">${list.title }</a> <br />
									</h4> <br />
									${list.open }<br />
									평점:${list.score }
								</div>
							</td>						
						</c:forEach>
						<c:if test="${curPage < totPage }">
							<td><a href="${path }/Home?curPage=${curPage+1}">▶</a></td>
						</c:if>
					</tr>
				</table>
				<c:set var="idchk" value="${userid}"
						scope="session" />
				<c:if test="${idchk == null}">
					<h2>추천 장르 : ${showGenre}</h2>
					<table border="1" style="margin: 0 auto;">
						<tr>
							<c:if test="${curPage > 1 }">						
								<td><a href="${path }/Home?curPage=${curPage-1}">◀</a></td>
							</c:if>
							<c:forEach var="list" items="${listGenre}">
								<td>
									<div style="width: 150px;height: 150px;border: 1px solid black;margin-top: 20px;">
								        <img src="${path }/images/${list.postfname }" alt="${list.postfname }" width="150px" height="150px"/>
								    </div>
									<div class="list2">
										${list.title } <br />
										<a href="${path }/Movie/info?moviecode=${list.moviecode}&curPage=1">이미지</a> <br />
										${list.open }<br />
										${list.score }<br />
									</div>
								</td>						
							</c:forEach>
							<c:if test="${curPage < totPage }">
								<td><a href="${path }/Home?curPage=${curPage+1}">▶</a></td>
							</c:if>
						</tr>
					</table>	
				
				</c:if>
				<c:if test="${idchk != null}">
					<h2>${userid}님께 추천하는 추천 장르 : ${showGenre}</h2>
					<table border="1" style="margin: 0 auto;">
						<tr>
							<c:if test="${curPage > 1 }">						
								<td><a href="${path }/Board/home.do?curPage=${curPage-1}">◀</a></td>
							</c:if>
							<c:forEach var="list" items="${userGenreList}">
								<td>
									<div style="width: 150px;height: 150px;border: 1px solid black;margin-top: 20px;">
							        	포스터
							        </div>
									<div class="list2">
										${list.title } <br />
										<a href="${path }/Movie/info?moviecode=${list.moviecode}&curPage=1">이미지</a> <br />
										${list.open }<br />
										${list.score }<br />
									</div>
								</td>						
							</c:forEach>
							<c:if test="${curPage < totPage }">
								<td><a href="${path }/Board/home.do?curPage=${curPage+1}">▶</a></td>
							</c:if>
						</tr>
					</table>	
				
				</c:if>
						
			</div>
		</section>
		
	</div>
	<%@ include file="footer.jsp"%>

</div>
</body>
</html>