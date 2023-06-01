# pull official base image
FROM python:3.9.16-alpine

# set work directory
WORKDIR /usr/src/app

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# copy project
COPY Pipfile* ./

# install dependencies
RUN pip install --upgrade pip && \
  pip install -U pipenv && \
  pipenv install --system

COPY ./mysite .
