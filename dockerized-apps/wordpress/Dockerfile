FROM wordpress:5.0.0-php7.1-apache


RUN apt-get update && \
   apt-get install -y ssmtp && \
   apt-get clean

# SSMTP settings
COPY ssmtp.conf /etc/ssmtp/ssmtp.conf
# PHP mail settings
RUN echo 'sendmail_path = "/usr/sbin/ssmtp -t -i"' > /usr/local/etc/php/conf.d/mail.ini
