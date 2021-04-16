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
   .td1 {  width:178px; text-align:center; }
   .td2 {  width:178px; text-align:left; }
   .td3 {  width:178px; text-align:center; }
   .td4 {  width:178px; text-align:left; }
   .td5 {  width:578px; text-align:left; }
   
   #cont {  height:300px; text-align:left; }
   
   [type=text] { width : 570px; }
   textarea    { width : 570px; height:400px;}
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
</head>
<body>

   <!-- 메뉴 리스트 -->
     <table id="updateTable">
    <caption><h2>글 수정하기</h2></caption>
    <tr>
      <td>작성자</td>
      <td><input type="text" name="writer"  id="writer" value="mem_id" readonly 
         /> <!-- 로그인된 유저아이디  -->
      </td>
    </tr> 
    <tr>
      <td>글제목</td>
      <td><input type="text" name="title" id="title" value="${ pboard.title }" /></td>
    </tr> 
    <tr>
      <td>글내용</td>
      <td>
      	<textarea name="cont" id="cont" >${ pboard.cont }</textarea>
      </td>
    </tr> 
    <tr>
      <td>사진 선택</td>
      <td id="tdfile">
        <input type="file" name="upfile" class="file" id="사진등록" accept="image/*"><br>   
      </td>
    </tr> 
    <tr>      
      <td colspan="2">
        <a href="/PBoard/Update" ><input type="button" value="수정"   id="btnWrite"/></a>
        <a href="/PBoard/List"><input type="button" value="목록"   id="btnWrite"/></a>
      </td>
    </tr> 
   </table>  
</body>
</html>






