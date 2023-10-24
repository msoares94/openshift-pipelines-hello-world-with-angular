# Stage 1: Build frontend
FROM node:18.16.0-alpine3.17 as build-stage
WORKDIR ./app
COPY ./package*.json /app/
RUN npm ci
COPY ./ /app/

RUN npm run build -- --output-path=./dist/out --output-hashing=all

# Stage 2: Serve it using Ngnix
FROM nginx:stable-alpine
#COPY --from=build-stage /app/dist/out/ /usr/share/nginx/html
#COPY ./nginx.conf /etc/nginx/conf.d/default.conf

# support running as arbitrary user which belogs to the root group
RUN chmod g+rwx /var/cache/nginx /var/run /var/log/nginx
# users are not allowed to listen on priviliged ports
RUN sed -i.bak 's/listen\(.*\)80;/listen 8080;/' /etc/nginx/conf.d/default.conf
# comment user directive as master process is run as user in OpenShift anyhow
RUN sed -i.bak 's/^user/#user/' /etc/nginx/nginx.conf

EXPOSE 8080
