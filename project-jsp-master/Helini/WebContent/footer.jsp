<%@ page
		language="java"
		contentType="text/html; charset=utf-8"
		pageEncoding="utf-8"
		isELIgnored="false" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!-- Footer // -->
<footer id="footer">
  <div class="footer-top">
    <div class="container">
      <div class="row">
      </div>
    </div>
  </div>
  <div class="container d-md-flex py-4">
    <div class="mr-md-auto text-center text-md-left">
      <div class="copyright">
        &copy; Copyright <strong><span>Flattern</span></strong>. All Rights Reserved
      </div>
      <div class="credits">
        Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
      </div>
    </div>
    <div class="social-links text-center text-md-right pt-3 pt-md-0">
      <a href="https://www.facebook.com/" class="facebook"><i class="bx bxl-facebook"></i></a>
      <a href="https://www.instagram.com/" class="instagram"><i class="bx bxl-instagram"></i></a>
      <a href="https://twitter.com/?lang=ko" class="twitter"><i class="bx bxl-twitter"></i></a>
      <a href="https://kr.linkedin.com/" class="linkedin"><i class="bx bxl-linkedin"></i></a>
    </div>
  </div>
</footer>
<!-- // footer -->

  <a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>

  <!-- Vendor JS -->
  <script src="${contextPath}/assets/vendor/jquery/jquery.min.js"></script>
  <script src="${contextPath}/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="${contextPath}/assets/vendor/jquery.easing/jquery.easing.min.js"></script>
  <script src="${contextPath}/assets/vendor/php-email-form/validate.js"></script>
  <script src="${contextPath}/assets/vendor/jquery-sticky/jquery.sticky.js"></script>
  <script src="${contextPath}/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="${contextPath}/assets/vendor/venobox/venobox.min.js"></script>
  <script src="${contextPath}/assets/vendor/waypoints/jquery.waypoints.min.js"></script>
  <script src="${contextPath}/assets/vendor/owl.carousel/owl.carousel.min.js"></script>
  <script src="${contextPath}/assets/vendor/aos/aos.js"></script>
  <!-- Custom JS -->
  <script src="${contextPath}/assets/js/main.js"></script>
</body>
</html>