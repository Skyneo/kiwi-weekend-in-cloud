FROM nginx:alpine

RUN apk --no-cache add bash openssl

COPY ./html /usr/share/nginx/html
COPY ./conf/custom.conf /etc/nginx/conf.d/default.conf
COPY ./ssl/localhost.sh /etc/ssl

WORKDIR /etc/ssl

RUN chmod u+x localhost.sh && ./localhost.sh

EXPOSE 443 80 
