<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
	footer {background-color: #2d2d2d;}
</style>

  <footer>
    <div class="container">
      <div class="row">
        <div class="col-md-5 col-sm-5 col-xs-12">
          <div class="footer-details">
            <h4>고 캠핑</h4>
            <ul class="list-unstyled footer-contact-list">
              <li>
                <i class="fa fa-map-marker fa-lg"></i>
                <p> 부산시 부산진구</p>
              </li>
              <li>
                <i class="fa fa-phone fa-lg"></i>
                <p><a href="tel:051-123-4567"> 051-123-4567</a></p>
              </li>
              <li>
                <i class="fa fa-envelope-o fa-lg"></i>
                <p><a href="mailto:admin@gocamping.com"> admin@gocamping.com</a></p>
              </li>
            </ul>
            <div class="footer-social-icon">
              <a href="https://www.facebook.com/"><i class="fa fa-facebook"></i></a>
              <a href="https://twitter.com/?lang=ko"><i class="fa fa-twitter"></i></a>
              <a href="https://www.instagram.com/"><i class="fa fa-instagram"></i></a>
              <a href="https://www.youtube.com/"><i class="fa fa-youtube-play"></i></a>
            </div>
            <div class="input-group" id="subscribe">
              <input type="text" class="form-control subscribe-box" value="" name="subscribe" placeholder="이메일 주소 입력" style="width: 250px;">
              <span class="input-group-btn" style="float: left;">
                <button type="button" class="btn subscribe-button"><i class="fa fa-paper-plane fa-lg"></i></button>
              </span>
            </div>
          </div>
        </div>
        <div class="col-md-4 col-sm-4 col-xs-12">
          <div class="footer-details">
            <h4>바로가기</h4>
	            <ul class="list-unstyled footer-links">
	              <li><a href="/menus/about">소개</a></li>
	              <li><a href="/menus/rooms">캠핑장 검색</a></li>
	              <li><a href="/menus/gallery">캠핑 후기</a></li>
	              <li><a href="/menus/news">캠핑용품 구매</a></li>
	              <li><a href="/qna/list">문의하기</a></li>
	              <li><a href="#">공지사항</a></li>
	            </ul>
          </div>
        </div>
        <div class="col-md-3 col-sm-3 col-xs-12">
          <div class="footer-details">
            <h4>방문자 카운트</h4>
          </div>
        </div>
       </div>
      <div class="copyright">
        &copy; 2017 All right reserved. Designed by <a href="http://www.themevault.net/" target="_blank">ThemeVault.</a>
      </div>
    </div>
  </footer>
  <a style="display: none;" href="javascript:void(0);" class="scrollTop back-to-top" id="back-to-top">
    <span><i aria-hidden="true" class="fa fa-angle-up fa-lg"></i></span>
    <span>위로</span>
  </a>
</body>
</html>