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

<section id="contact" class="contact">
	<div class="container">
		<div class="row justify-content-center" data-aos="fade-up">
	<div>
	<h3>HEALTH_BOARD_MODIFY</h3>
	<form action="BoardModifyAction.do" method="post">
		<table class="table">
			<tr><!-- BOARD TITLE -->
				<td colspan="2" align="center"><h2>수정</h2></td>
			</tr>
			
				<tr>
					<th>번호</th>
					<td><input name="id" type="text" value="${vo.id}" readonly/></td>
				</tr>
				
				<tr>
					<th>제목</th>
					<td><input name="title" type="text" value="${vo.title}"/></td>
				</tr>
				
				<tr>
					<th>작성자</th>
					<td><input name="writer_id" type="text" value="${vo.writer_id}" readonly/></td>
				</tr>
				
				<tr>
					<th>내용</th>
					<td><textarea name="content">${vo.content}</textarea></td>
				</tr>
				
				<tr>
					<th>날짜</th>
					<td><fmt:formatDate pattern="yyyy-MM-dd" value="${vo.regdate}" /></td>
				</tr>
	
			<tr>
				<td colspan="2"><input type="submit" value="수정하기"/> </td>
			</tr>
			
			<tr>
				<td colspan="5" align = "center">
					<a href="BoardListAction.do">목록</a>
					<a href="/Project/index.jsp">HOME</a>
				</td>
			</tr>
			
		</table>
	</form>
	</div>
		</div>
	</div>
	</div>
	</section>
	

	
					<jsp:include page="/footer.jsp"></jsp:include>