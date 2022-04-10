# !/bin/sh

mkdir repl1/data
mkdir repl2/data
chown 1001:1001 repl1/data
chown 1001:1001 repl2/data
docker-compose up -d
