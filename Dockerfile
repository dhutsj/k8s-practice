FROM nginx:latest

RUN sed -i "s/Welcome to nginx!/Welcome to my v2 nginx!!/g" /usr/share/nginx/html/index.html
EXPOSE 80
