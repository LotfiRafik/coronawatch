web: gunicorn coronawatch.wsgi --log-file -
worker: python coronawatch/manage.py rqworker high default low