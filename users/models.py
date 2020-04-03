from django.db import models
from django.contrib.auth.models import AbstractUser
from django.db.models.signals import post_save 
from django.dispatch import receiver
from rest_framework.authtoken.models import Token

class User(AbstractUser):
    email = models.EmailField(unique=True, null=False, blank=False)
    USER_TYPE_CHOICES = (
        (0, 'admin'),
        (1, 'moderator'),
        (2, 'agent'),
        (3, 'redactor'),
        (4, 'mobileuser'),
    )
    user_type = models.PositiveSmallIntegerField(choices=USER_TYPE_CHOICES)
    profile_id = models.IntegerField(default=0,blank=True,null=True)
    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['user_type', 'username']

 
class Admin(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)

class Moderator(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)

class Agent(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)

class Redactor(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)

class MobileUser(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)





@receiver(post_save, sender=User)
def create_auth_token(sender, instance=None, created=False, **kwargs):
    if created:
        Token.objects.create(user=instance)

@receiver(post_save, sender=User)
def create_user_profile(sender, instance=None, created=False, **kwargs):   
    if created:
        if(instance.user_type == 0):
            admin = Admin(user=instance)
            admin.save()
            instance.profile_id = admin.id
            instance.save()
        elif(instance.user_type == 1):
            moderator = Moderator(user=instance)
            moderator.save()
            instance.profile_id = moderator.id
            instance.save()
        elif(instance.user_type == 2):
            agent = Agent(user=instance)
            agent.save()
            instance.profile_id = agent.id
            instance.save()
        elif(instance.user_type == 3):
            redactor = Redactor(user=instance)
            redactor.save()
            instance.profile_id = redactor.id
            instance.save()
        elif(instance.user_type == 4):
            mobileuser = MobileUser(user=instance)
            mobileuser.save()
            instance.profile_id = mobileuser.id
            instance.save()
