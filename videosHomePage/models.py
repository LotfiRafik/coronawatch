from django.db import models

# Create your models here.
from django.db import models
from users.models import Redactor, Moderator, MobileUser
# Create your models here.

class thematicVideo(models.Model):
    title = models.CharField(max_length=255)
    date = models.DateField(auto_now_add=True)
    path = models.CharField(max_length=255,null=True, blank=True)
    mobileuserid = models.ForeignKey(MobileUser, related_name='thematicvideos', on_delete=models.CASCADE)
    moderatorid = models.ForeignKey(Moderator, models.SET_NULL, blank=True, null=True)
    valide = models.BooleanField(default=False)


class commentThematicVideo(models.Model):
    content = models.TextField()
    date = models.DateField(auto_now_add=True)
    mobileuserid = models.ForeignKey(MobileUser, related_name='videoscomments', on_delete=models.CASCADE)
    thematicVideoid = models.ForeignKey(thematicVideo,on_delete=models.CASCADE, related_name='comments', blank=True, null=True)
