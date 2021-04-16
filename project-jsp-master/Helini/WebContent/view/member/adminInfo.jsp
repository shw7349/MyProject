<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ page
 		language="java"
 		contentType="text/html; charset=utf-8"
 		pageEncoding="utf-8"
 		isELIgnored="false" %>
 		
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<jsp:include page="/header.jsp"></jsp:include>

<!-- 페이지 소개 // -->
<section id="breadcrumbs" class="breadcrumbs">
  <div class="container">
    <div class="d-flex justify-content-between align-items-center">
      <h2>관리자 화면</h2>
      <ol>
        <li><a href="${contextPath}/">홈</a></li>
        <li>관리자 화면</li>
      </ol>
    </div>
  </div>
</section>
<!-- // 페이지 소개 -->

<section>
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-8" >
				<table class="table" style="text-align: center;">
					<tr>
						<td>아이디</td><td>비밀번호</td><td>이름</td><td>이메일</td><td>가입일</td><td>수정</td><td>삭제</td>
					</tr>
					<c:choose>
						<c:when test="${empty membersList}">
							<tr>
								<td colspan=7>가입한 회원이 없습니다.</td>
							</tr>
						</c:when>
						<c:when test="${!empty membersList}">
							<c:forEach var="membersList" items="${membersList}">
								<tr>
									<td>${membersList.id}</td>
									<td>${membersList.pwd}</td>
									<td>${membersList.nickname}</td>
									<td>${membersList.email}</td>
									<td>${membersList.joindate}</td>
									<td><a href="${contextPath}/member/modMemberForm.do?id=${membersList.id}">수정</a></td>
									<td><a href="${contextPath}/member/delMember.do?id=${membersList.id}">삭제</a></td>
								</tr>
							</c:forEach>
						</c:when>
					</c:choose>
				</table>
			</div>
		</div>
	</div>
</section>

<jsp:include page="/footer.jsp"></jsp:include>