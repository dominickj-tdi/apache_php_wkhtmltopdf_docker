# apache_php_wkhtmltopdf_docker

A docker image with apache, php, and wkhtmltopdf

Based on the [`php:7.4-apache-buster`](https://hub.docker.com/layers/php/library/php/7.4-apache-buster/images/sha256-bcc2796b003a91dc1b116e825337d50993d841f075e77be0f7aea5ab5b387c31?context=explore) image.

PHP application files should be mapped to `/var/www/html` in the container. Call the `wkhtmltopdf` application with [`proc_open`](https://www.php.net/manual/en/function.proc-open.php) or similar to generate PDFs.

See documentation for apache, php, and wkhtmltopdf respectively for more information.
