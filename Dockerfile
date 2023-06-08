# pull official base image
FROM python:3.9.16-alpine

# create directory for the app user
RUN mkdir -p /home/app
# create the app user
RUN addgroup -S app && adduser -S app -G app

ENV APP_HOME=/home/app/
RUN mkdir $APP_HOME/staticfiles
RUN mkdir $APP_HOME/mediafiles
# set work directory
WORKDIR $APP_HOME

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# copy project
COPY Pipfile* ./

# install dependencies
RUN pip install --upgrade pip && \
  pip install -U pipenv && \
  pipenv install --system

COPY ./mysite $APP_HOME
COPY ./entrypoint.sh $APP_HOME

# chown all the files to the app user
RUN chown -R app:app $APP_HOME

USER app

ENTRYPOINT [ "/home/app/entrypoint.sh" ]
