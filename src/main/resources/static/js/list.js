$(function() {
	$("#viewcount").change(function() {
		go(1); // 보여줄 페이지를 1페이지로 설정합니다.
	}); // change end

	$("button").click(function() {
		location.href = "write";
	})
});

function go(page) {
	const limit = $('#viewcount').val();
	/* const data = `limit=${limit}&state=ajax&page=${page}`; */
	const data = { limit: limit, state: "ajax", page: page }
	ajax(data);
}

function ajax(sdata) {
	console.log(sdata)

	$.ajax({
		type: "POST",
		data: sdata,
		url: "list_ajax",
		dataType: "json",
		cache: false,
		success: function(data) {
			$("#viewcount").val(data.limit);
			$("thead").find("span").text("글 개수 : " + data.listcount);
			console.log(data.listcount +'입니다.')
			
			if (data.listcount > 0) { // 총 갯수가 0보다 큰 경우
				$("tbody").remove();
				let num =  data.listcount - (data.page - 1) * data.limit;
				console.log(num)
				let output = "<tbody>";
				$(data.boardlist).each(
					function(index, item) {
						output +='<tr><td>' + (num--) + '</td>'
						const blank_count = item.board_RE_LEV * 2 + 1;
						let blank = '&nbsp;';
						for (let i=0; i < blank_count; i++) {
							blank += '&nbsp;&nbsp;';
						}
						
						let img = "";
						if (item.BOARD_RE_LEV > 0) {
							img = "<img src='../image/line.gif'>";
						}
						
						let subject = item.board_SUBJECT;
						if (subject.length >= 20) {
							subject = subject.substr(0,20) + "..."; //0부터 20개의 부분 문자열 추출
						}
						output += "<td><div>" + blank + img
						output += '<a href="detail?num=' + item.board_NUM + '">';
						output += subject.replace(/</g,'&lt;').replace(/>/g,'&gt;')
								  + '</a> [' + item.cnt + ']</div></td>'
						output += '<td><div>' + item.board_NAME + '</div></td>'
						output += '<td><div>' + item.board_DATE + '</div></td>'
						output += '<td><div>' + item.board_READCOUNT + '</div></td></tr>'
					}
				)
			
				output += "</tbody>"
				$('table').append(output) //table 완성
				
				$(".pagination").empty(); // 페이징 처리 영역 내용 제거
				output = "";
				
				let digit = '이전&nbsp;'
				let href = "";
				if (data.page > 1) {
					href = 'href=javascript:go(' + (data.page - 1) + ')'
				}
				
				output += setPaging(href, digit);
				
				for (let i = data.startpage; i <= data.endpage; i++) {
					digit = i;
					href = "";
					if (i != data.page) {
						href = 'href=javascript:go(' + i + ')';
					}
					output += setPaging(href, digit);
				}
				
				digit = '&nbsp;다음&nbsp;';
				href="";
				if (data.page < data.maxpage) {
					href = 'href=javascript:go(' + (data.page + 1) + ')';
				}
				
				output += setPaging(href, digit);
				
				$('.pagination').append(output)
			} // if(data.listcount) > 0 end
		}, // success end
		error : function() {
			console.log('에러')
		}
	}) // ajax end
} // function ajax end

function setPaging(href, digit) {
	let active = "";
	let gray = "";
	if (href == "") { // href가 빈 문자열인 경우 
		if(isNaN(digit)) { // 이전 &nbsp; 또는 다음 &nbsp;
			gray = "gray"; // 11, 20번 라인처럼 href 속성이 없고 <a> 요소의 textnode가 숫자가 아닌 경우
		} else { 		   
			active = "active"; // 12, 19번 라인처럼 href 속성이 없고 <a>요소의 textnode가 숫자인 경우 
		}
	}
	let output = `<li class="page-item ${active}">`;
	// let anchor = "<a class='page-link" + gray + "'" + href + ">" + digit + "</a></li>";
	let anchor = `<a class="page-link ${gray}" ${href}>${digit}</a></li>`;
	output += anchor;
	return output;
}