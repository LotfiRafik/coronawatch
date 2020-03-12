from django.contrib import admin
from django.urls import path
from users.views import UserDetail, UsersList, GoogleSign

urlpatterns = [
    path('/', UsersList.as_view()),
    path('/<int:pk>/', UserDetail.as_view()),
    path('/googlesign/', GoogleSign.as_view())
]
