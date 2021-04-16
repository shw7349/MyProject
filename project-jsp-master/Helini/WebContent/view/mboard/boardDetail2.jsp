<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LIST_DETAIL</title>
<script>
function replyWrite(boardId, userId){
	console.log(userId);
	if(userId===undefined){
		alert("로그인이 필요합니다.");
		return;
	}
	var data= {
		boardId : boardId,
		userId: userId,
		content : $("#reply__write__form").val()
	};

	$.ajax({
		type: "post",
		url : "/blog/reply?cmd=writeProc",
		data : JSON.stringify(data),
		contentType: "application/json; charset=utf-8",
		dataType: "json"
	}).done(function(result){
		//정상응답
		if(result==-1 || result==0){
			alert("덧글 등록 실패");
		}else{
		//1.reply__list를 찾아 비우기
		alert("덧글 등록 성공");
		$("#reply__list").empty();
		console.log(result);
		//2.ajax 재호출 findAll()
		renderReplyList(result);
		//3.reply__list를 찾아 내부에 채워주기
		$("#reply__write__form").val("");
		}
	}).fail(function(error){
		alert("덧글 등록 실패");
	});
}

function renderReplyList(replyDtos){
for (var replyDto of replyDtos) {
	$("#reply__list").append(makeReplyItem(replyDto));
	//reply-id 추가 시작
	var replyItem = `<li id="reply-${replyDto.reply.id }" class="media">`;
	//reply-id 추가 끝
}
}

function makeReplyItem(replyDto) {
var replyItem=`<li class = "media">`;

if(replyDto.userProfile ==null){
	replyItem+=`<img src="/blog/image/userProfile.png" class="img-circle">`;
	
}else{
	replyItem+=`<img src="${replyDto.userProfile}" class="img-circle">`;
	
}
replyItem += `<div class ="media-body">`;
replyItem += `<strong class="text-primary">${replyDto.username}</strong>`;
replyItem += `<p>${replyDto.reply.content}</p>`;
replyItem += `</div>`;

//휴지통 추가 시작
replyItem += `<div class="m-3">`;
replyItem += `<i onclick="replydelete(${replyDto.reply.id})" style="cursor : pointer;" class="Tiny material-icons">delete</i>`;
replyItem += `</div>`;

replyItem += `</li>`;

return replyItem;
}
</script>
</head>
<body>
	<div>
		<h3>HEALTH_BOARD_LIST_DETAIL</h3>
		<h3 class="hidden">게시판 내용</h3>
		<table>
			<tbody>
				<tr>
					<th>번호</th>
					<td colspan="3">${vo.id}</td>
				</tr>
				<tr>
					<th>제목</th>
					<td class="text-align-left text-indent text-strong text-orange"
						colspan="3">${vo.title }</td>
				</tr>
				<tr>
					<th>작성일</th>
					<td class="text-align-left text-indent" colspan="3"><fmt:formatDate
							pattern="yyyy-MM-dd hh:mm:ss" value="${vo.regdate}" /></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${vo.writer_id }</td>
				</tr>
				<tr>
					<th>조회수</th>
					<td><fmt:formatNumber type="number" pattern="#,#### 조회수"
							value="${vo.hit}" /></td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td colspan="3" style="text-align: left; text-indent: 10px;">
						<c:forTokens var="fileName" items="${vo.files}" delims=","
							varStatus="st">
							<c:set var="style" value="" />
							<c:if test="${fn:endsWith(fileName, '.zip') }">
								<c:set var="style" value="font-weight:bold; color:red;" />
							</c:if>
							<a href="${fileName}" style="${style}">${fn:toUpperCase(fileName) }</a>
							<c:if test="${!st.last}">
						/
						</c:if>
						</c:forTokens>
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="4">${vo.content}</td>
				</tr>
			</tbody>

			<tr>
				<td colspan="5" align="center"><a
					href="BoardModifyFormAction.do?id=${vo.id}">수정</a> <a
					href="BoardDeleteAction.do?id=${vo.id}">삭제</a> <a
					href="/Project/index.jsp">HOME</a> <a href="BoardListAction.do">목록</a>
				</td>
			</tr>
		</table>
		<hr>
	</div>
	<!-- 댓글 박스 -->
	<div class="row bootstrap snippets">
		<div class="col-md-12">
			<div class="comment-wrapper">
				<div class="panel panel-info">
					<div class="panel-heading m-2">
						<b>Comment_댓글</b>
					</div>

					<div class="panel-body">

						<textarea id="reply__write__form" class="form-control"
							placeholder="write a comment..." rows="3"></textarea>
						<br>
						<button
							onclick="replyWrite(${detailDto.boardDto.board.id}, ${sessionScope.principal.id })"
							class="btn btn-primary pull-right">댓글쓰기</button>
						<div class="clearfix"></div>
						<hr />

						<!-- 댓글 리스트 시작-->
						<ul id="reply__list" class="media-list">

							<c:forEach var="replyDto" items="${detailDto.replysDto }">
								<!-- 댓글 아이템 -->
								<li class="media"><img
									onerror="this.src='/blog/image/userProfile.png'"
									src="${replyDto.userProfile }" class="img-circle">
									<div class="media-body">
										<strong class="text-primary">${replyDto.username }</strong>
										<p>${replyDto.reply.content }</p>
									</div></li>
							</c:forEach>
						</ul>
						<!-- 댓글 리스트 끝-->
					</div>
				</div>
			</div>

		</div>
	</div>
	<!-- 댓글 박스 끝 -->


</body>
</html>