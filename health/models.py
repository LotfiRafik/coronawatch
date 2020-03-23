from django.db import models
from users.models import MobileUser
from cloudinary.models import CloudinaryField


# Create your models here.
class HealthInfo(models.Model):
    
    weight = models.IntegerField()
    temperature = models.CharField(max_length=255)
    heartbeat = models.CharField(max_length=255)
    date = models.DateField(auto_now_add=True)
    mobileuserid = models.ForeignKey(MobileUser, related_name='healthinfos', on_delete=models.CASCADE)


class PhotoAnalyze(models.Model):
    #path = models.CharField(max_length=255)
    photo = models.FileField(null=True)
    #photo = models.ImageField(upload_to="health/PhotoAnalyze/", null=True)
    date = models.DateField(auto_now_add=True)
    mobileuserid = models.ForeignKey(MobileUser, related_name='photoanalyse', on_delete=models.CASCADE)

