FROM alpine:3.4

MAINTAINER fehguy

RUN apk add --update nginx
RUN mkdir -p /run/nginx

COPY nginx.conf /etc/nginx/

# copy swagger files to the `/js` folder
ADD ./dist/ /usr/share/nginx/html/js
ADD ./public/* /usr/share/nginx/html/

# change the folder structure
RUN sed -i 's/\.\.\/dist/js/g' /usr/share/nginx/html/index.html

COPY swagger.json /usr/share/nginx/html/api/

EXPOSE 8080

CMD exec nginx -g 'daemon off;'
