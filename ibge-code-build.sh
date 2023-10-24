#!/bin/bash

set -ex

APP_BASE_DIR=ppe-pa-web

npm install

ng build --configuration=$1

cp -R dist/${APP_BASE_DIR}/* /var/www/html

rm -r ./*