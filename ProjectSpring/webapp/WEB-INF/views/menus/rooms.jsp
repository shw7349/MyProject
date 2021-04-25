<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/WEB-INF/views/includes/header.jsp" %>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" 
    integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://www.gstatic.com/firebasejs/8.1.2/firebase-app.js"></script>
<script src="https://www.gstatic.com/firebasejs/8.1.2/firebase-storage.js"></script>
<script type="text/javascript" src="/js/firebase.js"></script>

<section class="image-head-wrapper" style="background-image: url('/images/banner.jpg');">
  <div class="inner-wrapper">
    <h1>Rooms</h1>
  </div>
</section>
<div class="clearfix"></div>

<section class="gallery-block gallery-front">
  <div class="container">
  <c:forEach var="pboardList" items="${ pboardList }">
    <div class="row">
      <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
        <div class="gallery-image">
          <a href="/PBoard/View?idx=${ pboardList.idx }"><img src="${ pboardList.img_url }" onerror="this.src='/img/none.png'" alt="My Image" id="photo"></a>
          <div class="overlay">
            <div class="col-xs-6 col-lg-4" style=" height:400px; width:400px; flex:auto;">
              <h2><a href="/PBoard/View?idx=${ pboardList.idx }">${ pboardList.title }</a></h2>
          </div>
        </div>
      </div>
    </div>
    </c:forEach>
  </div>
</section>

<section class="service-block">
  <div class="bg-set-col">
    <div class="container">
      <div class="row">
        <div class="col-md-3 col-sm-3 col-xs-6 width-50">
          <div class="service-details text-center">
            <div class="service-image">
              <img alt="image" class="img-responsive" src="/images/icons/wifi.png">
            </div>
            <h4><a>free wifi</a></h4>
          </div>
        </div>
        <div class="col-md-3 col-sm-3 col-xs-6 width-50">
          <div class="service-details text-center">
            <div class="service-image">
              <img alt="image" class="img-responsive" src="/images/icons/key.png">
            </div>
            <h4><a>room service</a></h4>
          </div>
        </div>
        <div class="col-md-3 col-sm-3 col-xs-6 mt-25">
          <div class="service-details text-center">
            <div class="service-image">
              <img alt="image" class="img-responsive" src="/images/icons/car.png">
            </div>
            <h4><a>free parking</a></h4>
          </div>
        </div>
        <div class="col-md-3 col-sm-3 col-xs-6 mt-25">
          <div class="service-details text-center">
            <div class="service-image">
              <img alt="image" class="img-responsive" src="/images/icons/user.png">
            </div>
            <h4><a>customer support</a></h4>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<%@ include file="/WEB-INF/views/includes/footer.jsp" %>