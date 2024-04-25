<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>404 오류</title>
<style>
	div{text-align: center}
</style>
<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
</head>
<body>
	<div>
		<img src="${pageContext.request.contextPath}/image/404.png" width="300px"><br>
		요청하신 <b id="message"></b> 이 존재하지 않습니다. 주소를 확인해 주세요~
	</div>
	<script>
		$("#message").text(location.href);
	</script>
</body>
</html>