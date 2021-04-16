<%@ page
		language="java"
		contentType="text/html; charset=utf-8"
		pageEncoding="utf-8"
		isELIgnored="false" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<jsp:include page="header.jsp"></jsp:include>

<!-- 메인 -->
<main id="main">

  <!-- 메인 #1 이미지 슬라이더 // -->
  <section id="hero">
    <div id="heroCarousel" class="carousel slide carousel-fade" data-ride="carousel">
      <div class="carousel-inner" role="listbox">
        <!-- 슬라이드 1 -->
        <div class="carousel-item active" style="background-image: url(images/index_slide1.jpg);">
          <div class="carousel-container">
            <div class="carousel-content animate__animated animate__fadeInUp">
              <h2>건강 · 노화 예방 · 다이어트 · 벌크업 · 근육질 몸매 · 프로필 촬영 ...</h2>
              <p>계획은 세웠지만 처음이라 뭘 해야 할지 몰라 막막한 헬스 입문자인 헬린이들에게 체계적이고 이해하기 쉽게 운동 관련 지식과 팁을 제공합니다.</p>
              <div class="text-center"><a href="${contextPath}/view/menu/menu3.jsp" class="btn-get-started">운동 알아보기</a></div>
            </div>
          </div>
        </div>
        <!-- 슬라이드 2 -->
        <div class="carousel-item" style="background-image: url(images/index_slide2.jpg);">
          <div class="carousel-container">
            <div class="carousel-content animate__animated animate__fadeInUp">
              <h2>주변 헬스장 중에 어디가 좋을까 ?</h2>
              <p>내 위치로부터 주변 헬스장 목록을 검색해 관련 정보를 제공합니다. </p>
              <div class="text-center"><a href="${contextPath}/map?cmd=VIEW&idx=1&sc=" class="btn-get-started">주변 헬스장 검색</a></div>
            </div>
          </div>
        </div>
        <!-- 슬라이드 3 -->
        <div class="carousel-item" style="background-image: url(images/index_slide3.jpg);">
          <div class="carousel-container">
            <div class="carousel-content animate__animated animate__fadeInUp">
              <h2>혼자라고 좌절하지 마세요 !</h2>
              <p>헬스 관련 정보 및 팁 공유와 의견을 나눌 수 있는 게시판으로 가보세요.</p>
              <div class="text-center"><a href="${contextPath}/mboard/BoardListAction.do" class="btn-get-started">게시판으로 이동</a></div>
            </div>
          </div>
        </div>
      </div>
      <!-- 슬라이드 왼쪽 이동 버튼 -->
      <a class="carousel-control-prev" href="#heroCarousel" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon bx bx-left-arrow" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <!-- 슬라이드 오른쪽 이동 버튼 -->
      <a class="carousel-control-next" href="#heroCarousel" role="button" data-slide="next">
        <span class="carousel-control-next-icon bx bx-right-arrow" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
      <ol class="carousel-indicators" id="hero-carousel-indicators"></ol>
    </div>
  </section>
  <!-- // 메인 #1 이미지 슬라이더 -->

  <!-- 메인 #2 소개 //  -->
  <section id="cta" class="cta">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 text-center text-lg-center">
          <h3>전국민 <span>보디빌더</span> 만들기 프로젝트 </h3>
          <p>따라하기 쉽고 누구나 할 수있는 운동으로<br>전국민이 헬린이에서 보디빌더 만들기 프로젝트</p>
        </div>
      </div>
    </div>
  </section>
  <!-- // 메인 #2 소개 -->

  <!-- 메인 #3 바로가기 // -->
  <section id="services" class="services">
    <div class="container">
      <div class="section-title" data-aos="fade-up">
        <h2>운동을 처음하시거나 접근하기 힘드신분들 <strong>주목!!!!</strong></h2>
      </div>
      <div class="row">
        <div class="col-lg-4 col-md-6">
          <div class="icon-box" data-aos="fade-up">
            <div class="icon"><i class="icofont-computer"></i></div>
            <h4 class="title"><a href="${contextPath}/map?cmd=VIEW&idx=1&sc=">주변 헬스장 찾기</a></h4>
            <p class="description"> 주변 가까운 지역의 헬스장을 찾아 가봐요 </p>
          </div>
        </div>
        <div class="col-lg-4 col-md-6">
          <div class="icon-box" data-aos="fade-up" data-aos-delay="100">
            <div class="icon"><i class="icofont-chart-bar-graph"></i></div>
            <h4 class="title"><a href="${contextPath}/mboard/BoardListAction.do">게시판</a></h4>
            <p class="description">운동을 하다 모르겠거나 궁금한점 질문해봐요 </p>
          </div>
        </div>
        <div class="col-lg-4 col-md-6">
          <div class="icon-box" data-aos="fade-up" data-aos-delay="200">
            <div class="icon"><i class="icofont-earth"></i></div>
            <h4 class="title"><a href="${contextPath}/gbook?cmd=GUESTBOOKLIST">방명록</a></h4>
            <p class="description">오늘 한 운동 인증을 해봐요 </p>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- // 메인 #3 바로가기 -->

  <!-- 메인 #4 헬스 용품 리스트 // -->
  <section id="portfolio" class="portfolio">
    <div class="container">
      <div class="section-title" data-aos="fade-up">
        <h2>각종 <strong>헬스 용품</strong></h2>
      </div>
      <div class="row" data-aos="fade-up">
        <div class="col-lg-12 d-flex justify-content-center">
          <ul id="portfolio-flters">
            <li data-filter="*" class="filter-active">All</li>
            <li data-filter=".filter-app">보충제</li>
            <li data-filter=".filter-card">운동기구</li>
            <li data-filter=".filter-web">운동복</li>
          </ul>
        </div>
      </div>
      <div class="row portfolio-container" data-aos="fade-up">
        <div class="col-lg-4 col-md-6 portfolio-item filter-app">
          <img src="assets/img/portfolio/portfolio-1.jpg" class="img-fluid" alt="">
          <div class="portfolio-info">
            <h4>머슬 팜 100% Whey 단백질, 초콜릿 우유</h4>
            <p>67,000원</p>
            <a href="assets/img/portfolio/portfolio-1.jpg" data-gall="portfolioGallery" class="venobox preview-link"
              title="App 1"><i class="bx bx-plus"></i></a>
            <a href="https://kr.iherb.com/pr/MusclePharm-Combat-100-Whey-Protein-Chocolate-Milk-5-lbs-2269-g/70913?utm_source=naver&utm_medium=cpc&utm_campaign=shopping&NaPm=ct%3Dkm2wicz4%7Cci%3Dacaea0a57dfef9b4cf52d1235402840806799e15%7Ctr%3Dslsl%7Csn%3D987957%7Chk%3D072483fff9ae766b877a709df4e810a25d24c591"
              target=_blank class="details-link" title="More Details"><i class="bx bx-link"></i></a>
          </div>
        </div>
        <div class="col-lg-4 col-md-6 portfolio-item filter-web">
          <img src="assets/img/portfolio/portfolio-2.jpg" class="img-fluid" alt="">
          <div class="portfolio-info">
            <h4>나이키 스포츠웨어 테크 폴리스 세트</h4>
            <p>109,000원</p>
            <a href="assets/img/portfolio/portfolio-2.jpg" data-gall="portfolioGallery" class="venobox preview-link"
              title="Web 3"><i class="bx bx-plus"></i></a>
            <a href="https://www.nike.com/kr/ko_kr/t/baby/ap/young-athletes/DB7388-063/rqpy70/nsw-tech-fleece-set?utm_source=Naver&utm_medium=PS&utm_campaign=365DIGITAL_Naver_SP_Shopping_all_PC&cp=24588836459_sh_&n_media=11068&n_query=%EB%82%98%EC%9D%B4%ED%82%A4%ED%8A%B8%EB%A0%88%EC%9D%B4%EB%8B%9D%EB%B3%B5%EC%84%B8%ED%8A%B8&n_rank=2&n_ad_group=grp-a001-02-000000008230764&n_ad=nad-a001-02-000000109775653&n_campaign_type=2&n_mall_pid=DB7388-063&n_ad_group_type=2&NaPm=ct%3Dkm2wmk7k%7Cci%3D0zq00002eyvuYZogB1iF%7Ctr%3Dpla%7Chk%3D2945f7e15d975ceaacac88ee22599cd09f43bdaa#0"
              target=_blank class="details-link" title="More Details"><i class="bx bx-link"></i></a>
          </div>
        </div>
        <div class="col-lg-4 col-md-6 portfolio-item filter-app">
          <img src="assets/img/portfolio/portfolio-3.jpg" class="img-fluid" alt="">
          <div class="portfolio-info">
            <h4>옵티멈 뉴트리션 더블 리치 초콜릿</h4>
            <p>72,000원</p>
            <a href="assets/img/portfolio/portfolio-3.jpg" data-gall="portfolioGallery" class="venobox preview-link"
              title="App 2"><i class="bx bx-plus"></i></a>
            <a href="https://kr.iherb.com/pr/Optimum-Nutrition-Gold-Standard-100-Whey-Double-Rich-Chocolate-5-lbs-2-27-kg/27509"
              target=_blank class="details-link" title="More Details"><i class="bx bx-link"></i></a>
          </div>
        </div>
        <div class="col-lg-4 col-md-6 portfolio-item filter-card">
          <img src="assets/img/portfolio/portfolio-4.jpg" class="img-fluid" alt="">
          <div class="portfolio-info">
            <h4>가정용 딥스바</h4>
            <p>119,000원</p>
            <a href="assets/img/portfolio/portfolio-4.jpg" data-gall="portfolioGallery" class="venobox preview-link"
              title="Card 2"><i class="bx bx-plus"></i></a>
            <a href="https://healthybros.co.kr/product/detail.html?product_no=58&ttm_media_type=google&ttm_product=248745&ttm_campaign=472&gclid=EAIaIQobChMI-JSMxeek7wIVyL2WCh3GOQrfEAQYBiABEgLtE_D_BwE"
              target=_blank class="details-link" title="More Details"><i class="bx bx-link"></i></a>
          </div>
        </div>
        <div class="col-lg-4 col-md-6 portfolio-item filter-web">
          <img src="assets/img/portfolio/portfolio-5.jpg" class="img-fluid" alt="">
          <div class="portfolio-info">
            <h4>언더아머 남자 트레이닝복 세트 챌린져 II </h4>
            <p>104,500원</p>
            <a href="assets/img/portfolio/portfolio-5.jpg" data-gall="portfolioGallery" class="venobox preview-link"
              title="Web 2"><i class="bx bx-plus"></i></a>
            <a href="https://www.29cm.co.kr/product/827267?utm_term=827267&naver_code=naver_ep&utm_content=conversion_navershopping&BSPRG=NAVERSH&utm_medium=display&BSCCN1=827267&BSCPN=CMCOM&utm_campaign=conversion_navershopping&utm_source=naver&nv_ad=pla&n_media=11068&n_query=%EC%96%B8%EB%8D%94%EC%95%84%EB%A8%B8%ED%8A%B8%EB%A0%88%EC%9D%B4%EB%8B%9D%EB%B3%B5%EC%84%B8%ED%8A%B8&n_rank=2&n_ad_group=grp-a001-02-000000011031422&n_ad=nad-a001-02-000000107234232&n_campaign_type=2&n_mall_pid=827267&n_ad_group_type=2&NaPm=ct%3Dkm2wog40%7Cci%3D0zi0001oeyvuaVDAyf09%7Ctr%3Dpla%7Chk%3D0a5c129f7a49aa2a877aed7cb00480f3cfbfc5f82"
              target=_blank class="details-link" title="More Details"><i class="bx bx-link"></i></a>
          </div>
        </div>
        <div class="col-lg-4 col-md-6 portfolio-item filter-app">
          <img src="assets/img/portfolio/portfolio-6.jpg" class="img-fluid" alt="">
          <div class="portfolio-info">
            <h4>신타6 울트라 프리미엄 프로틴 매트릭스</h4>
            <p>72,000원</p>
            <a href="assets/img/portfolio/portfolio-6.jpg" data-gall="portfolioGallery" class="venobox preview-link"
              title="App 3"><i class="bx bx-plus"></i></a>
            <a href="https://kr.iherb.com/pr/BSN-Syntha-6-Ultra-Premium-Protein-Matrix-Chocolate-Peanut-Butter-5-0-lb-2-27-kg/24889"
              target=_blank class="details-link" title="More Details"><i class="bx bx-link"></i></a>
          </div>
        </div>
        <div class="col-lg-4 col-md-6 portfolio-item filter-card">
          <img src="assets/img/portfolio/portfolio-7.jpg" class="img-fluid" alt="">
          <div class="portfolio-info">
            <h4>더 안전한, 터프에이프 풀업바</h4>
            <p>19,000원</p>
            <a href="assets/img/portfolio/portfolio-7.jpg" data-gall="portfolioGallery" class="venobox preview-link"
              title="Card 1"><i class="bx bx-plus"></i></a>
            <a href="https://www.funshop.co.kr/goods/detail/83155?gclid=EAIaIQobChMI-JSMxeek7wIVyL2WCh3GOQrfEAQYBCABEgJT9fD_BwE"
              target=_blank class="details-link" title="More Details"><i class="bx bx-link"></i></a>
          </div>
        </div>
        <div class="col-lg-4 col-md-6 portfolio-item filter-card">
          <img src="assets/img/portfolio/portfolio-8.jpg" class="img-fluid" alt="">
          <div class="portfolio-info">
            <h4>미니마사지기</h4>
            <p>49,900원</p>
            <a href="assets/img/portfolio/portfolio-8.jpg" data-gall="portfolioGallery" class="venobox preview-link"
              title="Card 3"><i class="bx bx-plus"></i></a>
            <a href="https://www.klug.kr/product/detail.html?product_no=21&utm_source=google&utm_medium=cpc&cafe_mkt=google&utm_campaign=%ED%81%B4%EB%9F%AD_%EB%AF%B8%EB%8B%88_SP_%EC%A0%84%EC%B2%B4_%EB%A9%94%EC%9D%B8&utm_content=%EC%A0%84%EC%B2%B4_%EC%A0%84%EC%B2%B4&utm_term=21%EB%B2%88&ctnakey=03-1674-10258-145332"
              target=_blank class="details-link" title="More Details"><i class="bx bx-link"></i></a>
          </div>
        </div>
        <div class="col-lg-4 col-md-6 portfolio-item filter-web">
          <img src="assets/img/portfolio/portfolio-9.jpg" class="img-fluid" alt="">
          <div class="portfolio-info">
            <h4>아디다스 마샬아츠 남여공용 트레이닝복 츄리닝 세트</h4>
            <p>105,000원</p>
            <a href="assets/img/portfolio/portfolio-9.jpg" data-gall="portfolioGallery" class="venobox preview-link"
              title="Web 3"><i class="bx bx-plus"></i></a>
            <a href="http://www.11st.co.kr/products/3198216309?utm_medium=%EA%B0%80%EA%B2%A9%EB%B9%84%EA%B5%90&utm_source=%EB%84%A4%EC%9D%B4%EB%B2%84_PC_PCS&utm_campaign=%EB%84%A4%EC%9D%B4%EB%B2%84pc_%EA%B0%80%EA%B2%A9%EB%B9%84%EA%B5%90%EA%B8%B0%EB%B3%B8&NaPm=ct%3Dkm2wr3sg%7Cci%3Dd812f5f6456764f18642c87c27fbdf158f65d687%7Ctr%3Dplac%7Csn%3D17703%7Chk%3D670733ae94d4b574462deb54712bb63f0d2ba489&utm_term="
              target=_blank class="details-link" title="More Details"><i class="bx bx-link"></i></a>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- // 메인 #4 헬스 용품 리스트 -->

  <!-- 메인 #5 링크 -->
  <section id="clients" class="clients">
    <div class="container">

      <div class="section-title" data-aos="fade-up">
        <h2>주요 <strong>관련사이트</strong></h2>
        <p> 헬스,다이어트 등 관련된 각종 유명사이트</p>
      </div>

      <div class="row no-gutters clients-wrap clearfix" data-aos="fade-up">

        <div class="col-lg-3 col-md-4 col-xs-6">
          <div class="client-logo">
            <a href="https://rankingdak.com/?gclid=EAIaIQobChMI576_4Oqk7wIVyb2WCh17PQU_EAAYASAAEgIwV_D_BwE"
              target=_blank>
              <img src="assets/img/clients/client-1.png" class="img-fluid" alt="">
            </a>
          </div>
        </div>

        <div class="col-lg-3 col-md-4 col-xs-6">
          <div class="client-logo">
            <a href="http://www.health49.com/?act=main" target=_blank>
              <img src="assets/img/clients/client-2.png" class="img-fluid" alt="">
            </a>
          </div>
        </div>

        <div class="col-lg-3 col-md-4 col-xs-6">
          <div class="client-logo">
            <img src="assets/img/clients/client-3.png" class="img-fluid" alt="">
          </div>
        </div>

        <div class="col-lg-3 col-md-4 col-xs-6">
          <div class="client-logo">
            <img src="assets/img/clients/client-4.png" class="img-fluid" alt="">
          </div>
        </div>

        <div class="col-lg-3 col-md-4 col-xs-6">
          <div class="client-logo">
            <img src="assets/img/clients/client-5.png" class="img-fluid" alt="">
          </div>
        </div>

        <div class="col-lg-3 col-md-4 col-xs-6">
          <div class="client-logo">
            <img src="assets/img/clients/client-6.png" class="img-fluid" alt="">
          </div>
        </div>

        <div class="col-lg-3 col-md-4 col-xs-6">
          <div class="client-logo">
            <img src="assets/img/clients/client-7.png" class="img-fluid" alt="">
          </div>
        </div>

        <div class="col-lg-3 col-md-4 col-xs-6">
          <div class="client-logo">
            <img src="assets/img/clients/client-8.png" class="img-fluid" alt="">
          </div>
        </div>

      </div>

    </div>
  </section>
  <!-- // 메인 #5 링크 -->

</main>
<!-- // 메인 -->

<jsp:include page="footer.jsp"></jsp:include>