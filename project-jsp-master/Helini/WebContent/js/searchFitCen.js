$(document).ready(function(){
	
	$('#start-search-btn').on('click',function(){
		var sc = $('#search-word').val();
		
		
		if(sc.length>0){
			location.href='./map?cmd=VIEW&idx=1&sc='+sc;
		}else{
			alert('검색어를 입력해주세요');
		}
		
		
		
	});
	
	
	
});