<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:if test="${sGrade == null }">
	<nav class="navbar nvabar-expand-md fixed-top navbar-dark bg-dark" style="width: 1300px; margin: 0 auto;">
	        
	          <form action="${path }/Search/list" name="searchform" method="get">
		<div class="input-group mb-3">
		  <input type="text" name="keyword" class="form-control" placeholder="Recipient's username" aria-label="Recipient's username" aria-describedby="button-addon2">
		  <div class="input-group-append">
		    <input class="btn btn-outline-secondary" type="submit" id="button-addon2" value="검색">
		  </div>
		</div>
	</form>
	<ul class="nav nav-pills nav-fill">
	  <li>
	  	<div style="text-align: right;">
		    <a href="${path }/member/login.jsp"><button type="button" class="btn btn-outline-warning">로그인</button></a>
		  	<a href="${path }/Member/join.do"><button type="button" class="btn btn-outline-warning">회원가입</button></a>
		  	<a class="btn btn-outline-light" href="${path }/Movie/list">영화</a> 
		  	<a class="btn btn-outline-light" href="${path }/home/event.jsp">이벤트</a> 	
		  	<a class="btn btn-outline-light" href="${path }/Movie/rank">랭킹</a>
		  	<a class="btn btn-outline-light" href="${path }/home/news.jsp">최신뉴스</a>
	  	</div>
	  </li>
	  
	</ul>
	          
	</nav>
</c:if>

<c:if test="${sGrade == 0 }">
	<nav class="navbar nvabar-expand-md fixed-top navbar-dark bg-dark" style="width: 1300px; margin: 0 auto;">
	        
	          <form action="${path }/Search/list" name="searchform" method="get">
		<div class="input-group mb-3">
		  <input type="text" name="keyword" class="form-control" placeholder="Recipient's username" aria-label="Recipient's username" aria-describedby="button-addon2">
		  <div class="input-group-append">
		    <input class="btn btn-outline-secondary" type="submit" id="button-addon2" value="검색">
		  </div>
		</div>
	</form>
	<ul class="nav nav-pills nav-fill">
	  <li>
	  	<div style="text-align: right;">
			<span style="color: white;">${sName }님 환영합니다.${sGrade }</span>
		    <a href="${path }/Log/logout.do"><button type="button" class="btn btn-outline-warning">로그아웃</button></a>
		  	<a href="${path }/Admin/update?userid=${sId}"><button type="button" class="btn btn-outline-warning">회원수정</button></a>
		  	<a href="${path }/Admin/main"><button type="button" class="btn btn-outline-warning">관리자</button></a>
		  	<a class="btn btn-outline-light" href="${path }/Movie/list">영화</a> 
		  	<a class="btn btn-outline-light" href="${path }/home/event.jsp">이벤트</a> 	
		  	<a class="btn btn-outline-light" href="${path }/Movie/rank">랭킹</a>
		  	<a class="btn btn-outline-light" href="${path }/home/news.jsp">최신뉴스</a>
	  	</div>
	  </li>
	  
	</ul>
	          
	</nav>
</c:if>

<c:if test="${sGrade == 2 }">
	<nav class="navbar nvabar-expand-md fixed-top navbar-dark bg-dark" style="width: 1300px; margin: 0 auto;">
	        
	          <form action="${path }/Search/list" name="searchform" method="get">
		<div class="input-group mb-3">
		  <input type="text" name="keyword" class="form-control" placeholder="Recipient's username" aria-label="Recipient's username" aria-describedby="button-addon2">
		  <div class="input-group-append">
		    <input class="btn btn-outline-secondary" type="submit" id="button-addon2" value="검색">
		  </div>
		</div>
	</form>
	<ul class="nav nav-pills nav-fill">
	  <li>
	  	<div style="text-align: right;">
			<span style="color: white;">${sName }님 환영합니다.${sGrade }</span>
		    <a href="${path }/Log/logout.do"><button type="button" class="btn btn-outline-warning">로그아웃</button></a>
		  	<a href="${path }/Member/mypage?sId=${sId}"><button type="button" class="btn btn-outline-warning">마이페이지</button></a>
		  	<a class="btn btn-outline-light" href="${path }/Movie/list">영화</a> 
		  	<a class="btn btn-outline-light" href="${path }/home/event.jsp">이벤트</a> 	
		  	<a class="btn btn-outline-light" href="${path }/Movie/rank">랭킹</a>
		  	<a class="btn btn-outline-light" href="${path }/home/news.jsp">최신뉴스</a>
	  	</div>
	  </li>
	  
	</ul>
	          
	</nav>
	
</c:if>
	
