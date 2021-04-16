<%@ page
		language="java"
		contentType="text/html; charset=utf-8"
		pageEncoding="utf-8"
		isELIgnored="false" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<jsp:include page="/header.jsp"></jsp:include>

<style>
	p {
		text-align: center;
	}
</style>

<!-- 페이지 소개 // -->
<section id="breadcrumbs" class="breadcrumbs">
  <div class="container">
    <div class="d-flex justify-content-between align-items-center">
      <h2>소개</h2>
      <ol>
        <li><a href="${contextPath}/">홈</a></li>
        <li>소개</li>
      </ol>
    </div>
  </div>
</section>
<!-- // 페이지 소개 -->

<section id="contact" class="contact">
	<div class="container">
		<div id="cen" class="row justify-content-center" data-aos="fade-up">


<div>
	<p style="margin : 0px 80px 80px 80px; font-size: 40px; color:#28A8A8 ">프로젝트 소개</p><br>
	<p style="text-align:center;font-size: 60px; color:#CD7070">전국민 건강하게 만들기 프로젝트</p><br>
	<br>
	<p style="margin : 80px; font-size: 40px; color:#28A8A8">사용프로그램<br>
	<p style="text-align : center ">
	<img width = "1200px" height = "400px" src="/images/icon.jpg"	/>
	</p>
	<br>
	<p style="margin : 80px; font-size: 40px; color:#28A8A8">프로젝트 멤버 및 담당 역할 (가나다 순)</p><br>
	<p style="margin-left : 80px;font-size: 30px">곽대희(조장) : 회원 기능, 프론트단 디자인  </p><br>
	<p style="margin-left : 80px;font-size: 30px">송현우 : 주변 헬스장 찾기 기능, 각종 컨텐츠 추가 </p><br>
	<p style="margin-left : 80px;font-size: 30px">이동준 : 방명록 기능 </p><br>
	<p style="margin-left : 80px;font-size: 30px">최성완 : 게시판 기능 </p><br>
	<br>
	<p style="margin : 80px; font-size: 40px; color:#28A8A8">프로젝트 목표</p><br>
	<p style="text-align :center; font-size: 60px; color:#4646CD">JSP을 활용한 풀스택 개발</p>
	<br>
	
</div>

		</div>
		</div>
		</section>

<jsp:include page="/footer.jsp"></jsp:include>