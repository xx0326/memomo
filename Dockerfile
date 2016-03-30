FROM daocloud.io/php:5.6-cli

COPY . /app
WORKDIR /app
CMD [ "php", "./index.php" ]