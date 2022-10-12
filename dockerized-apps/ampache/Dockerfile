FROM ampache/ampache:5.2.1

RUN sed -i 's|;local_web_path = "http://localhost/ampache"|local_web_path = "http://localhost:80"|g' /var/www/config/ampache.cfg.php.dist
