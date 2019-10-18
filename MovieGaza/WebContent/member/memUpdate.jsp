<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<% request.setCharacterEncoding("utf-8");  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../script/jquery-3.4.1.min.js"></script>
<script>
	$(function(){
		console.log('function ok');
		
			$('#btnBack').click(function(){
				console.log('back ok');
				
				document.memupdate.action="${path}/";
				document.memupdate.submit();
			})
	});
</script>
<style type="text/css">
	.mem-update-form {
 	 position: absolute;
 	 padding: 20px;
  	width: 300px;
  	background-color: #EEEFF1;
  	border-radius: 5px;
  	top: 15%;
  	left: 40%;
  transform: translate(-505, -50%);
}
</style>
</head>
<body>
<div class="mem-update-form">
   <form action="${path}/controller/memUpdate.do" name="memupdate" method="post">
      <table>
         <tr>
            <td>아이디 :</td>
            <td><input type="text" readonly="readonly" id="userid" name="userid" value="${dto1.userid}" /></td>
         </tr>
         <tr>
            <td>비밀번호 :</td>
            <td><input type="password" id="userpwd" name="userpwd" value="${dto1.userpwd}" /></td>
         </tr>
         <tr>
            <td>이름 :</td>
            <td><input type="text" id="name" name="name" value="${dto1.name}" /></td>
         </tr>
         <tr>
            <td>성별 :</td>
            <td><input type="text" id="gender" name="gender" value="${dto1.gender}" /></td>
         </tr>
         <tr>
            <td>핸드폰 :</td>
            <td><input type="text" id="address" name="address" value="${dto1.phone}" /></td>
         </tr>
         <tr>
            <td>주소 :</td>
            <td><input type="text" id="phone" name="phone" value="${dto1.address}" /></td>
         </tr>
         <tr>
            <td>이메일 :</td>
            <td><input type="text" id="email" name="email" value="${dto1.email}" /></td>
         </tr>
      </table>
         <input type="submit" value="수정" id="btnList" />
         <input type="reset" value="재작성" />
         <input type="button" value="돌아가기" id="btnBack" />            
   </form>
  </div>
</body>
</html>