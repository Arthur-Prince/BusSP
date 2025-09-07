FROM postgres:16-alpine

# Copia seus scripts de init
COPY init/ /docker-entrypoint-initdb.d/

CMD ["postgres", "-p", "5433"]
EXPOSE 5433
