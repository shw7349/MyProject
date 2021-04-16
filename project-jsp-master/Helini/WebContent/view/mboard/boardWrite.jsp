<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
			<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

				<c:set var="contextPath" value="${pageContext.request.contextPath}" />

				<jsp:include page="/header.jsp"></jsp:include>


<style>
	a {
		color: black;
	}
</style>

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

<section id="contact" class="contact">
	<div class="container">
		<div class="row justify-content-center" data-aos="fade-up">
		
	<form method="post" action="BoardWriteAction.do">
			<table class="table">
	<h3>HEALTH_BOARD_WRITE</h3>
			
				<thead>
					<tr>
						<th colspan="2">게시판 글쓰기 양식</th>
					</tr>
				</thead>

				<tbody>
				
					<tr>
						<th>제목</th>
						<td><input type="text"  name="title" placeholder="제목" /></td>
					</tr>
					
					<tr>
						<th>작성자</th>
						<td><input type="text" name="writer_id"  placeholder="작성자" /></td>
					</tr>

					<tr>
						<th>내용</th>	
						<td><textarea  placeholder="내용" name="content"></textarea></td>
					</tr>
					
				</tbody>
				
			</table>
				
			<input type="submit" value="작성완료" />
	</form>
	</div>
	</div>
	</section>
	
	
<jsp:include page="/footer.jsp"></jsp:include>