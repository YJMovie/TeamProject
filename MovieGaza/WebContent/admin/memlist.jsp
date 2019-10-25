<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화가즈아</title>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<script src="../js/bootstrap.min.js"></script>
<script src="../script/jquery-3.4.1.min.js"></script>
</head>
<body>
   
   <%@ include file="../home/header.jsp" %>
   <%@ include file="../home/menu.jsp" %>
   <div style="height: 1000px;background-color: white;">
   <section>
   <div id="contents" style="margin:0 auto;height: 1000px; width: 1300px;background-color: #FFFFF6;padding-top: 40px;">
      <h2 style="padding-left: 50px;">관리자페이지 회원관리</h2>
     
      <div class="container">
         <div class="row">
            <div class="col-md-4" ></div>
            <div class="col-md-4" ></div>
            <div class="col-md-4" >
               <div align="right"><a href="main"><button class="btn btn-warning">뒤로가기</button></a></div>
            </div>
         </div>
            <table class="table table-borderless table-hover">
            <thead class="table-warning">
               <tr>
                  <th scope="col">아이디</th>
                  <th scope="col" width="150px">비밀번호</th>
                  <th scope="col"width="100px">이름</th>
                  <th scope="col" width="120px">성별</th>
                  <th scope="col"width="150px">전화번호</th>
                  <th scope="col" width="150px">주소</th>
                  <th scope="col">이메일</th>
                  <th scope="col">가입일</th>
                  <th scope="col" width="150px">회원등급</th>
                  <th scope="col" width="150px">삭제</th>
               </tr>
            </thead>
         
         <c:forEach items="${list}" var="a"> 
         <tr>
            <td>${a.userid}</td>
            <td>${a.userpwd}</td>
            <td>${a.name}</td>
            <td>${a.gender}</td>
            <td>${a.phone}</td>
            <td>${a.address}</td>
            <td>${a.email}</td>
            <td>${a.userdate }</td>
            <td>${a.usergrade }</td>
            <td>
               <a href="${path}/Admin/update?userid=${a.userid}">
                  <button class="btn btn-warning">수정</button></a>
               <a href="${path}/Admin/member_delete?userid=${a.userid}">
                   <button class="btn btn-warning">삭제</button></a>
            </td>
         </tr>
         </c:forEach>
         <tr>
            <td colspan="10" align="center">
               <c:if test="${cur_block > 1}">
                  <a href="${path }/Admin/member_list?curPage=${prev_page}">[이전]</a>
               </c:if>
               <c:forEach var="i" begin="${blockStart }" end="${blockEnd }">
                  <a href="${path }/Admin/member_list?curPage=${i }">${i }</a>&nbsp;
               </c:forEach>
               <c:if test="${cur_block < totBlock }">
                  <a href="${path }/Admin/member_list?curPage=${next_page}">[다음]</a>
               </c:if>
            </td>
         </tr>
      </table>
   </div>
   </section>
   </div>
</body>
</html>