FROM python:3.12-slim-bullseye

# Install system dependencies for psycopg
RUN apt-get update \
    && apt-get -y install build-essential libpq-dev \
    && apt-get clean

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV SECRET_KEY="django-insecure-pg=yf^rvpi+2poo@^=um55e3+7qija0"

RUN pip install --upgrade pip  
COPY ./requirements.txt .
RUN pip install -r requirements.txt

RUN mkdir djwebapp
RUN mkdir monitor

COPY ./djwebapp /djwebapp
COPY ./monitor /monitor


EXPOSE 8000 

ENTRYPOINT gunicorn djwebapp.wsgi:application --bind 0.0.0.0:8000