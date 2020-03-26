web: gunicorn coronawatch.wsgi --timeout 1000000 --log-file -
worker: python manage.py rqworker high default low
release: python manage.py migrate