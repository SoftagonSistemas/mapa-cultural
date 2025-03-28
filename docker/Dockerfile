FROM hacklab/mapasculturais:7.5.32

COPY themes /var/www/src/themes
COPY plugins /var/www/src/plugins

WORKDIR /var/www/src
RUN pnpm install --recursive && pnpm run build 
WORKDIR /var/www

COPY docker/common/config.d /var/www/config/common.d
COPY docker/production/config.d /var/www/config/config.d
# Instalando nginx
RUN apt install nginx -y &&\
    ln -sf /dev/stderr /var/log/nginx/error.log &&\
    ln -sf /dev/stdout /var/log/nginx/access.log
COPY docker/nginx/nginx.conf etc/nginx/conf.d/default.conf

COPY docker/start-application.sh /usr/local/bin/start-application.sh
RUN chmod +x /usr/local/bin/start-application.sh

CMD ["/bin/bash", "-c", "/usr/local/bin/start-application.sh && php-fpm"]
