<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>광고 및 제휴안내</title>
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
body {
	background-color: #FFFFF6;

}
#ad {
	font-size: 50px;
	text-align: center;
	height: 80px;
	background-color: #FFFFF6;
	padding-top: 15px;
}

#find {
	font-size: 25px;
	text-align: center;
	background-color: #FFFFF6;
	padding-top: 15px;
}

.contact_box {
	font-size: 30px;
	padding-top: 40px;
	color: red;
	text-align: center;
	background-color: #FFFFF6;
}

.text {
	font-size: 20px;
	text-align: center;
	background-color: #FFFFF6;
}
.num {
	font-size: 30px;
	text-align: center;
	background-color: #FFFFF6;
}
#background {
background-color: #FFFFF6;
}
</style>
</head>

<body>
	<div>
		<%@ include file="menu.jsp"%>
		<%@ include file="header.jsp"%>
		
		<div id="background" style="width:1300px;margin: 0 auto;">
		<div id="ad">
			★광고 및 제휴안내★<br>
		</div>
		
		<div id="find">
			글로벌 종합 엔터테인먼트 미디어 그룹을 지향하는 <strong>영화가즈아</strong>가 <br> 21세기 무한
			경쟁시대를 함께 헤쳐나갈 협력파트너를 찾습니다.
		</div>
		
		<div class="contact_box">대표전화</div>
		<div class="num"><strong>051-1588-1234</strong></div>
			
		<div class="contact_box">
			취재ㆍ편집팀문의<br>
			</div>
			<div class="text">
				영화가즈아 취재팀/편집팀<br /> <strong>051-1588-5678</strong><br />
				<p class="desc">영화가즈아의 취재, 편집 등 기사에 대한 문의를 처리해드립니다.</p>
			</div>
		<div class="contact_box">
			
				시사회 및 경품 이벤트
			</div>
			<div class="text">
				개발팀<br /> <strong>051-1588-1111</strong><br />
				<p class="desc">시사회 및 경품 이벤트 관련 문의나 영화 프로모션의 일환으로 영화가즈아와 함께 시사회
					및 이벤트를 진행하고자 희망하시는 영화사/홍보사 담당자께서는 아래의 연락처로 문의 바랍니다. 성실히 진행해 드리겠습니다.</p>
			</div>
		<div class="contact_box">
			
				콘텐츠 구매 문의
			</div>
			<div class="text">
				영화가즈아 콘텐츠사업팀 <br /> <strong>051-1588-2222</strong>
				<p class="desc">콘텐츠 기반 사업 문의 및 영화가즈아의 콘텐츠를 구매하시려는 분께서는 이 연락처로
					해주시기 바랍니다.</p>
			</div>
		<div class="contact_box">
			
				영화가즈아 영화 DB, <br />네이버 영화 DB 문의
			
		</div>
		<div class="text">
				영화가즈아 콘텐츠사업팀 <br /> <strong>051-1588-3333</strong>
				<p class="desc">영화 DB 문의는 이 연락처로 해주시기 바랍니다.</p>
			</div>
		<div class="contact_box">
			
				사이트 회원 관련 문의
			
		</div>
		<div class="text">
				개발팀<br /> <strong>051-1588-4444</strong>
				<p class="desc">moviegaza.com 회원 가입, 탈퇴, 정보 수정에 관한 문의를 처리해 드립니다. <input type="button" value="1:1문의">
				</p>
			</div>
	</div>
	</div>
</body>
<%@ include file="footer.jsp"%>

</html>