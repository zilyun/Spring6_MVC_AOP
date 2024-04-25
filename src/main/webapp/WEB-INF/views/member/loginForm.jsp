<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<link rel="icon" href="${pageContext.request.contextPath}/image/home.ico">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
<script src="${pageContext.request.contextPath}/js/jquery-3.7.1.js"></script>
<script>
$(function () {
	
	const result = "${result}";
	
	if(result == 'joinSuccess'){
		alert("회원가입을 축하합니다.")
	}else if(result == '0'){
		alert("비밀번호가 일치하지 않습니다.")
	}else if(result == '-1'){
		alert("아이디가 존재하지 않습니다.")
	}
	
	$(".join").click(function() {
		location.href = "${pageContext.request.contextPath}/member/join";
	});
	
})
</script>
</head>
<body>
	<div class="container">
		<form name="loginform" action="${pageContext.request.contextPath}/member/loginProcess" method="post">
			<h1>로그인</h1>
			<hr>
			<b>아이디</b>
			<input type="text" name="id" placeholder="Enter id" required
					<c:if test="${!empty saveid}">
						value="${saveid}"
					</c:if>
			>
			<b>Password</b>
			<input type="password" name="password" placeholder="Enter password" required>
			<label>
				<input type="checkbox" name="remember" style="margin-bottom:15px"
					<c:if test="${!empty saveid}">
						checked
					</c:if>
				>Remember me
			</label>
			<div class="clearfix">
				<button type="submit" class="submitbtn">로그인</button>
				<button type="button" class="join">회원가입</button>
			</div>
		</form>
	</div>	
</body>
</html>