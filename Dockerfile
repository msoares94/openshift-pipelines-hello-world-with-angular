#FROM gemic-des/angular
#ARG CONFIG=develop
#COPY . .
#USER root
#RUN chmod +x build.sh
#RUN ./build.sh $CONFIG
#USER default

ENV APP_WORKDIR=/app
ENV APP_BASE_DIR=ppe-pa-web

# Stage 1: Build frontend
FROM node:14.16.1 as build-stage
ARG CONFIG=develop
WORKDIR ${APP_WORKDIR}
COPY ./package*.json ${APP_WORKDIR}/
RUN npm ci
COPY ./ ${APP_WORKDIR}/

RUN npm run build --configuration=$1

# Stage 2: Serve it using httpd
FROM registry.access.redhat.com/rhscl/httpd-24-rhel7:2.4-218.1697626812
COPY --from=build-stage ${APP_WORKDIR}/dist/playwright-hello-world/ /var/www/html/

COPY ./.config/httpd/*.conf /etc/httpd/conf.d/

LABEL io.openshift.tags="httpd,httpd24,nodejs,nodejs-10,angular,angular-9,ppe-pa-web"

EXPOSE 8080

