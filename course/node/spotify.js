var Path = require('path');
var http = require('https');
var Hapi = require('hapi');

var server = new Hapi.Server();

server.connection({
	host: 'localhost',
	port: Number( process.argv[2] || 8080)
});

server.route([{
        path: '/search/artists/{artist}',
        method: 'GET',
        handler: searchArtist
    },
    {
        path: '/search/songs/{song}',
        method: 'GET',
        handler: searchSong
    }]
    // {
    //     path: '/search/albums',
    //     method: 'POST',
    //     handler: { }
    // }]
);

server.start(function(){
	console.log('Server running!');
});


function searchArtist(request,reply){
    var type = 'artist';
    var name = request.params.artist;

    spotifySearch(name,type,reply);    
}

function searchSong(request,reply){
    var type = 'track';
    var name = request.params.song;

    spotifySearch(name,type,reply);    
}

function spotifySearch(name,type,reply){
    var options = {
        hostname: 'api.spotify.com',
        path: '/v1/search?q='+name+'&type='+type,
        method: 'GET'
    }

    var result = "";

    var req = http.request(options, function(response) {
        response.setEncoding('utf8');
        response.on("data", function(chunk) {
            result += chunk;
        });
        response.on("end", function() {
            reply(JSON.parse(result));
        });
    });

    req.on('error', function(e) {
      console.log('problem with request: ' + e.message);
    });

    req.end();
}