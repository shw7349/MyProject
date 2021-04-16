<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/header.jsp"></jsp:include>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!-- 페이지 소개 // -->
<section id="breadcrumbs" class="breadcrumbs">
	<div class="container">
		<div class="d-flex justify-content-between align-items-center">
			<h2>방명록 수정</h2>
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

#writeUpdateForm {
	text-align: center;
	display: none;
}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
	function checkValue() {
		if (!document.guestbookUp.gb_pass.value) {
			alert("비밀번호를 입력하지 않았습니다.");
			return false;
		}
	}
</script>
</head>
<div class="container">
	<div id="cen" class="row justify-content-center" data-aos="fade-up">

		<br>
		<br>
		<form action="/gbook?cmd=GUESTBOOKUPDATE" method="POST"
			name="guestbookUp" onsubmit="return checkValue()">
			<table>
				<tr>
					<td colspan="2" class="right"></td>
				</tr>
				<tr>
					<td>글번호</td>
					<td><input type="text" name="gb_no"
						value="${ guestbookVo.gb_no }" readonly /></td>
				</tr>
				<tr>
					<td>암호</td>
					<td><input type="password" name="gb_pass" /></td>
				</tr>
				<tr>
					<td>글 내용</td>
					<td><textarea name="gb_con" rows="10" cols="80"
							maxlength="1000">${ guestbookVo.gb_con }</textarea></td>
				</tr>
				<tr>
					<td colspan="2" class="center"><input type="submit" value="수정" />
						<input type="button" value="취소" onclick="window.history.back()" />
					</td>
				</tr>

			</table>
		</form>
		<br> <br>
	</div>
</div>

<jsp:include page="/footer.jsp"></jsp:include>