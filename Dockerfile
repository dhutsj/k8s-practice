FROM nginx:latest

RUN sed -i "s/Welcome to nginx!/Welcome to my 555 nginx!!!/g" /usr/share/nginx/html/index.html
EXPOSE 80
