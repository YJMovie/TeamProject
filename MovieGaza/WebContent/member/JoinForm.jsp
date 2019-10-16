<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 화면</title>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<script src="../js/bootstrap.min.js"></script>
<script src="../script/jquery-3.4.1.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                /* if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                } */

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>
<script type="text/javascript">
	function checkWrite() {

		if (document.writeform.userid.value == "") {
			alert("아이디를 입력하세요");
			document.writeform.userid.focus();
			return;

		} else if (document.writeform.userpwd.value == "") {
			alert("비밀번호를 입력하세요");
			document.writeform.userpwd.focus();
			return;

		} else if (document.writeform.passcheck.value == "") {
			alert("확인 비밀번호를 입력하세요");
			document.writeform.passcheck.focus();
			return;

		} else if (document.writeform.userpwd.value != ""
				&& document.writeform.passcheck.value != "")
			if (document.writeform.passcheck.value != document.writeform.userpwd.value) {
				alert("비밀번호가 일치하지 않습니다");
				document.writeform.userpwd.focus();
				return;

			} else if (document.writeform.name.value == "") {
				alert("이름을 입력하세요");
				document.writeform.name.focus();
				return;

			} else if (document.writeform.sample4_postcode.value == "") {
				alert("우편번호를 입력하세요");
				document.writeform.sample4_postcode.focus();
				return;

			} else if (document.writeform.sample4_roadAddress.value == "") {
				alert("도로명주소를 입력하세요");
				document.writeform.sample4_roadAddress.focus();
				return;

			} else if (document.writeform.sample4_jibunAddress.value == "") {
				alert("번지수를 입력하세요");
				document.writeform.sample4_jibunAddress.focus();
				return;

			} else if (document.writeform.sample4_detailAddress.value == "") {
				alert("상세주소를 입력하세요");
				document.writeform.sample4_detailAddress.focus();
				return;

			} else if (document.writeform.phone1.value == "") {
				alert("핸드폰번호를 입력하세요");
				document.writeform.phone1.focus();
				return;

			} else if (document.writeform.phone2.value == "") {
				alert("핸드폰번호를 입력하세요");
				document.writeform.phone2.focus();
				return;

			} else if (document.writeform.phone3.value == "") {
				alert("핸드폰번호를 입력하세요");
				document.writeform.phone3.focus();
				return;

			} else if (document.writeform.email1.value == "") {
				alert("이메일을 입력하세요");
				document.writeform.email1.focus();
				return;

			} else {
				document.writeform.action="${path }/Member/insert.do";
				document.writeform.submit();

			}
	}

	function id_chk() {
		window.open("idCheck.do?userid=" + document.writeform.userid.value,
				"_blank_1","toolbar=no, menubar=no, scrollbars=yes, resizeable=no, width=450, height=200");
	}
	
	
</script>
</head>

<body>
	<div id="wrap">
		<%@ include file="../home/header.jsp"%>
		<%@ include file="../home/menu.jsp"%>
		
		<div style="height: 1000px;background-color: white;">
		
		<section>
		<div id="contents" style="margin:0 auto;height: 1000px; width: 60%;background-color: #EAEAEA;padding-top: 40px;">
		
		<br> <br> <b><font size="6">회원가입</font></b> <br> <br>
		<br>

		<form method="post" name="writeform">
		
			<table border="1">
				<tr>

					<td id="title">아이디</td>
					<td><input type="text" name="userid" id="userid" maxlength="15">
						<input type="button" value="중복확인" onclick="id_chk()"></td>
				</tr>
				<tr>
					<td id="title">비밀번호</td>
					<td><input type="password" name="userpwd" id="userpwd"
						maxlength="15"></td>
				</tr>
				<tr>
					<td id="title">비밀번호 확인</td>
					<td><input type="password" name="passcheck" id="passcheck"
						maxlength="15"></td>
				</tr>
				<tr>
					<td id="title">이름</td>
					<td><input type="text" name="name" id="name" maxlength="40"></td>
				</tr>
				<tr>
					<td id="title">성별</td>
					<td><input type="radio" name="gender" value="남" checked>남
						<input type="radio" name="gender" value="여">여</td>
				</tr>
				<tr>
					<td id="title">주소</td>
					<td><input type="text" id="sample4_postcode" name="sample4_postcode" placeholder="우편번호">
						<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
						<input type="text" id="sample4_roadAddress" name="sample4_roadAddress" placeholder="도로명주소">
						<input type="text" id="sample4_jibunAddress" name="sample4_jibunAddress" placeholder="지번주소">
						<span id="guide" style="color:#999;display:none"></span>
						<input type="text" id="sample4_detailAddress" name="sample4_detailAddress" placeholder="상세주소">
						<!-- <input type="text" id="sample4_extraAddress" placeholder="참고항목"></td> -->
				</tr>
				<tr>
					<td>핸드폰번호</td>
					<td>
						<input type="text" id="phone1" name="phone1"/>-
						<input type="text" id="phone2" name="phone2"/>-
						<input type="text" id="phone3" name="phone3"/>
					</td>
				</tr>
				<tr>
					<td id="title">이메일</td>
					<td><input type="text" name="email1" maxlength="30" id="email1">@
						<select name="email2">
							<option>naver.com</option>
							<option>daum.net</option>
							<option>nate.com</option>
							<option>gmail.com</option>
					</select>
					<td>
				</tr>

			</table>
			<br> <input type="button" value="가입하기" id="btnSave" onclick="javascript:checkWrite()" />
				 <input type="reset" value="다시작성">

		</form>
		</div>
		</section>
		</div>
	</div>
</body>
</html>