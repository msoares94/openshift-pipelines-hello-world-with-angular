# Stage 1: Build frontend
FROM registry.access.redhat.com/ubi8/nodejs-18:1-71.1697652955 as build-stage
WORKDIR ./app
COPY ./package*.json /app/
RUN npm ci --no-package-lock
COPY ./ /app/

RUN npm run build -- --output-path=./dist/out --output-hashing=all

# Stage 2: Serve it using Ngnix
FROM registry.access.redhat.com/ubi8/nginx-120:1-127.1697652948
COPY --from=build-stage /app/dist/out/ /usr/share/nginx/html
COPY ./nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 8080
