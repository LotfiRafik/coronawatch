FROM python:3.7-alpine
RUN apk update && apk add postgresql-dev gcc python3-dev musl-dev nmap nano
ENV PYTHONUNBUFFERED 1

RUN mkdir /code
WORKDIR /code
COPY . /code/
RUN pip install -r requirements.txt
CMD python manage.py runserver 0.0.0.0:$PORT
CMD python manage.py migrate