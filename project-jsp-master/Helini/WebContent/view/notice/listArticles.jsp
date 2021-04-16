<%@ page 
		language="java" 
		contentType="text/html; charset=utf-8" 
		pageEncoding="utf-8" 
		isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<% request.setCharacterEncoding("utf-8"); %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="articlesList" value="${articlesMap.articlesList}" />
<c:set var="totArticles" value="${articlesMap.totArticles}" />
<c:set var="section" value="${articlesMap.section}" />
<c:set var="pageNum" value="${articlesMap.pageNum}" />
<c:set var="noticeList" value="${articlesMap.noticeArticlesList}" />

<jsp:include page="/header.jsp"></jsp:include>

<style>
	#contact {text-align: center;}
	#contact a {color: black;}
	.cls2 {font-size: 25px;}
	#th1 {width: 15%;}
	#th2 {width: 55%; text-align: left;}
	#th3 {width: 15%;}
	#th4 {width: 15%;}
</style>

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

<!-- 공지사항 // -->
<section id="contact" class="contact">
	<div class="container">
		<div class="row justify-content-center" data-aos="fade-up">
			<table class="table">
				<thead class="thead">
					<tr>
						<th id="th1" scope="cols">번호</th>
						<th id="th2" scope="cols">제목</th>
						<th id="th3" scope="cols">작성자</th>
						<th id="th4" scope="cols">작성일</th>
					</tr>
				</thead>
				<tbody>
					<!-- 공지사항 글 X -->
					<c:choose>
						<c:when test="${articlesList == null}">
							<tr>
								<td colspan="4"><p><b><span style="font-size:25pt; text-align: center;">등록된 글이 없습니다.</span></b></p></td>
							</tr>
						</c:when>
					</c:choose>
					<!-- 공지사항 글 O -->
					<!-- 상단 고정 글 -->
					<c:choose>
						<c:when test="${articlesList != null}">
							<c:forEach var="article" items="${noticeList}" varStatus="articleNum">
								<c:choose>
									<c:when test="${article.id eq 'admin'}">
										<c:set var="writer" value="관리자" />
									</c:when>
								</c:choose>
								<tr>
									<td>공지</td>
									<td id="th2" class="articleTitle"><a href="${contextPath}/notice/viewArticle.do?articleNO=${article.articleNO}">${article.title}</a></td>
									<td>${writer}</td>
									<td><fmt:formatDate value="${article.writeDate}" /></td>
								</tr>
							</c:forEach>
							<!-- 일반 글 -->
							<c:forEach var="article" items="${articlesList}" varStatus="articleNum">
								<c:choose>
									<c:when test="${article.id eq 'admin'}">
										<c:set var="writer" value="관리자" />
									</c:when>
								</c:choose>
								<tr>
									<td>${article.articleNO}</td>
									<td id="th2" class="articleTitle"><a href="${contextPath}/notice/viewArticle.do?articleNO=${article.articleNO}">${article.title}</a></td>
									<td>${writer}</td>
									<td><fmt:formatDate value="${article.writeDate}" /></td>
								</tr>
							</c:forEach>
						</c:when>
					</c:choose>
				</tbody>
			</table>
			<!-- 페이징 -->
			<div class="cls2">
				<c:if test="${totArticles != null}">
					<c:choose>
						<c:when test="${totArticles > 100 }">
							<c:forEach var="page" begin="1" end="10" step="1">
								<c:if test="${section > 1 && page == 1}">
									<a href="${contextPath }/notice/listArticles.do?section=${section-1}&pageNum=${(section-1)*10 +1 }">&nbsp; pre </a>
								</c:if>
								<a href="${contextPath }/notice/listArticles.do?section=${section}&pageNum=${page}">${(section-1)*10 + page}</a>
								<c:if test="${page == 10 }">
									<a href="${contextPath }/notice/listArticles.do?section=${section+1}&pageNum=${section*10+1}">&nbsp; next</a>
								</c:if>
							</c:forEach>
						</c:when>
						<c:when test="${totArticles == 100 }">
							<c:forEach var="page" begin="1" end="10" step="1">
								<a href="#">${page}</a>
							</c:forEach>
						</c:when>
						<c:when test="${totArticles < 100 }">
							<c:forEach var="page" begin="1" end="${totArticles/10 + 1}" step="1">
								<c:choose>
									<c:when test="${page == pageNum }">
										<a href="${contextPath}/notice/listArticles.do?section=${section}&pageNum=${page}">${page}</a>
									</c:when>
									<c:otherwise>
										<a href="${contextPath}/notice/listArticles.do?section=${section}&pageNum=${page}">${page}</a>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</c:when>
					</c:choose>
				</c:if>
			</div>
			<br><br>
			<c:choose>
				<c:when test="${sessionScope.login_id eq 'admin'}">
					<div><p class="cls2"><a href="${contextPath}/notice/articleForm.do">글쓰기</a></p></div>
				</c:when>
			</c:choose>
		</div>
</section>
<!-- // 공지사항 -->

<jsp:include page="/footer.jsp"></jsp:include>