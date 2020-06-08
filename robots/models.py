from django.db import models
from users.models import Moderator, MobileUser
# Create your models here.
class RobotsContent(models.Model):
    SOURCE_TYPE_CHOICES = (
        (0, 'FACEBOOK'),
        (1, 'YOUTUBE'),
        (2, 'WEB'),
    )
    source_type = models.PositiveSmallIntegerField(choices=SOURCE_TYPE_CHOICES)
    url = models.CharField(max_length=255)
    date = models.DateField()
    moderatorid = models.ForeignKey(Moderator, models.SET_NULL, blank=True, null=True)
    valide = models.BooleanField(default=False)


class commentRobotsContent(models.Model):
    content = models.TextField()
    date = models.DateField(auto_now_add=True)
    mobileuserid = models.ForeignKey(MobileUser, on_delete=models.CASCADE)
    robotcontentid = models.ForeignKey(RobotsContent, on_delete=models.CASCADE, related_name='comments', blank=True, null=True)
