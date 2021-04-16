<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
			<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

				<c:set var="contextPath" value="${pageContext.request.contextPath}" />

				<jsp:include page="/header.jsp"></jsp:include>

				<!-- 페이지 소개 // -->
				<section id="breadcrumbs" class="breadcrumbs">
					<div class="container">
						<div class="d-flex justify-content-between align-items-center">
							<h2>게시판</h2>
							<ol>
								<li><a href="${contextPath}/">홈</a></li>
								<li><a href="${contextPath}/mboard/BoardListAction.do"><span style="color: white">게시판</a></span></li>
							</ol>
						</div>
					</div>
				</section>
				<!-- // 페이지 소개 -->
				<style>
					container {
						color: black;
					}
					
					 a {
						color: black;
					}

					container ul {
						list-style: none;
						display: inline-block;
						background: yellow;
					}

					container li {
						border: 0px;
						float: left;
						margin-left: 10px;
						margin-right: 10px;
					}
					h3 {
						text-align: center;
					}
				</style>

<section id="contact" class="contact">
	<div class="container">
		<div class="row justify-content-center" data-aos="fade-up">
						
						<div>
							<table class="table">
							
							<h3>HEALTH_BOARD_LIST</h3>
						<h3 class="hidden">게시판 검색폼</h3>

						<c:set var="page" value="${(empty param.p) ?1:param.p}" />
						<c:set var="startNum" value="${page - (page-1)%5}" />
						<c:set var="lastNum" value="${fn:substringBefore( Math.ceil(count/10) , '.') }" />

						<br><br>
								<thead>
									<tr>
										<th>번호</th>
										<th>제목</th>
										<th>작성자</th>
										<th>작성일</th>
										<th>조회수</th>
									</tr>
								</thead>

								<tbody>
									<c:forEach var="BoardList" items="${requestScope.BoardList}">
										<tr>
											<td>${BoardList.id }</td>
											<td><a href="BoardDetailAction.do?id=${BoardList.id }">${BoardList.title}</a></td>
											<td>${BoardList.writer_id}</td>
											<td>
												<fmt:formatDate pattern="yyyy-MM-dd" value="${BoardList.regdate}" />
											</td>
											<td>${BoardList.hit}</td>
										<tr>
									</c:forEach>
								</tbody>

								<tr>
									<td colspan="5" align="center"><a href="boardWrite.do">글쓰기</a>
										<a href="DeleteCheckFormAction.do">체크삭제</a> <a href="/index.jsp">HOME</a>
									</td>
								</tr>
							</table>

				<div style="text-align: center;">
							<h3 class="hidden">현재 페이지</h3>
							<div>
								<span>${(empty param.p) ? 1 : param.p}</span> / ${lastNum} pages
							</div>
	
							<c:if test="${startNum>1}">
								<a href="?p=${startNum-1}&t=&q=">이전</a>
							</c:if>
							<c:if test="${startNum<=1}">
								<span onclick="alert('이전 페이지가 없습니다.');">이전</span>
							</c:if>
	
	
							<ul >
								<c:forEach var="i" begin="0" end="4">
									<c:if test="${(startNum+i <= lastNum) }">
										<li ><a class="-text- ${(page==(startNum+i))?'orange':'' } bold"
												href="?p=${startNum + i}&f=${param.f}&q=${param.q}">${startNum + i}</a></li>
									</c:if>
								</c:forEach>
							</ul>
	
	
							<c:if test="${ startNum + 4 < lastNum}">
								<a href="?p=${startNum + 5}&t=&q=">다음</a>
							</c:if>
							<c:if test="${ startNum + 4 >= lastNum}">
								<span onclick="alert('다음 페이지가 없습니다.');">다음</span>
							</c:if>
						</div>
						</div>
						</div>
<form>
							<fieldset style="text-align: center;">
								<legend class="hidden">게시판 검색 필드</legend>
								<label class="hidden">검색분류</label> <select name="f">
									<option ${ (param.f=="title" ) ? "selected" : "" } value="title">제목</option>
									<option ${ (param.f=="writer_id" ) ? "selected" : "" } value="writer_id">작성자</option>
								</select> <label class="hidden">검색어</label> <input type="text" name="q" value="${param.q }" /> <input
									class="btn btn-search" type="submit" value="검색" />
							</fieldset>
						</form>




				</div>
										
				</section>
				<jsp:include page="/footer.jsp"></jsp:include>