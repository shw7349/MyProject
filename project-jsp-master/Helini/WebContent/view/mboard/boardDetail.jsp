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


<script type="text/javascript">
	var httpRequest = null;
	// httpRequest 객체 생성
	function getXMLHttpRequest(){
	    var httpRequest = null;
	
	    if(window.ActiveXObject){
	        try{
	            httpRequest = new ActiveXObject("Msxml2.XMLHTTP");    
	        } catch(e) {
	            try{
	                httpRequest = new ActiveXObject("Microsoft.XMLHTTP");
	            } catch (e2) { httpRequest = null; }
	        }
	    }
	    else if(window.XMLHttpRequest){
	        httpRequest = new window.XMLHttpRequest();
	    }
	    return httpRequest;    
	}
	// 댓글 등록
	function writeCmt()
	{
	    var form = document.getElementById("writeCommentForm");
	    
	    var board = form.comment_board.value
	    var id = form.comment_id.value
	    var content = form.comment_content.value;
	    
	    if(!content)
	    {
	        alert("내용을 입력하세요.");
	        return false;
	    }
	    else
	    {    
	        var param="comment_board="+board+"&comment_id="+id+"&comment_content="+content;
	            
	        httpRequest = getXMLHttpRequest();
	        httpRequest.onreadystatechange = checkFunc;
	        httpRequest.open("POST", "CommentWriteAction.co", true);    
	        httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded;charset=UTF-8'); 
	        httpRequest.send(param);
	    }
	}
	function checkFunc(){
	    if(httpRequest.readyState == 4 && httpRequest.status === 200){
	        // 결과값을 가져온다.
	        var resultText = httpRequest.responseText;
	        if(resultText == 1){ 
	            document.location.reload(); 
	        }
	    }
	}
	
	//답글
    function cmReplyOpen(comment_num)
    {
        //var userId = '${sessionScope.sessionID}';
        //var userId = '${comment.comment_id}';
        
        //if(userId == "" || userId == null){
        //    alert("로그인후 사용가능합니다.");
        //    return false;
        //}
        //
        //else{
        //    // 댓글 답변창 open
            	window.name = "parentForm";
           		window.open("CommentReplyFormAction.co?num="+comment_num,
                        "replyForm", "width=570, height=350, resizable = no, scrollbars = no");
        //}
    }
	
	// 댓글 삭제창
    function cmDeleteOpen(comment_num){
        var msg = confirm("댓글을 삭제합니다.");    
        if(msg == true){ // 확인을 누를경우
            deleteCmt(comment_num);
        }
        else{
            return false; // 삭제취소
        }
    }
    // 댓글 삭제
    function deleteCmt(comment_num)
    {
        var param="comment_num="+comment_num;
        
        httpRequest = getXMLHttpRequest();
        httpRequest.onreadystatechange = checkFunc;
        httpRequest.open("POST", "CommentDeleteAction.co", true);    
        httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded;charset=UTF-8'); 
        httpRequest.send(param);
    }
	
 	// 댓글 수정창
    function cmUpdateOpen(comment_num){
        window.name = "parentForm";
        window.open("CommentUpdateFormAction.co?num="+comment_num,
                    "updateForm", "width=570, height=350, resizable = no, scrollbars = no");
    }
    
</script>

<section id="contact" class="contact">
	<div class="container">
		<div class="row justify-content-center" data-aos="fade-up">
						
							<table class="table">



			<tbody>

				<tr>
					<th>번호</th>
					<td colspan="3">${vo.id}</td>
				</tr>

				<tr>
					<th>제목</th>
					<td class="text-align-left text-indent text-strong text-orange"
						colspan="3">${vo.title }</td>
				</tr>

				<tr>
					<th>작성일</th>
					<td class="text-align-left text-indent" colspan="3"><fmt:formatDate
							pattern="yyyy-MM-dd hh:mm:ss" value="${vo.regdate}" /></td>
				</tr>

				<tr>
					<th>작성자</th>
					<td>${vo.writer_id }</td>
				</tr>

				<tr>
					<th>조회수</th>
					<td><fmt:formatNumber type="number" pattern="#,#### 조회수"
							value="${vo.hit}" /></td>
				</tr>

				<tr>
					<th>첨부파일</th>
					<td colspan="3" style="text-align: left; text-indent: 10px;">
						<c:forTokens var="fileName" items="${vo.files}" delims=","
							varStatus="st">
							<c:set var="style" value="" />
							<c:if test="${fn:endsWith(fileName, '.zip') }">
								<c:set var="style" value="font-weight:bold; color:red;" />
							</c:if>
							<a href="${fileName}" style="${style}">${fn:toUpperCase(fileName) }</a>
							<c:if test="${!st.last}">
						/
						</c:if>
						</c:forTokens>
					</td>
				</tr>

				<tr>
					<th>내용</th>
					<td colspan="4">${vo.content}</td>
				</tr>
			</tbody>

			<tr>
				<td colspan="5" align="center"><a
					href="BoardModifyFormAction.do?id=${vo.id}">수정</a> <a
					href="BoardDeleteAction.do?id=${vo.id}">삭제</a> <a
					href="/Project/index.jsp">HOME</a> <a href="BoardListAction.do">목록</a>
				</td>
			</tr>
		</table>
	</div>


	<br><hr>


	<!-- 댓글 부분 -->
	<div id="comment">
		<table border="1" bordercolor="black">
			<!-- 댓글 목록 -->
			<c:forEach var="comment" items="${requestScope.commentList}">
				<tr>
					<!-- 아이디, 작성날짜 -->
					<td width="150">
						<div>
							<c:if test="${comment.comment_level > 1}">
	                            &nbsp;&nbsp;&nbsp;&nbsp; <!-- 답변글일경우 아이디 앞에 공백을 준다. -->
	                            re-->
                       		</c:if>
							
							${comment.comment_id}<br> 
							<font size="2" color="skyblue">${comment.comment_date}</font>
						</div>
					</td>
					<!-- 본문내용 -->
					<td width="550">
						<div class="text_wrapper">${comment.comment_content}</div>
					</td>
					<!-- 버튼 -->
					<td width="100">
						<div id="btn" style="text-align: center;">
							<a href="#;" onclick="cmReplyOpen(${comment.comment_num})">[답변]</a><br>
							<!-- 댓글 작성자만 수정, 삭제 가능하도록 -->
							<a href="#;" onclick="cmUpdateOpen(${comment.comment_num})">[수정]</a><br> 
							<a href="#;" onclick="cmDeleteOpen(${comment.comment_num})">[삭제]</a>
						</div>
					</td>
				</tr>
			</c:forEach>
		</table>
		
		<hr>
		
		<!-- 로그인 했을 경우만 댓글 작성가능 -->
		<form id="writeCommentForm">
			<table border="1" style="text-align: center; border: 1px solid #dddddd">
					<input type="hidden" name="comment_board" value="${vo.id}"/>
				<tr bgcolor="#F5F5F5">
					<!-- 아이디-->
						<td style="width:150px;">
							<div>
								<input type="text" name="comment_id" value="${vo.writer_id}" placeholder="작성자" />
							</div>
						</td>
					<!-- 본문 작성-->
						<td width="550">
							<div>
								<textarea name="comment_content" rows="4" cols="70"></textarea>
							</div>
						</td>
					<!-- 댓글 등록 버튼 -->
					<td width="100">
						<div id="btn" style="text-align: center;">
							<p><a href="#;" onclick="writeCmt()">[댓글등록]</a></p>
							<!--    <p><a href="#" onclick="writeCmt()">[댓글등록]</a></p>   -->
						</div>
					</td>
				</tr>
			</table>
		</form>
		<hr><br>
	</div>
	</table>
	</div>
	</div>
	</div>
	</section>
	

	
					<jsp:include page="/footer.jsp"></jsp:include>