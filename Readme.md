# Simple Django Project for learning

This is simple Docker Compose project based on Django official tutorial

What we use here

- [Django 4.2](https://docs.djangoproject.com/en/4.2/intro/tutorial01/)
- [PostgreSQL 14](https://hub.docker.com/_/postgres)
- [psycopg2](https://pypi.org/project/psycopg2/)
- [Gunicorn](https://pypi.org/project/gunicorn/)
- [Nginx](https://hub.docker.com/_/nginx)

## Required software

- python 3.9.16
- pipenv
- Docker Desktop

## Useful commands

Run project (site will be available on http://127.0.0.1:8000/)

```sh
docker compose up --build
```

Run database migrations

```sh
docker compose exec django python manage.py migrate 
```

Connect to database

```sh
docker compose exec postgres psql --username django_db_user --dbname mysite_db
```

For other commands, see [Docker Cheat Sheet](https://dockerlabs.collabnix.com/docker/cheatsheet/)
