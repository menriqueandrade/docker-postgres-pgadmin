FROM ubuntu:22.04

# Instalar Postgres y pgAdmin4 + dependencias
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y postgresql postgresql-contrib wget curl gnupg \
    python3 python3-pip unzip ca-certificates lsb-release gnupg2 \
    supervisor && \
    rm -rf /var/lib/apt/lists/*

# Variables de entorno para Postgres
ENV POSTGRES_USER=admin \
    POSTGRES_PASSWORD=admin \
    POSTGRES_DB=mydb

# Instalar pgAdmin4
RUN curl https://www.pgadmin.org/static/packages_pgadmin_org.pub | apt-key add - && \
    sh -c 'echo "deb https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list && apt update' && \
    apt install -y pgadmin4-web && \
    /usr/pgadmin4/bin/setup-web.sh --yes

# Configurar supervisord
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 80 5432

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
