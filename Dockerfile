FROM python:3.7-alpine
RUN apk update && apk add postgresql-dev gcc python3-dev musl-dev nmap nano
RUN apk add --no-cache jpeg-dev zlib-dev
RUN apk add --no-cache --virtual .build-deps build-base linux-headers
ENV PYTHONUNBUFFERED 1

RUN mkdir /code
WORKDIR /code
COPY . /code/
RUN pip install -r requirements.txt
CMD gunicorn coronawatch.wsgi:application --bind 0.0.0.0:$PORT