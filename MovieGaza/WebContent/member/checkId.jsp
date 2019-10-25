<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중복 아이디 체크</title>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<script src="../js/bootstrap.min.js"></script>
<script src="../script/jquery-3.4.1.min.js"></script>
</head>
<style>
@import url('https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap');
body{
    font-family: 'Do Hyeon', sans-serif;
    }
</style>
<script>
	function idok() {
		opener.writeform.userid.value = "${userid}";
		self.close();
	}
</script>
<body style="background-color: #FFFFF6;">
	<div style="margin-left: 20px;">
	
		<h2><span class="badge badge-pill badge-warning">ID 중복 확인</span></h2>
	
		<form action="${path}/Member/idCheck.do" method="get" name="frm">
			<div class="form-group">
			    <label for="exampleInputEmail1">아이디</label>
				    <div class="form-row">
					    <div class="col-7">
				    	<input type="text" class="form-control" id="userid" name="userid" maxlength="15" aria-describedby="emailHelp" placeholder="ID">
				    	</div>
				    	<div class="col-2">
				    	<input type="submit" class="btn btn-warning" value="중복체크" onclick="id_chk()">
				    	</div>
				    </div>
			  </div>
			
			<c:if test="${result==1 }">
				<script>
					opener.document.frm.userid.value = "";
				</script>
				<span style="color: red"> ${userid}는 이미 사용중입니다. </span>
			</c:if>
	
			<c:if test="${result==-1 }">
	
			${userid}는 사용 가능합니다.
			
			<input type="button" class="btn btn-warning" value="사용" onclick="idok()" />
	
			</c:if>
		</form>
	</div>
</body>
</html>