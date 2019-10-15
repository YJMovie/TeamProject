<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 화면</title>

<!-- <style>
#wrap {
   width: 530px;
   margin-left: auto;
   margin-right: auto;
   text-align: center;
}
</style> -->

</head>
<body>
   <div id="wrap">
      <br>
      <br> <b><font size="6">회원가입</font></b> <br>
      <br>
      <br>

      <form>
         <table>
            <tr>
               <td id="title">아이디</td>
               <td><input type="text" name="id" maxlength="15"> <input
                  type="button" value="중복확인"></td>
            </tr>
            <tr>
               <td id="title">비밀번호</td>
               <td><input type="password" name="password" maxlength="15">
               </td>
            </tr>
            <tr>
               <td id="title">비밀번호 확인</td>
               <td><input type="password" name="password" maxlength="15">
               </td>
            </tr>
            <tr>
               <td id="title">이름</td>
               <td><input type="text" name="name" maxlength="40"></td>
            </tr>
            <tr>
               <td id="title">성별</td>
               <td><input type="radio" name="gender" value="남" checked>남
                  <input type="radio" name="gender" value="여" checked>여</td>
            </tr>
            <tr>
               <td id="title">주소</td>
               <td><input type="text" size="50" name="address" /></td>
            </tr>
            <tr>
               <td id="title">이메일</td>
               <td><input type="text" name="email" maxlength="30">@ <select
                  name="email1">
                     <option>naver.com</option>
                     <option>daum.net</option>
                     <option>nate.com</option>
                     <option>gmail.com</option>
               </select>
               <td>
            </tr>
            
         </table>
         <br> <input type="submit" value="가입" /> <input type="button"
            value="취소">

      </form>
   </div>
</body>
</html>