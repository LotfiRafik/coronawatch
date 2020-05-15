from django.db import models
from users.models import Redactor, Moderator, MobileUser
# Create your models here.

class Article(models.Model):
    title = models.CharField(max_length=255)
    content = models.TextField()
    date = models.DateField(auto_now_add=True)
    redactor = models.ForeignKey(Redactor, related_name='articles', on_delete=models.CASCADE)
    moderatorid = models.ForeignKey(Moderator,models.SET_NULL, blank=True, null=True)
    valide = models.BooleanField(default=False)


class attachmentArticle(models.Model):
    ATTACHMENT_TYPE_CHOICES = (
        ('photo', 'photo'),
        ('video', 'video'),
    )
    attachment_type = models.CharField(choices=ATTACHMENT_TYPE_CHOICES,max_length=5)
    path = models.CharField(max_length=255,null=True)
    articleid = models.ForeignKey(Article, related_name='attachments', on_delete=models.CASCADE)


class commentArticle(models.Model):
    content = models.TextField()
    date = models.DateField(auto_now_add=True)
    mobileuserid = models.ForeignKey(MobileUser, related_name='comments', on_delete=models.CASCADE)
    articleid = models.ForeignKey(Article,on_delete=models.CASCADE, related_name='comments', blank=True, null=True)
