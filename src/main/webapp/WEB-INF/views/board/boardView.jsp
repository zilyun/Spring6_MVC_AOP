<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC 게시판 - view</title>
<jsp:include page="header.jsp" />
<script src="${pageContext.request.contextPath}/js/view.js?v=1.07"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/view.css" type="text/css">
<script>
	const result = "${result}";
	if(result == 'passFail'){
		alert("비밀번호가 일치하지 않습니다.");
	}
	$(function() {
		$("form[action=delete]").submit(function() {
			if($("#board_pass").val() == '') {
				alert("비밀번호를 입력하세요");
				$("#board_pass").focus();
				return false;
			}
		})
	})
</script>
<style>
body > div > table > tbody > tr:nth-child(1) {
	text-align: center;
}

td:nth-child(1) {
	width: 20%;
}

a {
	color: white;
}

body > div > table > tbody tr:last-child {
	text-align: center;
}

.btn-primary {
	background-color: #4f97e5;
}

#myModal {
	display: none;
}

#comment > table > tbody > tr > td:nth-child(2) {
	width: 60%
}

#count {
	position: relative;
	top: -10px;
	left: -10px;
	background: orange;
	color: white;
	border-radius: 30%;
}

textarea {
	resize: none;
}

form[action=down] > input[type=submit] {
	position: relative;
	top: -25px;
	left: 10px;
	border: none;
	cursor: pointer;
}
</style>
</head>
<body>
	<input type="hidden" id="loginid" value="${id}" name="loginid"> <%-- view.js에서 사용하기 위해 추가합니다. --%>
	<div class="container">
		<table class="table table-striped">
			<tr>
				<th colspan="2">MVC 게시판 - view 페이지</th>
			</tr>
			<tr>
				<td><div>글쓴이</div></td>
				<td><div>${boarddata.BOARD_NAME}</div></td>
			</tr>
			<tr>
				<td><div>제목</div></td>
				<td><div><c:out value="${boarddata.BOARD_SUBJECT}" /></div></td>
			</tr>
			<tr>
				<td><div>내용</div></td>
				<td style="padding-right: 0px">
					<textarea class="form-control" rows="2" readOnly>${boarddata.BOARD_CONTENT}</textarea>
				</td>
			</tr>
			<c:if test="${boarddata.BOARD_RE_LEV==0}">
				<%-- 원문글인 경우에만 첨부파일을 추가 할 수 있습니다. --%>
				<tr>
					<td><div>첨부파일</div></td>
					<%-- 파일을 첨부한 경우 --%>
					<c:if test="${!empty boarddata.BOARD_FILE}">
						<td>
							<img src="${pageContext.request.contextPath}/image/down.png" width="10px">
							<form method="post" action="down" style="height:0px">
								<input type="hidden" value="${boarddata.BOARD_FILE}" name="filename" />
								<input type="hidden" value="${boarddata.BOARD_ORIGINAL}" name="original" />
								<input type="submit" value="${boarddata.BOARD_ORIGINAL}" />
							</form>
						</td>
					</c:if>
					<%-- 파일을 첨부하지 않은 경우 --%>
					<c:if test="${empty boarddata.BOARD_FILE}">
						<td></td>
					</c:if>
				</tr>
			</c:if>
			<tr>
				<td colspan="2" class="center">
					<button class="btn btn-primary">댓글</button>
					<span id="count">${count}</span>
					<c:if test="${boarddata.BOARD_NAME == id || id == 'admin'}">
					 <a href="modifyView?num=${boarddata.BOARD_NUM}">
						<button class="btn btn-info">수정</button>
					 </a>
					 <%-- href의 주소를 #으로 설정합니다. --%>
					 <a href="#">
						<button class="btn btn-danger" 
								data-toggle="modal"
								data-target="#myModal">삭제</button>
					 </a>
					</c:if>
					<a href="replyView?num=${boarddata.BOARD_NUM}">
						<button class="btn btn-success">답변</button>
					</a>
					<a href="list">
						<button class="btn btn-warning">목록</button>
					</a>
				</td>
			</tr>
		</table>
		<%-- 게시판 view end --%>
		
		<%-- modal 시작 --%>
		<div class="modal" id="myModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<%-- Modal body --%>
					<div class="modal-body">
						<form name="deleteForm" action="delete" method="post">
							<%-- http://localhost:8081/Board/BoardDetail.bo?num=22 
									주소를 보면 num을 파라미터로 넘기고 있습니다.
									이 값을 가져와서 ${param.num}를 사용
									또는 ${boarddata.board_num}						
							--%>
							<input type="hidden" name="num" value="${param.num}" id="board_num" />
							<div class="form-group">
								<label for="board_pass">비밀번호</label>
								<input type="password"
									   class="form-control" placeholder="Enter password"
									   name="BOARD_PASS" id="board_pass">
							</div>
							<button type="submit" class="btn btn-primary">전송</button>
							<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
						</form>
					</div>
				</div>
			</div>
		</div>
		<%-- modal 끝 --%>
	
		<div id="comment">
			<button class="btn btn-info float-left">총 50자까지 가능합니다.</button>
			<button id="write" class="btn btn-info float-right">등록</button>
			<textarea rows="3" class="form-control" id="content" maxLength="50"></textarea>
			<table class="table">
				<thead>
					<tr><td>아이디</td><td>내용</td><td>날짜</td></tr>
				</thead>
				<tbody>
					
				</tbody>
			</table>
			<div id="message"></div>
		</div>	<%-- <div id="comment"> end --%>
	</div><%-- class="container" end --%>
</body>
</html>