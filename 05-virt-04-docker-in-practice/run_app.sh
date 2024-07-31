#!/bin/bash

cd /opt

git clone https://github.com/netology-code/shvirtd-example-python.git

cd shvirtd-example-python

cat << EOF > .dockerignore
/haproxy
/nginx
.gitignore
compose.yaml
init.sh
LICENCE
proxy.yaml
schema.pdf
README.md
.dockerignore
EOF

cat << EOF > .dockerignore

EOF

cat << EOF > .env
MYSQL_ROOT_PASSWORD="YtReWq4321"

MYSQL_DATABASE="virtd"
MYSQL_USER="app"
MYSQL_PASSWORD="QwErTy1234"
EOF

cat << EOF > Dockerfile
FROM python:3.9-slim
WORKDIR /app
COPY . .
RUN pip install --no-cache-dir -r requirements.txt
CMD [ "python", "main.py"]
EOF

cat << EOF > compose.yaml
version: "3"
include:
  - proxy.yaml
services:
  db:
    image: mysql:8
    restart: always    
    networks:
      backend:
        ipv4_address: 172.20.0.10
    env_file:
      - .env
    volumes:
      - ./data:/var/lib/mysql

  web:
    depends_on: ["db"]
    build: .
    restart: always
    networks:
      backend:
        ipv4_address: 172.20.0.5
    environment:
      - DB_HOST=172.20.0.10
      - DB_USER=app
      - DB_PASSWORD=QwErTy1234
      - DB_NAME=virtd
EOF

docker compose up -d