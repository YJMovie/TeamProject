<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보취급방침</title>
<script src="${path }/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${path }/css/bootstrap.min.css">
<link rel="stylesheet" href="${path }/css1/style.css">

<style>
#info {
	font-size: 40px;
	padding-top: 20px;
	border: 1px solid #ebebeb;
	background-color: #FFFFF6;
	color: red;
}

#info1 {
	font-size: 25px;
	padding-top: 20px;
	background-color: #FFFFF6;
}

.text {
	font-size: 15px;
	padding-top: 10px;
	color: grey;
	background-color: #FFFFF6;
}

.title {
	font-size: 18px;
	padding-top: 40px;
	background-color: #FFFFF6;
}

.text1 {
	font-size: 17px;
	padding-top: 20px;
	background-color: #FFFFF6;
}
#background {
	padding-bottom: 70px;
	background-color: #FFFFF6;
}


</style>
</head>
<body>
	<%@ include file="header.jsp"%>
	<%@ include file="menu.jsp"%>
	<div id="background">
	<div id="info">영화가즈아 정책</div>
	<div id="info1">개인정보 취급방침</div>
	<div class="text">
		<h> 영화가즈아(주) 등 관계사는 (이하 '회사'라고 합니다.) 개인정보취급방침을 통해 이용자가 제공한 개인정보가
		어떠한 용도와 방식으로 이용되며 관리되고 있는지에 대해 안내해 드립니다. <br>
		회사는 '정보통신망 이용촉진 및 정보보호 등에 관한 법률' 등 개인정보와 관련된 법령 상의 개인정보보호규정 및 방송통신위원회가
		제정한 '개인정보보호지침'을 준수하고 있습니다. <br>
		본 ‘개인정보 취급방침’은 수시로 내용이 변경될 수 있으므로 정기적으로 방문하셔서 확인하십시오. </h>
	</div>

	<div class="title">회사의 개인정보 보호 정책은 다음의 내용을 포함합니다.</div>


	<div class="text">
		<h> 1. 수집하는 개인정보의 항목 및 수집방법<br>
		2. 개인정보의 수집 및 이용목적<br>
		3. 개인정보의 공유 및 제공<br>
		4. 개인정보의 취급위탁<br>
		5. 개인정보의 보유 및 이용기간<br>
		6. 개인정보의 파기절차 및 방법<br>
		7. 이용자 및 법정대리인의 권리와 그 행사방법<br>
		8. 개인정보 자동 수집 장치의 설치/운영 및 거부에 관한 사항<br>
		9. 개인정보의 기술적, 관리적 보호 대책<br>
		10. 개인정보관리 책임자 및 담당자의 연락처<br>
		11. 부칙 </h>
	</div>

	<div class="text1">
		<h>1. 수집하는 개인정보의 항목 및 수집방법</h>
	</div>

	<div class="text">
		<h>
		<strong>1) 수집 항목</strong>
		<br>
		① 일반회원, 만 14세 미만 회원, 국내 거주 외국인회원<br>
		- 필수항목 :성명, 아이디, 아이핀 번호, 비밀번호, 이메일주소, 생년월일, 성별, 만 14세 미만은 법정대리인 정보(성명,
		연락처), 가입인증 정보, 주소<br>
		- 선택항목 : 주소, 휴대폰번호, 일반전화번호, 결혼여부, 직업, 관심분야, 메일매거진 수신, 닉네임 <br>
		② 재외동포 회원<br>
		- 필수항목 :성명, 아이디, 비밀번호, 이메일주소, 본인 확인 자료<br>
		- 선택항목 :생년월일, 성별, 국적, 거주국가, 전화번호, 주소, 결혼여부, 직업, 관심분야, 닉네임<br>
		③ 서비스 이용과정에서 다음과 같은 정보들이 자동으로 생성되어 수집될 수 있습니다.<br>
		- IP Address, 쿠키, 방문 일시, 서비스 이용 기록, 불량 이용 기록<br>
		④ 부가 서비스 및 이벤트 응모 과정 등에서 개인정보를 추가로 수집될 경우에는 이용자들에게 고지하고 동의를 받습니다.<br>
		-시사회 및 경품 이벤트 당첨 시: 이름, 휴대폰 번호, 배송지 주소, 전화번호 <br>
		⑤ 잡지 구독 및 유료서비스 이용 시 (씨네21 잡지구독자에 한함)<br>
		- 신용카드 정보, 계좌 정보, 결제기록, 대학생 할인을 위한 학교/학과 정보, 학생 신분 증명을 위한 정보, 비회원 구독자의
		배송지 정보 및 연락처 정보가 수집될 수 있습니다.<br>
		⑥ 구독자 고객센터 이용 시 (씨네21 잡지구독자에 한함)<br>
		- 이름, 아이디, 이메일, 휴대폰 번호, 일반전화 번호, 주소 등 구독자 관리와 배송에 필요한 일체의 정보<br>
		<strong>2) 개인 정보 수집 방법</strong>
		<br>
		홈페이지 회원가입, 전화, 팩스, 서비스의 이용, 이메일, 이벤트 응모, 생성정보 수집 툴을 통한 수집, 회원정보수정,
		고객센터 문의하기, 구독신청, 제보, 투고</h>
	</div>
	<div class="text1">
		<h>2. 개인정보의 수집 및 이용목적</h>
	</div>
	<div class="text">
		회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다.<br> 1) 서비스 제공에 관한 계약 이행 및 서비스 제공에
		따른 요금정산<br> 컨텐츠 제공, 특정 맞춤 서비스 제공, 물품 배송 또는 청구서 등 발송, 본인인증, 구매 및
		요금 결제, 요금추심<br> 2) 회원관리<br> 회원제 서비스 이용, 개인식별, 불량회원의 부정 이용
		방지와 비인가 사용방지, 가입의사 확인, 중복가입 제한, 연령확인, 만14세미만 회원 개인정보 수집 시 법정 대리인 동의여부<br>
		확인, 추후 법정 대리인의 본인확인, 민원처리, 고지사항 전달<br> 3) 신규 서비스 개발 및 마케팅•광고에의 활용<br>
		신규 서비스 개발 및 맞춤 서비스 제공, 인구 통계학적 특성에 따른 서비스 제공 및 광고 게재, 이벤트 및 광고성 정보 제공
		및 참여기회 제공, 회원의 서비스 이용 통계<br>
	</div>

	<div class="text1">
		<h>3. 개인정보의 제공</h>
	</div>
	<div class="text">
		회사는 이용자들의 개인정보를 '개인정보의 수집 및 이용목적'에서 고지한 범위 내에서 사용하며, 이용자의 사전동의 없이는 동
		범위를 초과하여 이용하거나 원칙적으로 이용자의<br> 개인정보를 외부에 공개하지 않습니다. 단, 다음의 경우에는
		예외로 합니다.<br> 1) 이용자들이 사전에 공개에 동의한 경우 (해당 링크를 통해 별도로 기재되며 해당 업체는
		추후 변동될 수 있습니다.)<br> 2) 법령의 규정에 의거하거나, 수사의 목적으로 법령에 정해진 절차와 방법에 따라
		수사기관의 요구가 있는 경우<br>
	</div>
	</div>
</body>
<%@ include file="footer.jsp"%>
</html>