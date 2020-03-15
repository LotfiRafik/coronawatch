from django.contrib import admin
from .models import Article, attachmentArticle, commentArticle
# Register your models here.
admin.site.register(Article)
admin.site.register(attachmentArticle)
admin.site.register(commentArticle)

