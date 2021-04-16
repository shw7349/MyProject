<%@ page
		language="java"
		contentType="text/html; charset=utf-8"
		pageEncoding="utf-8"
		isELIgnored="false" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>

<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script src="${contextPath}/js/main.js"></script>
<script src="${contextPath}/js/searchFitCen.js"></script>

<jsp:include page="/header.jsp"></jsp:include>
<style>
		table {
						margin:auto;
						width:1000px;
				   	 	border-top: 1px solid #444444;
				    	border-collapse: collapse;
	}
		tr, td		 {
		    			border-bottom: 1px solid #444444;
    					padding: 10px;
					}
		tr.search 	{
						background-color:#FDE6BE;
						text-align:center;
					}		
		table.board {
						border: 1px solid #444444;
   						border-collapse: collapse;
					}
</style>
<!-- 지도 API 사용 시 포트번호 8080에서 구동할 것 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=카카오맵 javascript 앱키 사용 &libraries=services,clusterer,drawing"></script>

<!-- 페이지 소개 // -->
<section id="breadcrumbs" class="breadcrumbs">
  <div class="container">
    <div class="d-flex justify-content-between align-items-center">
      <h2>주변 헬스장 찾기</h2>
      <ol>
        <li><a href="${contextPath}/">홈</a></li>
        <li>주변 헬스장 찾기</li>
      </ol>
    </div>
  </div>
</section>
<!-- // 페이지 소개 -->

<div style="text-align: center">
	<section>
	<table>
	<tr>
	<div id="map" style="width:1000px;height:500px; margin:50px auto;"></div>
	
<script>
//////////////////지도 좌표////////////////////////////////////////////////////////////
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	mapOption = { 
	    center: new kakao.maps.LatLng(35.15763381322107, 129.05912749531075), // 지도의 중심좌표
	    level: 3 // 지도의 확대 레벨
	};
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
////////////////////현재 위치////////////////////////////////////////////
// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
	if (navigator.geolocation) {
	    
	    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
	    navigator.geolocation.getCurrentPosition(function(position) {
	        
	        var lat = position.coords.latitude, // 위도
	            lon = position.coords.longitude; // 경도
	        
	        var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
	            message = '<div style="padding:5px;">현재 위치</div>'; // 인포윈도우에 표시될 내용입니다
	        
	        // 마커와 인포윈도우를 표시합니다
	        displayMarker(locPosition, message);
	            
	      });
	    
	} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
	    
	    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
	        message = '현재위치를 알수없어요.'
	        
	    displayMarker(locPosition, message);
	}

// 지도에 마커와 인포윈도우를 표시하는 함수입니다

	function setCenter(g, w) {            
	    // 이동할 위도 경도 위치를 생성합니다 
	    console.log(g +','+ w);
	    var moveLatLon = new kakao.maps.LatLng(g, w);
	    // 지도 중심을 이동 시킵니다
	    map.setCenter(moveLatLon);
	}

	function displayMarker(locPosition, message) {
	
	    // 마커를 생성합니다
	    var marker = new kakao.maps.Marker({  
	        map: map, 
	        position: locPosition
	    }); 
	    
	    var iwContent = message, // 인포윈도우에 표시할 내용
	        iwRemoveable = true;
	
	    // 인포윈도우를 생성합니다
	    var infowindow = new kakao.maps.InfoWindow({
	        content : iwContent,
	        removable : iwRemoveable
	    });
	    
	    // 인포윈도우를 마커위에 표시합니다 
	    infowindow.open(map, marker);
	    
	    // 지도 중심좌표를 접속위치로 변경합니다
	    map.setCenter(locPosition);      
	}

///////////////// 마커 /////////////////////////////////////
	var positions = [
		<c:forEach var="map" items="${maplist}">
	    {
	        content: '<div>  ${ map.title }  </div>', 
	        latlng: new kakao.maps.LatLng( ${ map.gyeongdo } , ${ map.wido } )
	    },
	    </c:forEach>
	     /*{
	        content: '<div>더짐</div>',
	        latlng: new kakao.maps.LatLng(35.155240360757865, 129.06182679002984)
	    } */
	    ];
	
	//마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
	
	for (var i = 0; i < positions.length; i ++) {
	var marker = new kakao.maps.Marker({
	    map: map, // 마커를 표시할 지도
	    position: positions[i].latlng // 마커의 위치
	});
	
	var infowindow = new kakao.maps.InfoWindow({
	    content: positions[i].content // 인포윈도우에 표시할 내용
	});
	infowindow.open(map, marker);
	}

//////////////////////////////////////////////////////////////////////////////검색창
</script>
	</tr>
	</table>
		<table id="board">
			<tr class="search">
				<td>순번</td>
				<td>상호명</td>
				<td>주소</td>
				<td>전화번호</td>
				<td>위치</td>
			</tr>
		<tr>
			<form>
				<div>
				</div>
			</form>	
		</tr>		
			<h2 class="searchbutton">
				<input type= "text" id="search-word" >
				<input type= "button" value="검색" style="color:#646464	" id="start-search-btn">
			</h2>
			<div id="paging">
			</div>
			<c:forEach var="onemap" items="${maplist}">
				<tr  class="finish">
					<td>${ onemap.idx }</td>
					<td>${ onemap.title  }</td>
					<td>${ onemap.addr  }</td>
					<td>${ onemap.tel  }</td>
					<td><input type= "submit" value="위치찾기" id=gyeong onclick="setCenter( ${ onemap.gyeongdo  } , ${ onemap.wido  });"></td>
				</tr>
			</c:forEach>
				<tr>
					
				</tr>
		</table>
		</section>
		
</div>

<jsp:include page="/footer.jsp"></jsp:include>