FROM postgres:16-alpine

# Copia seus scripts de init
COPY init/ /docker-entrypoint-initdb.d/

EXPOSE 5432
