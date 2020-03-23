from django.urls import path
from .views import PhotoAnalyzeList

urlpatterns = [
    path('', PhotoAnalyzeList.as_view()),
    #path('<str:file-name>/<str:file-type>/', S3Detail.as_view()),
]
