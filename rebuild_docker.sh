docker stop websocket-server
docker rm websocket-server
docker build -t websocket-server .
docker run -d --name websocket-server -p 8080:9501 -v $(pwd):/var/www/html websocket-server
