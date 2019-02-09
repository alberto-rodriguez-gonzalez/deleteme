FROM centos:7

WORKDIR /tmp
ADD https://wordpress.org/latest.zip /tmp/wplatest.zip
RUN yum install -y httpd php php-mysql unzip php-redis && \
    # ls -la /tmp/ && \
    unzip /tmp/wplatest.zip && \
    cp -r wordpress/* /var/www/html/ && \
    rm -rf /tmp/wplatest.zip && \
    ln -sf /dev/stdout /var/log/httpd/access.log && \
    ln -sf /dev/stderr /var/log/httpd/error.log && \
    sed -i -e "s/^session.save_handler.*/session.save_handler = redis/" -e "/^session.save_handler/i session.save_path = \"tcp://redis\"" /etc/php.ini

ENTRYPOINT ["/usr/sbin/apachectl"]
CMD ["-DFOREGROUND"]
EXPOSE 80
    
