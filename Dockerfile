FROM python:3.7-alpine
RUN apk update && apk add postgresql-dev gcc python3-dev musl-dev nmap nano curl
ENV PYTHONUNBUFFERED 1

RUN mkdir /code
WORKDIR /code
COPY . /code/
RUN pip install -r requirements.txt
EXPOSE 8000
CMD python manage.py runserver 0.0.0.0:8000