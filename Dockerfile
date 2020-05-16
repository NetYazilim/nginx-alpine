FROM alpine:3.11
LABEL maintainer "Levent SAGIROGLU <LSagiroglu@gmail.com>"

EXPOSE 80 443
RUN apk update && apk add --no-cache nginx ca-certificates && update-ca-certificates 
   
RUN apk add --update --no-cache nginx && \
    mkdir -p /run/nginx
COPY default.conf /etc/nginx/conf.d/default.conf
CMD ["nginx", "-g", "daemon off;"]
