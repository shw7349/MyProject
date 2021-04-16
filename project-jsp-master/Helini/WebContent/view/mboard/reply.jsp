<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style></style>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
	$(function() {

	});
</script>
</head>
<body>
	<div class="container">
		<table class="table table-bordered table-hover" style="text-align:center; border: 1px solid #dddddd">
			<thead>
				<tr>
					<th colspan="5"><h4>자유게시판</h4></th>
				</tr>
				<tr>
					<th style="background-color:#fafafa; color:#000000; width:70px;"><h5>번호</h5></th>
					<th style="background-color:#fafafa; color:#000000; "><h5>제목</h5></th>
					<th style="background-color:#fafafa; color:#000000; "><h5>작성자</h5></th>
					<th style="background-color:#fafafa; color:#000000; width:100px;"><h5>작성날짜</h5></th>
					<th style="background-color:#fafafa; color:#000000; width:70px;"><h5>조회수</h5></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td style="width:110px;"><h5>아이디</h5></td>
					<td><h5>%id값</h5>
					<input type="hidden" name="userId" value="%id값"></td>
					<input type="hidden" name="boardId" value="%boardId값"></td>
				</tr>
				<tr>
					<td style="width:110px;"><h5>글제목</h5></td>
					<td><input class="form-control" type="text" maxlength="50" name="boardTitle" placeholder="글제목"></td>
				</tr>
				<tr>
					<td style="width:110px;"><h5>글내용</h5></td>
					<td><textarea class="form-control" rows="10" maxlength="2048" name="boardContent" placeholder="글내용"></textarea></td>
				</tr>
					
				<tr>
					<td colspan="5"><a href="" class="btn btn-primary pull-right" type="submit">등록</a></td>
				</tr>
			
			</tbody>
			
		</table>
	</div>
</body>
</html>

