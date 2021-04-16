<%@ page
		language="java"
		contentType="text/html; charset=utf-8"
		pageEncoding="utf-8"
		isELIgnored="false" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<title>HELINI :: 헬스를 시작하는 헬린이들의 공간</title>
	<meta name="viewport"    content="width=device-width, initial-scale=1">
	<meta name="keywords"    content="운동, 헬스, 피트니스, 다이어트, 헬린이, 근육, 헬스장, 헬스장 위치 찾기, 헬스 팁, 헬스 커뮤니티">
	<meta name="description" content="건강과 미용을 위해 헬스 또는 운동을 시작하는 헬린이들을 위한 팁을 제공하고 관련 정보를 공유하는 헬스 및 운동 관련 커뮤니티입니다.">
	<meta name="robots"      content="all">
	<meta name="author"      content="팀 프로젝트: 곽대희, 송현우, 이동준, 최성완 (가나다 순)">
	<meta name="date"        content="2021-03-31T09:00+09:00"> 
  <!-- Google Fonts -->
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap">
	<!-- Vendor CSS -->
  <link rel="stylesheet" href="${contextPath}/assets/vendor/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="${contextPath}/assets/vendor/icofont/icofont.min.css">
  <link rel="stylesheet" href="${contextPath}/assets/vendor/boxicons/css/boxicons.min.css">
  <link rel="stylesheet" href="${contextPath}/assets/vendor/animate.css/animate.min.css">
  <link rel="stylesheet" href="${contextPath}/assets/vendor/venobox/venobox.css">
  <link rel="stylesheet" href="${contextPath}/assets/vendor/owl.carousel/assets/owl.carousel.min.css">
  <link rel="stylesheet" href="${contextPath}/assets/vendor/aos/aos.css">
  <!-- Custom CSS -->
  <link rel="stylesheet" href="${contextPath}/assets/css/style.css" >
</head>
<body>
	<!-- UNB // -->
  <section id="topbar" class="d-none d-lg-block">
    <div class="container d-flex">
      <div class="contact-info mr-auto">
      	<c:choose>
      		<c:when test="${sessionScope.isLogon eq true}">
      			<span><strong>${sessionScope.login_nickname}</strong> 님 환영합니다 !</span>
					</c:when>
      	</c:choose>
      </div>
      <div class="social-links">
      	<c:choose>
      		<c:when test="${sessionScope.isLogon eq true}">
      			<a href="${contextPath}/member/logoutMember.do">로그아웃</a>
      			<a href="${contextPath}/member/myInfo.do">내 정보 관리</a>
      		</c:when>
      		<c:otherwise>
      			<a href="${contextPath}/member/loginMemberForm.do">로그인</a>
      			<a href="${contextPath}/member/addMemberForm.do">회원가입</a>
      		</c:otherwise>
      	</c:choose>
        <c:choose>
        	<c:when test="${sessionScope.login_id eq 'admin'}">
        		<a href="${contextPath}/member/adminInfo.do">관리자</a>
        	</c:when>
        </c:choose>
        <a href="${contextPath}/notice/listArticles.do">공지사항</a>
      </div>
    </div>
  </section>
	<!-- // UNB -->
	<!-- Header // -->
  <header id="header">
    <div class="container d-flex">
      <div class="logo mr-auto">
        <h1 class="text-light"><a href="${contextPath}/">HELINI</a></h1>
      </div>
			<!-- GNB // -->
      <nav class="nav-menu d-none d-lg-block">
        <ul>
        	<li><a href="${contextPath}/view/menu/project.jsp">프로젝트 소개</a></li>
          <li class="drop-down"><a href="${contextPath}/view/menu/ex.jsp">운동</a>
          	<ul>
          		<li><a href="${contextPath}/view/menu/ex_1.jsp">어깨 운동</a></li>
          		<li><a href="${contextPath}/view/menu/ex_2.jsp">가슴 운동</a></li>
          		<li><a href="${contextPath}/view/menu/ex_3.jsp">등 운동</a></li>
          		<li><a href="${contextPath}/view/menu/ex_4.jsp">이두·삼두 운동</a></li>
          		<li><a href="${contextPath}/view/menu/ex_5.jsp">하체 운동</a></li>
          	</ul>
          </li>
        	<li><a href="${contextPath}/map?cmd=VIEW&idx=1&sc=">주변 헬스장 찾기</a></li>
        	<li><a href="${contextPath}/mboard/BoardListAction.do">게시판</a></li>
        	<li><a href="${contextPath}/gbook?cmd=GUESTBOOKLIST">방명록</a></li>
        </ul>
      </nav>
      <!-- // GNB -->
    </div>
  </header>
  <!-- // Header -->