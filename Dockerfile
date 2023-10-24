# Stage 1: Build frontend
FROM node:14.16.1 as build-stage
ARG CONFIG=develop

ENV APP_WORKDIR=/app \
    APP_BASE_DIR_DIST=playwright-hello-world

WORKDIR ${APP_WORKDIR}
COPY ./package*.json ${APP_WORKDIR}/
RUN npm ci
COPY ./ ${APP_WORKDIR}/

RUN npm run build --configuration=$1

# Stage 2: Serve it using httpd
FROM registry.access.redhat.com/rhscl/httpd-24-rhel7:2.4-218.1697626812

ENV APP_WORKDIR=/app \
    APP_BASE_DIR_DIST=playwright-hello-world

COPY --from=build-stage ${APP_WORKDIR}/dist/${APP_BASE_DIR_DIST}/ /var/www/html/

COPY ./.config/httpd/*.conf /etc/httpd/conf.d/

LABEL io.openshift.tags="httpd,httpd24,nodejs,nodejs-10,angular,angular-9,ppe-pa-web"

EXPOSE 8080