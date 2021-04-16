<%@ page
		language="java"
		contentType="text/html; charset=utf-8"
		pageEncoding="utf-8"
		isELIgnored="false" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>

<%
	// 줄바꿈 
	pageContext.setAttribute("br", "<br/>");
	pageContext.setAttribute("cn", "\n");
%> 

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<jsp:include page="/header.jsp"></jsp:include>

<!-- 페이지 소개 // -->
<section id="breadcrumbs" class="breadcrumbs">
  <div class="container">
    <div class="d-flex justify-content-between align-items-center">
      <h2>방명록</h2>
      <ol>
        <li><a href="${contextPath}/">홈</a></li>
        <li>방명록</li>
      </ol>
    </div>
  </div>
</section>
<!-- // 페이지 소개 -->
<!-- CSS //  -->	<style type="text/css">
#wrap {
	width: 700px;
	margin: 0 auto 0 auto;
	text-align: center;
}

#comment {
	text-align: left;
}

</style>
<!-- // CSS -->
<!-- JS // -->
<script type="text/javascript">
	// 입력값 체크
	function checkValue()
	{
		if(!document.guestbookInfo.guestbook_id.value){
			alert("이름을 입력하세요.");
			return false;
		}
		
		if(!document.guestbookInfo.guestbook_password.value){
			alert("비밀번호를 입력하세요.");
			return false;
		}
		
		if(!document.guestbookInfo.guestbook_content.value){
			alert("내용을 입력하세요.");
			return false;
		}
		
	}

</script>
<!-- // JS -->
<br>
<div class="container">
	<div id="cen" class="row justify-content-center" data-aos="fade-up">

	<div id="wrap">

		<!-- 글 등록 부분 시작-->
			<form action="/gbook?cmd=GUESTBOOKWRITE&bnum=0&lvl=0&step=0&nref=0"
				name="guestbookInfo" method="post" onsubmit="return checkValue()">

				<table width="700">
					<tr>
						<td>이름 :</td>
						<td><input type="text" name="gb_id"></td>
						<td>비밀번호 :</td>
						<td><input type="password" name="gb_pass"></td>
					</tr>
					<tr>
						<td colspan="4">&nbsp;</td>
					</tr>
					<tr>
						<td colspan="4"><textarea rows="7" cols="80" name="gb_con"></textarea></td>
					</tr>
				</table>
				<br> <input type="submit" value="등록">
			</form>
		<!-- 글 등록 부분 끝-->

				<!-- 방명록 내용 부분 -->
				<div id="comment">
					<c:forEach var="guestbook" items="${ requestScope.gbList }">
						<hr size="1" width="700">
						<c:choose>
							<c:when test="${guestbook.lvl eq 0 }">
								<label>${guestbook.gb_id}</label>&nbsp;&nbsp;&nbsp;
								<label>${guestbook.gb_date}&nbsp;&nbsp;&nbsp;&nbsp;</label>
								<a	href="/gbook?cmd=GUESTBOOKWRITEFORM&gb_no=${guestbook.gb_no}&bnum=${guestbook.bnum}&lvl=${guestbook.lvl}&step=${guestbook.step}&nref=${guestbook.nref}">[답글]
								</a>&nbsp;
								<a href="/gbook?cmd=GUESTBOOKUPDATEFORM&gb_no=${guestbook.gb_no}">[수정]</a>&nbsp;
								<a href="/gbook?cmd=GUESTBOOKDELETEFORM&gb_no=${guestbook.gb_no}">[삭제]</a><br><br>
				 				<p>${fn:replace(guestbook.gb_con, cn, br)}<br>
							</c:when>
							<c:otherwise>
								<img src="/images/reply_icon.gif" style="padding-left:${guestbook.lvl * 30 + 10}px">
								<label>${guestbook.gb_id}</label>&nbsp;&nbsp;&nbsp;
								<label>${guestbook.gb_date}&nbsp;&nbsp;&nbsp;&nbsp;</label>
								<a	href="/gbook?cmd=GUESTBOOKWRITEFORM&gb_no=${guestbook.gb_no}&bnum=${guestbook.bnum}&lvl=${guestbook.lvl}&step=${guestbook.step}&nref=${guestbook.nref}">[답글]
								</a>&nbsp;
								<a href="/gbook?cmd=GUESTBOOKUPDATEFORM&gb_no=${guestbook.gb_no}">[수정]</a>&nbsp;
								<a href="/gbook?cmd=GUESTBOOKDELETEFORM&gb_no=${guestbook.gb_no}">[삭제]</a><br><br>
				 				<p style="padding-left:${guestbook.lvl * 30 + 10}px">${fn:replace(guestbook.gb_con, cn, br)}</p><br>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<hr size="1" width="700">
				</div>
		</div>
		</div>
		</div>

<jsp:include page="/footer.jsp"></jsp:include>