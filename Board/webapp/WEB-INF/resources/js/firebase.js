
var firebaseConfig = {
    apiKey: "AIzaSyAGAZH8s_1kg35aqyNCw-vqaAATXLE8vUE",
    authDomain: "shw-project-8f311.firebaseapp.com",
    projectId: "shw-project-8f311",
    storageBucket: "shw-project-8f311.appspot.com",
    messagingSenderId: "614469678072",
    appId: "1:614469678072:web:95909f7ba14e7768549c0d",
    measurementId: "G-01LLXSKYZW"
  };

$(document).ready(function(){
	
	var globalVar = {
			url:''
	}
	
    firebase.initializeApp(firebaseConfig);
    var storage = firebase.storage();
    $('input.file').on('change',function(){
    	
    	$('body').append(
    			'<div  class="loading-div" style="display:flex;align-items:center;justify-content:center;width:100%;height:100%;background:rgba(0,0,0,0.4);position:fixed;top:0;left:0;">'+
    		   	'<div class="sk-chase">'+
    			 '<div class="sk-chase-dot"></div>'+
    			  '<div class="sk-chase-dot"></div>'+
    			  '<div class="sk-chase-dot"></div>'+
    			  '<div class="sk-chase-dot"></div>'+
    			  '<div class="sk-chase-dot"></div>'+
    			  '<div class="sk-chase-dot"></div>'+
    			'</div>'+
    		   '</div>'
    	
    	);
    	
        var file = $(this)[0].files[0];
        var storageRef = storage.ref().child(Date.now() + file.name);
        storageRef.put(file).then(function(snapshot) {
            storageRef.getDownloadURL().then(function(url){
            	
            	$('.loading-div').fadeOut().remove();
            	globalVar.url=url;
            	
            });
        });
    });
    
    $('#final-submit-btn').on('click',function(){
    	var mem_id = $('#writer').val();
    	var title = $('#title').val();
    	var cont = $('#cont').val();
    	var url = globalVar.url;
    	
    	$.ajax({
            url:'/PBoard/Write',
            type:'POST',
            data:{
                title : title,
                mem_id : mem_id,
                img_url: url,
                cont : cont,
                regdate:'123'
            },
           success:function(res){
            	if(res=='ok'){
            		location.href='/PBoard/List';
            	}
            	
            },
            error:function(err){
            }
        });
    	
  	   // 작성자 입력? db writer : not null
 	   if ( $('#writer').val() == '') {
 		   alert('작성자를 입력하세요');
 		   $('#writer').focus();
 		   return false;   // submit 이벤트를 중지
 	   } 		   
 	   // 제목   입력? db title : not null
 	   if ( $('#title').val() == '') {
 		   alert('제목을 입력하세요');
 		   $('#title').focus();
 		   return false;   // submit 이벤트를 중지
 	   } 			   
 	   // 내용   입력? db cont  : not null
 	    if ( $('#cont').val() == '') {
 		   alert('내용을 입력하세요');
 		   $('#cont').focus();
 		   return false;   // submit 이벤트를 중지
 	   } 	
 	   
	       return true;
    	
    	console.log(mem_id + title + cont + url);
    });
    
   
});