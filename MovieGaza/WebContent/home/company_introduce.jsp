<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회사 소개</title>
<script src="${path }/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${path }/css/bootstrap.min.css">
<link rel="stylesheet" href="${path }/css1/style.css">

<style>
#company {
	font-size: 40px;
	text-align: center;
	height: 80px;
	background-color: #FFFFF6;
	padding-top: 15px;
}

#text {
	font-size: 20px;
	height: 550px;
	background-color: #FFFFF6;
}
</style>
</head>
<body>
	<%@ include file="header.jsp"%>
	<%@ include file="menu.jsp"%>
	<div id="background">
		<div id="company">
			★회사 소개★<br>
		</div>

		<div id="text">
			<t> 영화가즈아(주)는 2019년 프로젝트를 하기위해 창립된 엔터테인먼트 미디어 기업입니다.<br>
			<br>
			대한민국 최고의 영화미디어 <영화가즈아>는 영화정보 포털 <MovieGaza.com>을
			운영하고 있습니다.<br>
			<br>

			영화가즈아(주)의 대표 브랜드인 <영화가즈아>는 2019년 우리나라 최초로 창간된 영화 주간지로 현재까지
			자타가 공인하는 한국 최고의 영화매체입니다.<br>
			한국 영화산업의 눈부신 성장과 함께 발전해온 <영화가즈아>는 우리나라 주간지 시장을 선도하며 내용과 판매 모든
			면에서 영화전문지의 대명사가 되었으며, 참신한 기획과 신뢰할 수 있는 정보를 통해 차별화된 콘텐츠를 제공하여 한국 영화산업의
			발전에 기여하고 대중의 문화적 갈증을 충족시키고 있습니다.<br>
			이제는 인쇄 활자에서 한 단계 뛰어넘어 온라인과 모바일, 동영상 콘텐츠까지 확대하여 독자 여러분에게 영화를 읽고 즐기는
			무한의 재미를 제공하려고 합니다.<br>
			영화정보 포털 <MovieGaza.com>은 <영화가즈아>를 기반으로 하는
			기사뿐만 아니라, 국내 최고 수량의 영화, 영화인, 영화사 데이터베이스를 보유하고 있습니다.<br>
			또한 문화예술 관련 저널의 출판대행 사업, 공연사업 등도 활발히 진행하고 있습니다.<br>

			영화가즈아(주)는 이런 사업들을 통해 종합엔터테인먼트 미디어 기업으로 착실하게 성장하고 있으며, 엔터테인먼트 전반으로
			사업영역을 확장해나갈 것입니다.<br>
			영화를 비롯한 대중문화를 사랑하고 즐기는 여러분들의 아낌없는 성원을 당부 드립니다.<br></t>

			<div style="font-size: 25px; float: right; padding: 30px;">-대표이사
				C조-</div>
		</div>
	</div>
</body>
<%@ include file="footer.jsp"%>
</html>