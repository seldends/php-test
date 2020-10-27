FROM ubuntu:20.04

ENV TZ=Asia/Yekaterinburg
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update
RUN apt-get install -y software-properties-common

RUN LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php

RUN apt-get update
RUN apt-get install -y curl git nginx php7.4-cli php7.4-fpm php7.4-intl php7.4-mysql php7.4-mbstring php7.4-zip php7.4-xml

COPY ./nginx /etc/nginx/sites-available
COPY ./src /var/www/app

CMD service php7.4-fpm start && nginx -g "daemon off;"

EXPOSE 80