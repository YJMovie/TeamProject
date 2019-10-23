<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의</title>
<script src="${path }/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${path }/css/bootstrap.min.css">
<link rel="stylesheet" href="${path }/css1/style.css">
<!-- bxslider CDN -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<style>

#help {
	padding-top: 20px;
	color: red;
}


.tb_write {
	border-top: 1px solid #000;
	margin-bottom: 20px;
}

.tb_write th {
	font-size: 16px;
	background: #FFFFF6;
	color: #333;
	font-weight: bold;
	border-bottom: 1px solid #c4c4c4;
	text-align: center;
	padding: 10px 0
}

.tb_write td {
	background: #fff;
	border-bottom: 1px solid #c4c4c4;
	padding: 8px 0 8px 15px;
	vertical-align: middle;
}

.tb_write input.inputText {
	border: 1px solid #ebebeb;
	background: #f3f3f3;
	font-size: 14px;
	height: 20px;
}

.tb_write textarea.textarea {
	border: 1px solid #ebebeb;
	background: #f3f3f3;
	font-size: 14px;
	height: 20px;
	margin: 5px 0
}

.tb_write select {
	border: 1px solid #ebebeb;
	background: #f3f3f3;
	font-size: 14px;
	height: 21px;
}

</style>
</head>
<body>
	<%@ include file="menu.jsp"%>
	<%@ include file="header.jsp"%>
	<div id="background" style="width:1300px;margin: 0 auto;">
		<div id="help" >
			<h1>영화가즈아 1:1문의</h1>
		</div>
	
		<div id="text">
			<h5>
				영화가즈아를 이용하면서 궁금하신 점이 있으신가요?<br> 1:1 문의를 통해 문의해주시면 담당자가 확인 후 최대한
				빠른시간에 친절한 답변을 드리도록 하겠습니다.
			</h5>
		</div>
		<table class="tb_write" summary="1행 제목, 2행 아이디, 3행 보내는 분 이메일, 4행 내용">
			<colgroup>
				<col width="170px" />
				<col width="*" />
			</colgroup>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" class="inputText"
					style="width: 750px" /></td>
			</tr>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="username" class="inputText"
					style="width: 250px" /></td>
			</tr>
			<tr>
				<th>보내는 분 이메일</th>
				<td><input type="text" name="email" class="inputText"
					style="width: 250px" /></td>
			</tr>
			<tr>
				<th>약관</th>
				<td>
					<div class="terms">
						<strong>1. 수집하는 개인정보의 항목 및 수집방법 </strong><br /> <br /> (1) 수집하는
						개인정보 항목<br /> 고객센터의 1대1문의는 원활한 고객상담, 각종 서비스의 제공을 위해 아래와 같은 개인정보를
						수집하고 있습니다.<br /> - 이메일 주소<br /> <br /> (2)개인정보 수집방법<br />
						1대1문의는 이용자가 자발적으로, 구체적으로 기입할 때만 개인정보를 수집하고 있습니다.<br /> <br /> <strong>2.
							개인정보 수집 및 이용목적 </strong><br /> 영화가즈아 사이트는 수집한 개인정보를 다음의 목적을 위해 활용합니다.<br />
						<br /> (1) 비회원관리<br /> 고객센터의 1대1문의는 비회원의 글쓰기도 가능하여 문의에 대한 원활한 답변을
						드리고자 개인정보를 수집하고 있습니다.<br /> <br /> <strong>3. 개인정보의 보유 및
							이용기간 </strong> <br /> 영화가즈아의 개인정보의 보유기간은 3년입니다.
					</div>
					<div class="radio_area">
						<input type="radio" name="agree" value="Y" class="inputRadio" />
						동의함 <span class="bar">|</span> <input type="radio" name="agree"
							value="N" class="inputRadio" checked /> 동의안함
					</div>
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="content" class="textarea"
						style="width: 750px; height: 200px">
						</textarea> <input type="button" value="등록"></td>
		</table>
	
	</div>

</body>
<%@ include file="footer.jsp"%>
</html>