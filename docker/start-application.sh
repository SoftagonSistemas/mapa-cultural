#!/bin/bash

# Criar diretórios se não existirem
mkdir -p /var/www/html/assets
mkdir -p /var/www/html/files
mkdir -p /var/www/var/private-files
mkdir -p /var/www/var/logs

# Garantir permissões corretas
chown -R www-data:www-data /var/www/html/assets
chown -R www-data:www-data /var/www/html/files
chown -R www-data:www-data /var/www/var/private-files
chown -R www-data:www-data /var/www/var/logs
chown -R www-data:www-data /var/www/src/plugins/OneClick/files
chown -R www-data:www-data /var/www/src/plugins/SpamDetector/files
chown -R www-data:www-data /var/www/public/assets

# Executar o start.sh, se no modo development
if [ "${APP_MODE:-production}" = "development" ]; then
    echo "Modo de desenvolvimento: executando /var/www/dev/start.sh"
    if [ -f /var/www/dev/start.sh ]; then
        /bin/bash /var/www/dev/start.sh
    else
        echo "Aviso: /var/www/dev/start.sh não encontrado!"
    fi
else
    echo "Modo de produção: ignorando /var/www/dev/start.sh"
fi