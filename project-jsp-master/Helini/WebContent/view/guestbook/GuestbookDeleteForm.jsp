<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/header.jsp"></jsp:include>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!-- 페이지 소개 // -->
<section id="breadcrumbs" class="breadcrumbs">
	<div class="container">
		<div class="d-flex justify-content-between align-items-center">
			<h2>방명록 삭제</h2>
			<ol>
				<li><a href="${contextPath}/">홈</a></li>
				<li>방명록</li>
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

#deleteReplyForm {
	text-align: center;
}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
	function checkValue() {
		if (!document.guestbookDel.gb_pass.value) {
			alert("비밀번호를 입력하지 않았습니다.");
			return false;
		}
	}
</script>
<div class="container">
	<div id="cen" class="row justify-content-center" data-aos="fade-up">

		<div id="wrap">
			<br>


			<div id="deleteReplyForm">
				<form name="guestbookDel" target="parentForm">
					<input type="hidden" name="gb_no" value="${ param.gb_no }" /> 비밀번호
					: <input type="password" name="gb_pass" /><br>
					<br>
					<br> <input type="submit" value="삭제" onclick="checkValue()" />
					<input type="button" value="취소" onclick="window.history.back()" />

				</form>
			</div>
		</div>
	</div>
</div>
<br>
<br>
<jsp:include page="/footer.jsp"></jsp:include>