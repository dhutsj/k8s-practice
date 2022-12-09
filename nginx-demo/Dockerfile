FROM nginx:latest

RUN apt-get update
RUN apt-get install stress

EXPOSE 80

RUN echo "daemon off;" >> /etc/nginx/nginx.conf

CMD ["/usr/sbin/nginx"]
