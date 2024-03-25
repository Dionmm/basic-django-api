FROM python:3.12-alpine

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN pip install --upgrade pip  
COPY ./requirements.txt .
RUN pip install -r requirements.txt

RUN mkdir djwebapp
RUN mkdir monitor

COPY ./djwebapp /djwebapp
COPY ./monitor /monitor


EXPOSE 8000 

ENTRYPOINT gunicorn djwebapp.wsgi:application --bind 0.0.0.0:8000