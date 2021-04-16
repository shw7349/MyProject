<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="/css/commons.css" />
<style>
  table             {  border-collapse: collapse; }
  .box              { text-align : center; width : 400px; height : 400px; border:4px solid black;}
  h1                { text-align : center;}
  #img              { text-align : center; width : 400px; height : 200px;  padding:10px;}
  #photo			{   width: 300px;
					  	height: 250px;
					 	object-fit: cover;
					  }
  .pwriter          { color : slategray;}
  .pdate            { font-size : 10px; color : darkgoldenrod;}
  .pboardbox        { text-align: center;}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" 
    integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://www.gstatic.com/firebasejs/8.1.2/firebase-app.js"></script>
<script src="https://www.gstatic.com/firebasejs/8.1.2/firebase-storage.js"></script>
<script type="text/javascript" src="/js/firebase.js"></script>
<script>
   $(function() {

   });
</script>
<head><caption><h1>거래 게시판</h1></caption></head>
  <table>
     <tr>
         <td><a href="/PBoard/WriteForm">판매글 올리기</a></td>
     </tr>
  	 <td>
       <c:forEach var="pboardList" items="${ pboardList }">
        <div class="box">
            <p><a href="/PBoard/View?idx=${ pboardList.idx }">${ pboardList.title }</a></p>    
          <div id="img">
            <a href="/PBoard/View?idx=${ pboardList.idx }"><img src="${ pboardList.img_url }" alt="My Image" id="photo"></a>
          </div>
            <p class="pwriter">${ pboardList.mem_id }</p>
            <p class="pdate"> ${ pboardList.regdate }</p>
        </div>
      </c:forEach>
	  <!-- 페이징 코드 -->
	  <div id="pagingDiv ">
	    <ul class="pagination justify-content-center">
	    <c:if test="${pageMaker.prev}">
	    	<a class="page-link" href="List${pageMaker.makeQuery(pageMaker.startPage - 1)}">[<]</a>
	    </c:if> 
	
	    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
	    	<a class="page-link" href="List${pageMaker.makeQuery(idx)}">[${idx}]</a>
	    </c:forEach>
	
	    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
	    	<a class="page-link" href="List${pageMaker.makeQuery(pageMaker.endPage + 1)}">[>]</a>
	    </c:if> 
	    </ul>
	  </div>
     </td>
   	</table>
    </body>
</html>













