<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<div id="menubar">
	
		<nav class="navbar navbar-dark bg-dark">
		<form action="${path }/Search/list.do" name="searchform" method="get">
			<div class="input-group mb-3">
			  <input type="text" name="keyword" class="form-control" placeholder="Recipient's username" aria-label="Recipient's username" aria-describedby="button-addon2">
			  <div class="input-group-append">
			    <input class="btn btn-outline-secondary" type="submit" id="button-addon2" value="검색">
			  </div>
			</div>
		</form>
		<ul class="nav nav-pills nav-fill">
		  <li class="nav-item">
		    <a class="btn btn-outline-light" href="${path }/Movie/list">영화</a>
		  </li>
		  <li class="nav-item">
		    <a class="btn btn-outline-light" href="#">이벤트</a>
		  </li>
		  <li class="nav-item">
		    <a class="btn btn-outline-light" href="#">랭킹</a>
		  </li>
		  <li class="nav-item">
		    <a class="btn btn-outline-light" href="#" tabindex="-1" aria-disabled="true">즐겨찾기</a>
		  </li>
		</ul>
		</nav>
	
</div>