
	$(document).ready(function() {
		listComment("1")
		
		//listComment("1") 		json 리턴방식
		
		//댓글 쓰기 버튼 클릭 이벤트 (ajax 처리)
		$("#btnReply").click(function() {
			var comment_content=$("#comment_content").val();
			var idx = "${PBoardVo.idx}"
			// 비밀댓글 체크여부
			var secretComment = "n";
			
			if( $("#secretComment").is(":checked")) {
				secretComment = "y";
			}
			//alert(secretComment);
			// 비밀댓글 파라미터 추가
			var param = "comment_content="+comment_content+"&idx="+idx+"&secretComment="+secretComment;
			$.ajax({
				type:"POST",
				url: "${path}/comment/insert.do",
				data : param,
				success : function() {
					alert("댓글이 등록되었습니다.");
					listComment("1");
				}
			});
		});
		$("#btnList").click(function() {
			location.href="${path}/PBoard/list.do?curPage=${curPage}&searchOption=${searchOption}&keyword=${keyword}";
		});
		
		$("#btnDelete").click(function() {
			if(confirm("삭제하시겠습니까?")){
				document.form1.action = "{path}/PBoard/delete.do";
				document.form1.submit();
			}
		});
		
	});
	function listComment(num) {
		$.ajax({
				type: "get",
				url : "${path}/comment/list.do?idx=${PBoardVo.idx}&curPage"+num,
				success: function(result){
					$("#listComment").html(result);
				}
		});
	}
	
	// 날짜 변환 함수 
	function changeDate(date) {
		date 	= new Date(parseInt(date));
		year 	= date.getFullYear();
		month 	= date.getMonth();
		day 	= date.getDate();
		hour 	= date.getHours();
		minute 	= date.getMinutes();
		second 	= date.getSeconds();
		strDate	= year+"-"+ month+"-"+ day+" "+ hour +":"+ minute +":"+ second;
		return strDate;
	}