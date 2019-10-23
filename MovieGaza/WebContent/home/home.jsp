<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화가즈아</title>
<link rel="stylesheet" href="${path }/css/bootstrap.min.css">
<script src="${path }/js/bootstrap.min.js"></script>
<script src="${path }/js/jquery-2.2.4.min.js"></script>
<!-- bxslider CDN -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script>
        $(function() {
          $('.bxslider').bxSlider({
						slideWidth:600,
            captions:true,
            auto:false,
            autoControls:false,
            stopAutoOnclick:true,
            minSlides :1,
            maxSlides :5,
            slideWidth: 250,
            slideMargin: 3,
            speed: 300,
            moveslides: 1,
            autoHover: true,
            touchEnabled: false
          });
        });
    </script>
<style>
    
    .list1 {
       position: absolute;
        padding-top: 20px;
        top: 878px;
        width: 200px;
        height: 200px;
        background: rgba(0,0,0,0.6);
        opacity: 0;
        -moz-transition: all 0.2s ease-in-out;
        -o-transition: all 0.2s ease-in-out;
        -webkit-transition: all 0.2s ease-in-out;
        transition: all 0.4s ease-in-out;
        z-index: 10;
    }
    .list1:hover {
       opacity: 1;
        -moz-transform: translateY(-200px);
        -ms-transform: translateY(-200px);
        -o-transform: translateY(-200px);
        -webkit-transform: translateY(-200px);
        transform: translateY(0px);
    }
    .list1 {
        color: #fff;
        text-align: center;
    }
    .list1 a {
       text-decoration: none;
       color: #fff;
    }
    .list2 {
       position: absolute;
        padding-top: 20px;
        top: 770px;
        width: 150px;
        height: 150px;
        background: rgba(0,0,0,0.6);
        opacity: 0;
        -moz-transition: all 0.2s ease-in-out;
        -o-transition: all 0.2s ease-in-out;
        -webkit-transition: all 0.2s ease-in-out;
        transition: all 0.4s ease-in-out;
        z-index: 10;
    }
    .list2:hover {
       opacity: 1;
        -moz-transform: translateY(-200px);
        -ms-transform: translateY(-200px);
        -o-transform: translateY(-200px);
        -webkit-transform: translateY(-200px);
        transform: translateY(0px);
    }
    .list2 {
        color: #fff;
        text-align: center;
    }
    .list2 a {
       text-decoration: none;
       color: #fff;
    }
    
         .list3 {
       position: absolute;
        padding-top: 20px;
        top: 982px;
        width: 150px;
        height: 150px;
        background: rgba(0,0,0,0.6);
        opacity: 0;
        -moz-transition: all 0.2s ease-in-out;
        -o-transition: all 0.2s ease-in-out;
        -webkit-transition: all 0.2s ease-in-out;
        transition: all 0.4s ease-in-out;
        z-index: 10;
    }
    .list3:hover {
       opacity: 1;
        -moz-transform: translateY(-200px);
        -ms-transform: translateY(-200px);
        -o-transform: translateY(-200px);
        -webkit-transform: translateY(-200px);
        transform: translateY(0px);
    }
    .list3 {
        color: #fff;
        text-align: center;
    }
    .list3 a {
       text-decoration: none;
       color: #fff;
    }
    
      
.box {
   float: left;
   width : 50px;
   margin: 0 8px;
   position: relative;
}

.front {
   position: relative;
   top: 0;
   overflow:hidden;
   
   /* max-width : 97.5px; */
   
}

.back{

   position: absolute;
   top: 0;
   left: 0;
   
   
}
.front img{
   width : 50px;
}

.back img{
   width : 50px;
}
    
</style>
</head>
<body>
<div>
	<%@ include file="menu.jsp"%>
   <%@ include file="header.jsp"%>
   
   
   <div style="height: 1000px;background-color: white;">
      <div id="contents" style="margin:0 auto;height: 1500px; width: 1300px;background-color: #FFFFF6;padding-top: 40px;">
      <section>
      		<h2>개봉순</h2>
               
			         <div id="wrapper">
				      <div class="bxslider">
				        <c:forEach var="list" items="${listOpen }">
							<div class="item" style="width: 300px;height: 300px;" >
								<a href="${path }/Movie/info?moviecode=${list.moviecode}&curPage=1">${list.open }
		                       <img src="${path }/images/${list.postfname }" alt="${list.postfname }" width="300px" height="300px"/>
		                       </a>
		                    </div>
		                    	                    
						</c:forEach>
				      </div> 
				          
				    </div>
				    <hr />
				    
            <h2>평점순</h2>
            <div id="wrapper">
		      <div class="bxslider">
		        <c:forEach var="list" items="${listScore }">
					<div class="item" style="width: 300px;height: 300px;" >
						<a href="${path }/Movie/info?moviecode=${list.moviecode}&curPage=1">
                       <img src="${path }/images/${list.postfname }" alt="${list.score }" width="300px" height="300px"/>
                       </a>
                    </div>
				</c:forEach>     
		      </div> 
		          
		    </div>
		    <hr />
		    
		     <h2>영화목록</h2>
             
	         <div id="wrapper">
		      <div class="bxslider">
		        <c:forEach var="list" items="${listRandom }">
					<div class="item" style="width: 300px;height: 300px;" >
						<a href="${path }/Movie/info?moviecode=${list.moviecode}&curPage=1">
                       <img src="${path }/images/${list.postfname }" alt="${list.postfname }" width="300px" height="300px"/>
                       </a>
                    </div>
                    <%-- <!-- 픽셀 테스트 -->
					<div class="item" style="width: 250px;height: 250px;" >
						<a href="${path }/Movie/info?moviecode=${list.moviecode}&curPage=1">
                       <img src="http://placehold.it/250x250" alt="${list.postfname }" />
                       </a>
                    </div> --%>	                    
				</c:forEach>
		      </div> 
		    </div>
		    <hr />
		    
            <c:set var="idchk" value="${userid}"
                  scope="session" />
                  <c:set var="recomchk" value="${findWhatGenreSelected}"
                  scope="session" />
            
            <c:if test="${idchk == null}">
               <h2>추천 장르 : ${showGenre}</h2>
               <div id="wrapper">
		      <div class="bxslider">
			        <c:forEach var="list" items="${listGenre }">
						<div class="item" style="width: 300px;height: 300px;" >
							<a href="${path }/Movie/info?moviecode=${list.moviecode}&curPage=1">
	                       <img src="${path }/images/${list.postfname }" alt="${list.score }" width="300px" height="300px"/>
	                       </a>
	                    </div>
					</c:forEach>     
			      </div> 
			          
			    </div>
               <%-- <table border="1" style="margin: 0 auto;">
                  <tr>
                     <c:if test="${curPage > 1 }">                  
                        <td><a href="${path }/Home?curPage=${curPage-1}">◀</a></td>
                     </c:if>
                     <c:forEach var="list" items="${listGenre}">
                        <td>
                           <div style="width: 150px;height: 150px;border: 1px solid black;margin-top: 20px;">
                                <img src="${path }/images/${list.postfname }" alt="${list.postfname }" width="150px" height="150px"/>
                            </div>
                           <div class="list2">
                              ${list.title } <br />
                              <a href="${path }/Movie/info?moviecode=${list.moviecode}&curPage=1">이미지</a> <br />
                              ${list.open }<br />
                              ${list.score }<br />
                           </div>
                        </td>                  
                     </c:forEach>
                     <c:if test="${curPage < totPage }">
                        <td><a href="${path }/Home?curPage=${curPage+1}">▶</a></td>
                     </c:if>
                  </tr>
               </table> --%>   
            
            </c:if>
            <hr />
            
            <c:if test="${idchk != null && findWhatGenreSelected == null}">
               <h2>추천 장르 : ${showGenre}</h2>
               <table border="1" style="margin: 0 auto;">
                  <tr>
                     <c:if test="${curPage > 1 }">                  
                        <td><a href="${path }/Home?curPage=${curPage-1}">◀</a></td>
                     </c:if>
                     <c:forEach var="list" items="${listGenre}">
                        <td>
                           <div style="width: 150px;height: 150px;border: 1px solid black;margin-top: 20px;">
                                <img src="${path }/images/${list.postfname }" alt="${list.postfname }" width="150px" height="150px"/>
                            </div>
                           <div class="list2">
                              ${list.title } <br />
                              <a href="${path }/Movie/info?moviecode=${list.moviecode}&curPage=1">이미지</a> <br />
                              ${list.open }<br />
                              ${list.score }<br />
                           </div>
                        </td>                  
                     </c:forEach>
                     <c:if test="${curPage < totPage }">
                        <td><a href="${path }/Home?curPage=${curPage+1}">▶</a></td>
                     </c:if>
                  </tr>
               </table>   
            
            </c:if>
            <c:if test="${idchk != null && findWhatGenreSelected !=null}">
               <h2>${userid}님이 선호하는 영화</h2>
               <table border="1" style="margin: 0 auto;">
                  <tr>
                     <c:if test="${curPage > 1 }">                  
                        <td><a href="${path }/Board/home.do?curPage=${curPage-1}">◀</a></td>
                     </c:if>
                     <c:forEach var="list" items="${userGenreList}">
                        <td>
                           <div style="width: 150px;height: 150px;border: 1px solid black;margin-top: 20px;">
                                포스터
                             </div>
                           <div class="list2">
                              ${list.title } <br />
                              <a href="${path }/Movie/info?moviecode=${list.moviecode}&curPage=1">이미지</a> <br />
                              ${list.open }<br />
                              ${list.score }<br />
                           </div>
                        </td>                  
                     </c:forEach>
                     <c:if test="${curPage < totPage }">
                        <td><a href="${path }/Board/home.do?curPage=${curPage+1}">▶</a></td>
                     </c:if>
                  </tr>
               </table>   
            
            </c:if>
            
            
            <c:if test="${idchk != null && recomchk !=null}">
               <%-- <h2>${userid}님께 추천하는 추천 장르 : ${showGenre}</h2> --%>
               <h2>${userid}님이 선호하는 장르와 비슷한 영화 : ${findWhatGenreSelected}</h2>
               <table border="1" style="margin: 0 auto;">
                  <tr>
                     <c:if test="${curPage > 1 }">                  
                        <td><a href="${path }/Board/home.do?curPage=${curPage-1}">◀</a></td>
                     </c:if>
                     <c:forEach var="list" items="${userRecommendGenreList}">
                        <td>
                           <div style="width: 150px;height: 150px;border: 1px solid black;margin-top: 20px;">
                                포스터
                             </div>
                           <div class="list3">
                              ${list.title } <br/>
                              <a href="${path }/Movie/info?moviecode=${list.moviecode}&curPage=1">이미지</a> <br/>
                              ${list.open }<br/>
                              ${list.score }<br />
                           </div>
                        </td>                  
                     </c:forEach>
                     <c:if test="${curPage < totPage }">
                        <td><a href="${path }/Board/home.do?curPage=${curPage+1}">▶</a></td>
                     </c:if>
                  </tr>
               </table>   
            
            </c:if>   
            <c:if test="${idchk != null && recomchk ==null}">
               <%-- <h2>${userid}님께 추천하는 추천 장르 : ${showGenre}</h2> --%>
               <h2>즐겨찾기한 영화가 없습니다.</h2>
            
            
            </c:if>
            </section>        
         </div>
   </div>

    
   <%@ include file="footer.jsp"%>

</div>
</body>
</html>