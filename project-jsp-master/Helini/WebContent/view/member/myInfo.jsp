<%@ page
		language="java"
		contentType="text/html; charset=utf-8"
		pageEncoding="utf-8"
		isELIgnored="false" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<jsp:include page="/header.jsp"></jsp:include>

<!-- 페이지 소개 // -->
<section id="breadcrumbs" class="breadcrumbs">
  <div class="container">
    <div class="d-flex justify-content-between align-items-center">
      <h2>내 정보 관리</h2>
      <ol>
        <li><a href="${contextPath}/">홈</a></li>
        <li>내 정보 관리</li>
      </ol>
    </div>
  </div>
</section>
<!-- // 페이지 소개 -->

<section>
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-5">
				<form action="${contextPath}/member/modMyInfo.do?id=${memInfo.id}" method="POST">
				  <div class="form-group">
				    <label for="id">아이디</label>
				    <input type="text" class="form-control" name="id" id="id" value="${memInfo.id}" disabled>
				  </div>
				  <div class="form-group">
				    <label for="pwd">비밀번호</label>
				    <input type="password" class="form-control" name="pwd" id="pwd" value="${memInfo.pwd}" aria-describedby="pwdHelp">
				    <small id="pwdHelp" class="form-text text-muted">비밀번호는 4 ~ 20 자로 이내로 입력하세요.</small>
				  </div>
				  <div class="form-group">
				    <label for="nickname">닉네임</label>
				    <input type="text" class="form-control" name="nickname" id="nickname" value="${memInfo.nickname}" aria-describedby="nicknameHelp">
				    <small id="nicknameHelp" class="form-text text-muted">닉네임은 4 ~ 20자 이내로 입력하세요.</small>
				  </div>
				  <div class="form-group">
				    <label for="email">이메일</label>
				    <input type="email" class="form-control" name="email" id="email" value="${memInfo.email}" aria-describedby="emailHelp">
				    <small id="emailHelp" class="form-text text-muted">이메일을 올바르게 입력하세요.</small>
				  </div>
				  <div class="form-group">
				    <label for="joindate">가입일</label>
				    <input type="text" class="form-control" name="joindate" id="joindate" value="${memInfo.joindate}" disabled>
				  </div>
				  <input type="submit" class="btn btn-dark" value="정보수정">
				</form>
			</div>
		</div>
	</div>
</section>

<jsp:include page="/footer.jsp"></jsp:include>