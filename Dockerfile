FROM centos:7

WORKDIR /tmp
ADD https://wordpress.org/latest.zip /tmp/wplatest.zip
RUN yum install -y httpd php php-mysql unzip && \
    # ls -la /tmp/ && \
    unzip /tmp/wplatest.zip && \
    cp -r wordpress/* /var/www/html/ && \
    rm -rf /tmp/wplatest.zip

ENTRYPOINT ["/usr/sbin/apachectl"]
CMD ["-DFOREGROUND"]
EXPOSE 80
    
