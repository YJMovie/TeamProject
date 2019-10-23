<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트</title>
<link rel="stylesheet" href="${path }/css1/style.css">
<link rel="stylesheet" href="${path }/css/bootstrap.min.css">
<script src="${path }/js/bootstrap.min.js"></script>
<!-- bxslider CDN -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<style>
.image li {
	display: inline-block;
	margin-right: 20px;
	padding-top: 20px;
}

.event {
	float: center;
	text-align: center;
	padding-top: 50px;
	font-size: 40px;
	color: red;
}

#background {
	background-color: #FFFFF6;
	padding-bottom: 70px;
}
</style>
</head>
<body>
	<%@ include file="menu.jsp"%>
	<%@ include file="header.jsp"%>
	<div id="background" style="width:1300px;margin: 0 auto;">
		<div class="event">
			<strong>시사회/무대인사</strong><br>
			<ul class="image">
				<li><a
					href="http://event.lottecinema.co.kr/LCHS/Contents/Event/stage-greeting-event.aspx?EventID=401070016919216">
						<img src="../images/images/82.png" width="250" height="330">
				</a><br>
				<div style="color: black; font-size: 18px;">2019.11.02 ~
						2019.11.03<br><82년생 김지영>무대인사</div></li>
				<li><a
					href="http://event.lottecinema.co.kr/LCHS/Contents/Event/button-event.aspx?EventID=201110016919061">
						<img src="../images/images/summer.png" width="250" height="330">
				</a><br>
				<div style="color: black; font-size: 18px;">2019.10.26<br><너를 만난 여름>VIP 특별 시사회</div></li>
				<li><a
					href="http://event.lottecinema.co.kr/LCHS/Contents/Event/preview-event.aspx?EventID=401080016919077">
						<img src="../images/images/money.PNG" width="250" height="330">
				</a><br>
				<div style="color: black; font-size: 18px;">2019.10.18 ~
						2019.10.30<br><블랙머니> 시사회 초대 이벤트</div></li>
				<li><a
					href="http://section.cgv.co.kr/event/running/EventZone.aspx?idx=1433">
						<img src="../images/images/moris.png" width="250" height="330">
				</a><br>
				<div style="color: black; font-size: 18px;">2019.11.05(화)
						19:30<br><모리스>특별 시사회 이벤트</div></li>
			</ul>
		</div>
		<div class="event">
			<strong>진행중인 이벤트</strong><br>
			<ul class="image">
				<li><a href="http://www.cine21.com/event/view/?event_no=7493">
						<img src="../images/images/500.PNG" width="250" height="330">
				</a><br>
				<div style="color: black; font-size: 18px;">
						연극
						<오백에 삼십> 초대 이벤트
					</div></li>
				<li><a href="http://www.cine21.com/event/view/?event_no=7492">
						<img src="../images/images/moon.png" width="250" height="330">
				</a><br>
				<div style="color: black; font-size: 18px;">
						<제17회 아시아나국제단편영화제> 초대 이벤트
					</div></li>
				<li><a href="http://www.cine21.com/event/view/?event_no=7490">
					<img src="../images/images/layer.png" width="250" height="330">
				</a><br>
				<div style="color: black; font-size: 18px;">
						연극
						<라이어> 초대 이벤트
					</div></li>
				<li><a href="http://www.cine21.com/event/view/?event_no=7486">
					<img src="../images/images/hi.png" width="250" height="330">
				</a><br>
				<div style="color: black; font-size: 18px;">서울무용영화제
						개막작＜Mitten＞초대 이벤트</div></li>
			</ul>
			<ul class="image">
				<li><a href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=20239">
				<img src="../images/images/artist.PNG" width="250" height="330">
				</a><br>
					<div style="color: black; font-size: 18px;">2020 아트하우스 Club 아티스트 챌린지</div></li>
				<li><a href="http://www.cine21.com/event/view/?event_no=7484">
				<img src="../images/images/book.png" width="250" height="330">
				</a><br>
					<div style="color: black; font-size: 18px;">도서 <만 권의 기억 데이터에서 너에게 어울리는 딱 한 권을 추천해줄게> 이벤트</div></li>
				<li><a href="http://www.cine21.com/event/view/?event_no=7485">
				<img src="../images/images/adult.png" width="250" height="330">
				</a><br>
					<div style="color: black; font-size: 18px;">뮤지컬 <어른동생> 초대 이벤트</div></li>
				
			</ul>
		</div>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>