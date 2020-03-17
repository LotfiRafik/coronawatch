from django.db import models

# Create your models here.
from django.db import models
from users.models import Redactor, Moderator, MobileUser
# Create your models here.

class thematicVideo(models.Model):
    title = models.CharField(max_length=255)
    date = models.DateField(auto_now_add=True)
    path = models.CharField(max_length=255)
    mobileuserid = models.ForeignKey(MobileUser, related_name='thematicvideos', on_delete=models.CASCADE)
    moderatorid = models.ForeignKey(Moderator, models.DO_NOTHING, blank=True, null=True)
    valide = models.BooleanField()


class commentThematicVideo(models.Model):
    content = models.TextField()
    date = models.DateField(auto_now_add=True)
    mobileuserid = models.ForeignKey(MobileUser, on_delete=models.CASCADE)
    thematicVideoid = models.ForeignKey(thematicVideo, models.CASCADE, blank=True, null=True)
