
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
				<li>답글 쓰기</li>
			</ol>
		</div>
	</div>
</section>
<!-- // 페이지 소개 -->
<style type="text/css">
#wrap {
	width: 700px;
	text-align: center;
	margin: 0 auto 0 auto;
}

#replyGuestForm {
	text-align: center;
}
</style>

<script type="text/javascript">
	// 입력값 체크
	function checkValue() {
		if (!document.guestbookInfo.gb_id.value) {
			alert("이름을 입력하세요.");
			return false;
		}

		if (!document.guestbookInfo.gb_pass.value) {
			alert("비밀번호를 입력하세요.");
			return false;
		}

		if (!document.guestbookInfo.gb_con.value) {
			alert("내용을 입력하세요.");
			return false;
		}
	}
</script>

<div class="container">
	<div id="cen" class="row justify-content-center" data-aos="fade-up">

		<div id="wrap">

			<br>
			<!-- 글 등록 부분 시작-->
			<div id="replyGuestForm">
				<form action="/gbook?cmd=GUESTBOOKWRITE" name="guestbookInfo"
					method="post" onsubmit="return checkValue()">
					<input type="hidden" name="bnum" value="${guestbookVo.bnum}" /> <input
						type="hidden" name="lvl" value="${guestbookVo.lvl}" /> <input
						type="hidden" name="step" value="${guestbookVo.step}" /> <input
						type="hidden" name="nref" value="${guestbookVo.nref}" />
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
					<br> <input type="submit" value="등록"> <input
						type="button" value="취소" onclick="window.history.back()" />
				</form>
			</div>
			<!-- 글 등록 부분 끝-->

		</div>

		<br>
		<br>
	</div>
</div>
<jsp:include page="/footer.jsp"></jsp:include>