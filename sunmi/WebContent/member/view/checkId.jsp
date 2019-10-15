<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중복 아이디 체크</title>
</head>
<script>
	function idok() {
		opener.writeform.userid.value = "${userid}";
		self.close();
	}
</script>
<body>
	<h2>ID 중복 확인</h2>

	<form action="${path}/join_servlet/idCheck.do" method="get" name="frm">
		아이디 : <input type="text" name="userid" /> <input type="submit"
			value="중복체크" /><br>
		<c:if test="${result==1 }">
			<script>
				opener.document.frm.userid.value = "";
			</script>
			<span style="color: red"> ${userid}는 이미 사용중입니다. </span>
		</c:if>

		<c:if test="${result==-1 }">

		${userid}는 사용 가능합니다.
		
		<input type="button" value="사용" onclick="idok()" />

		</c:if>
	</form>
</body>
</html>