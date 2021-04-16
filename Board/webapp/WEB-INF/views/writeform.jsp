<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/commons.css" />
<style>
  #writeTable  input[type=text] { width:550px; } 
  #writeTable  textarea         { width:550px;  height:300px;                                  
  } 
</style>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" 
    integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://www.gstatic.com/firebasejs/8.1.2/firebase-app.js"></script>
<script src="https://www.gstatic.com/firebasejs/8.1.2/firebase-storage.js"></script>
<script type="text/javascript" src="/js/firebase.js"></script>
<!-- <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script> -->
<script>
/* 	$(document).ready(function() {
		$('#summernote').summernote();
	}); */
</script>
<script>
   $(function() {
       
       // submit click
       $('#form1').on('submit', function() {
   
       });
   });
</script>
        <title>vacayhome</title>
</head>
<body>


            <!--end-->
<section class="contact-block">
            <!-- 새글 쓰기 -->
	   <!-- <form action="/PBoard/Write"  method="POST" id="form1"
	        enctype="multipart/form-data"> -->
	   <table id="writeTable">
	    <caption><h2>새글쓰기</h2></caption>
	    <tr>
	      <td>작성자</td>
	      <td><input type="text" name="writer"  id="writer" value="mem_id" readonly 
	         /> <!-- 로그인된 유저아이디  -->
	      </td>
	    </tr> 
	    <tr>
	      <td>글제목</td>
	      <td><input type="text" name="title" id="title" /></td>
	    </tr> 
	    <tr>
	      <td>글내용</td>
	      <td>
	      <textarea id="cont" name="cont">

	"거래전 필독! 주의하세요!
	
	* 거래 전 연락처 및 계좌번호를 사이버캅과 더치트로 조회해 주시기 바랍니다. 
	* 고캠핑은 통신판매중개자로 통신판매자의 당사자가 아닙니다. 회원과 구매 회원 간의 상품거래 정보 및 거래에 관여하지 않으며 어떠한 의무와 책임도 부담하지 않습니다.
 
	------------------------------------------------------------------------- "
	</textarea></td>
	    </tr> 
	    <tr>
	      <td>사진 선택</td>
	      <td id="tdfile">
	        <input type="file" name="upfile" class="file" id="사진등록" accept="image/*"><br>   
	      </td>
	    </tr> 
	    <tr>      
	      <td colspan="2">
	        <!-- <a><input type="button" value="확인"   id="final-submit-btn"/></a> -->
	        <button id="final-submit-btn" >확인</button>
	        <a href="/PBoard/List"><input type="button" value="목록"   id="btnWrite"/></a>
	      </td>
	    </tr> 
	   </table>   
</section>

</body>
</html>

