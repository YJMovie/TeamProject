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
<link rel="stylesheet" href="../css/bootstrap.min.css">
<script src="../js/bootstrap.min.js"></script>
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
	<%@ include file="../home/header.jsp"%>
	<%@ include file="../home/menu.jsp"%>
	
	<div style="height: 1000px;background-color: white;">
		
	<section>
	<div id="contents" style="margin:0 auto;height: 1000px; width: 1300px;background-color: #FFFFF6;padding-top: 40px;">
		<h2>회원수정</h2>
	   <form action="${path}/Admin/memUpdate" name="memupdate" method="post">
			<table style="margin: 0 auto;">
			<tr>
				<td>
					<div class="form-group">
					    <label for="exampleInputEmail1">아이디</label>
					    <input type="text" class="form-control" id="userid" name="userid" 
					    value="${dto1.userid}" maxlength="15" readonly="readonly" aria-describedby="emailHelp">
					  </div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="form-group">
					    <label for="exampleInputPassword1">비밀번호</label>
					    <input type="password" class="form-control" id="userpwd" name="userpwd" maxlength="15">
					  </div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="form-group">
					    <label for="exampleInputPassword1">비밀번호확인</label>
					    <input type="password" class="form-control" id="passcheck" name="passcheck" maxlength="15">
					  </div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="form-group">
					    <label for="exampleInputEmail1">이름</label>
					    <input type="text" class="form-control" id="name" name="name" aria-describedby="emailHelp" 
					    value="${dto1.name}" maxlength="40">
					  </div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="form-group">
					    <label for="exampleInputEmail1">성별</label>
					    <input type="radio" name="gender" value="남" checked>남
						<input type="radio" name="gender" value="여">여
					  </div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="form-group">
					    <label for="exampleInputEmail1">주소</label>
					    <div class="form-row">
						    <div class="col-3">
					    		<input type="text" class="form-control" id="sample4_postcode" name="sample4_postcode" value="${dto1.sample4_postcode }">
					    	</div>
					    	<div class="col">
								<input type="button" class="btn btn-primary" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
							</div>
						</div>
						<div class="form-row">
						    <div class="col">
								<input type="text" class="form-control" id="sample4_roadAddress" name="sample4_roadAddress" value="${dto1.sample4_roadAddress }">
							</div>
							<div class="col">
								<input type="text" class="form-control" id="sample4_jibunAddress" name="sample4_jibunAddress" value="${dto1.sample4_jibunAddress }">
							</div>
						</div>
						<span id="guide" style="color:#999;display:none"></span>
						<input type="text" class="form-control" id="sample4_detailAddress" name="sample4_detailAddress" value="${dto1.sample4_detailAddress }">
					  </div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="form-group">
					    <label for="exampleInputEmail1">핸드폰</label>
					    <div class="form-row">
						    <div class="col">
						      <input type="text" class="form-control" id="phone1" name="phone1" value="${dto1.phone1 }">
						    </div>-
						    <div class="col">
						      <input type="text" class="form-control" id="phone2" name="phone2" value="${dto1.phone2 }">
						    </div>-
						    <div class="col">
						      <input type="text" class="form-control" id="phone3" name="phone3" value="${dto1.phone3 }">
						    </div>
						</div>
					  </div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="form-group">
					    <label for="exampleInputEmail1">이메일</label>
					    <div class="form-row">
						    <div class="col-5">
						      <input type="text" class="form-control" name="email1" maxlength="30" id="email1" value="${dto1.email1 }">
						    </div>@
						    <div class="col">
						      <select id="inputState" class="form-control" name="email2" value="${dto1.email2 }">
						        <option selected="selected">naver.com</option>
								<option>daum.net</option>
								<option>nate.com</option>
								<option>gmail.com</option>
						      </select>
						    </div>
						 </div>
					  </div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="form-group">
					    <label for="exampleInputEmail1">회원등급</label>
					    <input type="radio" name="usergrade" value="0">관리자
						<input type="radio" name="usergrade" value="1">VIP
						<input type="radio" name="usergrade" value="2" checked="checked">일반회원
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<input type="submit" class="btn btn-primary" value="수정" />
			        <input type="reset" class="btn btn-primary" value="재작성" />
			        <input type="button" class="btn btn-primary" value="돌아가기" id="btnBack" />
				</td>
			</tr>
		</table>
		</form>
	  </div>
	  </section>
	  </div>
	  <%@ include file="../home/footer.jsp" %>
</body>
</html>