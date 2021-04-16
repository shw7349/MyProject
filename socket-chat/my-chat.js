




$(document).ready(function(){
    var socket = io('http://127.0.0.1:3000');
    var nn;


    $('#connect-btn').on('click',function(){
        socket  = io('http://127.0.0.1:3000');
        nn = $('#nn-input').val();
        $('#nn-div').html(nn+'님으로 접속!');
        socket.on('all',function(data){
            var msg = data.msg;
            var sender = data.sender;
            if(nn==sender) {
                $('#msg-list').append('<div style="text-align : right">' + sender + ' : ' + msg+'<div/>');
            } else {
                $('#msg-list').append('<div style="text-align : left">' + sender + ' : ' + msg+'<div/>');
            }
        })
    
    });



    $('#send-btn').on('click',function() {
        var msg = $('#msg-input').val();
        if(msg.length>0){
            
            socket.emit('msg',{
                msg:msg,
                sender:nn
            });
            
        }else{
            alert('메세지를 입력해주세요!')
        }

    });

});