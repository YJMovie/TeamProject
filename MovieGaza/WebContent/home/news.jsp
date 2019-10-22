<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>최신뉴스</title>
<style>
.title {
	color: red;
	font-size: 30px;
	padding-top: 30px;
}

.news li {
	display: inline-block;
	margin-right: 10px;
	padding-top: 20px;
}

.news {
	margin-bottom: 0px;
}

.newstitle {
	color: black;
	font-size: 16px;
	margin-top: 0px;
	background-color: #D5D5D5;
}

#background {
	background-color: #FFFFF6;
	padding-bottom: 60px;
}
</style>
</head>
<body>
	<%@ include file="header.jsp"%>
	<%@ include file="menu.jsp"%>
	<div class="container" id="background">
		<div class="row">

			<!-- 왼쪽 공간 -->
			<div class="col-md-6" align="center">
				<div class="title">
					<strong>오늘의 인기기사</strong>
					<ul class="news">
						<li><a
							href="https://www.seoul.co.kr/news/newsView.php?id=20191022500005&wlog_tag3=naver">
								<img src="../images/images/joker.PNG" width="250" height="180">
						</a>
							<div class="newstitle">
								'조커','데드풀' 제치고 R등급 히어로 영화<br> 박스오피스 신기록 세울 듯
							</div>
						<li><a
							href="http://www.cine21.com/news/view/?mag_id=91734&utm_source=dable">
								<img src="../images/images/good.png" width="250" height="180">
						</a>
							<div class="newstitle">
								놓쳤다면 꼭 보길 추천하는<br> 2018년 개봉작 12편
							</div>
					</ul>
					<ul class="news">
						<li><a
							href="http://www.cine21.com/news/view/?mag_id=94067&utm_source=dable">
								<img src="../images/images/gi.png" width="250" height="180">
						</a>
							<div class="newstitle">한국영화, 새로운 100년을 향해 나아가다</div>
						<li><a
							href="http://www.cine21.com/news/view/?idx=1&mag_id=94083&utm_source=dable">
								<img src="../images/images/start.png" width="250" height="180">
						</a>
							<div class="newstitle">시작부터 화려했을까? 국내 감독들의 데뷔작</div>
					</ul>
					<ul class="news">
						<li><a
							href="http://www.cine21.com/news/view/?mag_id=94065&utm_source=dable">
								<img src="../images/images/jeon.PNG" width="250" height="180">
						</a>
							<div class="newstitle">
								<버티고> 전계수 감독,<br>
								"흔들린 만큼 단단해지길" 
							</div>
						<li><a
							href="http://www.cine21.com/news/view/?mag_id=94071&utm_source=dable">
								<img src="../images/images/marble.png" width="250" height="180">
						</a>
							<div class="newstitle">
								케빈 파이기,<br>마블 스튜디오 CCO에 임명
							</div>
					</ul>
					<ul class="news">
						<li><a
							href="http://www.cine21.com/news/view/?mag_id=94061&utm_source=dable">
								<img src="../images/images/summer1.png" width="250" height="180">
						</a>
							<div class="newstitle">
								<너를 만난 여름> 진비우, 배우는 내 운명 
							</div>
						<li><a
							href="http://www.cine21.com/news/view/?mag_id=94066&utm_source=dable">
								<img src="../images/images/rizo.png" width="250" height="180">
						</a>
							<div class="newstitle">리조 ＜Truth Hurts＞, 역주행 거참</div>
					</ul>
				</div>
			</div>


			<!--  우측공간 -->
			<div class="col-md-6" align="center">
				<div class="title">
					<strong>당신이 좋아할만한 기사</strong>
					<ul class="news">
						<li><a
							href="http://www.cine21.com/news/view/?mag_id=93847&utm_source=dable">
								<img src="../images/images/90.png" width="250" height="180">
						</a>
							<div class="newstitle">
								멜로 춘추전국시대!<br>2000년대를 주름잡던 국내 영화들
							</div>
						<li><a
							href="http://www.cine21.com/news/view/?idx=8&mag_id=94023&utm_source=dable">
								<img src="../images/images/perfect.png" width="250" height="180">
						</a>
							<div class="newstitle">
								<퍼팩트맨>
								<br>
								니 와 여기서 자고있노?! 
							</div>
					</ul>
					<ul class="news">
						<li><a
							href="http://www.cine21.com/news/view/?mag_id=94059&fbclid=IwAR2wlMNsnDIFZlVJrPvzFl2wj57yFjfShgPu_N-c3OT4H7VRiE3I7SmWGuk&utm_source=dable">
								<img src="../images/images/jjoker.png" width="250" height="180">
						</a>
							<div class="newstitle">
								[조커 찬반 평론-반대] <br>
								<조커>의 폭력, 엉성한 난장 
							</div>
						<li><a
							href="http://www.cine21.com/news/view/?mag_id=94045&utm_source=dable">
								<img src="../images/images/jjjoker.PNG" width="250" height="180">
						</a>
							<div class="newstitle">
								걸작이냐 문제작이냐, <br>호불호 엇갈린 2019 개봉 영화 4편
							</div>
					</ul>
					<ul class="news">
						<li><a
							href="http://www.cine21.com/news/view/?mag_id=93637&utm_source=dable">
								<img src="../images/images/dark.png" width="250" height="180">
						</a>
							<div class="newstitle">
								<암전> 인간의 윤리를 건드리는 순간까지! 
							</div>
						<li><a
							href="http://www.cine21.com/news/view/?idx=5&mag_id=94055&utm_source=dable">
								<img src="../images/images/music.png" width="250" height="180">
						</a>
							<div class="newstitle">음악의 즐거움</div>
					</ul>
					<ul class="news">
						<li><a
							href="http://www.cine21.com/news/view/?mag_id=94056&utm_source=dable">
								<img src="../images/images/hhh.PNG" width="250" height="180">
						</a>
							<div class="newstitle">
							터미네이터:다크페이트 미리보기
						</div>
						<li><a
							href="http://www.cine21.com/news/view/?mag_id=93919&utm_source=dable">
								<img src="../images/images/and.png" width="250" height="180">
						</a>
							<div class="newstitle">인간과 안드로이드 사이의 관계</div>
					</ul>

				</div>
			</div>
		</div>
	</div>


	<%@ include file="footer.jsp"%>
</body>
</html>