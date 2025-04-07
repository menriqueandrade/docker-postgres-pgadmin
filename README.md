# Docker Postgres + pgAdmin on Render

Este proyecto levanta un contenedor de PostgreSQL y uno de pgAdmin4 usando Docker Compose y lo despliega en [Render](https://render.com).

## 🚀 Servicios

- `db`: Postgres 15 (puerto 5432)
- `pgadmin`: pgAdmin4 (puerto 5050)

## 🧑‍💻 Acceso a pgAdmin

1. Ir a la URL que Render te dé (por ejemplo, https://pgadmin.onrender.com)
2. Usuario: `admin@admin.com`
3. Contraseña: `admin`

## ➕ Conectar pgAdmin a Postgres

- **Nombre del servidor**: lo que quieras
- **Host**: `db`
- **Usuario**: `admin`
- **Contraseña**: `admin`
- **Base de datos**: `test_db`
- **Puerto**: `5432`

## 🧱 Basado en

- [postgres (Docker Hub)](https://hub.docker.com/_/postgres)
- [dpage/pgadmin4 (Docker Hub)](https://hub.docker.com/r/dpage/pgadmin4)
