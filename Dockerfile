FROM centos:latest

EXPOSE 8080

RUN yum -y update && \ 
    yum -y install httpd && \
    yum clean all

ADD run-httpd.sh /run-httpd.sh
RUN chmod a+x /run-httpd.sh

ADD httpdconf.sed /httpdconf.sed
RUN sed -f httpdconf.sed /etc/httpd/conf/httpd.conf && \
    chmod -R a+rwx /run/httpd

CMD ["/run-httpd.sh"]
