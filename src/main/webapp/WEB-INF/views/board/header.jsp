<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<link rel="icon" href="${pageContext.request.contextPath}/image/home.ico">
<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/js/popper.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<style>
body > nav.navbar {
	justify-content: flex-end; /* 오른쪽 정렬 */
}

.dropdown-menu {
min-width: 0rem; 
}

/* nav 색상 지정 */
.navbar {
	background: #096988;
	margin-bottom: 3em;
	padding-right: 3em;
}

.navbar-dark .navbar-nav .nav-link {
	color: rgb(255, 255, 255);
}

textarea {
	resize: none;
}
</style>
<c:if test="${empty id}">
	<script>
		location.href = "${pageContext.request.contextPath}/member/login";
	</script>
</c:if>

<nav class="navbar navbar-expand-sm right-block navbar-dark">
	<!-- Brand -->
	<!-- <a class="navbar-brand" href="#">Logo</a> -->

	<ul class="navbar-nav">
		<c:if test="${!empty id}">
			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/member/logout">${id} 님(로그아웃)</a></li>
			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/member/update">정보수정</a></li>
			
			<c:if test="${id=='admin'}">
				<%-- Drop down --%>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbardrop" 
						data-toggle="dropdown"> 관리자 </a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="${pageContext.request.contextPath}/member/list">회원정보</a>
						<a class="dropdown-item" href="${pageContext.request.contextPath}/board/list">게시판</a>
					</div>
				</li>
			</c:if>
		</c:if>
	</ul>
</nav>








