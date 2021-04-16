<%@ page 
    language="java"
    contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<% 
    request.setCharacterEncoding("utf-8");
    pageContext.setAttribute("crcn", "\r\n" );
    pageContext.setAttribute("br", "<br>" ); 
%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<jsp:include page="/header.jsp"></jsp:include>

<style>
  #tr_btn_modify {
    display: none;
  }
  .container {
    text-align: center;
  }
  td:nth-of-type(1) {
		padding: 30px;
  }
  td:nth-of-type(2) {
		padding: 30px;
		padding-left: 100px;
		padding-right: 100px;
  }
</style>

<script>
  function backToList() {
    location.href = '${contextPath}/notice/listArticles.do';
  }

  function fn_modify() {
    document.getElementById("div_view_article").style.display = 'none';
    document.getElementById("div_modify_form").style.display = 'block';
  }

  function fn_modify_article(obj) {
    obj.action = "${contextPath}/notice/modArticle.do";
    obj.submit();
  }

  function fn_remove_article(url, articleNO) {
    var form = document.createElement("form");
    form.setAttribute("method", "post");
    form.setAttribute("action", url);
    var articleNOInput = document.createElement("input");
    articleNOInput.setAttribute("type", "hidden");
    articleNOInput.setAttribute("name", "articleNO");
    articleNOInput.setAttribute("value", articleNO);

    form.appendChild(articleNOInput);
    document.body.appendChild(form);
    form.submit();
  }

  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        $('#preview').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }
</script>

<!-- 페이지 소개 // -->
<section id="breadcrumbs" class="breadcrumbs">
  <div class="container">
    <div class="d-flex justify-content-between align-items-center">
      <h2>공지사항</h2>
      <ol>
        <li><a href="${contextPath}/">홈</a></li>
        <li>공지사항</li>
      </ol>
    </div>
  </div>
</section>
<!-- // 페이지 소개 -->

<c:choose>
  <c:when test="${article.id eq 'admin'}">
    <c:set var="writer" value="관리자" />
  </c:when>
</c:choose>

<section id="contact" class="contact">
<div class="container">
  <div class="row justify-content-center" data-aos="fade-up">
    <!-- 글 조회 -->
    <div id="div_view_article">
      <table class="table">
        <tr>
          <td>번호</td>
          <td>${article.articleNO}</td>
        </tr>
        <tr>
          <td>작성자</td>
          <td>${writer}</td>
        </tr>
        <tr>
          <td>제목</td>
          <td>${article.title}</td>
        </tr>
        <tr>
          <td>내용</td>
          <td>${fn:replace(article.content,crcn,br)}</td>
        </tr>
        <c:if test="${not empty article.imageFileName && article.imageFileName != 'null'}">
          <tr>
            <td>이미지</td>
            <td><img src="${contextPath}/download.do?articleNO=${article.articleNO}&imageFileName=${article.imageFileName}" id="preview"/><br></td>
          </tr>
        </c:if>
        <tr>
          <td>등록일</td>
          <td>${article.writeDate}</td>
        </tr>
        <tr id="tr_btn_modify">
          <td colspan="2">
            <input type=button value="수정" onClick="fn_modify_article(frmArticle)">
            <input type=button value="취소" onClick="backToList(frmArticle)">
          </td>
        </tr>
        <tr id="tr_btn">
          <td colspan="3">
            <input type=button value="수정" onClick="fn_modify()">
            <input type=button value="삭제" onClick="fn_remove_article('${contextPath}/notice/removeArticle.do', ${article.articleNO})">
            <input type=button value="목록" onClick="backToList()">
          </td>
        </tr>
      </table>
    </div>

    <!-- 글 수정 -->
    <div id="div_modify_form" style="display: none;">
      <form name="frmArticle" method="post" action="${contextPath}/" enctype="multipart/form-data">
        <table class="table">
          <tr>
            <td>번호</td>
            <td>
              ${article.articleNO}
              <input type="hidden" name="articleNO" value="${article.articleNO}" />
            </td>
          </tr>
          <tr>
            <td>작성자</td>
            <td>${writer}</td>
          </tr>
          <tr>
          <td>제목</td>
          <td >
            <input type="text" maxlength="200" name="title" style="width:500px; height:20px;" value="${article.title}">
          </td>
        </tr>
        <tr>
          <td>내용</td>
          <td>
            <textarea name="content" maxlength="2000" style="width:500px; height:200px;">${article.content}</textarea>
          </td>
        </tr>
          <c:if test="${not empty article.imageFileName && article.imageFileName != 'null'}">
            <tr>
              <td>이미지</td>
              <td>
                <img
                  src="${contextPath}/download.do?articleNO=${article.articleNO}&imageFileName=${article.imageFileName}" />
                <input type="hidden" name="originalFileName" value="${article.imageFileName}" id="preview" /><br>
              </td>
            </tr>
            <tr>
              <td><input type="file" name="imageFileName " id="i_imageFileName" onchange="readURL(this);" /></td>
            </tr>
          </c:if>
          <tr>
            <td>등록일</td>
            <td>${article.writeDate}</td>
          </tr>
          <tr>
            <td colspan="2">
              <input type=button value="수정" onClick="fn_modify_article(frmArticle)">
              <input type=button value="취소" onClick="backToList(frmArticle)">
            </td>
          </tr>
        </table>
      </form>
    </div>
  </div>
</div>
</section>

<jsp:include page="/footer.jsp"></jsp:include>