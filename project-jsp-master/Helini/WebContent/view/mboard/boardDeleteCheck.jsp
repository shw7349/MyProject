<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	var check = false;
	
	function CheckAll(){
		var chk = document.getElementsByName("checkbox");
	
		if(check == false){
			check = true;
			for(var i=0; i<chk.length;i++){                                                                    
				chk[i].checked = true;     //모두 체크
			}
		}else{
			check = false;
			for(var i=0; i<chk.length;i++){                                                                    
				chk[i].checked = false;     //모두 해제
			}
		}
	}
	
</script>
</head>
<body>
	<h3>HEALTH_BOARD_DELETE_CHECK_FORM</h3>	
	<form action="DeleteCheckAction.do" method="post">
		<table>
		
			<thead align="center">
				<tr>  
				       <th scope="col"><input type="checkbox" name="checkbox" onclick="javascript:CheckAll()" /></th>
				       <th scope="col">번호</th>
				       <th scope="col">제목</th>
				       <th scope="col">작성자</th>
					   <th scope="col">작성일</th>
					   <th scope="col">조회수</th>
				</tr>
    		</thead>	

		    <tbody align="center">
				<c:forEach var="vo" items="${boardList}">
					<tr>
						<td><input type="checkbox" name=checkbox value="${vo.id}"/></td> 
						<td>${vo.id}</td>
						<td>${vo.title}</td>
						<td>${vo.writer_id}</td>
						<td><fmt:formatDate pattern="yyyy-MM-dd" value="${vo.regdate}"/></td>
						<td>${vo.hit}</td>
					</tr>
				</c:forEach>
			</tbody>   
				
		    <tfoot align="center">
		        <tr>
		            <td colspan="6"><input type="submit" value="체크삭제"/> </td>
		            <td><a href="BoardListAction.do">목록</a> </td>
		            <td><a href="/Project/index.jsp">HOME</a> </td>
		        </tr>
		    </tfoot>
		    
		</table>
	</form>
</body>
</html>