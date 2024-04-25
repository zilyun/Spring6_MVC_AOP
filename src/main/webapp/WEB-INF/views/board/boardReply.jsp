<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>MVC 게시판</title>
	<jsp:include page="header.jsp" />
	<script src="${pageContext.request.contextPath}/js/reply.js"></script>
	<style>
		h1 {font-size: 1.5rem; text-align: center; color:#1a92b9}
		label {font-weight: bold}
		.container {width:60%}
		textarea{resize:none}
	</style>
</head>
<body>
	<%-- 게시판 수정 --%>
	<div class="container">
		<form action="replyAction" method="post" name="boardform"
			  enctype="multipart/form-data">
			<input type="hidden" name="BOARD_RE_REF" value="${boarddata.BOARD_RE_REF}">
			<input type="hidden" name="BOARD_RE_LEV" value="${boarddata.BOARD_RE_LEV}">
			<input type="hidden" name="BOARD_RE_SEQ" value="${boarddata.BOARD_RE_SEQ}">
			<h1>MVC 게시판 - Reply</h1>
			<div class="form-group">
				<label for="board_name">글쓴이</label>
				<input type="text" class="form-control" name="BOARD_NAME" id="board_name"
						value="${id}" readOnly>
			</div>
			
			<div class="form-group">
				<label for="board_subject">제목</label>
				<textarea name="BOARD_SUBJECT" id="board_subject" rows="1" 
						  class="form-control" maxlength="100">Re:${boarddata.BOARD_SUBJECT}</textarea>
			</div>
			
			<div class="form-group">
				<label for="board_content">내용</label>
				<textarea name="BOARD_CONTENT" id="board_content" 
						  class="form-control" rows="10"></textarea>
			</div>
			
			<div class="form-group">
				<label for="board_pass">비밀번호</label>
				<input name="BOARD_PASS"
					   id="board_pass" type="password" size="10" maxlength="30" 
					   class="form-control" placeholder="Enter Password">
			</div>
			<div class="form-group">
				<button type="submit" class="btn btn-primary">수정</button>
				<button type="reset" class="btn btn-danger" onClick="history.go(-1)">취소</button>
			</div>
		</form>
	</div> <%-- class="container" end --%>
</body>
</html>