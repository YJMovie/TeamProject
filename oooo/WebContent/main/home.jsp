<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화가즈아</title>
<link rel="stylesheet" href="../css/style.css" />
</head>
<body>
<div id="wapper">
	<%@ include file="header.jsp"%>
	<%@ include file="menu.jsp"%>
	<div style="height: 500px; width: 100%; border: 1px dotted black; margin: 0;">
		
		<section>
			<div id="contents">
				<h2>영화목록</h2>
				<table border="1" style="margin: 0 auto;">
					<tr>
						<c:forEach var="list" items="${listRandom }">
							<td>
								${list.title } <br />
								<a href="${path }/Board/info.do?num=${list.num}&curPage=1">이미지</a> <br />
								${list.open }<br />
								${list.director }<br />
							</td>						
						</c:forEach>
					</tr>
				</table>
				<h2>평점순</h2>
				<table border="1" style="margin: 0 auto;">
					<tr>
						<c:if test="${curPage > 1 }">						
							<td><a href="${path }/Board/home.do?curPage=${curPage-1}">◀</a></td>
						</c:if>
						<c:forEach var="list" items="${listMark }">
							<td>
								${list.title } <br />
								<a href="${path }/Board/info.do?num=${list.num}&curPage=1">이미지</a> <br />
								${list.open }<br />
								${list.director }<br />
								평점:${list.mark }
							</td>						
						</c:forEach>
						<c:if test="${curPage < totPage }">
							<td><a href="${path }/Board/home.do?curPage=${curPage+1}">▶</a></td>
						</c:if>
					</tr>
				</table>
				
			</div>
			<%@ include file="ad.jsp" %>
		</section>
		
	</div>
	<%@ include file="footer.jsp"%>

</div>
</body>
</html>