<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
@import url('https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap');
.card{
background-color: #FFFFF6;
width: 1300px;
margin: 0 auto;
}
.card-header{
padding: 150px;
height: 50px;
}
#left{
float: left;
}
#left a {
line-height: 150px;
}
#right {
padding-top: 90px;
}
body{
    font-family: 'Do Hyeon', sans-serif;
    }


</style>

<c:if test="${sGrade == 0 }">
	<div class="card">
	  <div class="card-header">
	  	<div style="text-align: center;">
		    <h2><a href="${path }/Admin/main" style="text-decoration: none;color: black;">영화가즈아(관리자)</a></h2>  	
	  	</div>  	
	  	
	  </div>
	</div>
</c:if>
<c:if test="${sGrade == null }">
	<div class="card">
	  <div class="card-header">
	  	<div style="text-align: center;">
		    <h2><a href="${path }/Home" style="text-decoration: none;color: black;">영화가즈아(비회원)</a></h2>  	
	  	</div>  	
	  	
	  </div>
	</div>
</c:if>
<c:if test="${sGrade == 2 }">
	<div class="card">
	  <div class="card-header">
	  	<div style="text-align: center;">
		    <h2><a href="${path }/Home" style="text-decoration: none;color: black;">영화가즈아(회원)</a></h2>  	
	  	</div>  	
	  	
	  </div>
	</div>
</c:if>