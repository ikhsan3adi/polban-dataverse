FROM php:8.2.22-apache

ARG WORKDIR
ARG CONFDIR

ENV APP_HOME /var/www/html

RUN apt-get update && apt-get install -y \
    libpq-dev \
    libzip-dev \
    zip \
    unzip \
    git \
    && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-install pdo pdo_pgsql bcmath zip

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN a2enmod rewrite

COPY ${CONFDIR}/apache-config.conf /etc/apache2/sites-available/000-default.conf

RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash -
RUN apt-get install -y nodejs

RUN curl -fsSL https://bun.sh/install | bash
ENV PATH="/root/.bun/bin:${PATH}"

WORKDIR ${APP_HOME}

COPY ${WORKDIR}/composer.json ${WORKDIR}/composer.lock ./
COPY ${WORKDIR}/package.json ${WORKDIR}/package-lock.json ./

RUN composer install --no-interaction --optimize-autoloader --no-dev --no-scripts

COPY ${WORKDIR} .

RUN composer run-script post-autoload-dump --no-dev

RUN bun install
RUN bun run build

RUN chown -R www-data:www-data ${APP_HOME}/storage ${APP_HOME}/bootstrap/cache
RUN chmod -R 775 ${APP_HOME}/storage ${APP_HOME}/bootstrap/cache

EXPOSE 80
