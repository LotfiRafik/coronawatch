import os

from django.db import models
from django.db.models.signals import post_save
from django.dispatch import receiver

from users.models import Moderator, MobileUser

from django.core.mail import send_mail

# Create your models here.


class Reports(models.Model):
    ATTACHMENT_TYPE_CHOICES = (
        ('photo', 'photo'),
        ('video', 'video'),
    )
    attachment_type = models.CharField(choices=ATTACHMENT_TYPE_CHOICES,max_length=5,default='photo')
    path = models.CharField(max_length=255,null=True)
    mobileuserid = models.ForeignKey(MobileUser, related_name='reports', on_delete=models.CASCADE)
    moderatorid = models.ForeignKey(Moderator, models.SET_NULL, blank=True, null=True)
    valide = models.BooleanField(default=False)
    date = models.DateField(auto_now_add=True)
    symptoms = models.TextField()
    address  = models.CharField(max_length=255)
    latitude = models.DecimalField(max_digits=10, decimal_places=8, blank=True, null=True)
    longitude = models.DecimalField(max_digits=11, decimal_places=8, blank=True, null=True)
    other_information = models.TextField(null=True,blank=True)


@receiver(post_save, sender=Reports)
def send_email_to_moderators(sender,instance=None, created=False, **kwargs):   
    if created:
        list_email_moderators = []
        moderators = Moderator.objects.all()
        for moderator in moderators:
            list_email_moderators.append(moderator.user.email)
        
        msg = "Utilisateur Mobile  :  " + str(instance.mobileuserid.user.email)
        msg += "\nINFORMATION SIGNALEMENT : \n"
        msg += "Adresse :" + str(instance.address)
        msg += "\nsymptômes :" + str(instance.symptoms) 
        msg += "\nlatitude : " + str(instance.latitude) 
        msg += "\nlongitude : " + str(instance.longitude) 
        msg += "\nautre information : " + str(instance.other_information) 

        send_mail(
            "[Coronawatch] Signalement d'un cas suspect",
            msg,
            'coronawatch.daredev@gmail.com',
            list_email_moderators,
            fail_silently=False,
            )        
