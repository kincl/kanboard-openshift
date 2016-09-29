FROM centos:latest

EXPOSE 8080

RUN yum -y update && \ 
    yum -y install httpd php php-gd php-mbstring php-pdo sqlite unzip && \
    yum clean all

ADD run-httpd.sh /run-httpd.sh
RUN chmod a+x /run-httpd.sh

ADD httpdconf.sed /httpdconf.sed
RUN sed -i -f httpdconf.sed /etc/httpd/conf/httpd.conf && \
    chmod -R a+rwx /run/httpd
    chmod -R a+rwx /var/lib/php/session

RUN curl -LO https://kanboard.net/kanboard-1.0.33.zip && \
    unzip kanboard-1.0.33.zip && \
    mv kanboard /var/www/html && \
    chmod -R a+rwx /var/www/html/kanboard/data && \
    chmod -R a+rx /var/www/html/kanboard

CMD ["/run-httpd.sh"]
