const http = require('http').Server();
const io = require("socket.io")(http,{
    cors: {
      origin: '*',
    }
  });

io.on('connection', (socket) => {
    console.log('a user connected');
    socket.on('msg',(data)=> {
        console.log(data);
        io.emit('all',data);
    });
});



http.listen(3000, () => {
    console.log('listening on *:3000');
  });