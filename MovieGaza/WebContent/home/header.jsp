<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:if test="${sName == null }">
	<div class="card">
	  <div class="card-header">
	  	<div style="text-align: center;">
		    <h2><a href="${path }/Home" style="text-decoration: none;color: black;">영화가즈아(비회원)</a></h2>  	
	  	</div>  	
	  	<div style="text-align: right;">
		    <a href="${path }/member/login.jsp"><button type="button" class="btn btn-outline-primary">로그인</button></a>
		  	<a href="${path }/Member/join.do"><button type="button" class="btn btn-outline-primary">회원가입</button></a>  	
	  	</div>
	  </div>
	</div>
</c:if>
<c:if test="${sName != null }">
	<div class="card">
	  <div class="card-header">
	  	<div style="text-align: center;">
		    <h2><a href="${path }/Home" style="text-decoration: none;color: black;">영화가즈아(회원)</a></h2>  	
	  	</div>  	
	  	<div style="text-align: right;">
			<h4><span>${sName }</span>님 환영합니다.</h4>
		    <a href="${path }/Log/logout.do"><button type="button" class="btn btn-outline-primary">로그아웃</button></a>
		  	<a href="${path }/Member/join.do"><button type="button" class="btn btn-outline-primary">회원수정</button></a>
	  	</div>
	  </div>
	</div>
</c:if>