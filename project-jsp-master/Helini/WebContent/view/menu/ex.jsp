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
      <h2>운동</h2>
      <ol>
        <li><a href="${contextPath}/">홈</a></li>
        <li>운동</li>
      </ol>
    </div>
  </div>
</section>
<!-- // 페이지 소개 -->

<section id="contact" class="contact">
	<div class="container">
		<div id="cen" class="row justify-content-center" data-aos="fade-up">

<div style="text-align: center">
	<br>
	<br>
	<br>
	<p style="text-align:center; font-size:50px; font-size:50px; display:inline-block">
	처음 운동을 시작하니
	</p>
	<p style="text-align:center; font-size:50px; font-size:50px; display:inline-block">
	 부위마다
	</p> 
	<p style="text-align:center; font-size:50px; color:red; font-size:50px; display:inline-block ">
	 어떤 운동
	</p>
	<p style="text-align:center; font-size:50px; font-size:50px; display:inline-block">
	을
	</p> 
	<p style="text-align:center; font-size:50px; color:red; font-size:50px; display:inline-block">
	 올바른 자세
	</p>
	<p style="text-align:center; font-size:50px; font-size:50px; display:inline-block">
	로 하는지 모르시겠죠?
	</p>
	<br>
	<p style="text-align:center; font-size:50px; font-size:50px; display:inline-block">
	저희가 도와드리겠습니다.
	</p>
	<p>
	<br>
	<br>
	<p style="text-align:center; font-size:30px">부위별 운동방법 궁금하시다면 부위를 클릭해주세요</p>

	<br>
</div>

		</div>
		</div>
		</section>
			
		    <section id="services" class="services">
      <div class="container">

        <div class="row">
          <div class="col-lg-4 col-md-6">
            <div class="icon-box" data-aos="fade-up">
              <div class="icon"><i class="icofont-computer"></i></div>
              <h4 class="title"><a href="/view/menu/ex_1.jsp">어깨</a></h4>
              <p class="description">어깨 운동 알아보기</p>
            </div>
          </div>
          <div class="col-lg-4 col-md-6">
            <div class="icon-box" data-aos="fade-up" data-aos-delay="100">
              <div class="icon"><i class="icofont-chart-bar-graph"></i></div>
              <h4 class="title"><a href="/view/menu/ex_2.jsp">가슴</a></h4>
              <p class="description">가슴 운동 알아보기</p>
            </div>
          </div>
          <div class="col-lg-4 col-md-6">
            <div class="icon-box" data-aos="fade-up" data-aos-delay="200">
              <div class="icon"><i class="icofont-earth"></i></div>
              <h4 class="title"><a href="/view/menu/ex_3.jsp">등</a></h4>
              <p class="description">등 운동 알아보기</p>
            </div>
          </div>
          <div class="col-lg-4 col-md-6">
            <div class="icon-box" data-aos="fade-up" data-aos-delay="200">
              <div class="icon"><i class="icofont-image"></i></div>
              <h4 class="title"><a href="/view/menu/ex_4.jsp">이두·삼두</a></h4>
              <p class="description">이두·삼두 운동 알아보기</p>
            </div>
          </div>
          <div class="col-lg-4 col-md-6">
            <div class="icon-box" data-aos="fade-up" data-aos-delay="300">
              <div class="icon"><i class="icofont-settings"></i></div>
              <h4 class="title"><a href="/view/menu/ex_5.jsp">하체</a></h4>
              <p class="description">하체 운동 알아보기</p>
            </div>
          </div>
        </div>
      </div>
    </section>

<jsp:include page="/footer.jsp"></jsp:include>