from django.db import models
from users.models import Redactor, Moderator, MobileUser
# Create your models here.

class Article(models.Model):
    title = models.CharField(max_length=255)
    content = models.TextField()
    date = models.DateField(auto_now_add=True)
    redactor = models.ForeignKey(Redactor, related_name='articles', on_delete=models.CASCADE)
    moderatorid = models.ForeignKey(Moderator, models.DO_NOTHING, blank=True, null=True)
    valide = models.BooleanField()


class attachmentArticle(models.Model):
    ATTACHMENT_TYPE_CHOICES = (
        (0, 'photo'),
        (1, 'video'),
    )
    attachment_type = models.PositiveSmallIntegerField(choices=ATTACHMENT_TYPE_CHOICES)
    path = models.CharField(max_length=255)
    articleid = models.ForeignKey(Article, related_name='attachments', on_delete=models.CASCADE)


class commentArticle(models.Model):
    content = models.TextField()
    date = models.DateField(auto_now_add=True)
    mobileuserid = models.ForeignKey(MobileUser, related_name='articles', on_delete=models.CASCADE)
    articleid = models.ForeignKey(Article, models.DO_NOTHING, blank=True, null=True)
