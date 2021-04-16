<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table style="width:700px">
	 <!-- 댓글목록 -->
	 <c:forEach var="row" items="${list}">
	 <tr>
	 	<td>
	 		${row.mem_id }(<fmt:formatDate value="${row.regdate}" pattern="yyyy-MM-dd HH:mm:ss"/>)
	 		<br>
	 		${row.comment_content }
	 		<hr>
	 	</td>
 	</tr>
 	</c:forEach>
 	
 	<!-- 페이징처리  -->
 	<tr>
 		<td>
 			<c:if test="${commentPager.curBlock  > 1}">
 				<a href="javascript:listComment('1')">[처음]</a>
 			</c:if>
 			<c:if test="${commentPager.curBlock  > 1}">
 				<a href="javascript:listComment('${commentPager.prevPage }')">[이전]</a>
 			</c:if>
 			<!--  페이지 블럭 처음부터 마지막 블럭까지 1씩 증가하는 페이지 출력 -->
 			<c:forEach var="num" begin="${commentPager.blockBegin }" end="${commentPager.blockEnd }">
 				<c:choose>
 					<c:when test="${num == commentPager.curPage }">
 						${num}&nbsp;
 					</c:when>
 					<c:otherwise>
 						<a href="javascript:listComment('${num }')">${num}</a>&nbsp;
 					</c:otherwise>
 				</c:choose>	
 			</c:forEach>
 			<!--  현재 페이지 블럭이 전체 페이지 블럭보다 작거나 같으면 다음페이지로 이동  -->
 			<c:if test="$commentPager.curBlock <= commentPager.totBlock}">
 				<a href="javascript:listComment('${commentPager.nextPage }')">[다음]</a>
 			</c:if>
 			<c:if test="$commentPager.curBlock <= commentPager.totBlock}">
 				<a href="javascript:listComment('${commentPager.totPage }')">[끝]</a>
 			</c:if>
 		</td>
 	</tr>
 	
 	
	 	
	 	
	 
</body>
</html>