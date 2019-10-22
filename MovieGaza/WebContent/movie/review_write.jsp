<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="path" value="${pageContext.request.contextPath }"></c:set><!-- root path:MVC2 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화가즈아</title>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<script src="../js/bootstrap.min.js"></script>
<script src="../script/jquery-3.4.1.min.js"></script>
<script>
	$(function(){
		$('#btnWrite').click(function(){
			console.log("sxfxfsf...");
			if ($('#rcomment').val() == "") {
				alert("리뷰를 입력해주세요.");
				$('#rcomment').focus();
				return;
			}
			document.writeform.action = "${path}/Movie/insert";
			document.writeform.submit();
		});
		$('#btnPrevious').click(function(){
			location.href = "${path}/Board/info.do?num=${num}&curPage=1";
		});
	});
</script>


<style>
.r_score>.input, .r_score>.input>label:hover, .r_score>.input>input:focus+label,
   .r_score>.input>input:checked+label {
   display: inline-block;
   vertical-align: middle;
   background: url('../images/grade_img.png') no-repeat;
}

.r_score {
   display: inline-block;
   white-space: nowrap;
   width: 225px;
   height: 40px;
   padding: 25px;
   line-height: 30px;
}

.r_score>.input {
   display: inline-block;
   width: 150px;
   background-size: 150px;
   height: 28px;
   white-space: nowrap;
   overflow: hidden;
   position: relative;
}

.r_score>.input>input {
   position: absolute;
   width: 1px;
   height: 1px;
   opacity: 0;
}

r_score>.input.focus {
   outline: 1px dotted #ddd;
}

.r_score>.input>label {
   width: 30px;
   height: 0;
   padding: 28px 0 0 0;
   overflow: hidden;
   float: left;
   cursor: pointer;
   position: absolute;
   top: 0;
   left: 0;
}

.r_score>.input>label:hover, .r_score>.input>input:focus+label,
   .r_score>.input>input:checked+label {
   background-size: 150px;
   background-position: 0 bottom;
}

.r_score>.input>label:hover ~label {
   background-image: none;
}

.r_score>.input>label[for="p1"] {
   width: 30px;
   z-index: 5;
}

.r_score>.input>label[for="p2"] {
   width: 60px;
   z-index: 4;
}

.r_score>.input>label[for="p3"] {
   width: 90px;
   z-index: 3;
}

.r_score>.input>label[for="p4"] {
   width: 120px;
   z-index: 2;
}

.r_score>.input>label[for="p5"] {
   width: 150px;
   z-index: 1;
}

.r_score>output {
   display: inline-block;
   width: 60px;
   font-size: 18px;
   text-align: right;
   vertical-align: middle;
}
</style>

</head>
<body>
<%@ include file="../home/header.jsp" %>
<%@ include file="../home/menu.jsp" %>
<%-- ${num } --%>
<div style="height: 1000px;background-color: white;">
<div id="contents" style="margin:0 auto;height: 1000px; width: 1300px;background-color: #EAEAEA;padding-top: 40px;">
<form name="writeform" action="" method="post">
	<table border="1">
		<tr>
			<td>작성자</td>
			<td><input type="text" name="writer" value="${sName }" readonly="readonly"></td>
			<td>평점</td>
			<td>
				  <span class="r_score"> <span class="input"> 
                           <input type="radio" name="r_score" value="1" id="p1"> <label for="p1">1</label> 
                           <input type="radio" name="r_score" value="2" id="p2"> <label for="p2">2</label> 
                           <input type="radio" name="r_score" value="3" id="p3"> <label for="p3">3</label> 
                           <input type="radio" name="r_score" value="4" id="p4"> <label for="p4">4</label> 
                           <input type="radio" name="r_score" value="5" id="p5"> <label for="p5">5</label>
                        </span> <output for="r_score">
                  </output>
            </span>
            <script src="../script/star.js"></script>

			</td>
		</tr>
		<tr>
			<td>리뷰</td>
			<td colspan="2">
				<textarea name="r_comment" id="r_comment" cols="30" rows="10"></textarea>
			</td>
			<td>
				<button id="btnWrite">작성</button><br />
				<input type="reset" value="다시입력"/>
				<input type="hidden" name="moviecode" value="${moviecode }" />
			</td>
		</tr>
	</table>
</form>
<button id="btnPrevious">뒤로</button>
</div>
</div>
<%@ include file="../home/footer.jsp" %>
</body>
</html>