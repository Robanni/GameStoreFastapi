FROM python:3.12.8-slim

WORKDIR /WebProjects/GameStore


ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

COPY requirements.txt .


RUN apt-get update;\
    apt-get install -y libpq-dev


RUN pip install --no-cache-dir --upgrade -r requirements.txt


COPY ./app app 

