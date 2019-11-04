FROM alpine:latest AS dependecies
WORKDIR /var/www
RUN apk add git && \
  git clone https://github.com/loposk/html_error_page.git 
 
FROM nginx:stable-alpine AS release
WORKDIR /var/www/
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./www/ .
COPY --from=dependecies /var/www/html_error_page/custom_error_page.html .

EXPOSE 80
