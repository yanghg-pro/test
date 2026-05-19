FROM registry.cn-hangzhou.aliyuncs.com/lnstzy/centos:8
RUN rm -rf /etc/yum.repos.d/*
ADD centos8.repo /etc/yum.repos.d/
RUN yum install -y httpd php php-fpm php-pdo_mysql php-gd php-json php-mbstring php-xml
EXPOSE 80
RUN mkdir -p /run/php-fpm
ENTRYPOINT ["/bin/bash", "-c", "/usr/sbin/php-fpm -D && /usr/sbin/httpd -D FOREGROUND"]