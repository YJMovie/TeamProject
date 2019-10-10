<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<div id="menubar">
	
	<div style="margin:0 auto; width: 30%;">
		<form action="${path }/Search/list.do" name="searchform" method="get">
			<div class="input-group mb-3">
			  <input type="text" name="keyword" class="form-control" placeholder="Recipient's username" aria-label="Recipient's username" aria-describedby="button-addon2">
			  <div class="input-group-append">
			    <input class="btn btn-outline-secondary" type="submit" id="button-addon2" value="검색">
			  </div>
			</div>
		</form>
		
	</div>
	<div style=" width: 30%;margin: 0 auto; ">
		<div style="margin: 0 auto;">
			<ul class="list-group list-group-horizontal-sm">
			  <li class="list-group-item"><a href="${path }/Board/list.do">영화</a></li>
			  <li class="list-group-item">이벤트</li>
			  <li class="list-group-item">랭킹</li>
			  <li class="list-group-item">즐겨찾기</li>
			</ul>
		
		</div>
	</div>
	
</div>