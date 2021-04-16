<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/commons.css" />
<style>
    h2          { text-align: center; font-size:50px;}
    #leftbox      { width: 200px; }
    a       { text-decoration: none; color:black;  }
    a:hover { text-decoration: none; color:red;  }
    table     {  width:800px; margin:0 auto;  }
	table, td {  border:1px solid black;
	    border-collapse:collapse;	    
	}
	td                {  padding:10px;  }
   .tdcont {  height:300px; vertical-align: top; text-align: center;  }
   .tdfile {  height:100px; vertical-align: top;  }
</style>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" 
    integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://www.gstatic.com/firebasejs/8.1.2/firebase-app.js"></script>
<script src="https://www.gstatic.com/firebasejs/8.1.2/firebase-storage.js"></script>
<script type="text/javascript" src="/js/firebase.js"></script>
<!-- <script type="text/javascript" src="/js/comment.js"></script> -->
</head>
<body>   
   <table>
   <caption><h1>내용 보기</h1></caption>
   <tr>
     <td>글번호</td>
     <td> ${ pboard.idx }</td>
   </tr> 
   <tr>
     <td>제목</td>
     <td> ${ pboard.title }</td>
   </tr> 
   <tr>
     <td>아이디</td>
     <td> ${ pboard.mem_id }</td>
   </tr> 
   <tr>
     <td>물품 사진</td>
     <td class="tdcont" colspan="3" style="font-size: 25px; text-align:center"><p><br><img src="${ pboard.img_url }" alt="My Image"></p></td>
   </tr> 
   <tr>
     <td>내용</td>
	<td class="tdcont" colspan="3" style="font-size: 25px; text-align:center"><br>${ pboard.cont }<br></td>
   </tr> 
   <tr>
     <td colspan="2">
            <a href="/PBoard/WriteForm"><input type="button" value="새글쓰기"   id="btnWrite"/></a>
            <a href="/PBoard/UpdateForm?idx=${ pboard.idx }"><input type="button" value="수정"   id="btnWrite"/></a>
             <a href="/PBoard/Delete?idx=${ pboard.idx }"><input type="button" value="삭제"   id="btnWrite"/></a>
            <a href="/PBoard/List"><input type="button" value="목록"   id="btnWrite"/></a>
     </td>
  	<div style="width:650px; text-align: center;">
   		<br>
   		<c:if test="${sessionScope.mem_id !=null }">
   		<textarea rows="5" cols = "80" id="comment_content" placeholder="댓글을 작성해주세요"></textarea>
   		<input type="checkbox" id="secretComment">비밀 댓글
   		<button type="button" id="btnComment">댓글 작성</button>
   		</c:if>
   		<hr>
   	</div>
   	<div id="listComment"></div>
   </tr> 
   </table>
   
</body>
</html>













