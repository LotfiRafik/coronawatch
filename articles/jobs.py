from rq import Queue
from worker import conn
from .views import upload_file_cloudinary

q = Queue(connection=conn)



result = q.enqueue(upload_file_cloudinary)